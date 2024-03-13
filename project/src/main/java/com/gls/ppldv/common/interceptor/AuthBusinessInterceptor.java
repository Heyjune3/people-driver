package com.gls.ppldv.common.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class AuthBusinessInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// 전체 URL 요청 경로
		String requestURI = request.getRequestURI();
		// 프로젝트 경로
		String contextPath = request.getContextPath();
		// session에 저장된 로그인된 사용자 정보
		Object obj = request.getSession().getAttribute("loginMember");
		
		String regex = "[-+]?\\d*\\.?\\d+"; // 숫자일때만 확인(게시글 번호가 숫자이므로)
	
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		
		// 미로그인된 사용자
		if (obj == null) {
			if (request.getMethod().equalsIgnoreCase("get")) {
				// get 매핑일 때만
				out = response.getWriter();
				
				out.println("<script>");
				out.println("alert('로그인부터 해주세요.');");
				out.println("location.href='"+contextPath+"/user/login'");
				out.println("</script>");
				return false;
			}
			return true;
		// 로그인된 사용자
		} else {
			return true;
		}
	}

	
}
