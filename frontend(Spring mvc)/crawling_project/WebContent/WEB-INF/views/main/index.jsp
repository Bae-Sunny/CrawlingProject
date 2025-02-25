<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="../temp/header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section id="banner">
	<div class="banner_menu">
		<h2 class="ir_so">���� ���</h2>
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
					<%-- �α��� �� --%>
					<c:choose>
						<c:when test="${sessionScope.sessionID == null }">
							<ul>
								<li class="line"><a href="login"><i
										class="fa-solid fa-lock"></i>&nbsp;�α���</a></li>
								<li class="line"><a href="signup"><i
										class="fa-solid fa-user"></i>&nbsp;ȸ������</a></li>
							</ul>
						</c:when>
						<c:when test="${sessionScope.sessionID != null }">
							<%-- �α��� �� --%>
							<ul>
								<li class="line"><a href="mypage"> <i
										class="fa-solid fa-circle-info"></i>&nbsp;����������
								</a></li>
								<li class="line"><a href="logout"> <i
										class="fa-solid fa-lock-open"></i>&nbsp;�α׾ƿ�
								</a></li>
							</ul>
						</c:when>
					</c:choose>
					<ul>
						<li class="blue"><a href="matches"><i
								class="fa-solid fa-computer-mouse"></i>&nbsp;��� ����</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="video-container">
		<div class="background-video">
			<!-- ������ ��ó : https://youtu.be/qilrsq-1c_k?si=bqrfpjEd_B7rXbKn -->
			<video playsinline autoplay muted loop>
				<source src="resources/img/KBO_Opening Day.mp4" type="video/mp4">
			</video>
		</div>
		<div class="video-overlay">
			<h2>
    			<strong style="color: #d11a45;"><b>����</b></strong>�� �ٰ��ϴ�<br>
    			<strong style="color: #005bcc;">�ѱ� �߱�</strong>��
    			<em class="emphasize"><b>��� ������ �Բ� �ϼ���.</b></em>
			</h2>
			<p>��� ����, ���, �ֽ� ����, �� ����, �׸��� ���� �ҽı���</p>
			<p>�������� <span style="color: #d11a45;"><b>�߱� ����</b></span>��
			<span style="color: #005bcc;"><b>�Ϻ��ϰ�</b></span> �����մϴ�.</p>
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
						<span class="title-emphasis">�߱��� ���� ����</span>
					</h3>
					<div class="weather-widget">
						<div class="tab">
							<button class="tablinks" data-city="Jamsil">LG/�λ�</button>
							<button class="tablinks" data-city="Gwangju">KIA</button>
							<button class="tablinks" data-city="Suwon">KT</button>
							<button class="tablinks" data-city="Changwon">NC</button>
							<button class="tablinks" data-city="Incheon">SSG</button>
							<button class="tablinks" data-city="Busan">�Ե�</button>
							<button class="tablinks" data-city="Daegu">�Ｚ</button>
							<button class="tablinks" data-city="Gocheok">Ű��</button>
							<button class="tablinks" data-city="Daejeon">��ȭ</button>
						</div>
						<div class="weather" id="weather-content"></div>
						<div class="button-container">
							<button class="prev">
								<i class="fa-solid fa-angles-left"></i>����
							</button>
							<button class="next">
								����<i class="fa-solid fa-angles-right"></i>
							</button>
						</div>
						<div class="info-provider">
							(��������: <img src="resources/img/naver_logo.png" alt="naver"
								style="width: 80px;">)
						</div>
					</div>
				</article>
				<article class="board_box2">
					<h3>
						<em>����/��ȸ Ȩ������</em>
					</h3>
					<div class="teams">
						<ul>
							<li><a href="https://www.doosanbears.com/" target="_blank">
									<img src="resources/img/DOOSANBEARS.svg" alt="doosan"> <strong>�λ꺣�</strong>
							</a></li>
							<li><a href="https://www.hanwhaeagles.co.kr/index.do"
								target="_blank"> <img src="resources/img/HANWHAEAGLES.svg"
									alt="hanwha"> <strong>��ȭ�̱۽�</strong>
							</a></li>
							<li><a href="https://tigers.co.kr/" target="_blank"> <img
									src="resources/img/KIATIGERS.svg" alt="kia"> <strong>KIAŸ�̰���</strong>
							</a></li>
							<li><a href="https://heroesbaseball.co.kr/index.do"
								target="_blank"> <img src="resources/img/KIWOOMHEROES.svg"
									alt="kiwoom"> <strong>Ű���������</strong>
							</a></li>
							<li><a href="https://www.ktwiz.co.kr/" target="_blank">
									<img src="resources/img/KTWIZ.svg" alt="kt"> <strong>KT����</strong>
							</a></li>
							<li><a href="https://www.lgtwins.com/" target="_blank">
									<img src="resources/img/LGTWINS.svg" alt="lg"> <strong>LGƮ����</strong>
							</a></li>
							<li><a href="https://www.giantsclub.com/" target="_blank">
									<img src="resources/img/LOTTEGIANTS.svg" alt="lotte"> <strong>�Ե����̾���</strong>
							</a></li>
							<li><a href="https://www.ncdinos.com/" target="_blank">
									<img src="resources/img/NCDINOS.svg" alt="nc"> <strong>NC���̳뽺</strong>
							</a></li>
							<li><a href="https://www.samsunglions.com/" target="_blank">
									<img src="resources/img/SAMSUNGLIONS.svg" alt="samsung">
									<strong>�Ｚ���̿���</strong>
							</a></li>
							<li><a href="https://www.ssglanders.com/" target="_blank">
									<img src="resources/img/SSGLADERS.svg" alt="ssg"> <strong>SSG������</strong>
							</a></li>
							<li><a href="https://www.koreabaseball.com/" target="_blank">
									<img src="resources/img/kboleague2024.svg" alt="kboleague">
									<strong>KBO ����</strong>
							</a></li>
							<li><a href="http://www.kpbpa.com/" target="_blank"><img
									src="resources/img/kpbpa.png" alt="kpbpa"> <strong>�ѱ����ξ߱�������ȸ</strong></a></li>
						</ul>
					</div>
				</article>
				<article class="board_box3">
					<h3>
						<em>2024 KBO ���� ����</em>
					</h3>
					<div class="ticketlink">
						<ul>
							<li><a
								href="https://ticket.interpark.com/Contents/Sports/Bridge/baseball"
								target="_blank"> <img src="resources/img/Interpark.webp"
									alt="interpark"> <strong>������ũ Ƽ��</strong></a></li>
							<li><a href="https://www.ticketlink.co.kr/sports/baseball/"
								target="_blank"> <img src="resources/img/ticketlink.svg"
									alt="ticketlink"> <strong>Ƽ�ϸ�ũ</strong></a></li>
							<li><a href="https://ticket.giantsclub.com/" target="_blank">
									<img src="resources/img/lotteticket.gif" alt="lotteticket">
									<strong>�Ե� Ƽ�Ͽ���</strong>
							</a></li>
							<li><a href="https://www.ncdinos.com/auth/ticket.do"
								target="_blank"> <img src="resources/img/ncticket.png"
									alt="ncticket"> <strong>NC Ƽ�Ͽ���</strong></a></li>
						</ul>
					</div>
				</article>
			</div>
		</div>
	</div>
