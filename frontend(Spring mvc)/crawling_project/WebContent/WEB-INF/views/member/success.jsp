<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="../temp/header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
/* membership_success CSS */
.success_top .sm_left, .success_top .sm_right {
	flex: 1;
	text-align: center;
}

.success_top .sm_left img {
	max-width: 100%;
	height: auto;
	object-fit: cover;
}

.success_top .sm_right {
	padding: 20px;
}

.success_top .sm_right p {
	font-size: 1.1rem;
}

.success_top .sm_right table {
	font-size: 1.1rem;
	text-align: center;
	width: 500px;
	margin: auto;
}

.success_top .sm_right table tr, td {
	padding: 5px;
	border: none;
	margin-bottom: 10px;
}

.success_bottom h3 {
	font-size: 30px;
	font-weight: 500;
	margin-top: 20px;
	margin-bottom: 10px;
}

.success_bottom button {
	cursor: pointer;
	background-color: #004aad;
	color: white;
	border: none;
	padding: 10px 15px;
	border-radius: 5px;
	text-align: center;
	display: inline-block;
	box-sizing: border-box;
	margin-bottom: 15px;
	width: 150px;
	font-size: 1.1rem;
	opacity: 1;
    transition: opacity 0.3s ease;
}

.success_bottom button:hover {
	background-color: #005bcc;
	opacity: 0.5;
}
</style>

<section id="membership_success">
	<div class="success_top">
		<div class="container">
			<div class="row">
				<div class="sm_left">
					<img src="resources/img/welcome.png" alt="welcome">
				</div>
				<div class="sm_right">
					<h3>
						ȯ���մϴ�, <span style="color: #d11a45;"><b>${vo.name}</b></span>��! <br>
						ȸ�������� ���������� �Ϸ�Ǿ����ϴ�.
					</h3>
					<br>
					<table>
						<tr>
							<th><i class="fa-solid fa-id-card"></i>&nbsp;ID</th>
							<td>${vo.id}</td>
						</tr>
						<tr>
							<th><i class="fa-solid fa-key"></i>&nbsp;Password</th>
							<td>${vo.pwd}</td>
						</tr>
						<tr>
							<th><i class="fa-solid fa-envelope"></i>&nbsp;E-mail</th>
							<td>${vo.email}</td>
						</tr>
						<tr>
							<th><i class="fa-solid fa-baseball-bat-ball"></i>&nbsp;������</th>
							<td>${vo.favteam}</td>
						</tr>
					</table>
					<br>
				</div>
			</div>
		</div>
	</div>
	<hr>
	<div class="success_bottom">
		<h2>
			<img src="resources/img/logo2.png" alt="gloves"
				style="width: 80px; margin: auto;">
		</h2>
		<h3>
			<span style="color: #005bcc;"><b>�ѱ� �߱�</b></span>�� ��� ��!<br>
			<b>��� ������ ���, �ֽ� ����, �� ����, ���� ���� �ҽı���!</b><br>
			<span style="color: #d11a45;"> <b>${vo.name}</b>
			</span>���� ã�� �߱� �ҽ��� �����մϴ�.<br><br>
			<span style="color: #005bcc;"><b>���� �ٷ� �α����Ͽ� Ȯ���� ������!</b></span>
			<button onclick="location='login'">
				<i class="fa-solid fa-lock"></i>&nbsp;�α���
			</button>
			<p style="font-size: 1.1rem; line-height: 1.5;">
				<a href="main"><i class="fa-solid fa-rotate-left"></i>&nbsp;����ȭ������
					���ư���</a>
			</p>
		</h3>
	</div>
</section>
<%@include file="../temp/footer.jsp"%>