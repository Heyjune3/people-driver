package com.gls.ppldv.user.service;

import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.gls.ppldv.user.entity.Member;
import com.gls.ppldv.user.mapper.MemberMapper;
import com.gls.ppldv.user.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

@Service
@PropertySource("classpath:prop/db-aws.properties") // 프로퍼티 가져오기
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final MemberRepository mr;
	private final MemberMapper mm;
	
	private final AmazonS3 S3Client;
	
	@Value("${aws.bucket}")
	private String bucketname;
	
	
	@Override
	@Transactional // 2개 이상의 db 처리 관리
	public String register(Member member, MultipartFile file) throws Exception {
		String message = "회원가입실패";
		Member m = mm.idCheck(member.getEmail());
		// 아이디 중복 체크
		if (m != null) {
			throw new Exception("아이디 중복입니다. 다시 선택해주세요."); 
		} else {
			// 이미지 업로드
			String imgUrl = uploadFile(file);
			if (imgUrl != null) { // 이미지 업로드 성공 (S3)
				// 이미지 URL 설정
				member.setImgUrl(imgUrl);
				// 회원 정보 저장
				Member mem = mr.save(member);
				if (mem != null) {
					message = "회원가입성공";
				} else {
					// S3에 올라간 데이터 삭제 요청 +
					message = "회원가입실패 (DB 요청 실패)";
				}
			}
		}
		return message;
	}
		
	
	@Override
	public String register(Member member) throws Exception {
		String message = "회원가입실패";
		Member m = mm.idCheck(member.getEmail());
		
		if (m != null) {
			throw new IllegalArgumentException("아이디 중복입니다. 다시 선택해주세요.");
		} else {
			Member mem = mr.save(member);
			if (mem != null) {
				message = "회원가입 성공";
				System.out.println(message);
			}
		}
		return message;
	}
	
	
	/**
	 * S3에 파일을 업로드 하고 DB에 imgUrl 저장
	 * @param file - 받은 파일
	 * @return - 저장한 파일 url + 파일 이름
	 */
	public String uploadFile(MultipartFile file) throws IOException {
		
		String originalFileName = file.getOriginalFilename(); // 원본 파일 이름
		String ext = originalFileName.substring(originalFileName.lastIndexOf(".")); // 확장자
		String savedFileName = ""; // 저장파일이름
		String uuid = UUID.randomUUID().toString(); // UUID 32 숫자 + 4 개의 -, 36개 랜덤
		savedFileName = uuid.replace("-", "")+"_"+originalFileName;
		
		// com.amazonaws.services.model
		ObjectMetadata metadata = new ObjectMetadata(); // 메타데이터
		metadata.setContentType("image/"+ext); // 이미지만 처리
		metadata.setContentLength(file.getSize()); // 이미지 크기를 명시해줘야 함

		// S3clinet (버킷이름, 저장할 파일 이름, 인풋스트림, 메타데이터)
		S3Client.putObject(new PutObjectRequest(bucketname, savedFileName, file.getInputStream(), metadata));
		
		return S3Client.getUrl(bucketname, savedFileName).toString();
	}
}
