<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="page" />
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
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css"/>

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
	
	header #logout:hover {
		cursor: pointer;
		text-decoration: underline;
		color: blue;
	}
	
	header .prifileImage {
		box-sizing: border-box; /* border와 padding을 포함한 전체 요소 크기 지정 */
	}
	
	header .profileImage:hover {
		box-shadow: 0 0 0 3px green;
		cursor: pointer;
	}
	
	header .profileImage2:hover {
		cursor: default;
		box-shadow: none;
	}
	
	header .modal {
            position: absolute;
            display: none;
            align-items: center;
            flex-direction: column;
            width: 300px;
            height: 300px;
            border: 1px solid black;

            justify-content: center;
            background-color: rgba(255,255,255);
        }
        header .modal_body {
            display: flex;
            flex-direction: row;
            margin-bottom: 20px;
        }

        header .modal_info {
            padding: 10px 0;
            
        }

        header .modal_info * {
            display: flex;
            flex-direction: column;
            margin: 5px;
            border: none;
            padding: 0;
        }

        header .modal_footer {
            display: flex;
            gap : 10px;
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
						<img onclick="modalShow($(this))" class="profileImage" src="${sessionScope.loginMember.imgUrl}" style="width:50px; height:50px; border-radius: 50%; object-fit: cover;" />
						<div class="modal">
					        <h2>프로필</h2>
					        <div class="modal_body">
					            <div>
					                <img class="profileImage profileImage2" style="width: 100px; height: 100px; border-radius: 50%; object-fit: cover;" src="${sessionScope.loginMember.imgUrl}" />
					            </div>
					            <div class="modal_info">
					                <input style="width:190px;" value="이름 : ${sessionScope.loginMember.name}" readonly >
					                <input style="width:190px;" value="아이디 : ${sessionScope.loginMember.email}" readonly >
					                <input style="width:190px;" value="역할 : ${sessionScope.loginMember.role}" readonly >
					                <input style="width:190px;" value="성별 : ${sessionScope.loginMember.gender}" readonly >
					                <input style="width:190px;" value="전화번호 : ${sessionScope.loginMember.phoneNo}" readonly >
					            </div>
					        </div>
					        <div class="modal_footer">
					            <a href="/user/editProfile">회원정보 수정</a>
					            <a href="/developer/register">프로필 등록</a>
					            <a href="/business/register">프로젝트 등록</a>
					            <span id="logout" onclick="logout()">로그아웃</span>
					        </div>
					    </div>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
	</header>
<script>
const msg = '${message}';
if (msg != '') {
	alert(msg);
}

	var image = $(".profileImage");
	var modal = $(".modal");
	var flag = false; // 닫혀있는 상태
	
	if (!image.attr("src")) {
		image.attr("src", "${path}/resources/img/profile.jpg");
	}
	
	$(window).resize(function() {
		if (flag === true) {
			let position = image.offset();
			modal.css({
				"top": position.top + image.outerHeight(),
				"left": position.left - 300 + image.outerWidth()
			});
		}
	});
	
	function modalShow(e) {
		// 현재 이벤트가 발생한 객체 위치
		let position = e.offset();
		if (flag === false) {
			modal.css({
				"display": "flex",
				"top": position.top + e.outerHeight(),
				"left": position.left - 300 + e.outerWidth()
			});	
			flag = true;
		} else {
			modal.css({
				"display": "none"
			});
			flag = false;
		}
	}

	function logout() {
		alert("로그아웃 완료");
		window.location.href="/user/logout";
	}
</script>