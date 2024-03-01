<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="content">
	<h2>홈 페이지</h2>
	<h2>홈 페이지</h2>
	${sessionScope.loginMember}
</c:set>

<%@ include file="/WEB-INF/views/common/frame.jsp" %>