<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${path}/resources/css/lejcss/register.css?after"/>


<!-- 개별 프로젝트 창 -->
<c:set var="content">
<input type="hidden" value="${loginMember.id}" name="uno" />
<form action="/business/register" method="POST" id="registerForm">
	<div class="frame3">
		<div class="proApplyTitle">
			<span id="ProApply">프로젝트 등록</span>
		</div>
		
		<div class="title">
			<div id="ProTitle">제목</div>
			<input type="text" id="ProTitleBar" name="title"
			 placeholder="*등록하실 프로젝트 제목을 입력해주세요."
			 onfocus="this.placeholder=''"
			 onblur="this.placeholder='*등록하실 프로젝트 제목을 입력해주세요.'"/>
		</div><br/>
		 
		 <div class="payment">
			 <div id="ApplyPay">금액</div>
			 <input type="text" id="ApplyPayBar" name="payment"
			 placeholder="*금액을 입력해주세요."
			 onfocus="this.placeholder=''"
			 onblur="this.placeholder='*금액을 입력해주세요.'"/>
		 </div><br/>
		
		<div class="wonImage">
			<img src="${path}/resources/img/won.png" id="Won"/>
		</div>
		<div class="company">
			<div id="CompanyName">사업체명</div>
			<input type="text" id="CompanyNameBar"
			 placeholder="*회사명을 입력해주세요."
			 onfocus="this.placeholder=''"
			 onblur="this.placeholder='*회사명을 입력해주세요.'"/>
		</div><br/>
		
		<div class="time">
			<div id="Term">기간</div>
			<input type="text" id="TermBar"
			 placeholder="*기간을 입력해주세요."
			 onfocus="this.placeholder=''"
			 onblur="this.placeholder='*기간을 입력해주세요.'"/><br/>
		</div><br/>
		
		<div class="dates">
			<div id="StartDate">시작일</div>
			<input type="date" id="StartDateBar" name="startDate"
			 data-placeholder="*시작일을 선택해주세요."
			aria-required="true" required/>
			<div id="EndDate">종료일</div>
			<input type="date" id="EndDateBar" name="endDate"
			 data-placeholder="*종료일을 선택해주세요." 
			required/>
		</div><br/>
		
		<div class="forEmail">
			<div id="EMail">e-mail</div>
			<input type="email" id="EMailBar"
			 placeholder="*등록하실 프로젝트 담당자의 e-mail을 입력해주세요."
			 onfocus="this.placeholder=''"
			 onblur="this.placeholder='*등록하실 프로젝트 담당자의 e-mail을 입력해주세요.'"/>
		</div><br/>
		
		<div class="forPhone">
			<div id="Phone">연락처</div>
			<input type="text" id="PhoneBar"
			 placeholder="*등록하실 프로젝트 담당자의 전화번호를 입력해주세요."
			 onfocus="this.placeholder=''"
			 onblur="this.placeholder='*등록하실 프로젝트 담당자의 전화번호를 입력해주세요.'"/>
		</div><br/>
		
		<div class="forAddress">
			<div id="Address">주소</div>
			<input type="text" id="AddressBar"
			 placeholder="사업체 주소를 입력해주세요."
			 onfocus="this.placeholder=''"
			 onblur="this.placeholder='사업체 주소를 입력해주세요.'"/>
		</div><br/>

		<div class="FilterBox">
			<div>
				<span id="Work">진행 방식</span>
			</div>
			<div class="proceedWay">
				<input type="radio" id="Outsourcing" name="proceed" class="proceed" value="outsourcing"/>
			    <label for="Outsourcing">외주</label>
			    <input type="radio" id="FixedTerm" name="proceed" class="proceed" value="fiexedTerm"/>
		        <label for="FixedTerm">기간제</label>
			</div>
			<div>
				<span id="Choose">선택 분야</span>
			</div>
			
			<div class="chooseWay">
				<input type="radio" id="Web" name="options" class="options" value="web"/>
		        <label for="Web">웹</label>
		        <input type="radio" id="Front" name="options" class="options" value="FrontEnd"/>
		        <label for="Front">프론트앤드</label>
		        <input type="radio" id="Back" name="options" class="options" value="backEnd"/>
		        <label for="Back">백앤드</label>
			</div>
		</div>
		<div>
			<textarea id="ProContext" name="content"
			placeholder="*프로젝트의 내용을 입력해주세요.
		
프로젝트 소개 :

진행 현황 :

자격 요건 :

개발 언어 :

