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
				<li><span onclick="showFirstRow()">체결된 프로젝트 보기</span></li>
				<li><span onclick="showSecondRow()">프로필 보기</span></li>
				<li><span onclick="showThirdRow()">프로필 삭제</span></li>
			</ul>
		</div>
		
		<div class="content">
			<div class="firstRow">
				체결된 프로젝트 목록
			</div>
			<div class="secondRow">
				등록된 프로필 목록
				<a href="/developer/register">등록</a>
				<table border="1">
					<tr>
						<th>증명사진</th>
						<th>제목</th>
						<th>성향</th>
						<th>이름</th>
						<th>업데이트 날짜</th>
						<th>조회수</th>
					</tr>
					<c:choose>
						<c:when test="${!empty developerList}">
							<c:forEach var="developer" items="${developerList}">
							<tr>
								<c:choose>
								<c:when test="${!empty developer.imgUrl}">
									<td><img src="${developer.imgUrl}" style="width:100px; height:100px; object-fit:cover;" /></td>
								</c:when>
								<c:otherwise>
									<td><img src="${path}/resources/img/profile.jpg" style="width:100px; height:100px; object-fit:cover;" /></td>
								</c:otherwise>
								</c:choose>
								<td><a href="/developer/readPage">${developer.title}</a></td>
								<td>${developer.tendency}</td>
								<td>${loginMember.name}</td>
								<td>${developer.updateDate}</td>
								<td>${developer.viewCount}</td>
							</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
						<tr>
							<th colspan="5">등록된 게시물이 없습니다.</th>
						</tr>
						</c:otherwise>
					</c:choose>
				</table>
				
			</div>
			
			<div class="thirdRow">
				삭제 할 수 있는 목록
			</div>
		</div>
		
		
	</div>
	
	
</c:set>

<%@ include file="/WEB-INF/views/common/frame.jsp" %>

<script>

	// 탭 버튼 구현
    function showFirstRow() {
        $('.firstRow').css({
        	display: 'block'
        });
        $('.secondRow').css({
        	display: 'none'
        });
        $('.thirdRow').css({
        	display: 'none'
        });
    }

    function showSecondRow() {
    	$('.firstRow').css({
        	display: 'none'
        });
        $('.secondRow').css({
        	display: 'block'
        });
        $('.thirdRow').css({
        	display: 'none'
        });
    }

    function showThirdRow() {
    	$('.firstRow').css({
        	display: 'none'
        });
        $('.secondRow').css({
        	display: 'none'
        });
        $('.thirdRow').css({
        	display: 'block'
        });
    }
</script>