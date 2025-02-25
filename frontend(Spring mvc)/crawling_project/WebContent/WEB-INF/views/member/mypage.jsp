<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="../temp/header.jsp"%>
<%-- 마이페이지, 정보수정 구현 --%>
<style>
#mypage {
	font-size: 1.1rem;
}

.mypage_menu {
	flex: 1;
	text-align: center;
}

#mypage h2 {
	font-size: 30px;
	font-weight: 500;
	margin-top: 20px;
	margin-bottom: 20px;
}

#mypage p {
	font-size: 1.1rem;
}

#mypage table {
	font-size: 1.1rem;
	text-align: center;
	width: 500px;
	margin: auto;
}

#mypage table tr, td {
	padding: 5px;
	border: none;
	margin-bottom: 10px;
}

#mypage button {
	cursor: pointer;
	background-color: #007bff;
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

#mypage button:hover {
	background-color: #005bcc;
	opacity: 0.5;
}
</style>
<section id="mypage">
	<div class="mypage_menu">
		<div class="container">
			<div class="row">
				<h2>
					<img src="resources/img/logo3.png" alt="hat" style="width: 100px;">
				</h2>
				<h2>
					<em>마이페이지</em>
				</h2>
				<br>
				<p>
					아래는 <span style="color: #005bcc;"><b>${dto.name}</b></span>님의 가입
					정보입니다.<br> 확인해주시고, 수정이 필요하시면 '정보수정' 버튼을 클릭해 주세요.
				<p>
					<br>
				<table>
					<tr>
						<th><i class="fa-solid fa-id-card"></i>&nbsp;ID</th>
						<td>${dto.id}</td>
					</tr>
					<tr>
						<th><i class="fa-solid fa-tag"></i>&nbsp;Name</th>
						<td>${dto.name}</td>
					</tr>
					<tr>
						<th><i class="fa-solid fa-envelope"></i>&nbsp;E-mail</th>
						<td>${dto.email}</td>
					</tr>
					<tr>
						<th><i class="fa-solid fa-phone"></i>&nbsp;Tel</th>
						<td>${dto.tel}</td>
					</tr>
					<tr>
						<th><i class="fa-solid fa-award"></i>&nbsp;Grade</th>
						<td>${dto.grade}</td>
					</tr>
					<tr>
						<th><i class="fa-solid fa-baseball-bat-ball"></i>&nbsp;응원팀</th>
						<td>${dto.favteam}</td>
					</tr>
					<tr>
						<th><i class="fa-regular fa-calendar-plus"></i>&nbsp;가입일</th>
						<td>${dto.rdate}</td>
					</tr>
				</table>
				<br>
				<button onclick="location='mypageUpdate?num=${dto.num}'">
					<i class="fa-solid fa-gear"></i>&nbsp;정보수정
				</button>
			</div>
		</div>
	</div>
</section>
<%@ include file="../temp/footer.jsp"%>