<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="${path}/resources/css/developer/readOtherPage.css"/>

<c:set var="content">
	<input id="dno" type="hidden" value="${param.dno}" />
	<div class="container">
		<div class="input">
			<span id="info"  onclick="location.href='/developer/Info?id=${developerInfo.uno}'" ><b>${memberName}</b> &nbsp; 프로필</span>
			<span class="home-tooltip">개발자 프로필 보기</span>
			<span>
			제목
			<input id="title" type="text" value="${developerInfo.title}" readonly />
			</span>
		</div>
		
		<div class="profile">
			<div class="firstRow">
				<div class="img">
					<c:if test="${!empty developerInfo.imgUrl}">
						<img src="${developerInfo.imgUrl}" id="sampleImg" />
					</c:if>
					<c:if test="${empty developerInfo.imgUrl}">
						<img src="${path}/resources/img/profile.jpg" id="sampleImg" />
					</c:if>
				</div>
				<div class="introduce">
					<span>개발자 소개</span>
					<textarea class="introduce2" id="introduce" readonly >${developerInfo.content}</textarea>
				</div>
			</div>
			<div class="secondRow">
				<div class="tendency">
					<h3>성향</h3>
					<div>
		                <input type="radio" id="tend" name="tend" class="tend" value="FRONT" ${developerInfo.tendency == 'FRONT' ? 'checked' : ''} disabled />
		                <label for="tend">프론트엔드</label>
		                <input type="radio" id="tend2" name="tend" class="tend" value="BACK" ${developerInfo.tendency == 'BACK' ? 'checked' : ''} disabled />
		                <label for="tend2">백엔드</label>
		                <input type="radio" id="tend3" name="tend" class="tend" value="APP" ${developerInfo.tendency == 'APP' ? 'checked' : ''} disabled />
		                <label for="tend3">앱</label>
	            	</div>
				</div>
				<div class="introduce">
					<span>개발자 기술스택</span>
					<textarea class="introduce2" id="skill" readonly >${developerInfo.skill}</textarea>
				</div>
			</div>
			
			<div class="thirdRow">
				<table border="1">
					<tr>
						<th colspan="2">
							<span>학력사항</span>
						</th>
					</tr>
					<tr>
						<th>학교명</th>
						<td>
							<textarea id="school" readonly >${developerInfo.school}</textarea>
						</td>
					</tr>
				</table>
			</div>
			
			<div class="fourthRow">
				<table border="1">
					<tr>
						<th colspan="3">
							<span>경력사항</span>
						</th>
					</tr>
					<tr>
						<th>직장명</th>
						<th>근무기간</th>
						<th>담당업무</th>
					</tr>
					<tr>
						<td>
							<input class="nameList" type="text" readonly />
						</td>
						<td>
							<input class="periodList" type="text" readonly />
						</td>
						<td>
							<input class="resList" type="text" readonly />
						</td>
					</tr>
					<tr>
						<td>
							<input class="nameList" type="text" readonly />
						</td>
						<td>
							<input class="periodList" type="text" readonly />
						</td>
						<td>
							<input class="resList" type="text" readonly />
						</td>
					</tr>
					<tr>
						<td>
							<input class="nameList" type="text" readonly />
						</td>
						<td>
							<input class="periodList" type="text" readonly />
						</td>
						<td>
							<input class="resList" type="text" readonly />
						</td>
					</tr>
				</table>
			</div>
			
			<div class="fifthRow">
				<table border="1">
					<tr>
						<th colspan="2">
							<span>보유자격증</span>
						</th>
					</tr>
					<tr>
						<th>자격증명</th>
						<th>취득기간</th>
					</tr>
					<tr>
						<td>
							<input class="licList" type="text" readonly />
						</td>
						<td>
							<input class="acqList" type="text" readonly />
						</td>
					</tr>
					<tr>
						<td>
							<input class="licList" type="text" readonly />
						</td>
						<td>
							<input class="acqList" type="text" readonly />
						</td>
					</tr>
					<tr>
						<td>
							<input class="licList" type="text" readonly />
						</td>
						<td>
							<input class="acqList" type="text" readonly />
						</td>
					</tr>
				</table>
			</div>
			
		</div>
	</div>
</c:set>

<%@ include file="/WEB-INF/views/common/frame.jsp" %>

<script>

	$(document).ready(function() {
		// 컨텐츠 가로 길이 조절
		function setImgSize() {
			let firstRowHeight = $(".firstRow").height();
			
			let profileImg = $("#sampleImg");
			let introduce = $(".introduce");
			let tendency = $(".tendency");
			let imgdiv = $(".img");
			
			// 가로 크기를 세로와 동일하게 바꿈 (이미지)
			imgdiv.css({
				width: firstRowHeight + 'px'
			});
			
			// 변경됭 이미지 크기에 맞춰 가로 변경 (개발자 소개)
			let imgWidth = profileImg.width();
			introduce.css({
				width: 'calc(98% - ' + imgWidth + 'px)'
			});
			
			// 이미지 크기에 맞춰 가로 변경 (성향)
			tendency.css({
				width: firstRowHeight + 'px'
			});
		}
		
		// 페이지 로드 시 이미지 크기 설정
		setImgSize();
		
		// 창 크기 변경 시 이미지 크기 다시 설정
		$(window).resize(function() {
			setImgSize();
		});
		
		let nameList = $(".nameList");
		let periodList = $(".periodList");
		let resList = $(".resList");
		let licList = $(".licList");
		let acqList = $(".acqList");
		
		let dcLength = ${fn:length(developerInfo.DCareer)};
		let dlLength = ${fn:length(developerInfo.DLicense)};
		
		// DCareer 값 설정
	    <c:forEach var="career" items="${developerInfo.DCareer}" varStatus="loop">
	        nameList.eq(${loop.index}).val('${career.jobName}');
	        periodList.eq(${loop.index}).val('${career.jobPeriod}');
	        resList.eq(${loop.index}).val('${career.jobResponsibilities}');
	    </c:forEach>

	    // DLicense 값 설정
	    <c:forEach var="license" items="${developerInfo.DLicense}" varStatus="loop">
	        licList.eq(${loop.index}).val('${license.licenseName}');
	        acqList.eq(${loop.index}).val('${license.acquisitionDate}');
	    </c:forEach>
	});
	
</script>