<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rPath" value="${pageContext.request.contextPath}/resources"
	scope="application" />
<%@ include file="../temp/header.jsp"%>
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
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>News Rankings</title>
<style>
/* CSS 스타일 */
.player-image {
	width: 100px; /* 이미지 크기 조절 */
}

.row {
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
}

.navgrid {
	width: 40%;
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	white-space: nowrap;
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

.teamButton {
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

.teamButton:hover {
	background-color: #181A1C;
	color: #ffffff;
}

.teamButton:focus {
	background-color: #181A1C;
	color: #ffffff;
}

.btn-wrt {
	display: flex;
	justify-content: flex-end;
	padding-right: 10%;
	margin-bottom: 20px;
}

#bottom7 {
	margin: 0 auto; /* 가운데 정렬 */
	border-collapse: collapse; /* 테이블 셀 경계를 합침 */
	width: 80%; /* 테이블 너비 설정 */
}

#bottom7 th, #bottom7 td, #top3 p {
	text-align: center; /* 텍스트 가운데 정렬 */
}

#bottom7 th, #bottom7 td {
	padding: 10px; /* 셀 내부 여백 설정 */
	border: 1px solid #ddd; /* 셀 경계선 스타일 설정 */
}

#bottom7 th {
	background-color: #f2f2f2; /* 테이블 헤더 배경색 설정 */
	font-weight: bold; /* 테이블 헤더 텍스트 굵게 설정 */
}

#bottom7 tbody tr:hover {
	background-color: #f2f2f2;
}

#top3 {
	display: flex; /* flexbox 사용 */
	justify-content: space-around; /* 요소들을 가운데 정렬하여 동일한 간격으로 배치 */
	align-items: center; /* 세로 가운데 정렬 */
}

#top3 {
	display: flex; /* 기본 마진 제거 */
	justify-content: center;
	align-items: flex-end;
	margin-top: 20px;
}

/* 이미지 크기 조절 */
.player-image {
	width: 250px; /* 이미지 크기 기본값 */
	transition: all 0.3s; /* 애니메이션 효과 적용 */
}

.player-info:nth-child(2) .player-image {
	width: 150px; /* 2등의 이미지 크기 */
}

.player-info:nth-child(3) .player-image {
	width: 130px; /* 3등의 이미지 크기 */
}

.player-name {
	font-size: 24px; /* 플레이어 이름의 텍스트 크기를 크게 설정 */
	font-weight: bold; /* 플레이어 이름에 굵은 글꼴 적용 */
}

/* 1등 스타일 */
#top3 .player-info:nth-child(1) {
	background: #294faa; /* 파란 계열 그라데이션 배경 */
	padding: 20px 30px; /* 적당한 여백 */
	border-radius: 10px; /* 모서리 둥글게 */
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1); /* 약간의 그림자 효과 */
	transition: all 0.3s ease; /* 부드러운 변화 효과 */
	color: white;
	margin-left: 200px;
}

/* 2등 스타일 */
#top3 .player-info:nth-child(2) {
	background: #b80c3b; /* 파란 계열 그라데이션 배경 */
	padding: 15px 25px; /* 적당한 여백 */
	border-radius: 10px; /* 모서리 둥글게 */
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1); /* 약간의 그림자 효과 */
	transition: all 0.3s ease; /* 부드러운 변화 효과 */
	color: white;
	margin-left: -550px;
}

/* 3등 스타일 */
#top3 .player-info:nth-child(3) {
	background: #000000; /* 파란 계열 그라데이션 배경 */
	padding: 10px 20px; /* 적당한 여백 */
	border-radius: 10px; /* 모서리 둥글게 */
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1); /* 약간의 그림자 효과 */
	transition: all 0.3s ease; /* 부드러운 변화 효과 */
	color: white;
	margin-left: 330px;
}

/* hover 효과 */
#top3 .player-info:hover {
	transform: translateY(-5px); /* 위로 약간 이동 */
	box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.2); /* 그림자 강화 */
}

#top3 .player-info {
	margin-right: 20px; /* 이미지들 간의 오른쪽 여백 설정 */
}

/* 이미지 hover 효과 */
.player-info img.player-image {
	transition: transform 0.3s ease; /* 변화를 부드럽게 만들기 위한 transition 속성 추가 */
}

/* 마우스를 올렸을 때 이미지 확대 */
.player-info img.player-image:hover {
	transform: scale(1.1); /* 1.1배로 확대 */
}

