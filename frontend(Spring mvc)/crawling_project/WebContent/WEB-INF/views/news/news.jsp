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
/* CSS ��Ÿ�� */
.player-image {
	width: 100px; /* �̹��� ũ�� ���� */
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
	margin: 0 auto; /* ��� ���� */
	border-collapse: collapse; /* ���̺� �� ��踦 ��ħ */
	width: 80%; /* ���̺� �ʺ� ���� */
}

#bottom7 th, #bottom7 td, #top3 p {
	text-align: center; /* �ؽ�Ʈ ��� ���� */
}

#bottom7 th, #bottom7 td {
	padding: 10px; /* �� ���� ���� ���� */
	border: 1px solid #ddd; /* �� ��輱 ��Ÿ�� ���� */
}

#bottom7 th {
	background-color: #f2f2f2; /* ���̺� ��� ���� ���� */
	font-weight: bold; /* ���̺� ��� �ؽ�Ʈ ���� ���� */
}

#bottom7 tbody tr:hover {
	background-color: #f2f2f2;
}

#top3 {
	display: flex; /* flexbox ��� */
	justify-content: space-around; /* ��ҵ��� ��� �����Ͽ� ������ �������� ��ġ */
	align-items: center; /* ���� ��� ���� */
}

#top3 {
	display: flex; /* �⺻ ���� ���� */
	justify-content: center;
	align-items: flex-end;
	margin-top: 20px;
}

/* �̹��� ũ�� ���� */
.player-image {
	width: 250px; /* �̹��� ũ�� �⺻�� */
	transition: all 0.3s; /* �ִϸ��̼� ȿ�� ���� */
}

.player-info:nth-child(2) .player-image {
	width: 150px; /* 2���� �̹��� ũ�� */
}

.player-info:nth-child(3) .player-image {
	width: 130px; /* 3���� �̹��� ũ�� */
}

.player-name {
	font-size: 24px; /* �÷��̾� �̸��� �ؽ�Ʈ ũ�⸦ ũ�� ���� */
	font-weight: bold; /* �÷��̾� �̸��� ���� �۲� ���� */
}

/* 1�� ��Ÿ�� */
#top3 .player-info:nth-child(1) {
	background: #294faa; /* �Ķ� �迭 �׶��̼� ��� */
	padding: 20px 30px; /* ������ ���� */
	border-radius: 10px; /* �𼭸� �ձ۰� */
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1); /* �ణ�� �׸��� ȿ�� */
	transition: all 0.3s ease; /* �ε巯�� ��ȭ ȿ�� */
	color: white;
	margin-left: 200px;
}

/* 2�� ��Ÿ�� */
#top3 .player-info:nth-child(2) {
	background: #b80c3b; /* �Ķ� �迭 �׶��̼� ��� */
	padding: 15px 25px; /* ������ ���� */
	border-radius: 10px; /* �𼭸� �ձ۰� */
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1); /* �ణ�� �׸��� ȿ�� */
	transition: all 0.3s ease; /* �ε巯�� ��ȭ ȿ�� */
	color: white;
	margin-left: -550px;
}

/* 3�� ��Ÿ�� */
#top3 .player-info:nth-child(3) {
	background: #000000; /* �Ķ� �迭 �׶��̼� ��� */
	padding: 10px 20px; /* ������ ���� */
	border-radius: 10px; /* �𼭸� �ձ۰� */
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1); /* �ణ�� �׸��� ȿ�� */
	transition: all 0.3s ease; /* �ε巯�� ��ȭ ȿ�� */
	color: white;
	margin-left: 330px;
}

/* hover ȿ�� */
#top3 .player-info:hover {
	transform: translateY(-5px); /* ���� �ణ �̵� */
	box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.2); /* �׸��� ��ȭ */
}

#top3 .player-info {
	margin-right: 20px; /* �̹����� ���� ������ ���� ���� */
}

/* �̹��� hover ȿ�� */
.player-info img.player-image {
	transition: transform 0.3s ease; /* ��ȭ�� �ε巴�� ����� ���� transition �Ӽ� �߰� */
}

