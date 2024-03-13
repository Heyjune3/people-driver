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
		<div>
			<span id="Filter">필터</span>
		</div>
		
		<div id="line5"></div>
		<div class="proceedWay">
				<input type="radio" id="OutsourcingBar" name="proceed" class="proceed" value="outsourcing"/>
		        <label for="OutsourcingBar">외주</label>
		        <input type="radio" id="FixedTermBar" name="proceed" class="proceed" value="fiexedTerm"/>
		        <label for="FixedTermBar">기간제</label>
		</div>
		<div id="line3"></div>
		<div>
			<span id="ChooseIn">선택 분야</span>
		</div>
		<div class="chooseWay">
				<input type="radio" id="WebBar" name="options" class="options" value="web"/>
		        <label for="WebBar">웹</label>
		        <input type="radio" id="FrontBar" name="options" class="options" value="FrontEnd"/>
		        <label for="FrontBar">프론트앤드</label>
		        <input type="radio" id="BackBar" name="options" class="options" value="backEnd"/>
		        <label for="BackBar">백앤드</label>
		</div>
		<div id="line4"></div>
		<div><span id="PaymentIn">금액</span></div>
	
		<div class="payRange">
			<input type="text" id="MinPay"/>
			<span id="NaN_0002">~</span>
			<input type="text" id="MaxPay"/>
		</div>
		<div id="line6"></div>
		<div class="dates">
			<span id="StartDate">시작일</span>
			<span id="EndDate">종료일</span>
		</div>
		<div class="dateBars">
			<input type="date" id="StartDateBar" required/>
			<span id="NaN">~</span>
			<input type="date" id="EndDateBar" required/>
		</div>
		<div class="terms">
			<span id="MinTerm">최소 기간</span>
			<span id="MaxTerm">최대 기간</span>
		</div>
		<div class="termBars">
		<input type="text" id="MinTermBar"/>
			<span id="NaN_0001">~</span>
			<input type="text" id="MaxTermBar"/>
		</div>
		<div id="line7"></div>
		<div class="btns">
			<div id="ResetBar">초기화</div>
			<div id="ProSearch">프로젝트 검색</div>
		</div>
		
	</div>
	
	<!-- 총 프로젝트 갯수 -->
	<div class="CountProjectFrame">
			<span id="CountProject">OOO개의 프로젝트</span>
		</div>
	
	<!-- 정렬 -->
	<div id="ProArray">
		<span id="ClickArray">기본 정렬순</span>
		<span id="ClickStartDate">시작 날짜 순</span>
		<span id="ClickRecent">최신순</span>
		<span id="ClickHighPay">높은 금액 순</span>
	</div>
		
	
	<!-- 개별 프로젝트 -->	
	<div class="ProjectBar">
	
		<div id="Ellipse4"></div>
		<div class="proTitleText">
			<span id="ProTitle">
				<a href="/business/project" >어플리케이션 회계 페이지 구축</a>
			</span>
		</div>
		
		<div id="Ellipse5"></div>
		<div>
			<span id="ProClarlification">프로젝트 설명</span>
		</div>
		
		<div class="ProClarlificationBar">
			<span id="Explain">
				-Health Kihosk의 회계 페이지 UI 구축<br/>
				-당일 매출, 월 매출, 년 매출 개발 필요<br/>
				-SenceBuilder를 이용해 개발해줄 인재
			</span>
		</div>
		
		<div>
			<img src="resources/img/won.png" alt="icon" id="ClarityWonSolid" />
		</div>
		<div class="proPayment">
			<span id="ProPay">금액</span>
			<span id="Payment">100,000,000 원</span>
		</div>
		
		
		<div class="proStatus">
			<span id="Choose">선택분야</span>
			<div class="ChooseStatus">
				<div id="Ellipse7"></div>
				<span id="Back_0001">프론트앤드</span>
			</div>
			<br/>
			<span id="Term">기간</span>
			<div class="termStatus">
				<div id="Ellipse8"></div>
				<span id="TermDate">
				시작일 : 2023.09.18<br/>
				근무 기간 : 30일
				</span>
			</div>
			<br/>
			<span id="Company">회사명</span>
			<div class="companyStatus">
				<div id="Ellipse9"></div>
				<span id="CompanyName">(주) Health - Kihosk</span>
			</div>
			
		</div>
		
		<div id="OutsourcingBar_0001">외주</div>
	</div>
	
	
	
	
	
	
	
</div>
</c:set>
	


<%@ include file="/WEB-INF/views/common/frame.jsp" %>
















