<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="${path}/resources/css/developer/findD.css"/>

<c:set var="content">
	
	<div class="container">
		<div class="sideBar">
			<ul class="tab-list">
				<li><span onclick="showFirstRow()">등록된 프로필 보기</span></li>
				<li><span onclick="showSecondRow()">체결된 회원 목록</span></li>
				<li><span onclick="showThirdRow()">대기중인 회원 목록</span></li>
			</ul>
		</div>
		
		<div class="content">
			<div class="developerList">
				<p>등록된 개발자 프로필 목록</p>
				<div class="find">
					<label>찾기</label>
					<div class="findName">
						<input id="firstFindName" type="text" placeholder="회원 이름으로 검색" />
						<img id="firstSearchName" class="searchName" src="${path}/resources/img/home/findD/searchBtn.png" />
					</div>
				</div>
				<div class="findProfile">
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
							<c:when test="${!empty developerAllList}">
								<c:forEach var="developer" items="${developerAllList}">
								<tr>
									<c:choose>
									<c:when test="${!empty developer.imgUrl}">
										<td><img src="${developer.imgUrl}" style="width:100px; height:100px; object-fit:cover;" /></td>
									</c:when>
									<c:otherwise>
										<td><img src="${path}/resources/img/profile.jpg" style="width:100px; height:100px; object-fit:cover;" /></td>
									</c:otherwise>
									</c:choose>
									<td><a href="/developer/readOtherPage?dno=${developer.dno}">${developer.title}</a></td>
									<td>${developer.tendency}</td>
									<td>${developer.member.name}</td>
									<td>${developer.updateDate}</td>
									<td>${developer.viewCount}</td>
								</tr>
								</c:forEach>
								<c:if test="${!empty pm and pm.maxPage > 0}">
									<tr>
										<th colspan="6">
											<c:choose>
												<c:when test="${!empty param.name}">
													<c:if test="${pm.first}"> <!-- 제일 처음으로 갈 수 있는가? -->
														<a href="/developer/searchFirst?name=${param.name}&page=1">[&laquo;]</a>
													</c:if>
													<c:if test="${pm.prev}"> <!-- 이전으로 갈 수 있는가? -->
														<a href="/developer/searchFirst?name=${param.name}&page=${pm.startPage-1}">[&lt;]</a>
													</c:if>
													<c:forEach var="i" begin="${pm.startPage}" end ="${pm.endPage}">
														<a href="/developer/searchFirst?name=${param.name}&page=${i}">[${i}]</a>
													</c:forEach>
													<c:if test="${pm.next}">
														<a href="/developer/searchFirst?name=${param.name}&page=${pm.endPage+1}">[&gt;]</a>
													</c:if>
													<c:if test="${pm.last}">
														<a href="/developer/searchFirst?name=${param.name}&page=${pm.maxPage}">[&raquo;]</a>
													</c:if>
												</c:when>
												<c:otherwise>
													<c:if test="${pm.first}"> <!-- 제일 처음으로 갈 수 있는가? -->
														<a href="/developer/search?page=1">[&laquo;]</a>
													</c:if>
													<c:if test="${pm.prev}"> <!-- 이전으로 갈 수 있는가? -->
														<a href="/developer/search?page=${pm.startPage-1}">[&lt;]</a>
													</c:if>
													<c:forEach var="i" begin="${pm.startPage}" end ="${pm.endPage}">
														<a href="/developer/search?page=${i}">[${i}]</a>
													</c:forEach>
													<c:if test="${pm.next}">
														<a href="/developer/search?page=${pm.endPage+1}">[&gt;]</a>
													</c:if>
													<c:if test="${pm.last}">
														<a href="/developer/search?page=${pm.maxPage}">[&raquo;]</a>
													</c:if>	
												</c:otherwise>
											</c:choose>
										</th>
									</tr>
								</c:if>
							</c:when>
							<c:otherwise>
							<tr>
								<th colspan="6">등록된 프로필이 없습니다.</th>
							</tr>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
			</div>
			<div class="developerContractList">
				<p>현재 계약 중인 회원 목록</p>
				<div class="find">
					<label>찾기</label>
					<div class="findName">
						<input type="text" placeholder="회원 이름으로 검색" />
						<img class="searchName" src="${path}/resources/img/home/findD/searchBtn.png" />
					</div> 
				</div>
				<div class="findProfile">
					<table border="1">
						<tr>
							<th>회원 사진</th>
							<th>회원 이름</th>
							<th>회원 이메일</th>
							<th>회원 전화번호</th>
							<th>계약 된 비즈니스</th>
						</tr>
						<c:choose>
							<c:when test="${!empty developerInfo}">
								<c:forEach var="developer" items="${developerInfo}">
								<tr>
									<c:choose>
									<c:when test="${!empty developer.imgUrl}">
										<td><img src="${developer.imgUrl}" style="width:100px; height:100px; object-fit:cover;" /></td>
									</c:when>
									<c:otherwise>
										<td><img src="${path}/resources/img/profile.jpg" style="width:100px; height:100px; object-fit:cover;" /></td>
									</c:otherwise>
									</c:choose>
									<td><a href="/developer/readOtherPage?dno=${developer.dno}">${developer.title}</a></td>
									<td>${developer.tendency}</td>
									<td>${developer.member.name}</td>
									<td>${developer.updateDate}</td>
									<td>${developer.viewCount}</td>
								</tr>
								</c:forEach>
								<c:if test="${!empty pm2 and pm2.maxPage > 0}">
									<tr>
										<th colspan="6">
											<c:if test="${pm2.first}"> <!-- 제일 처음으로 갈 수 있는가? -->
												<a href="/developer/profile?id=${loginMember.id}&page=1">[&laquo;]</a>
											</c:if>
											<c:if test="${pm2.prev}"> <!-- 이전으로 갈 수 있는가? -->
												<a href="/developer/profile?id=${loginMember.id}&page=${pm2.startPage-1}">[&lt;]</a>
											</c:if>
											<c:forEach var="i" begin="${pm2.startPage}" end ="${pm2.endPage}">
												<a href="/developer/profile?id=${loginMember.id}&page=${i}">[${i}]</a>
											</c:forEach>
											<c:if test="${pm2.next}">
												<a href="/developer/profile?id=${loginMember.id}&page=${pm2.endPage+1}">[&gt;]</a>
											</c:if>
											<c:if test="${pm2.last}">
												<a href="/developer/profile?id=${loginMember.id}&page=${pm2.maxPage}">[&raquo;]</a>
											</c:if>
										</th>
									</tr>
								</c:if>
							</c:when>
							<c:otherwise>
							<tr>
								<th colspan="6">후에 업데이트 될 예정.</th>
							</tr>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
			</div>
			<div class="developerPauseList">
				<p>현재 계약 대기 중인 회원 목록</p>
				<div class="find">
					<label>찾기</label>
					<div class="findName">
						<input type="text" placeholder="회원 이름으로 검색" />
						<img class="searchName"  src="${path}/resources/img/home/findD/searchBtn.png" />
					</div> 
				</div>
				<div class="findProfile">
					<table border="1">
						<tr>
							<th>회원 사진</th>
							<th>회원 이름</th>
							<th>회원 이메일</th>
							<th>회원 전화번호</th>
							<th>이메일로 연락하기</th>
						</tr>
						<c:choose>
							<c:when test="${!empty developerInfo2}">
								<c:forEach var="developer" items="${developerInfo2}">
								<tr>
									<c:choose>
									<c:when test="${!empty developer.imgUrl}">
										<td><img src="${developer.imgUrl}" style="width:100px; height:100px; object-fit:cover;" /></td>
									</c:when>
									<c:otherwise>
										<td><img src="${path}/resources/img/profile.jpg" style="width:100px; height:100px; object-fit:cover;" /></td>
									</c:otherwise>
									</c:choose>
									<td><a href="/developer/readOtherPage?dno=${developer.dno}">${developer.title}</a></td>
									<td>${developer.tendency}</td>
									<td>${developer.member.name}</td>
									<td>${developer.updateDate}</td>
									<td>${developer.viewCount}</td>
								</tr>
								</c:forEach>
								<c:if test="${!empty pm3 and pm3.maxPage > 0}">
									<tr>
										<th colspan="5">
											<c:if test="${pm3.first}"> <!-- 제일 처음으로 갈 수 있는가? -->
												<a href="/developer/profile?id=${loginMember.id}&page=1">[&laquo;]</a>
											</c:if>
											<c:if test="${pm3.prev}"> <!-- 이전으로 갈 수 있는가? -->
												<a href="/developer/profile?id=${loginMember.id}&page=${pm3.startPage-1}">[&lt;]</a>
											</c:if>
											<c:forEach var="i" begin="${pm2.startPage}" end ="${pm2.endPage}">
												<a href="/developer/profile?id=${loginMember.id}&page=${i}">[${i}]</a>
											</c:forEach>
											<c:if test="${pm3.next}">
												<a href="/developer/profile?id=${loginMember.id}&page=${pm3.endPage+1}">[&gt;]</a>
											</c:if>
											<c:if test="${pm3.last}">
												<a href="/developer/profile?id=${loginMember.id}&page=${pm3.maxPage}">[&raquo;]</a>
											</c:if>
										</th>
									</tr>
								</c:if>
							</c:when>
							<c:otherwise>
							<tr>
								<th colspan="5">후에 업데이트 될 예정.</th>
							</tr>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
			</div>		
		</div>
	</div>
	
	
