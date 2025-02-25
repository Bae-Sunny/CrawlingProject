<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rPath" value="${pageContext.request.contextPath}/resources"
	scope="application" />
<%@include file="../temp/header.jsp"%>
<!-- Load css styles -->


<link rel="stylesheet" type="text/css"
	href="${rPath}/gallery/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="${rPath}/gallery/css/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css"
	href="${rPath}/gallery/css/style.css" />


<link rel="stylesheet" type="text/css"
	href="${rPath}/gallery/css/jquery.cslider.css" />
<link rel="stylesheet" type="text/css"
	href="${rPath}/gallery/css/jquery.bxslider.css" />
<link rel="stylesheet" type="text/css"
	href="${rPath}/gallery/css/animate.css" />


<style>
.news-row {
	padding: 0 0px;
}

h1 {
	font-size: 30px !important;
	font-weight: 500 !important;
	margin-bottom: 20px !important;
}

a {
	color: #181A1C;
	text-decoration: none;
}

a:hover {
	color: #FFFFF;
	text-decoration: none;
}

#portfolio {
	margin-top: 20px;
}

.section .title {
	background-color: #f7f7f7;
	padding: 20px;
	width: 1210px;
}

.navgrid {
	width: 100%;
	display: grid;
	grid-template-columns: repeat(5, 2fr);
	white-space: nowrap;
	margin-top: 50px;
	margin-bottom: 30px;
}

.news-indicator2 {
	display: inline-flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	height: 100%;
}

.chart-provider-container {
	margin-left: 800px;
}

.chart-provider button {
	background-color: #000000;
	padding: 10px 20px;
	cursor: pointer;
	border-radius: 5px;
	width: 200px;
	border: none;
	color: #ffffff;
	font-size: 1.1rem;
	opacity: 1;
	transition: opacity 0.3s ease;
}

.chart-provider button:hover {
	background-color: #333333;
	color: #f8f8f8;
	opacity: 0.5;
}

@media ( max-width : 979px) {
	body {
		padding-left: 0;
		padding-right: 0;
	}
}

.thumbnails.rows li img {
	height: 300px;
}

.write-button {
	background: transparent;
	-webkit-border-radius: 0;
	-moz-border-radius: 0;
	border-radius: 0;
	margin-right: 5px;
	padding-left: 25px;
	padding-right: 25px;
	border: 1px solid #181A1C;
	padding-top: 5px;
	padding-bottom: 5px;
	font-size: 1.1rem;
	font-weight: bold;
}

.write-button:hover {
	background-color: #181A1C;
	color: #ffffff;
}

.btn-wrt {
	display: flex;
	justify-content: flex-end;
	padding-right: 10%;
	margin-bottom: 20px;
}

.filter {
	height: 60px;
}

.filter img {
	width: 30px;
	height: 30px;
}

.section .title h1 {
	font-weight: normal;
	margin-bottom: 5px;
	margin-top: 0;
	padding: 0;
}

.thumbnails rows {
	display: center;
}

container1 {
	display: center;
}
</style>


<div class="section secondary-section " id="portfolio">
	<div class="container1">
		<div class=" title">
			<h1>구단별 NEWS!</h1>
			<strong>이시각 우리 구단 소식은?</strong>
		</div>
		<div class="container">
			<div class="news-row"
				style="text-align: center; width: 100%; height: 100%;">
				<div>
					<ul class="nav-pills navgrid">
						<li class="filter" data-filter="LG"><a href="#noAction">
								<img src="${rPath}/img/initial_LG.png">&nbsp;&nbsp;LG
						</a></li>
						<li class="filter" data-filter="HH"><a href="#noAction">
								<img src="${rPath}/img/initial_Hanwha.png">한화
						</a></li>
						<li class="filter" data-filter="SS"><a href="#noAction">
								<img src="${rPath}/img/initial_Samsung.png">삼성
						</a></li>
						<li class="filter" data-filter="WO"><a href="#noAction">
								<img src="${rPath}/img/initial_Kiwoom.png">키움
						</a></li>
						<li class="filter" data-filter="KT"><a href="#noAction">
								<img src="${rPath}/img/initial_KT.png">KT
						</a></li>
						<li class="filter" data-filter="OB"><a href="#noAction">
								<img src="${rPath}/img/initial_Doosan.png">두산
						</a></li>
						<li class="filter" data-filter="LT"><a href="#noAction">
								<img src="${rPath}/img/initial_Lotte.png">롯데
						</a></li>
						<li class="filter" data-filter="SK"><a href="#noAction">
								<img src="${rPath}/img/initial_SSG.png">SSG
						</a></li>
						<li class="filter" data-filter="HT"><a href="#noAction">
								<img src="${rPath}/img/initial_KIA.png">KIA
						</a></li>
						<li class="filter" data-filter="NC"><a href="#noAction">
								<img src="${rPath}/img/initial_NC.png">NC
						</a></li>
					</ul>
				</div>
				<div class="chart-provider-container">
					<a href="newschart" class="chart-provider">
						<button>뉴스 차트로 이동</button>
					</a>
				</div>
			</div>
		</div>
		<div class="news-indicator2">
			<img src="resources/img/newsnotice.jpeg" alt="newsnotice"
				style="width: 700px;">
		</div>
		<!-- Start thumbnails-->
		<ul id="portfolio-grid" class="thumbnails rows"></ul>
	</div>
