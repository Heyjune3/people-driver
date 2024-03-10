<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="page"/>
<link rel="stylesheet" href="${path}/resources/css/lejcss/search.css"/>
<c:set var="content">
	<!-- 프로젝트 찾기 UI -->
<div class="frame1">
	
	<div class="FilterUi">
		<!-- 검색바 -->
		<div class="MenuBar">
			<input type="text" id="SearchBar" placeholder="프로젝트 제목을 입력해주세요." />
			<img src="resources/img/searchBtn.png" id="searchBtn"/>
		</div>
	
		<!-- 필터 -->
		<span id="Filter">필터</span>
		
		<div id="line5"></div>
		<div id="FixedTermBar">기간제</div>
		<div id="OutsourcingBar">외주</div>

		<div id="line3"></div>
		<span id="ChooseIn">선택 분야</span>
		<div id="WebBar">웹</div>
		<div id="BackBar">백앤드</div>
		<div id="FrontBar">프론트앤드</div>
		
		<div id="line4"></div>
		
		<span id="PaymentIn">금액</span>
	
		<div>
			<div id="MinPay"></div>
			<span id="NaN_0002">~</span>
			<div id="MaxPay"></div>
		</div>
		
		<div id="line6"></div>
		<span id="StartDate">시작일</span>
		<div id="StartDateBar"></div>
		<span id="NaN">~</span>
		<span id="EndDate">종료일</span>
		<div id="EndDateBar"></div>
		<span id="MinTerm">최소 기간</span>
		<div id="MinTermBar"></div>
		<span id="NaN_0001">~</span>
		<span id="MaxTerm">최대 기간</span>
		<div id="MaxTermBar"></div>
		
		<div id="line7"></div>
		
		<div id="ResetBar">초기화</div>
		<div id="ProSearch">프로젝트 검색</div>
	</div>
	
	
	<!-- 개별 프로젝트 -->	
	<div class="ProjectBar">
	
		<div id="CountProjectFrame">
			<span id="CountProject">OOO개의 프로젝트</span>
		</div>
	
		<!-- 정렬 -->
		<div id="ProArray">
			<span id="ClickArray">기본 정렬순</span>
			<span id="ClickStartDate">시작 날짜 순</span>
			<span id="ClickRecent">최신순</span>
			<span id="ClickHighPay">높은 금액 순</span>
		</div>
		
		<div id="Ellipse4"></div>
		<span id="ProTitle">
			<a href="/business/project" >어플리케이션 회계 페이지 구축</a>
		</span>
		<span id="ProPay">금액</span>
		
		<img src="#" alt="icon" id="ClarityWonSolid" />
		<span id="Payment">100,000,000 원</span>
		
		<div id="Ellipse5"></div>
		<span id="ProClarlification">프로젝트 설명</span>
		<div id="ProClarlificationBar"></div>
		<span id="Explain">
		-Health Kihosk의 회계 페이지 UI 구축<br/>
		-당일 매출, 월 매출, 년 매출 개발 필요<br/>
		-SenceBuilder를 이용해 개발해줄 인재
		</span>
		<span id="Choose">선택분야</span>
		<div id="Ellipse7"></div>
		<span id="Back_0001">프론트앤드</span>
		<span id="Term">기간</span>
		<div id="Ellipse8"></div>
		<span id="TermDate">
		시작일 : 2023.09.18<br/>
		근무 기간 : 30일
		</span>
		<span id="Company">회사명</span>
		<div id="Ellipse9"></div>
		<span id="CompanyName">(주) Health - Kihosk</span>
		<div id="OutsourcingBar_0001">외주</div>
	</div>
	
	
	
	
	
	
	
</div>
</c:set>
	

<%@ include file="/WEB-INF/views/common/frame.jsp" %>
















