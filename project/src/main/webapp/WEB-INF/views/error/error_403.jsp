<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="${path}/resources/css/error/error.css"/>

<c:set var="content">
	<div class="error" style="background-image: url('${path}/resources/img/error/error_403.jpg');">
		<h1>접근 권한이 없습니다.</h1>
		<h3>관리자에게 문의해주세요.</h3>
		<a href="/">메인으로</a>
	</div>
</c:set>

<%@ include file="/WEB-INF/views/common/frame.jsp" %>