<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HOMERUN TICKET</title>
<!-- ajax를 링크 걸기 -->
<script src="resources/js/ajaxdemo1.js"></script>
<%-- css 파일 연결 --%>
<link rel="stylesheet" href="resources/css/style.css" type="text/css">
<link rel="stylesheet" href="resources/css/reset.css" type="text/css">
<%-- google 웹 폰트 Noto Sans KR --%>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean"
	rel="stylesheet">
<%-- 폰트어썸의 CDN 스크립트 주소 CP --%>
<script src="https://kit.fontawesome.com/6c4ebccfb3.js" crossorigin="anonymous"></script>

<%-- jQuery 추가 --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<%-- 하이차트 추가 --%>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script src="https://code.highcharts.com/modules/sunburst.js"></script>

</head>
<body>
	<header id="header">
		<div class="container">
			<div class="row">
				<div class="header clearfix">
					<nav class="total">
						<ul class="clearfix">
							<li class="dropdown"><a href="javascript:void(0)"
								class="dropbtn"><i class="fa-solid fa-bars"></i>&nbsp;전체메뉴</a>
								<ul class="dropdown-content">
									<%-- 로그인 전 --%>
									<c:choose>
										<c:when test="${sessionScope.sessionID == null }">
											<li
												style="text-align: left; background-color: #dbdbdb; font-size: 1.1rem;"><b>&nbsp;KBO리그 정보</b></li>
											<li><a href="matches">경기 일정</a></li>
											<li><a href="record">팀/개인 순위</a></li>
											<li><a href="stock">구단 증권 정보</a></li>
											<li style="text-align: left; background-color: #dbdbdb; font-size: 1.1rem;"><b>&nbsp;미디어/뉴스</b></li>
											<li><a href="newsList">뉴스 게시판</a></li>
											<li><a href="newsrank">스타디움의 별들</a></li>

											<li
												style="text-align: left; background-color: #dbdbdb; font-size: 1.1rem;"><b>&nbsp;멤버십</b></li>
											<li><a href="login">로그인</a></li>
											<li><a href="signup">회원가입</a></li>
											<li><a href="boardlist">응원게시판</a></li>
											<!-- <li><a href="mypage">마이페이지</a></li> -->
										</c:when>
										<c:when test="${sessionScope.sessionID != null }">
											<%-- 로그인 후 --%>
											<li
												style="text-align: left; background-color: #dbdbdb; font-size: 1.1rem;"><b>&nbsp;KBO리그 정보</b></li>
											<li><a href="matches">경기 일정</a></li>
											<li><a href="record">팀/개인 순위</a></li>
											<li><a href="stock">구단 증권 정보</a></li>
											<li
												style="text-align: left; background-color: #dbdbdb; font-size: 1.1rem;"><b>&nbsp;미디어/뉴스</b></li>
											<li><a href="newsList">뉴스 게시판</a></li>
											<li><a href="newsrank">스타디움의 별들</a></li>

											<li
												style="text-align: left; background-color: #dbdbdb; font-size: 1.1rem;"><b>&nbsp;멤버십</b></li>
											<li><a href="mypage">마이페이지</a></li>
											<li><a href="boardlist">응원게시판</a></li>
										</c:when>
									</c:choose>
								</ul></li>
						</ul>
					</nav>
					<%--logo1 이미지 로드--%>
					<h1>
						<a href="main"> <em><img src="resources/img/logo1.png"
								alt="KOREAN LEAUGE"></em>
						</a>
					</h1>
					<nav class="nav">
						<ul class="clearfix">
							<li><a href="matches">경기 일정</a></li>
							<li><a href="record">팀/개인순위</a></li>
							<li><a href="stock">구단 증권 정보</a></li>
							<li><a href="newsList">뉴스 게시판</a></li>
							<li><a href="newsrank">스타디움의 별들</a></li>
							<li><a href="boardlist">응원게시판</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</header>