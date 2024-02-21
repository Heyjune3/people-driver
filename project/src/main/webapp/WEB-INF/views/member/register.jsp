<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 카카오맵 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8bfd085ed59957246b59c9466c5d09d7"></script>
<!-- Postcodify (주소) -->
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<style>
	.aaaa{
		display:none;
	}
</style>
<c:set var="content">
	<form id="joinForm" action="/user/register" method="POST">
		<input type="hidden" class="postcodify_postcode5"/>
		<input type="hidden" class="postcodify_address"/>
		<table class="join">
			<tr>
				<td colspan="2"><h1>회원가입</h1></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" autofocus required placeholder="이름 작성" /></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="email" name="email" required placeholder="이메일 작성" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" required placeholder="비밀번호 작성"/></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<!-- 서버에서도 비밀번호 확인할 수 있도록 name 추가 -->
				<td><input type="password" id="re_pass" name="re_pass" required placeholder="비밀번호 확인"/></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" name="birth" required/> </td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" id="phone" name="phone" value="010" placeholder="휴대전화 입력" required />
				</td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td>
					<input type="text" name="address" id="postcode1" readOnly />
					<button type="button" id="postcodify_search_button">검색</button>
				</td>
			</tr>
			<tr>
				<td>도로명주소</td>
				<td><input type="text" name="address" id="postcode2" readOnly /></td>
			</tr>
			<tr>
				<td>상세주소</td>
				<td><input type="text" name="address" id="postcode3" placeholder="상세주소 입력" /></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<label>
						<input type="radio" name="gender" value="MALE" checked/> 남성
					</label>
					<input type="radio" id="female" name="gender" value="FEMALE"/>
					<label for="female"> 여성 </label>
				</td>
			</tr>
			<tr>
				<td>원하는 비즈니스 형태 선택</td>
				<td>
					<label>
						<input type="radio" id="DEVELOPER" name="role" value="DEVELOPER" checked/> 개발자
					</label>
					<input type="radio" id="BUSINESS" name="role" value="BUSINESS"/>
					<label for="BUSINESS"> 사업가 </label>
				</td>
			</tr>
			<tr class="aaaa">
				<td>회사 명</td>
				<td><input type="text" name="bname" required placeholder="회사 명 작성" /></td>
			</tr>
			<tr class="aaaa">
				<td>회사 우편 번호</td>
				<td>
					<input type="text" name="baddress" id="postcode4" readonly />
					<button type="button" id="postcodify_search_button2">검색</button>
				</td>
			</tr>
			<tr class="aaaa">
				<td>회사 도로명 주소</td>
				<td><input type="text" name="baddress" id="postcode5" readonly /></td>
			</tr>
			<tr class="aaaa">
				<td>회사 상세 주소</td>
				<td><input type="text" name="baddress" id="postcode6" placeholder="상세주소 입력" /></td>
			</tr>
			<tr class="aaaa">
				<td>회사 연락 번호</td>
				<td><input type="text" id="phone2" name="phone2" placeholder="회사 일반 전화 작성(또는 담당자 전화)" required />
				</td>
			</tr>
			<tr>
				<td colspan=2>
				<input type="button" onclick="javascript:directJoin();" value="회원가입" />
				</td>
			</tr>
		</table>
	</form>
	<div id="map" style="width:500px;height:400px;"></div>
	
</c:set>

<%@ include file="/WEB-INF/views/common/frame.jsp" %>

<script>

// kakaoMapAPI
var container = $("#map")[0];
var options= {
		center : new kakao.maps.LatLng(35.159056, 129.116904), // 지도 중심 좌표 (부산 광안리)
		level : 3 // 지도 레벨 (확대, 축소 정도)
};
var map = new kakao.maps.Map(container, options); // 지도 생성 및 객체 리턴

// 사업가 모드
$("#BUSINESS").click(function(){
	if($("#BUSINESS").is(':checked')){
		$(".aaaa").show();	
	}
});

$("#DEVELOPER").click(function(){
	if($("#DEVELOPER").is(':checked')){
		// 입력된 값들을 초기화
		$(".aaaa input").val('');
		// 다시 숨기기
		$(".aaaa").hide();
	}
});

// Postcodify 주소 검색 설정
$("#postcodify_search_button").postcodifyPopUp({
	afterSelect: function(data) {
		$("#postcode1").val($(".postcodify_postcode5").val());
		$("#postcode2").val($(".postcodify_address").val());
		$("#postcode3").focus();
		
		// 주소 선택 후 팝업 닫음
		alert("입력이 완료되었습니다. esc를 눌러주세요");
	}
});

$("#postcodify_search_button2").postcodifyPopUp({
	afterSelect: function(data) {
		$("#postcode4").val($(".postcodify_postcode5").val());
		$("#postcode5").val($(".postcodify_address").val());
		$("#postcode6").focus();
		
		// 주소 선택 후 팝업 닫음
		alert("입력이 완료되었습니다. esc를 눌러주세요");
	}
});

/* login page로 이동 */
function directLogin(){
	
}

/* 회원가입 요청 처리 */
function directJoin(){
	var form = document.getElementById("joinForm");
	var u_name = form.name; // user 이름
	var u_id = form.email; // user 아이디
	var u_pass = form.pass; // user 비번
	var u_re_pass = document.getElementById("re_pass");
	var u_birth = form.birth; // user 생년월일
	var u_phone_f = $(".phone"); // 휴대전화
	var u_phone_s = $(".phone2"); // 일반전화
	
	var regexEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/; // 정규표현식 이메일
	var regexPass = /(?=.*\d)(?=.*[a-z]).{8,}/; // 흔한 8자리 이상의 영어소문자, 숫자 포함
	var regexPhone = /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/; // 휴대전화
	var regexLocalPhone = /^(0(2|3[1-3]|4[1-4]|5[1-5]|6[1-4]))-(\d{3,4})-(\d{4})$/; // 일반 전화
	
	// 이름 필드
	if(u_name.value === '') {
		alert('이름을 입력해주세요.');
		u_name.focus();
	} else if (u_name.value.length <2 || u_name.value.length > 20) {
		alert('이름은 2자 이상 20자 이내입니다.');
		u_name.value = "";
		u_name.focus();
	}
	
	// 이메일 필드
	else if(!regexEmail.test(u_id.value)){
		alert('이메일 형식이 맞지 않습니다.');
		u_id.value = "";
		u_id.focus();
	}
	
	// 패스워드 필드
	else if(!regexPass.test(u_pass.value) || u_pass.value.length > 20) {
		alert('영문자,숫자를 포함한 8자리 이상 20자 이내로 작성해주세요.');
		u_pass.value="";
		u_pass.focus();
	}
	
	// 패스워드 일치 필드
	else if(u_pass.value != u_re_pass.value){
		alert('비밀번호가 일치하지 않습니다.');
		u_re_pass.value="";
		u_re_pass.focus();
	}
	
	// 생년월일 필드
	else if(u_birth.value === ''){
		alert('생년월일을 입력해주세요.');
	}
	
	// 전화번호 필드
	else if(!regexPhone.test(u_phone_f.value)) {
		alert('휴대전화 형태가 맞지 않습니다.')
		u_phone_f.value="";
		u_phone_f.focus();
	}
	
	// 사업가 이름 필드 설정과, 전화번호 필드 설정
	
	else{
		form.submit();
	}
}
</script>