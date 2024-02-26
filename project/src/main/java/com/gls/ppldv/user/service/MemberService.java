package com.gls.ppldv.user.service;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import com.gls.ppldv.user.entity.Member;

public interface MemberService {
	
	/**
	 * 회원 등록(이미지 포함)
	 * @param member - 회원 등록을 위한 객체
	 * @param file - 클라이언트로부터 받은 파일
	 * @return - 메세지
	 */
	public String register(Member member, MultipartFile file) throws Exception;
	
	/**
	 * 회원 등록(이미지 없이)
	 * @param member - 회원 등록을 위한 객체
	 * @return - 메세지
	 */
	public String register(Member member) throws Exception;
	
	
	/**
	 * 로그인
	 * @param member - 회원 찾기를 위한 객체
	 * @return - 존재하는 회원 정보
	 */
	public Member login(Member member) throws Exception;
	
	/**
	 * 로그아웃
	 * @param request - session, cookie 정보 불러오기 위한 request
	 * @param response - cookie 정보를 반환해주기 위한 response
	 * @return - 로그아웃 메시지 반환
	 */
	public String logOut(HttpServletRequest request, HttpServletResponse response);
}