#bottom7 {
	margin-bottom: 50px;
	width: 1200px;
}
</style>
</head>
<body>
	<div class="section secondary-section" id="portfolio">
		<div class="container1">
			<h1>최근 일주일 간 기사에서 가장 많이 언급된 선수 TOP 10</h1>
			<div class="title">

				<p></p>
				<div id="rankings">
					<!-- 구단별 버튼 -->
					<div id="teamButtons">
						<button class="teamButton 전체" data-type="전체">전체</button>
						<button class="teamButton KIA" data-type="KIA">KIA</button>
						<button class="teamButton NC" data-type="NC">NC</button>
						<button class="teamButton 삼성" data-type="삼성">삼성</button>
						<button class="teamButton LG" data-type="LG">LG</button>
						<button class="teamButton SSG" data-type="SSG">SSG</button>
						<button class="teamButton 두산" data-type="두산">두산</button>
						<button class="teamButton KT" data-type="KT">KT</button>
						<button class="teamButton 키움" data-type="키움">키움</button>
						<button class="teamButton 한화" data-type="한화">한화</button>
						<button class="teamButton 롯데" data-type="롯데">롯데</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 순위 1부터 3까지 이미지로 표시 -->
		<div id="top3"></div>

	</div>
	<!-- 순위 4부터 10까지 테이블로 표시 -->
	<table id="bottom7">
		<thead>
			<tr>
				<th>순위</th>
				<th>선수</th>
				<th>언급 횟수</th>
			</tr>
		</thead>
		<tbody id="rankingsBody">
			<!-- 여기에 4등부터 10등까지 선수를 동적으로 추가 -->
		</tbody>
	</table>
	<p style="text-align: center; margin-bottom: 50px;">
		<a href="main"><i class="fa-solid fa-rotate-left"></i>&nbsp;메인화면으로
			돌아가기</a>
	</p>
	<%@include file="../temp/footer.jsp"%>
	<script>
		$(document)
				.ready(
						function() {
							// 페이지 로드 시 전체 팀의 순위 데이터 표시
							displayTeamRankings("전체");

							// 각 구단별 버튼 클릭 이벤트 처리
							$(".teamButton").click(function() {
								const type = $(this).data("type");
								displayTeamRankings(type);
							});

							// 특정 구단 및 전체의 순위 데이터 표시 함수
							function displayTeamRankings(type) {
								$
										.ajax({
											url : 'http://192.168.0.45:9000/teamproject/open_json',
											type : 'GET',
											dataType : 'json',
											success : function(data) {
												console.log(data);
												// 받아온 데이터를 테이블에 채우는 코드 추가
												$("#rankingsBody").empty(); // 기존 데이터 비우기
												$("#top3").empty(); // 상위 3명 영역 비우기
												let topPlayersCount = 0; // 상위 선수 개수를 세는 변수
												let totalPlayersCount = 0; // 전체 선수 개수를 세는 변수
												$
														.each(
																data,
																function(index,
																		player) {
																	if (totalPlayersCount < 10
																			&& (type === "전체" || player.type === type)) {
																		if (topPlayersCount < 3) {
																			// 상위 3명의 선수는 이미지와 함께 출력
																			const playerInfo = $(
																					'<div>')
																					.addClass(
																							'player-info');
																			const playerImage = $(
																					'<img>')
																					.addClass(
																							'player-image')
																					.attr(
																							'src',
																							player.image);
																			const playerName = $(
																					'<p>')
																					.addClass(
																							'player-name')
																					.text(
																							player.player
																									+ (type === "전체" ? '('
																											+ player.team
																											+ ')'
																											: ""));
																			const playerCount = $(
																					'<p>')
																					.addClass(
																							'player-count')
																					.text(
																							'언급 횟수: '
																									+ player.count);
																			const playerRank = $(
																					'<p>')
																					.addClass(
																							'player-rank')
																					.text(
																							'순위: '
																									+ player.rank);

																			playerInfo
																					.append(
																							playerImage,
																							playerName,
																							playerCount,
																							playerRank);
																			$(
																					"#top3")
																					.append(
																							playerInfo);
																			topPlayersCount++; // 상위 선수 개수 증가
																		} else {
																			// 나머지 데이터는 테이블에만 출력
																			const row = "<tr><td>"
																					+ player.rank
																					+ "</td><td>"
																					+ player.player
																					+ (type === "전체" ? '('
																							+ player.team
																							+ ')'
																							: "")
																					+ "</td><td>"
																					+ player.count
																					+ "</td></tr>";
																			$(
																					"#rankingsBody")
																					.append(
																							row); // 새로운 행 추가
																		}
																		totalPlayersCount++; // 전체 선수 개수 증가
																	}
																});
											},
											error : function(xhr, status, error) {
												console.error(
														'Error fetching data:',
														error);
											}
										});
							}
						});
	</script>
</body>