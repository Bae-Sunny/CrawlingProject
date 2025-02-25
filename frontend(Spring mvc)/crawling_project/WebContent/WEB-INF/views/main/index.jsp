<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="../temp/header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section id="banner">
	<div class="banner_menu">
		<h2 class="ir_so">메인 배너</h2>
		<div class="container">
			<div class="row">
				<div class="bm_left">
					<ul>
						<li><a href="https://www.koreabaseball.com/" target="_blank">
								<img src="resources/img/h1_logo.png" alt="kbo"
								style="width: 150px;">
						</a></li>
					</ul>
				</div>
				<div class="bm_right">
					<%-- 로그인 전 --%>
					<c:choose>
						<c:when test="${sessionScope.sessionID == null }">
							<ul>
								<li class="line"><a href="login"><i
										class="fa-solid fa-lock"></i>&nbsp;로그인</a></li>
								<li class="line"><a href="signup"><i
										class="fa-solid fa-user"></i>&nbsp;회원가입</a></li>
							</ul>
						</c:when>
						<c:when test="${sessionScope.sessionID != null }">
							<%-- 로그인 후 --%>
							<ul>
								<li class="line"><a href="mypage"> <i
										class="fa-solid fa-circle-info"></i>&nbsp;마이페이지
								</a></li>
								<li class="line"><a href="logout"> <i
										class="fa-solid fa-lock-open"></i>&nbsp;로그아웃
								</a></li>
							</ul>
						</c:when>
					</c:choose>
					<ul>
						<li class="blue"><a href="matches"><i
								class="fa-solid fa-computer-mouse"></i>&nbsp;경기 일정</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="video-container">
		<div class="background-video">
			<!-- 동영상 출처 : https://youtu.be/qilrsq-1c_k?si=bqrfpjEd_B7rXbKn -->
			<video playsinline autoplay muted loop>
				<source src="resources/img/KBO_Opening Day.mp4" type="video/mp4">
			</video>
		</div>
		<div class="video-overlay">
			<h2>
    			<strong style="color: #d11a45;"><b>심장</b></strong>을 뛰게하는<br>
    			<strong style="color: #005bcc;">한국 야구</strong>의
    			<em class="emphasize"><b>모든 순간을 함께 하세요.</b></em>
			</h2>
			<p>경기 일정, 결과, 최신 뉴스, 팀 순위, 그리고 구단 소식까지</p>
			<p>여러분의 <span style="color: #d11a45;"><b>야구 열정</b></span>을
			<span style="color: #005bcc;"><b>완벽하게</b></span> 지원합니다.</p>
		</div>
	</div>
</section>
<%-- //banner --%>

<section id="board">
	<div class="container">
		<div class="row">
			<div class="board clearfix">
				<article class="board_box1">
					<h3>
						<span class="title-emphasis">야구장 날씨 정보</span>
					</h3>
					<div class="weather-widget">
						<div class="tab">
							<button class="tablinks" data-city="Jamsil">LG/두산</button>
							<button class="tablinks" data-city="Gwangju">KIA</button>
							<button class="tablinks" data-city="Suwon">KT</button>
							<button class="tablinks" data-city="Changwon">NC</button>
							<button class="tablinks" data-city="Incheon">SSG</button>
							<button class="tablinks" data-city="Busan">롯데</button>
							<button class="tablinks" data-city="Daegu">삼성</button>
							<button class="tablinks" data-city="Gocheok">키움</button>
							<button class="tablinks" data-city="Daejeon">한화</button>
						</div>
						<div class="weather" id="weather-content"></div>
						<div class="button-container">
							<button class="prev">
								<i class="fa-solid fa-angles-left"></i>이전
							</button>
							<button class="next">
								다음<i class="fa-solid fa-angles-right"></i>
							</button>
						</div>
						<div class="info-provider">
							(정보제공: <img src="resources/img/naver_logo.png" alt="naver"
								style="width: 80px;">)
						</div>
					</div>
				</article>
				<article class="board_box2">
					<h3>
						<em>구단/협회 홈페이지</em>
					</h3>
					<div class="teams">
						<ul>
							<li><a href="https://www.doosanbears.com/" target="_blank">
									<img src="resources/img/DOOSANBEARS.svg" alt="doosan"> <strong>두산베어스</strong>
							</a></li>
							<li><a href="https://www.hanwhaeagles.co.kr/index.do"
								target="_blank"> <img src="resources/img/HANWHAEAGLES.svg"
									alt="hanwha"> <strong>한화이글스</strong>
							</a></li>
							<li><a href="https://tigers.co.kr/" target="_blank"> <img
									src="resources/img/KIATIGERS.svg" alt="kia"> <strong>KIA타이거즈</strong>
							</a></li>
							<li><a href="https://heroesbaseball.co.kr/index.do"
								target="_blank"> <img src="resources/img/KIWOOMHEROES.svg"
									alt="kiwoom"> <strong>키움히어로즈</strong>
							</a></li>
							<li><a href="https://www.ktwiz.co.kr/" target="_blank">
									<img src="resources/img/KTWIZ.svg" alt="kt"> <strong>KT위즈</strong>
							</a></li>
							<li><a href="https://www.lgtwins.com/" target="_blank">
									<img src="resources/img/LGTWINS.svg" alt="lg"> <strong>LG트윈스</strong>
							</a></li>
							<li><a href="https://www.giantsclub.com/" target="_blank">
									<img src="resources/img/LOTTEGIANTS.svg" alt="lotte"> <strong>롯데자이언츠</strong>
							</a></li>
							<li><a href="https://www.ncdinos.com/" target="_blank">
									<img src="resources/img/NCDINOS.svg" alt="nc"> <strong>NC다이노스</strong>
							</a></li>
							<li><a href="https://www.samsunglions.com/" target="_blank">
									<img src="resources/img/SAMSUNGLIONS.svg" alt="samsung">
									<strong>삼성라이온즈</strong>
							</a></li>
							<li><a href="https://www.ssglanders.com/" target="_blank">
									<img src="resources/img/SSGLADERS.svg" alt="ssg"> <strong>SSG랜더스</strong>
							</a></li>
							<li><a href="https://www.koreabaseball.com/" target="_blank">
									<img src="resources/img/kboleague2024.svg" alt="kboleague">
									<strong>KBO 리그</strong>
							</a></li>
							<li><a href="http://www.kpbpa.com/" target="_blank"><img
									src="resources/img/kpbpa.png" alt="kpbpa"> <strong>한국프로야구선수협회</strong></a></li>
						</ul>
					</div>
				</article>
				<article class="board_box3">
					<h3>
						<em>2024 KBO 리그 예매</em>
					</h3>
					<div class="ticketlink">
						<ul>
							<li><a
								href="https://ticket.interpark.com/Contents/Sports/Bridge/baseball"
								target="_blank"> <img src="resources/img/Interpark.webp"
									alt="interpark"> <strong>인터파크 티켓</strong></a></li>
							<li><a href="https://www.ticketlink.co.kr/sports/baseball/"
								target="_blank"> <img src="resources/img/ticketlink.svg"
									alt="ticketlink"> <strong>티켓링크</strong></a></li>
							<li><a href="https://ticket.giantsclub.com/" target="_blank">
									<img src="resources/img/lotteticket.gif" alt="lotteticket">
									<strong>롯데 티켓예매</strong>
							</a></li>
							<li><a href="https://www.ncdinos.com/auth/ticket.do"
								target="_blank"> <img src="resources/img/ncticket.png"
									alt="ncticket"> <strong>NC 티켓예매</strong></a></li>
						</ul>
					</div>
				</article>
			</div>
		</div>
	</div>
