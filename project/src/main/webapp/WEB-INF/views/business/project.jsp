<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="page"/>
<link rel="stylesheet" href="${path}/resources/css/lejcss/project.css"/>
<c:set var="content">
<div class="Frame">
			<div class="Project">
				<div class="proceed">
					<div id="Outsourcing">외주</div>
					<div id="Select">프론트앤드</div>
				</div>
				<div>
					<span id="ApplyTime">등록일  2024.02.23</span>
				</div>
				
				<span id="ProjectName">프로젝트 이름</span>
				<ul>
					<li id="ProjectTerm">프로젝트 기간</li>
				</ul>
				<div class="startDates">시작일
					<span id="StartDate">  2024.02.24</span>
				</div>
				<div class="endDates">종료일
					<span id="EndDate">  2024.03.18</span>
				</div>
				<div class="times">기간
					<span id="Time">  23일</span>
				</div>
				<div class="applyDates">모집마감일
					<span id="ApplyDate">2024.03.18</span>
				</div>
				
				<div class="ProPayment">
					<span id="PayTitle">금액</span>
					<img src="${path}/resources/img/won.png" id="won"/>
					<span id="Pay">10,000,000 원</span>
				</div>
				<div class="CompanyInfomation">
					<span id="Name">
						회사명
					</span>
					<span id="CompanyName">
						(주)Health-Kiosk
					</span>
					<span id="Email">
						담당자 이메일
					</span>
					<span id="CompanyEmail">
						test@gmail.com
					</span>
					<span id="Phone">
						담당자 전화번호
					</span>
					<span id="CompanyPhone">
						010-1111-1111
					</span>
					<span id="Adress">
						주소
					</span>
					<span id="CompanyAdress">
						부산시 수영구 광남로 70
					</span>
				</div>
				<svg xmlns="http://www.w3.org/2000/svg" id="Line4">
					<path fill="transparent" d="M 0 0 L 1113 0">
						
					</path>
				</svg>
				<span id="ProContent">
					프로젝트 내용
				</span>
				<span id="ProContents">
					프로젝트 소개 :<br/>
		<br/>
		진행 현황 :<br/>
		<br/>
		자격요건 : <br/>
		<br/>
		개발 언어 :<br/>
		<br/>
		 참고 :<br/>
		      <br/>
		기타 유의 사항 : <br/>
		<br/>
		<br/>
		
				</span>
			</div>
			<div id="ProjectApply">
				<div id="ProApply">
					
				</div>
				<span id="ProjectApply_0001">
					프로젝트 신청
				</span>
				<span id="DeveloperInfo">
					인적 사항
				</span>
				<span id="DeveloperName">
					*성함
				</span>
				<div id="DeveloperNameBar">
					
				</div>
				<span id="DeveloperPhone">
					*전화번호
				</span>
				<div id="DeveloperPhoneBar">
					
				</div>
				<span id="DeveloperGender">
					*성별
				</span>
				<div id="DeveloperGenderBar">
					
				</div>
				<span id="DeveloperEmail">
					*e-mail
				</span>
				<div id="DeveloperEmailBar">
					
				</div>
				<svg xmlns="http://www.w3.org/2000/svg" id="Line9">
					<path fill="transparent" d="M 0 0 L 286 0">
						
					</path>
				</svg>
				<span id="Capacity">
					자격 요건
				</span>
				<span id="Languge">
					*사용 언어
				</span>
				<div id="LangugeBar">
					
				</div>
				<span id="License">
					보유 자격증
				</span>
				<div id="LicenseBar1">
					
				</div>
				<div id="LicenseBar2">
					
				</div>
				<div id="LicenseBar3">
					
				</div>
				<span id="School">
					최종 학력
				</span>
				<div id="SchoolBar">
					
				</div>
				<svg xmlns="http://www.w3.org/2000/svg" id="Line5">
					<path fill="transparent" d="M 0 0 L 1113 0">
						
					</path>
				</svg>
				<span id="Attachment">
					이력서 첨부
				</span>
				<div id="FileBtn">
					
				</div>
				<div id="FileUpload">
					
				</div>
				<span id="FileName">
					파일명.
				</span>
				<div id="AttachAjax">
					
				</div>
				<span id="AttachDrag">
					첨부하실 파일을 마우스로 끌어 오세요.
				</span>
				<div id="Line8">
					
				</div>
				<div id="ApplyBtn">
					
				</div>
			</div>
			<div id="AskUi">
				<div id="Ask">
					
				</div>
				<span id="AskTitle">
					문의
				</span>
				<span id="AskEmail">
					kfd45******
				</span>
				<span id="AskContent">
					-댓글 내용
				</span>
				<span id="AskDate">
					2024.02.23  10:45
				</span>
				<svg xmlns="http://www.w3.org/2000/svg" id="Line5_0001">
					<path fill="transparent" d="M 0 0 L 1113 0">
						
					</path>
				</svg>
				<div id="Rectangle11">
					
				</div>
				<div id="AskBtn">
					
				</div>
			</div>
			<div id="Delete">
				
			</div>
			<div id="Update">
				
			</div>
		</div>

</c:set>
	


<%@ include file="/WEB-INF/views/common/frame.jsp" %>
















