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
@PropertySource("classpath:prop/db-aws.properties") // ������Ƽ ����
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final MemberRepository mr;
	private final MemberMapper mm;
	
	private final AmazonS3 S3Client;
	
	@Value("${aws.bucket}")
	private String bucketname;
	
	
	@Override
	@Transactional // 2���� ��ϰ� ������Ʈ�� ���е��� �ʵ��� ����
	public String register(Member member, MultipartFile file) throws Exception {
		mr.save(member); // �޾ƿ� ��ü�� �����ϸ� imgUrl�� ������ �Ǿ����� ����
		// uploadFile ���� (����ó��)
		// ���� �̹��� ������ ���ε� ���� �ʾ��� ��쵵 �����غ�����
		return null;
	}
	
	
	/**
	 * ������ ��ġ�� ������ ���ε� �� ���ε�� ���� �̸� ��ȯ (S3)
	 * @param file - Ŭ���̾�Ʈ�� ���� ���� �̹��� ����
	 * @return - ���� �̸� ��ȯ(���ε� ��) s3 url+�����̸�
	 */
	public String uploadFile(MultipartFile file) throws IOException {
		String originalFileName = file.getOriginalFilename(); // ���� ���� �̸�
		String ext = originalFileName.substring(originalFileName.lastIndexOf(".")); // Ȯ����
		String savedFileName = ""; // ������ ���� �̸�
		String uuid = UUID.randomUUID().toString(); // �� 32���� ���� ���� + 4���� -���� ���յ� 36�ڸ� ����
		savedFileName = uuid.replace("-", "")+"_"+originalFileName; // ����Ǵ� ���� �̸�
		
		// com.amazonaws.services.model
		ObjectMetadata metadata = new ObjectMetadata(); // ��Ÿ ������
		metadata.setContentType("image/"+ext); // �̹��� ���ϸ� �ø� ���̱� ������

		// S3clinet�� �̿��� S3�� ���� ���ε� (��Ŷ�̸�, ���ε��� ���� �̸�, ���� ��, �Է½�Ʈ��, ��Ÿ������)
		S3Client.putObject(new PutObjectRequest(bucketname, savedFileName, file.getInputStream(), metadata));
		
		// ���⼭ ����� ���� ��θ� DB�� �����ϴ� �޼��带 �����ؾ���
		// TODO 
		
		return savedFileName;
	}

}
