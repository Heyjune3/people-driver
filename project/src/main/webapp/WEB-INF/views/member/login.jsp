<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

</style>

<c:set var="content">
	<div>
		<label>
			<h1>로그인</h1>
		</label>
		
		<label>아이디</label>
		<input type="text" name="id" required autofocus />
		
		<label>비밀번호</label>
		<input type="password" name="pass" required />
		
		<input type="checkbox" id="login" name="login" />
		<label for="login">로그인 상태 유지</label>
		
		<button>로그인</button>
		<input type="button" onclick="location.href='findPass.jsp'" value="비밀번호 찾기" />
	</div>
</c:set>

<%@ include file="/WEB-INF/views/common/frame.jsp" %>