참고 :

기타 유의 사항 :"
			></textarea>
		</div><br/>
		
		<div class="attached">
			<ul>
				<li id="AttachedFile">첨부파일</li>
			</ul>
			<span id="AttachedEx">등록하실 프로젝트에 참고될 첨부파일을 삽입해주세요.</span>
		</div>
		
		
		<div class="UploadForm">
		  <input class="inputFile" id="upload1" type="file" multiple>
		  <label class="UploadForm1" for="upload1">내 PC </label>
		  <span class="UploadedFileName">선택된 파일이 없습니다.</span>
		</div>
		
		<div id="UploadAjax">
			<span id="UploadAjax1">첨부하실 파일을 마우스로 끌어 오세요.</span>
		</div>
		<ul class="uploadList">
		</ul>
		<div>
			<span id="ApplyEx">*등록하실 프로젝트의 모집 마감일을 선택해주세요.</span>
		</div>
		<div class="applyDates">
			<div id="ApplyTerm">지원 기간</div>
			<input type="date" id="ApplyTermBar" name="applyDate"
			 data-placeholder="*마감일을 선택해주세요."
			aria-required="true" required/>
		</div>
		<div class="buttons">
			<input type="button" id="ResetBtn" value="초기화"/>
			<input type="button" id="WriteBtn" value="작성하기" />
		</div>
	</div>
</form>
</c:set>

<%@ include file="/WEB-INF/views/common/frame.jsp" %>

<script>

//파일 추가 시 파일명 조회
let fileTarget = $('.UploadForm input');

fileTarget.on('change', function (e){
	
	let files = e.target.files;
	// console.log(files);
	let maxSize = 10485760; // 10MB
	
	let formData = new FormData();
	for(let i = 0; i < files.length; i++){
		if(files[i].size > maxSize){
			alert("업로드 할 수 없는 파일이 포함되어있습니다.");
			return false;
		}
		formData.append("file", files[i]);
	}
	
	$.ajax({
		type : "POST",
		url : "${path}/uploadFile",
		data : formData,
		contentType : false,
		processData : false,
		dataType : "json",
		success : function(data){
			// upload 된 파일 이름을 list(배열) 로 전달
			// console.log(data);
			$(".UploadedFileName").text("");
			for(let i = 0; i < data.length; i++){
				let fileInfo = getFileInfo(data[i]);
				// 기존 내용이 없으면 구분자 없이 추가
			    if ($(".UploadedFileName").text() === "") {
			        $(".UploadedFileName").append(fileInfo.fileName);
			    } else {
			        // 기존 내용이 있으면 구분자와 함께 추가
			        $(".UploadedFileName").append(", " + fileInfo.fileName);
			    }
				let html = "<li>";
				html += "<img src='"+fileInfo.imgSrc+"'/>";
				html += "<div>";
				html += "<a href='"+fileInfo.getLink+"' target='_blank'>";
				html += fileInfo.fileName;
				html += "</a>";
				html += "</div>";
				html += "<div>";
				// fullName == data[i]
				html += "<a href='"+data[i]+"' class='delBtn'>[삭제]</a>";
				html += "</div>";
				html += "</li>";
				$(".uploadList").append(html);
			}
		},
		error : function(res){
			alert(res.responseText);
		}
	});
});

//drag & drop 시 브라우저가 파일을 해석 할려는 기본이벤트를 제거
	$("#UploadAjax").on("dragenter dragover",function(e){
		e.preventDefault();
	});

	$("#UploadAjax").on("drop",function(e){
		e.preventDefault();
		
		let files = e.originalEvent.dataTransfer.files;
		// console.log(files);
		let maxSize = 10485760; // 10MB
		
		let formData = new FormData();
		for(let i = 0; i < files.length; i++){
			if(files[i].size > maxSize){
				alert("업로드 할 수 없는 파일이 포함되어있습니다.");
				return false;
			}
			formData.append("file", files[i]);
		}
		
		$.ajax({
			type : "POST",
			url : "${path}/uploadFile",
			data : formData,
			contentType : false,
			processData : false,
			dataType : "json",
			success : function(data){
				// upload 된 파일 이름을 list(배열) 로 전달
				// console.log(data);
				$(".UploadedFileName").text("");
				for(let i = 0; i < data.length; i++){
					let fileInfo = getFileInfo(data[i]);
					// 기존 내용이 없으면 구분자 없이 추가
				    if ($(".UploadedFileName").text() === "") {
				        $(".UploadedFileName").append(fileInfo.fileName);
				    } else {
				        // 기존 내용이 있으면 구분자와 함께 추가
				        $(".UploadedFileName").append(", " + fileInfo.fileName);
				    }
					let html = "<li>";
					html += "<img src='"+fileInfo.imgSrc+"'/>";
					html += "<div>";
					html += "<a href='"+fileInfo.getLink+"' target='_blank'>";
					html += fileInfo.fileName;
					html += "</a>";
					html += "</div>";
					html += "<div>";
					// fullName == data[i]
					html += "<a href='"+data[i]+"' class='delBtn'>[삭제]</a>";
					html += "</div>";
					html += "</li>";
					$(".uploadList").append(html);
				}
			},
			error : function(res){
				alert(res.responseText);
			}
		});
	});

