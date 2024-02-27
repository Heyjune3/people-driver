<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Postcodify (주소) -->
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<!-- 카카오맵 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8bfd085ed59957246b59c9466c5d09d7"></script>
<meta charset="UTF-8">
<title>Web Site</title>
<link rel="stylesheet" type="text/css" href="/resources/css/common.css"/>
<style type="text/css">
	header, footer, main {
		border:1px solid black;
		margin: 5px 0;
	}
	
	header ul {
		
		list-style-type: none; /* 목록 기호 제거 */
		text-align: right;
		margin: 0;
		padding: 0;
	}
	
	header ul li {
		display: inline-block; /* 목록 항목을 인라인 블록 요소로 설정 */
		margin-right: 10px;
	}
	
	#logout:hover {
		cursor: pointer;
		text-decoration: underline;
		color: blue;
	}
	
</style>

</head>
<body>
	<header>
		<!-- 헤더 내용 추가 -->
		<div>
			<!-- 왼쪽 상단에 로고 추가 -->
		</div>
		<nav>
			<ul>
				<li><a href="/">home</a></li>
				<c:choose>
					<c:when test="${empty sessionScope.loginMember}">
					<!-- 로그인 되지 않은 사용자 -->
						<li><a href="/login">로그인</a></li>
						<li><a href="/register">회원가입</a></li>
					</c:when>
					<c:otherwise>
					<!-- 로그인 된 사용자 -->
						<li><a href="/search">프로젝트 찾기</a>
						<li id="logout" onclick="logout()">로그아웃</li>
					</c:otherwise>
				</c:choose>
				
			</ul>
		</nav>
	</header>
<script>
	function logout() {
		$.ajax({
			type : "POST",
			url : "/user/logout",
			dataType : "text",
			success : function(result) {
				alert(result);
				window.location.href="/";
			}	
		});
	}
</script>