/* ���콺�� �÷��� �� �̹��� Ȯ�� */
.player-info img.player-image:hover {
	transform: scale(1.1); /* 1.1��� Ȯ�� */
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
			<h1>�ֱ� ������ �� ��翡�� ���� ���� ��޵� ���� TOP 10</h1>
			<div class="title">

				<p></p>
				<div id="rankings">
					<!-- ���ܺ� ��ư -->
					<div id="teamButtons">
						<button class="teamButton ��ü" data-type="��ü">��ü</button>
						<button class="teamButton KIA" data-type="KIA">KIA</button>
						<button class="teamButton NC" data-type="NC">NC</button>
						<button class="teamButton �Ｚ" data-type="�Ｚ">�Ｚ</button>
						<button class="teamButton LG" data-type="LG">LG</button>
						<button class="teamButton SSG" data-type="SSG">SSG</button>
						<button class="teamButton �λ�" data-type="�λ�">�λ�</button>
						<button class="teamButton KT" data-type="KT">KT</button>
						<button class="teamButton Ű��" data-type="Ű��">Ű��</button>
						<button class="teamButton ��ȭ" data-type="��ȭ">��ȭ</button>
						<button class="teamButton �Ե�" data-type="�Ե�">�Ե�</button>
					</div>
				</div>
			</div>
		</div>
		<!-- ���� 1���� 3���� �̹����� ǥ�� -->
		<div id="top3"></div>

	</div>
	<!-- ���� 4���� 10���� ���̺�� ǥ�� -->
	<table id="bottom7">
		<thead>
			<tr>
				<th>����</th>
				<th>����</th>
				<th>��� Ƚ��</th>
			</tr>
		</thead>
		<tbody id="rankingsBody">
			<!-- ���⿡ 4����� 10����� ������ �������� �߰� -->
		</tbody>
	</table>
	<p style="text-align: center; margin-bottom: 50px;">
		<a href="main"><i class="fa-solid fa-rotate-left"></i>&nbsp;����ȭ������
			���ư���</a>
	</p>
	<%@include file="../temp/footer.jsp"%>
	<script>
		$(document)
				.ready(
						function() {
							// ������ �ε� �� ��ü ���� ���� ������ ǥ��
							displayTeamRankings("��ü");

							// �� ���ܺ� ��ư Ŭ�� �̺�Ʈ ó��
							$(".teamButton").click(function() {
								const type = $(this).data("type");
								displayTeamRankings(type);
							});

							// Ư�� ���� �� ��ü�� ���� ������ ǥ�� �Լ�
							function displayTeamRankings(type) {
								$
										.ajax({
											url : 'http://192.168.0.45:9000/teamproject/open_json',
											type : 'GET',
											dataType : 'json',
											success : function(data) {
												console.log(data);
												// �޾ƿ� �����͸� ���̺� ä��� �ڵ� �߰�
												$("#rankingsBody").empty(); // ���� ������ ����
												$("#top3").empty(); // ���� 3�� ���� ����
												let topPlayersCount = 0; // ���� ���� ������ ���� ����
												let totalPlayersCount = 0; // ��ü ���� ������ ���� ����
												$
														.each(
																data,
																function(index,
																		player) {
																	if (totalPlayersCount < 10
																			&& (type === "��ü" || player.type === type)) {
																		if (topPlayersCount < 3) {
																			// ���� 3���� ������ �̹����� �Բ� ���
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
																									+ (type === "��ü" ? '('
																											+ player.team
																											+ ')'
																											: ""));
																			const playerCount = $(
																					'<p>')
																					.addClass(
																							'player-count')
																					.text(
																							'��� Ƚ��: '
																									+ player.count);
																			const playerRank = $(
																					'<p>')
																					.addClass(
																							'player-rank')
																					.text(
																							'����: '
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
																			topPlayersCount++; // ���� ���� ���� ����
																		} else {
																			// ������ �����ʹ� ���̺��� ���
																			const row = "<tr><td>"
																					+ player.rank
																					+ "</td><td>"
																					+ player.player
																					+ (type === "��ü" ? '('
																							+ player.team
																							+ ')'
																							: "")
																					+ "</td><td>"
																					+ player.count
																					+ "</td></tr>";
																			$(
																					"#rankingsBody")
																					.append(
																							row); // ���ο� �� �߰�
																		}
																		totalPlayersCount++; // ��ü ���� ���� ����
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