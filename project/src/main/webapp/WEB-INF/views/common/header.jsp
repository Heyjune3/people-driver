<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Site</title>
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
				<li><a href="/login">로그인</a></li>
				<li><a href="/logon">회원가입</a></li>
				<li><a href="/register">회원가입2</a></li>
				<li><a href="/search">프로젝트 찾기</a>
			</ul>
		</nav>
	</header>