</div>
<!-- Footer section start -->
<%@include file="../temp/footer.jsp"%>
<!-- Footer section end -->
<!-- ScrollUp button start -->
<div class="scrollup">
	<a href="#"> ▲ </a>
</div>
<!-- ScrollUp button end -->
<!-- Include javascript -->

<!-- jquery.js 없애면 썸네일이 안나오고 디테일이 다 노출됨-->
<script src="${rPath}/gallery/js/jquery.js"></script>
<script type="text/javascript"
	src="${rPath}/gallery/js/jquery.mixitup.js"></script>
<script type="text/javascript"
	src="${rPath}/gallery/js/jquery.bxslider.js"></script>
<script type="text/javascript"
	src="${rPath}/gallery/js/jquery.cslider.js"></script>
<script type="text/javascript"
	src="${rPath}/gallery/js/jquery.placeholder.js"></script>
<!-- 요기까지 동일-->
<!-- 지워도 문제없는 JS -->
<!-- <script type="text/javascript"
	src="${rPath}/gallery/js/modernizr.custom.js"></script> -->
<!--<script type="text/javascript" src="${rPath}/gallery/js/bootstrap.js"></script>-->
<!-- <script type="text/javascript"
	src="${rPath}/gallery/js/jquery.inview.js"></script> -->
<!-- css3-mediaqueries.js for IE8 or older -->
<!--[if lt IE 9]>
            <script src="js/respond.min.js"></script>
        <![endif]-->
<script type="text/javascript" src="${rPath}/gallery/js/app.js"></script>
<script>
	$(window)
			.on(
					'load',
					function() {
						$
								.ajax({
									url : 'http://192.168.0.45:9000/teamproject/loadDf3Json',
									type : 'GET',
									dataType : 'json',
									success : function(data) {
										console.log(data);
										data
												.forEach(function(item) {
													let maxLength = 45;
													let content = item.content;
													if (content.length > maxLength) {
														let trimmedText = content
																.substring(0,
																		maxLength)
																+ "...";
														item.content = trimmedText;
													}

													let portfolioHtml = '<li class="span4 mix ' + item.ctg + '">'
															+ '<div class="thumbnail" style="height:500px">'
															+ '<img src="' + item.imgn + '" alt="project ' + item.num + '">'
															+ '<a href="/crawling_project/newsDetail?num='
															+ item.num
															+ '">'
															+ '<p style="color: white; font-size: 54px;">+</p></a>'
															+ '<h3 class="thmbh3">'
															+ item.title
															+ '</h3>'
															+ '<p class="thmbP">'
															+ item.content
															+ '</p>'
															+ '<div class="mask"></div></div></li>';

													$('#portfolio-grid')
															.append(
																	portfolioHtml);
												});
									},
									error : function(xhr, status, error) {
										console.log("Error occurred: " + error);
										console.log("Status: " + status);
										console.dir(xhr);
									}
								});
					});

	document.addEventListener('DOMContentLoaded', function() {
		// 모든 .filter 요소를 선택
		let filters = document.querySelectorAll('.filter');

		// 각 필터 요소에 대해 클릭 이벤트 리스너를 추가
		filters.forEach(function(filter) {
			filter.addEventListener('click', function() {
				// .news-indicator2 내의 img 요소를 선택
				let newsIndicatorImg = document
						.querySelector('.news-indicator2 img');

				// img 요소의 display 속성을 'none'으로 설정하여 숨김
				if (newsIndicatorImg) {
					newsIndicatorImg.style.display = 'none';
				}
			});
		});
	});
</script>

