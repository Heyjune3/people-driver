package com.gls.ppldv.user.util;

import java.io.IOException;
import java.util.UUID;

public class FileUtil {
	
	
	
	public String uploadFile(String original, byte[] fileData) throws IOException {
		String savedFileName = "";
		String uuid = UUID.randomUUID().toString(); // 총 32개의 랜덤 문자 + 4개의 -으로 조합된 36자리 문자
		savedFileName = uuid.replace("-", "")+"_"+original; // 저장되는 파일 이름
		
		//Spring 에서 제공하는 파일 헬퍼 객체를 이용해 지정된 위치에 파일 업로드
		
		
		return null;
	}
}
