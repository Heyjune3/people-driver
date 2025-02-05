<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="${path}/resources/css/error/error.css"/>

<c:set var="content">
	<section>
	<div class="error" style="background-image: url('${path}/resources/img/error/error_404.jpg');">
		<h1>요청하신 페이지를 찾을 수 없습니다.</h1>
		<h3>확인 후 다시 요청 해주세요.</h3>
		<a href="javascript:history.go(-1);">이전페이지로</a>
	</div>
	</section>
</c:set>

<%@ include file="/WEB-INF/views/common/frame.jsp" %>