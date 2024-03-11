<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="${path}/resources/css/member/register.css"/>

<c:set var="content">
		<div id="table">
			<div>
				<h2>회원정보</h2>
			</div>
			
			<div>
				<c:choose>
					<c:when test="${developer.imgUrl ne null}">
						<img src="${developer.imgUrl}" id="sampleImg"  style="width:100px; height:100px; border-radius: 50%; object-fit: cover;"/>
					</c:when>
					<c:otherwise>
						<img src="${path}/resources/img/profile.jpg" id="sampleImg"  style="width:100px; height:100px; border-radius: 50%; object-fit: cover;"/>
					</c:otherwise>
				</c:choose>
			</div>
			
			<div>
				<input type="text" id="name" value="${developer.name}" readonly />
			</div>
			
			<div>
				<input type="email" id="email" name="email" value="${developer.email}" readonly />
			</div>
			
			<div>
				<p>나이</p>
				<input type="text" id="age" readonly/>
			</div>
			
			<div>
				<p>전화번호</p>
				<input type="text" id="phone" name="phoneNo" value="${developer.phoneNo}" readonly />
			</div>
			
            <div>
	            <p>성별</p>
	            <div>
	            	<c:choose>
	            		<c:when test="${developer.gender eq 'MALE'}">
	            			<input type="text" id="gender" value="남성" readonly/>
	            		</c:when>
	            		<c:otherwise>
	            			<input type="text" id="gender" value="여성" readonly/>
	            		</c:otherwise>
	            	</c:choose>
	           	</div>
            </div>
            
            <div>
	            <p>비즈니스 형태</p>
	            <c:choose>
	            	<c:when test="${developer.role eq 'DEVELOPER'}">
	            		<input type="text" id="role" value="DEVELOPER(개발자)" readonly/>
	            	</c:when>
	            	<c:otherwise>
	            		<input type="text" id="role" value="BUSINESS(사업가)" readonly/>
	            	</c:otherwise>
	            </c:choose>
            </div>
            
            <c:if test="${developer.role eq 'BUSINESS'}">
            	<hr />
            	<div>
	            	<p>회사명</p>
	            	<input type="text" id="bname" name="bname" value="${loginMember.bname}" />
	            </div>
	            
	            <div>
	            	<p>회사 우편 번호</p>
	            	<div class="bbbb">
		            	<input type="text" id="postcode4" name="bpc5" value="${loginMember.bpc5}" readonly />
		            	<button type="button" id="postcodify_search_button2">검색</button>
	            	</div>
	            </div>
	            
	            <div>
		            <p>회사 도로명주소</p>
		            <input type="text" id="postcode5" name="baddress" value="${loginMember.baddress}" readOnly />
            	</div>
	            
	            <div>
	            	<p>회사 상세 주소</p>
	            	<input type="text" id="postcode6" name="bdetail" value="${loginMember.bdetail}" required placeholder="상세주소 입력" />
	            </div>
	            
	            <div>
	            	<p>회사 연락 번호</p>
	            	<input type="text" id="phone2" name="bphone" value="${loginMember.bphone}" placeholder="회사 일반 전화 작성(또는 담당자 전화)" required />
	            </div>
            </c:if>
      	</div>
     
     
</c:set>

<%@ include file="/WEB-INF/views/common/frame.jsp" %>


<script>
	function calAge(birth) {
		let birthDate = new Date(birth);
		let currentDate = new Date();
		let age = currentDate.getFullYear() - birthDate.getFullYear();
		
		// 생일이 지났는지 확인
		let monthDiff = currentDate.getMonth() - birthDate.getMonth();
		if (monthDiff < 0 || (monthDiff === 0 && currentDate.getDate() < birthDate.getDate())) {
            age--;
        }
		
		return age;
	}
	
	window.onload = function() {
		let ageForm = $("#age");
		let birth = "${developer.birth}";
		let age = calAge(birth);
		
		ageForm.val(age);
	}
</script>