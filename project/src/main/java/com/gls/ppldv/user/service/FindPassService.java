package com.gls.ppldv.user.service;

import javax.servlet.http.HttpServletRequest;

import com.gls.ppldv.user.entity.Member;
import com.gls.ppldv.user.entity.PassCode;

public interface FindPassService {

	/**
	 * 비밀번호 찾기 메일 발송 요청 <br/>
	 *
	 * @param member  - 저장된 member 의 id와 name
	 * @param request - context 경로 받아오기 위함 <br/>
	 * @return - 메시지
	 */
	String findPassSubmit(Member member, HttpServletRequest request) throws Exception;

	/**
	 * 이메일을 확인하여 비밀번호 변경 페이지 요청 처리 <br/>
	 *
	 * @param passCode - 저장된 passCode 의 id, code
	 * @param request  - id(email), code <br/>
	 * @return - 메시지
	 */
	String changePassCode(PassCode passCode);

	/**
	 * @implNote 비밀번호 변경 페이지에서 새로운 비밀번호를 전달 받아 비밀번호 정보 수정
	 * @param request  - id(email), code, pass
	 * @param response - 비밀번호 변경 요청 처리 결과 응답
	 */
	String changePass(Member member) throws Exception;
}
