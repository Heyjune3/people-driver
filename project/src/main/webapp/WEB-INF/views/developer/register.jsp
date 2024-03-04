<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="${path}/resources/css/developer/register.css"/>

<c:set var="content">
<section>
	<div class="container">
		<div class="input">
			<span>개발자 프로필</span>
			<span>
			제목
			<input type="text" placeholder="제목입력" autofocus="autofocus" />
			</span>
			<span id="register" onclick="register()">프로필 등록</span>
		</div>
		
		<div class="profile">
			<div class="firstRow">
				<c:if test="${loginMember.imgUrl}"></c:if>
				<img src="${loginMember.imgUrl}" id="sampleImg" />
				<div class="introduce">
					<span>개발자 소개</span>
					<textarea id="introduce" placeholder="1000자 이내로 작성해주세요."></textarea>
				</div>
			</div>
			<div class="secondRow">
				<div class="tendency">
					<h3>성향</h3>
					<div>
		                <input type="radio" id="tend" name="tend" class="tend" value="FRONT" checked/>
		                <label for="tend">프론트엔드</label>
		                <input type="radio" id="tend2" name="tend" class="tend" value="BACK"/>
		                <label for="tend2">백엔드</label>
		                <input type="radio" id="tend3" name="tend" class="tend" value="APP"/>
		                <label for="tend3">앱</label>
	            	</div>
				</div>
				<div class="introduce">
					<span>개발자 기술스택</span>
					<textarea id="introduce" placeholder="1000자 이내로 작성해주세요."></textarea>
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
							<textarea placeholder="학력사항에 대해 간단하게 설명해주세요. ex. 어느 고등학교 : 언제 입학, 졸업"></textarea>
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
							<input type="text" placeholder="IT 관련 직장"/>
						</td>
						<td>
							<input type="text" placeholder="ex. 18.03.18 ~ 24.03.18 (6년 근무)"/>
						</td>
						<td>
							<input type="text" placeholder="ex. 개발자 (웹 엔지니어 전문)"/>
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" />
						</td>
						<td>
							<input type="text" />
						</td>
						<td>
							<input type="text" />
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" />
						</td>
						<td>
							<input type="text" />
						</td>
						<td>
							<input type="text" />
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
							<input type="text" placeholder="ex. 리눅스마스터 1급 (KAIT 자격검정)"/>
						</td>
						<td>
							<input type="text" placeholder="ex. 18.06.03 취득"/>
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" />
						</td>
						<td>
							<input type="text" />
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" />
						</td>
						<td>
							<input type="text" />
						</td>
					</tr>
				</table>
			</div>
			
		</div>
	</div>
</section>
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
			
			// 가로 크기를 세로와 동일하게 바꿈 (이미지)
			profileImg.css({
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
	});
</script>