<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="${path}/resources/css/error/error.css"/>

<c:set var="content">
	<section>
	<div class="error" style="background-image: url('${path}/resources/img/error/error_400.png');">
		<h1>잘못된 요청입니다.</h1>
		<h2>사이트를 이용할 수 없습니다.</h2>
		<a href="/">메인으로</a>
	</div>
	</section>
</c:set>

<%@ include file="/WEB-INF/views/common/frame.jsp" %>