</c:set>

<%@ include file="/WEB-INF/views/common/frame.jsp" %>

<script>

	$(document).ready(function() {
		
		// 처음 페이지 오픈
		$('.developerList').css({
        	display: 'block'
        });
        $('.developerContractList').css({
        	display: 'none'
        });
        $('.developerPauseList').css({
        	display: 'none'
        });
		
		var firstFindName = $("#firstFindName");
		var firstSearchName = $("#firstSearchName");
		
		firstFindName.keypress(function(e) {
			if (e.key === 'Enter') {
				e.preventDefault();
				sendRequest();
			}
		});
		
		firstSearchName.click(function() {
			sendRequest();
		})
		
		function sendRequest() {
			let firstInputValue = firstFindName.val().trim();
			
			if (firstInputValue === '') {
				window.location.href="/developer/search";
			} else {
				window.location.href="/developer/searchFirst?name="+firstInputValue;	
			}
		}
	});
	
	// 탭 버튼 구현
    function showFirstRow() {
        $('.developerList').css({
        	display: 'block'
        });
        $('.developerContractList').css({
        	display: 'none'
        });
        $('.developerPauseList').css({
        	display: 'none'
        });
    }

    function showSecondRow() {
    	$('.developerList').css({
        	display: 'none'
        });
        $('.developerContractList').css({
        	display: 'block'
        });
        $('.developerPauseList').css({
        	display: 'none'
        });
    }

    function showThirdRow() {
    	$('.developerList').css({
        	display: 'none'
        });
        $('.developerContractList').css({
        	display: 'none'
        });
        $('.developerPauseList').css({
        	display: 'block'
        });
    }
	
</script>