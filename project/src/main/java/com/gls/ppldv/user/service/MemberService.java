package com.gls.ppldv.user.service;

import org.springframework.web.multipart.MultipartFile;

import com.gls.ppldv.user.entity.Member;

public interface MemberService {
	
	/**
	 * 회원 등록
	 * @param member - 회원 등록을 위한 객체
	 * @param file - 클라이언트로부터 받은 파일
	 * @return - 메세지
	 */
	public String register(Member member, MultipartFile file) throws Exception;
}
