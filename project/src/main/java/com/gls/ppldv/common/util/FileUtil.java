package com.gls.ppldv.common.util;

import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

import lombok.RequiredArgsConstructor;

@Component
@PropertySource("classpath:prop/db-aws.properties") // 프로퍼티 가져오기
@RequiredArgsConstructor
public class FileUtil {

	private final AmazonS3 S3Client;

	@Value("${aws.bucket}")
	private String bucketname;

	/**
	 * S3에 파일을 업로드 하고 DB에 imgUrl 저장
	 *
	 * @param file - 받은 파일
	 * @return - 저장한 파일 url + 파일 이름
	 */
	public String uploadFile(MultipartFile file) throws IOException {

		String originalFileName = file.getOriginalFilename(); // 원본 파일 이름
		String ext = originalFileName.substring(originalFileName.lastIndexOf(".")); // 확장자
		String savedFileName = ""; // 저장파일이름
		String uuid = UUID.randomUUID().toString(); // UUID 32 숫자 + 4 개의 -, 36개 랜덤
		savedFileName = uuid.replace("-", "") + "_" + originalFileName;

		// com.amazonaws.services.model
		ObjectMetadata metadata = new ObjectMetadata(); // 메타데이터
		metadata.setContentType("image/" + ext); // 이미지만 처리
		metadata.setContentLength(file.getSize()); // 이미지 크기를 명시해줘야 함

		// S3clinet (버킷이름, 저장할 파일 이름, 인풋스트림, 메타데이터)
		S3Client.putObject(new PutObjectRequest(bucketname, savedFileName, file.getInputStream(), metadata));

		return S3Client.getUrl(bucketname, savedFileName).toString();
	}

	public String savedFileName(String imgUrl) throws IOException {
		int lastIndex = imgUrl.lastIndexOf("/");
		String fileName = imgUrl.substring(lastIndex + 1);

		return fileName;
	}

	public void deleteFile(String fileName) throws IOException {
		S3Client.deleteObject(bucketname, fileName);
	}

	/*
	 * public static MultipartFile
	 * convertToMultipartFile(MultipartHttpServletRequest request) { MultipartFile
	 * file = null;
	 *
	 * try { // 멀티파트 요청에서 파일 데이터를 추출하기 위해 iterator를 사용 Iterator<String> fileNames =
	 * request.getFileNames(); while (fileNames.hasNext()) { String fileName =
	 * fileNames.next(); // 요청에서 파일 이름을 사용해 파일 데이터 가져오기 Map<String, MultipartFile>
	 * fileMap = request.getFileMap(); file = fileMap.get(fileMap); } } catch
	 * (Exception e) { e.printStackTrace(); } return file; }
	 */

}
