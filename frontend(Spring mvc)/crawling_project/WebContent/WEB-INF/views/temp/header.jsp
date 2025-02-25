<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HOMERUN TICKET</title>
<!-- ajax�� ��ũ �ɱ� -->
<script src="resources/js/ajaxdemo1.js"></script>
<%-- css ���� ���� --%>
<link rel="stylesheet" href="resources/css/style.css" type="text/css">
<link rel="stylesheet" href="resources/css/reset.css" type="text/css">
<%-- google �� ��Ʈ Noto Sans KR --%>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean"
	rel="stylesheet">
<%-- ��Ʈ����� CDN ��ũ��Ʈ �ּ� CP --%>
<script src="https://kit.fontawesome.com/6c4ebccfb3.js" crossorigin="anonymous"></script>

<%-- jQuery �߰� --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<%-- ������Ʈ �߰� --%>
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
								class="dropbtn"><i class="fa-solid fa-bars"></i>&nbsp;��ü�޴�</a>
								<ul class="dropdown-content">
									<%-- �α��� �� --%>
									<c:choose>
										<c:when test="${sessionScope.sessionID == null }">
											<li
												style="text-align: left; background-color: #dbdbdb; font-size: 1.1rem;"><b>&nbsp;KBO���� ����</b></li>
											<li><a href="matches">��� ����</a></li>
											<li><a href="record">��/���� ����</a></li>
											<li><a href="stock">���� ���� ����</a></li>
											<li style="text-align: left; background-color: #dbdbdb; font-size: 1.1rem;"><b>&nbsp;�̵��/����</b></li>
											<li><a href="newsList">���� �Խ���</a></li>
											<li><a href="newsrank">��Ÿ����� ����</a></li>

											<li
												style="text-align: left; background-color: #dbdbdb; font-size: 1.1rem;"><b>&nbsp;�����</b></li>
											<li><a href="login">�α���</a></li>
											<li><a href="signup">ȸ������</a></li>
											<li><a href="boardlist">�����Խ���</a></li>
											<!-- <li><a href="mypage">����������</a></li> -->
										</c:when>
										<c:when test="${sessionScope.sessionID != null }">
											<%-- �α��� �� --%>
											<li
												style="text-align: left; background-color: #dbdbdb; font-size: 1.1rem;"><b>&nbsp;KBO���� ����</b></li>
											<li><a href="matches">��� ����</a></li>
											<li><a href="record">��/���� ����</a></li>
											<li><a href="stock">���� ���� ����</a></li>
											<li
												style="text-align: left; background-color: #dbdbdb; font-size: 1.1rem;"><b>&nbsp;�̵��/����</b></li>
											<li><a href="newsList">���� �Խ���</a></li>
											<li><a href="newsrank">��Ÿ����� ����</a></li>

											<li
												style="text-align: left; background-color: #dbdbdb; font-size: 1.1rem;"><b>&nbsp;�����</b></li>
											<li><a href="mypage">����������</a></li>
											<li><a href="boardlist">�����Խ���</a></li>
										</c:when>
									</c:choose>
								</ul></li>
						</ul>
					</nav>
					<%--logo1 �̹��� �ε�--%>
					<h1>
						<a href="main"> <em><img src="resources/img/logo1.png"
								alt="KOREAN LEAUGE"></em>
						</a>
					</h1>
					<nav class="nav">
						<ul class="clearfix">
							<li><a href="matches">��� ����</a></li>
							<li><a href="record">��/���μ���</a></li>
							<li><a href="stock">���� ���� ����</a></li>
							<li><a href="newsList">���� �Խ���</a></li>
							<li><a href="newsrank">��Ÿ����� ����</a></li>
							<li><a href="boardlist">�����Խ���</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</header>