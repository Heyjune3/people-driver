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
@PropertySource("classpath:prop/db.properties") // 프로퍼티 파일
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final MemberRepository mr;
	private final MemberMapper mm;
	
	private final AmazonS3 S3Client;
	
	@Value("${aws.bucket}")
	private String bucketname;
	
	
	@Override
	@Transactional // 2개의 등록과 업데이트가 실패되지 않도록 설정
	public String register(Member member, MultipartFile file) throws Exception {
		mr.save(member); // 받아온 객체를 저장하면 imgUrl은 생략이 되어있을 것임
		// uploadFile 실행 (예외처리)
		// 만약 이미지 파일이 업로드 되지 않았을 경우도 생각해봐야함
		return null;
	}
	
	
	/**
	 * 지정한 위치에 파일을 업로드 후 업로드된 파일 이름 반환 (S3)
	 * @param file - 클라이언트로 부터 받은 이미지 파일
	 * @return - 파일 이름 반환(업로드 된) s3 url+파일이름
	 */
	public String uploadFile(MultipartFile file) throws IOException {
		String originalFileName = file.getOriginalFilename(); // 원본 파일 이름
		String ext = originalFileName.substring(originalFileName.lastIndexOf(".")); // 확장자
		String savedFileName = ""; // 저장할 파일 이름
		String uuid = UUID.randomUUID().toString(); // 총 32개의 랜덤 문자 + 4개의 -으로 조합된 36자리 문자
		savedFileName = uuid.replace("-", "")+"_"+originalFileName; // 저장되는 파일 이름
		
		// com.amazonaws.services.model
		ObjectMetadata metadata = new ObjectMetadata(); // 메타 데이터
		metadata.setContentType("image/"+ext); // 이미지 파일만 올릴 것이기 때문에

		// S3clinet를 이용해 S3에 파일 업로드 (버킷이름, 업로드할 파일 이름, 파일 명, 입력스트림, 메타데이터)
		S3Client.putObject(new PutObjectRequest(bucketname, savedFileName, file.getInputStream(), metadata));
		
		// 여기서 저장된 파일 경로를 DB에 저장하는 메서드를 구축해야함
		// TODO 
		
		return savedFileName;
	}

}