</section>

<script>
$(document).ready(function() {
    // JSON 데이터 불러오기
    $.ajax({
        url: 'http://192.168.0.45:9000/teamproject/loadJson_2',
        type: 'GET',
        dataType: 'json',
        success: processData,
        error: function(err) {
            console.error('데이터를 불러오는데 실패했습니다:', err);
        }
    });

    function processData(data) {
    	/* console.log(data) */
        $('.tablinks').click(function() {
        	$('.tablinks').removeClass('active');
            $(this).addClass('active');
            $('.tabcontent').removeClass('active');
        	
        	let city = $(this).data('city');
        	let filteredData = data.filter(item => item.city === city);
        	
            let content = '';
            filteredData.forEach(function(weather, index) {
                content += '<div class="weather-card" style="display: ' + (index === 0 ? 'block' : 'none') + ';">' +
                  '<h3><i class="fa-solid fa-map-location-dot"></i> <strong class="location">' +
                  weather.지역 + '</strong><br>' +
                  '<span class="date-weather">' + formatDate(weather.날짜) + ' <i class="fa-solid ' +
                  getWeatherIconClass(weather["오후 날씨상태"]) + '"></i> ' + weather["오후 날씨상태"] +
                  '</span></h3>' +
                  '<table>' +
                  '<tr><th><i class="fa-solid fa-umbrella"></i>오전 강수확률</th><td>' + weather["오전 강수확률"] + '</td>' +
                  '<th><i class="fa-solid fa-umbrella"></i>오후 강수확률</th><td>' + weather["오후 강수확률"] + '</td></tr>' +
                  '<tr><th><i class="fa-solid fa-temperature-low"></i>최저기온</th><td>' + weather["최저기온"] + '</td>' +
                  '<th><i class="fa-solid fa-temperature-high"></i>최고기온</th><td>' + weather["최고기온"] + '</td></tr>' +
                  '</table></div>';
            });
            $('#weather-content').html(content);

            let currentCard = 0;
            updateButtonVisibility();
            
            $('.next').click(function() {
                if (currentCard < filteredData.length - 1) {
                    currentCard++;
                    $('.weather-card').hide().eq(currentCard).show();
                    updateButtonVisibility();
                }
            });

            $('.prev').click(function() {
                if (currentCard > 0) {
                    currentCard--;
                    $('.weather-card').hide().eq(currentCard).show();
                    updateButtonVisibility();
                }
            });
            
            function updateButtonVisibility() {
                $('.prev').prop('disabled', currentCard <= 0);
                $('.next').prop('disabled', currentCard >= filteredData.length - 1);
            }
        });

        $('.tablinks:first').trigger('click'); // 페이지 로드 시 첫 번째 탭을 자동으로 클릭
    }

    function formatDate(date) {
    	let dateParts = date.toString().split('.');
    	let dateObj = new Date(2024, dateParts[0] - 1, dateParts[1]);
    	let dayNames = ["일", "월", "화", "수", "목", "금", "토"];
        return  dateParts[0] + '/' + Math.floor(dateParts[1]) + '(' + dayNames[dateObj.getDay()] + ')';
    }

    function getWeatherIconClass(weatherCondition) {
        switch(weatherCondition) {
            case "맑음": return "fa-sun color-sunny";
            case "흐림": return "fa-cloud color-cloudy";
            case "비": return "fa-cloud-rain color-rainy";
            case "눈": return "fa-snowflake color-snowy";
            default: return "fa-cloud color-default";
        }
    }
});
</script>
<%-- //board --%>
<%@include file="../temp/footer.jsp"%>