<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<c:set var="content">
	<form id="joinForm" action="/user/register" method="POST">
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
				<td><input type="text" value="010" readonly required />
					-<input type="text" required />
					-<input type="text" required />
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" required placeholder="주소 입력"/></td>
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
						<input type="radio" name="role" value="DEVELOPER" checked/> 개발자
					</label>
					<input type="radio" id="BUSINESS" name="role" value="BUSINESS"/>
					<label for="BUSINESS"> 사업가 </label>
				</td>
			</tr>
			<tr>
				<td colspan=2>
				<input type="button" onclick="javascript:directJoin();" value="다음" />
				</td>
			</tr>
			
			<c:set var="role" value="$(BUSINESS)" />
			<c:if test="$(role eq 'BUSINESS')">
				<tr>
					<td>회사 명</td>
					<td><input type="text" name="bname" autofocus required placeholder="회사 명 작성" /></td>
				</tr>
				<tr>
					<td>회사 주소</td>
					<td><input type="text" name="baddress" required placeholder="회사 주소 작성" /></td>
				</tr>
				<tr>
					<td>전화번호</td>
				<td><input type="text" required />
					-<input type="text" required />
					-<input type="text" required />
				</td>
				</tr>
			</c:if>
		
		</table>
	
	</form>
	
	<input type="text" placeholder="아이디를 입력해주세요(이메일형식) autofocus"/>
</c:set>

<%@ include file="/WEB-INF/views/common/frame.jsp" %>

<script>
	/* login page로 이동 */
	function directLogin(){
		
	}

	/* 회원가입 요청 처리 */
	function directJoin(){
		var form = document.getElementById("joinForm");
		var u_id = form.email;
		var u_pass = form.pass;
		var u_re_pass = document.getElementById("re_pass");
		var u_birth = form.birth;
		
		var regexEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/; // 정규표현식 이메일
		
		console.log(regexEmail.test(u_id.value));
		
		if(!regexEmail.test(u_id.value)){
			alert('이메일 형식이 맞지 않습니다.');
			u_id.value = "";
			u_id.focus();
		}else if(u_pass.value.length > 20 || u_pass.value.length < 8){
			alert('비밀번호는 8~20글자이내에서 작성해주세요.');
			u_pass.value="";
			u_pass.focus();
		}else if(u_pass.value != u_re_pass.value){
			console.log(u_pass);
			console.log(u_re_pass);
			alert('비밀번호가 일치하지 않습니다.');
			u_re_pass.value="";
			u_re_pass.focus();
		}else if(u_birth.value === ''){
			alert('생년월일을 입력해주세요.');
		}else{
			form.submit();
		}
	}
</script>