//image file 확인
	function checkImage(fileName){
		return fileName.indexOf("s_") > 0 ? true : false;
	}
	
var contextPath = '${path}';
	
	// li 로 출력에 필요한 파일 정보를 반환할 함수
	function getFileInfo(fullName){
		// 이미지 경로, 원본 파일 이름, 원본파일 요청 경로
		let imgSrc,    fileName,     getLink;
		// /contextPath/displayFile?fileName=업로드된 파일 이름
		if(checkImage(fullName)){
			// 이미지 파일 - s_db59c759c27941ab985b40b92cdbbeba_camera.png
			imgSrc = contextPath+"/displayFile?fileName="+fullName;
			// 원본 이미지 링크 - db59c759c27941ab985b40b92cdbbeba_camera.png
			getLink = contextPath+"/displayFile?fileName="+fullName.replace("s_","");
		}else{
			// 일반 파일경우 출력 이미지는 file.png
			imgSrc = contextPath+"/resources/img/file.png";
			getLink = contextPath+"/displayFile?fileName="+fullName;
		}
		// db59c759c27941ab985b40b92cdbbeba_camera.png
		// 업로드한 파일 이름
		fileName = fullName.substr(fullName.lastIndexOf("_")+1);
		// fileName = camera.png
		return {fileName : fileName, imgSrc : imgSrc, getLink : getLink};
	}
	
	// 첨부파일 삭제
	$(".uploadList").on("click",".delBtn",function(event){
		event.preventDefault(); // a tag 기본 이벤트 처리 제거
		// .delBtn인 요소들 중에 click event가 발생한 대상 요소
		let target = $(this);
		// target .delBtn의 href 속성에 부여된 값 == fullName
		let fullName = target.attr("href");
		
		// 파일 이름 삭제
	    let fileNameToRemove = fullName.substr(fullName.lastIndexOf("_") + 1);
	    let uploadedFileName = $(".UploadedFileName").text();
	    // 파일 이름이 포함된 경우 해당 부분을 공백으로 치환하여 삭제
	    uploadedFileName = uploadedFileName.replace(fileNameToRemove, "").replace(/,\s*,/g, ",").replace(/^,|,$/g, "");
	    $(".UploadedFileName").text(uploadedFileName);
		
		$.ajax({
			type : "POST",
			url : contextPath+"/deleteFile",
			data : {
				fileName : fullName
			},
			success : function(data){
				alert(data);
				// closest target 기준으로 부모요소 중에
				// 선택자로 지정된 가장 가까운 부모요소를 검색
				target.closest("li").remove();
			}
		});
	});
	
	// 게시글 등록 버튼이 click 되면
	$("#saveBtn").click(function(){
		let str = "";
		let fileList = $(".uploadList .delBtn");
		console.log(fileList);
		for(let i = 0; i < fileList.length; i++){
			str += "<input type='hidden' name='files' value='"+fileList[i].getAttribute("href")+"' />";
		}
		$("#registerForm").append(str);
		$("#registerForm").submit();
	});

	// 게시글 등록 버튼이 click 되면
 	$("#WriteBtn").click(function(){
 		let str = "";
 		let fileList = $(".uploadList .delBtn");
 		console.log(fileList);
 		for(let i = 0; i < fileList.length; i++){
 			str += "<input type='hidden' name='files' value='"+fileList[i].getAttribute("href")+"' />";
 		}
 		$("#registerForm").append(str);
 		$("#registerForm").submit();
 		
 		$("#StartDateBar").val();
 		
 		console.log($("#StartDateBar").val());
 		console.log($("#EndDateBar").val());
 		console.log($("#ApplyDateBar").val());
 		
 	});


</script>	
















