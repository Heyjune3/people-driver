<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="${path}/resources/css/common/home.css"/>

<c:set var="content">
	<div class="frame">
		<div class="adv first">
			광고창
		</div>
		<div class="adv second">
			움직이는 애니메이션
		</div>
		<div class="adv third">
			사이트 설명 과 얼마나 좋은지 알림
		</div>
		<div class="adv fourth">
			다양한 이쁜 이미지들을 js로 드래그 할 수 있게 설계
		</div>
		<div class="adv fifth">
			<div>제휴 회사 였으면 좋겠다 목록</div>
			<div class="image-slider"></div>
		</div>
	</div>
	
</c:set>

<%@ include file="/WEB-INF/views/common/frame.jsp" %>

<script>
	$(document).ready(function() {
	    var images = ["DB.jpg", "KG.jpg", "교보생명보험.jpg", "금호아시아나.png", "넥슨.png", "넷마블.jpg", "네이버.png", "농협.png", "두산.jpg", "롯데.png", "삼성.png", "삼천리.jpg", "신세계.png", "씨제이.jpg", "에스케이.png", "엘에스.png", "유진.png", "장금상선.png", "현대자동차.jpg", "한화.png"];
	    var slider = $(".image-slider");
	
	    images.forEach(function(image) {
	        var imgElement = $('<img>').attr('src', "/resources/img/home/affiliate/logos/" + image).css('width', '100px');
	        slider.append(imgElement);
	    });
	
	    var position = 88;
	    var imageWidth = slider.find('img').eq(0).width();
		var windowWidth = $(window).width();
	    
	    function slideRight() {
	        position -= imageWidth;
	        if (position < -(imageWidth+3)*5 ) {
	            position = windowWidth;
	        }
	        slider.css('transform', 'translateX(' + position + 'px)');
	    }
	
	    setInterval(slideRight, 1000); // 1초마다 이미지를 오른쪽으로 슬라이드
	});
</script>