</section>

<script>
$(document).ready(function() {
    // JSON ������ �ҷ�����
    $.ajax({
        url: 'http://192.168.0.45:9000/teamproject/loadJson_2',
        type: 'GET',
        dataType: 'json',
        success: processData,
        error: function(err) {
            console.error('�����͸� �ҷ����µ� �����߽��ϴ�:', err);
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
                  weather.���� + '</strong><br>' +
                  '<span class="date-weather">' + formatDate(weather.��¥) + ' <i class="fa-solid ' +
                  getWeatherIconClass(weather["���� ��������"]) + '"></i> ' + weather["���� ��������"] +
                  '</span></h3>' +
                  '<table>' +
                  '<tr><th><i class="fa-solid fa-umbrella"></i>���� ����Ȯ��</th><td>' + weather["���� ����Ȯ��"] + '</td>' +
                  '<th><i class="fa-solid fa-umbrella"></i>���� ����Ȯ��</th><td>' + weather["���� ����Ȯ��"] + '</td></tr>' +
                  '<tr><th><i class="fa-solid fa-temperature-low"></i>�������</th><td>' + weather["�������"] + '</td>' +
                  '<th><i class="fa-solid fa-temperature-high"></i>�ְ���</th><td>' + weather["�ְ���"] + '</td></tr>' +
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

        $('.tablinks:first').trigger('click'); // ������ �ε� �� ù ��° ���� �ڵ����� Ŭ��
    }

    function formatDate(date) {
    	let dateParts = date.toString().split('.');
    	let dateObj = new Date(2024, dateParts[0] - 1, dateParts[1]);
    	let dayNames = ["��", "��", "ȭ", "��", "��", "��", "��"];
        return  dateParts[0] + '/' + Math.floor(dateParts[1]) + '(' + dayNames[dateObj.getDay()] + ')';
    }

    function getWeatherIconClass(weatherCondition) {
        switch(weatherCondition) {
            case "����": return "fa-sun color-sunny";
            case "�帲": return "fa-cloud color-cloudy";
            case "��": return "fa-cloud-rain color-rainy";
            case "��": return "fa-snowflake color-snowy";
            default: return "fa-cloud color-default";
        }
    }
});
</script>
<%-- //board --%>
<%@include file="../temp/footer.jsp"%>