<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/developer/profile.css"/>

<c:set var="content">
	<!-- 개인 프로필 등록된 게 있으면 등록된 게시물 보여주고 등록 페이지 오픈 -->
	<h1>등록된 프로필 확인</h1>
	
	<div class="container">
	
		<div class="sidebar">
			<ul class="tab-list">
				<li><a href="#">탭1</a></li>
				<li><a href="#">탭2</a></li>
				<li><a href="#">탭3</a></li>
			</ul>
		</div>
		
		<div class="content">
			<div>
				체결된 프로젝트 목록
			</div>
			<div>
				등록된 프로필 목록
				<a href="/developer/register">등록</a>
				<!-- 만약에 등록된 프로필이 없다면, 등록 -->
				<c:if test=""></c:if>
			</div>
		</div>
		
		
	</div>
	
	
</c:set>

<%@ include file="/WEB-INF/views/common/frame.jsp" %>