<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="page"/>
<link rel="stylesheet" href="${path}/resources/css/lejcss/register.css?after"/>


<!-- 개별 프로젝트 창 -->
<c:set var="content">
	<div class="frame3">
		<span id="ProApply">프로젝트 등록</span>
		<div class="title">
			<div id="ProTitle">제목</div>
			<input type="text" id="ProTitleBar"
			 placeholder="*등록하실 프로젝트 제목을 입력해주세요."
			 onfocus="this.placeholder=''"
			 onblur="this.placeholder='*등록하실 프로젝트 제목을 입력해주세요.'"/>
		</div>
		 
		 
		<input type="text" id="ApplyPayBar"
		 placeholder="*금액을 입력해주세요."
		 onfocus="this.placeholder=''"
		 onblur="this.placeholder='*금액을 입력해주세요.'"/>
		<div id="ApplyPay">금액</div>
		<img src="${path}/resources/img/won.png" id="Won"/>
		<div id="CompanyName">사업체명</div>
		<input type="text" id="CompanyNameBar"
		 placeholder="*회사명을 입력해주세요."
		 onfocus="this.placeholder=''"
		 onblur="this.placeholder='*회사명을 입력해주세요.'"/>
		<div id="Term">기간</div>
		<input type="text" id="TermBar"
		 placeholder="*기간을 입력해주세요."
		 onfocus="this.placeholder=''"
		 onblur="this.placeholder='*기간을 입력해주세요.'"/>
		<div id="StartDate">시작일</div>
		<input type="date" id="StartDateBar" data-placeholder="*시작일을 선택해주세요."
		aria-required="true" required/>
		<input type="date" id="EndDateBar" data-placeholder="*종료일을 선택해주세요." 
		required/>
		<div id="EndDate">종료일</div>
		<div id="EMail">e-mail</div>
		<input type="email" id="EMailBar"
		 placeholder="*등록하실 프로젝트 담당자의 e-mail을 입력해주세요."
		 onfocus="this.placeholder=''"
		 onblur="this.placeholder='*등록하실 프로젝트 담당자의 e-mail을 입력해주세요.'"/>
		<div id="Phone">연락처</div>
		<input type="text" id="PhoneBar"
		 placeholder="*등록하실 프로젝트 담당자의 전화번호를 입력해주세요."
		 onfocus="this.placeholder=''"
		 onblur="this.placeholder='*등록하실 프로젝트 담당자의 전화번호를 입력해주세요.'"/>
		<div id="Address">주소</div>
		<input type="text" id="AddressBar"
		 placeholder="사업체 주소를 입력해주세요."
		 onfocus="this.placeholder=''"
		 onblur="this.placeholder='사업체 주소를 입력해주세요.'"/>
		<div id="FilterBox"></div>
		<span id="Work">진행 방식</span>
		<div id="FixedTerm">기간제</div>
		<div id="Outsourcing">외주</div>
		<span id="Choose">선택 분야</span>
		<div id="Web">웹</div>
		<div id="Front">프론트앤드</div>
		<div id="Back">백앤드</div>
		<textarea id="ProContext"
		placeholder="*프로젝트의 내용을 입력해주세요.
		
프로젝트 소개 :

진행 현황 :

자격 요건 :

개발 언어 :

참고 :

기타 유의 사항 :"
		></textarea>
		
		<ul>
			<li id="AttachedFile">첨부파일</li>
		</ul>
		<span id="AttachedEx">등록하실 프로젝트에 참고될 첨부파일을 삽입해주세요.</span>
		
		<div class="UploadForm">
		  <input class="inputFile" id="upload1" type="file" multiple>
		  <label class="UploadForm1" for="upload1">내 PC </label>
		  <span class="UploadedFileName">선택된 파일이 없습니다.</span>
		</div>
		
		<div id="UploadAjax"></div>
		<span id="UploadAjax1">첨부하실 파일을 마우스로 끌어 오세요.</span>
		<div id="ApplyTerm">지원 기간</div>
		<span id="ApplyEx">*등록하실 프로젝트의 모집 마감일을 선택해주세요.</span>
		<input type="date" id="ApplyTermBar" data-placeholder="*마감일을 선택해주세요."
		aria-required="true" required/>
		<input type="button" id="ResetBtn" value="초기화"/>
		<input type="button" id="WriteBtn" value="작성하기" />
	</div>
</c:set>


<%@ include file="/WEB-INF/views/common/frame.jsp" %>

<script>
// 파일 추가 시 파일명 조회
let fileTarget = $('.UploadForm input');

fileTarget.on('change', function () { 
  var files = $(this)[0].files;
  var fileArr = [];
  for (var i = 0; i < files.length; i++) {
    fileArr.push(files[i].name);
}
  console.log(fileArr); 
// 배열 값 사이에 공백 추가
var fileList = fileArr.join(', '); // 배열 값을 쉼표와 공백으로 연결
$(this).siblings('.UploadedFileName').text(fileList);
console.log(fileList);

});



</script>	
















