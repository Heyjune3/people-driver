<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="${path}/resources/css/common/home.css"/>

<c:set var="content">
	<div class="frame">
		<div class="first">
			<div class="advertise">
				<img src="${path}/resources/img/home/adv/hire.gif" onclick="alert('아직 배정된 광고가 없습니다.');" />
				<img src="${path}/resources/img/home/adv/JobAlert.gif" onclick="alert('아직 배정된 광고가 없습니다.');" />
				<img src="${path}/resources/img/home/adv/boom.gif" onclick="alert('아직 배정된 광고가 없습니다.');" />
				<img src="${path}/resources/img/home/adv/meeting.gif" onclick="alert('아직 배정된 광고가 없습니다.');" />
			</div>
			<div class="advertise">
				<img src="${path}/resources/img/home/adv/world.gif" onclick="alert('아직 배정된 광고가 없습니다.');" />
				<img src="${path}/resources/img/home/adv/alien.gif" onclick="alert('헉!');" />
				<img src="${path}/resources/img/home/adv/space.gif" onclick="alert('아직 배정된 광고가 없습니다.');" />
			</div>
		</div>
		<div class="second">
			<div>
				<div id="first"><h1>역대급</h1></div>
			</div>
			<div>
				<div id="second"><h2>프리랜서</h2></div>
		        <div id="second"><h2>개발자</h2></div>
		        <div id="second"><h2>를 위한</h2></div>
		        <div id="second"><h2>사이트</h2></div>
		        <div id="second"><h2>두둥!</h2></div>
			</div>
			<div>
				<div id="third" class="wrap">
		            <div class="word">많이 이용해 주세요!</div>
		        </div>
			</div>
			<button id="aniBtn" onclick="controlAnimation();">애니메이션 버튼 중지하기</button>
		</div>
		
		<div class="third">
			<div class="title"><h1>PEOPLE.DRIVER를 사용해야 하는 이유</h1></div>
			<div class="t1">
				<div class="t2">
					<img src="${path}/resources/img/home/discription/coin.png" style="width: 100px; height:100px;"/>
					<h3>100% 보장 제도</h3>
					<span>안전한 프로젝트 완수를 위해</span>
					<span>프리랜서 중도 해지 시 수수료 없이 재매칭 등</span>
					<span>단계별 보장 서비스를 제공합니다.</span>
				</div>
				<div class="t2">
					<img src="${path}/resources/img/home/discription/manager.png" style="width: 100px; height:100px;"/>
					<h3>전담 매니저</h3>
					<span>전담 매칭매니저가 프로젝트 등록부터</span>
					<span>프리랜서 매칭협업까지 모두 도와드립니다.</span>
					<span>오직 프로젝트에만 집중하세요.</span>
				</div>
				<div class="t2">
					<img src="${path}/resources/img/home/discription/auth.png" style="width: 100px; height:100px;"/>
					<h3>검증된 프리랜서</h3>
					<span>경력 10년 이상의 매칭매니저가</span>
					<span>평가 데이터 및 정성/정량 평가서를 기반으로</span>
					<span>프리랜서를 정교하게 검증합니다.</span>
				</div>
			</div>
			<div class="projectSearch">
				<button onclick="window.location.href='/business/register'"><h2>프로젝트 의뢰하기</h2></button>
			</div>
		</div>
		
		<div class="fourth">
			<div class="fourthTitle">
				<h2>딱 맞는 전문가 찾기! PEOPEL.DRIVER를 참고하세요!</h2>
			</div>
			<div class="comment">
				<div>
					<h3>하루 2시간</h3>
					<p>사이트를 뒤적거려보세요!</p>
				</div>
				<div>
					<h3>프로젝트 선점</h3>
					<p>내가 원하는 프로젝트를 빠르고 쉽게 수주를 맡길 수 있습니다!</p>
				</div>
				<div>
					<h3>7일</h3>
					<p>일주일이면 원하는 프로젝트를 찾고 바로 프로젝트를 진행할 수 있습니다!</p>
				</div>
			</div>
		</div>
		<div class="fifth">
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
	    
		// 제휴 회사 이미지 옮기는 메서드
		function slideRight() {
	        position -= imageWidth;
	        if (position < -(imageWidth+3)*7 ) {
	            position = windowWidth;
	        }
	        slider.css('transform', 'translateX(' + position + 'px)');
	    }
		
	    setInterval(slideRight, 1000); // 1초마다 이미지를 오른쪽으로 슬라이드
	    
	    $(window).resize(function() {
			windowWidth = $(window).width();
		});
	});
	
	
	
	
	
	
	var animationPaused = false; // 애니메이션 중지 여부
	
	function controlAnimation() {
		const firstElement = $("#first");
		const secondElement = $(".second #second");
		const wordElement = $(".wrap .word");
		const aniBtn = $("#aniBtn");
		
		if (animationPaused) {
			// 애니메이션이 중지된 상태일 때, 다시 시작하기
	        firstElement.css('animation-play-state', 'running');
	        secondElement.css('animation-play-state', 'running');
	        wordElement.css('animation-play-state', 'running');
	        
	        aniBtn.text("애니메이션 중지하기");
		} else {
			// 각 요소의 애니메이션을 중지시킵니다.
		    firstElement.css('animation-play-state', 'paused');
	        secondElement.css('animation-play-state', 'paused');
	        wordElement.css('animation-play-state', 'paused');
		    
		    aniBtn.text("애니메이션 시작하기");
		}
		
		// 애니메이션 상태 변경
		animationPaused = !animationPaused;
	}
</script>