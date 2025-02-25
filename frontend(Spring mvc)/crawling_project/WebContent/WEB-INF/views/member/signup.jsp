<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="../temp/header.jsp"%>
<style>
/* Membership signup table CSS */
#membership .signup_menu .sm_left, .signup_menu .sm_right {
	flex: 1;
	text-align: center;
}

#membership .signup_menu .sm_left img {
	max-width: 100%;
	height: 700px;
	object-fit: cover;
}

#membership .signup_menu .sm_right {
	padding: 20px;
}

#membership .signup_menu table {
	width: 100%;
	border-collapse: separate;
	border-spacing: 0 10px;
	margin-bottom: 10px;
}

#membership .signup_menu tr, td {
	padding: 5px;
	border: none !important;
	text-align: left;
}

#membership .signup_menu input[type="text"], #membership .signup_menu input[type="password"],
	#membership .signup_menu input[type="email"], #id {
	width: calc(100% - 30px);
	padding: 8px 10px;
	margin-bottom: 5px;
	border: 1px solid #ddd;
	border-radius: 5px;
	box-sizing: border-box;
}

#membership .signup_menu input[type="button"], .signup_menu .sm_right button[type="submit"]
	{
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
	font-size: 1.1rem;
	opacity: 1;
    transition: opacity 0.3s ease;
}

#membership .signup_menu input[type="button"]:hover, .signup_menu .sm_right button[type="submit"]:hover
	{
	background-color: #0056b3;
	opacity: 0.5;
}

#membership .nowrap {
	white-space: nowrap;
}

#membership .team-checkboxes {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 10px;
	padding: 0;
	list-style: none;
}

#membership .team-checkboxes label {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-bottom: 5px;
}

#membership .team-logo {
	order: 1;
	width: 30px;
	height: 30px;
	margin-bottom: 5px;
}

#membership .team-checkboxes input[type="checkbox"] {
	order: 2;
	margin-top: 5px;
}

#membership img.logo {
	width: 80px;
	margin: auto;
}
</style>
<section id="membership">
	<div class="signup_menu">
		<div class="container">
			<div class="row">
				<div class="sm_left">
					<img src="resources/img/matches.png" alt="matches">
				</div>
				<div class="sm_right">
					<h2>
						<img src="resources/img/logo111.png" alt="baseball"
							style="width: 80px; margin-bottom: 0;">
					</h2>
					<h3>ȸ������</h3>
					<form method="post" action="memberIn" class="signupform">
						<table>
							<tr>
								<td>���̵�*</td>
								<td><input type="text" name="id" id="id" maxlength="10"
									style="width: 68%;" class="inputEng">&nbsp;<input
									type="button" value="ID �ߺ�Ȯ��" id="idChkBtn"></td>
							</tr>
							<tr>
								<td colspan="2" id="target"></td>
							</tr>
							<tr>
								<td>��й�ȣ*</td>
								<td><input type="password" name="pwd" id="pwd"
									maxlength="10"></td>
							</tr>
							<tr>
								<td>�̸�*</td>
								<td><input type="text" id="name" name="name"></td>
							</tr>
							<tr>
								<td>�̸���*</td>
								<td><input type="email" id="email" name="email"
									class="inputEmail"></td>
							</tr>
							<tr>
								<td>����ó*</td>
								<td><input type="text" id="tel" name="tel" class="inputNum"></td>
							</tr>
							<tr>
								<td>����*</td>
								<td style="text-align: left; padding-left: 20px;"><input
									type="radio" id="male" name="gender" value="male"> <label
									for="male">����</label> <input type="radio" id="female"
									name="gender" value="female"> <label for="female">����</label></td>
							</tr>
							<%-- �迭Ÿ���� �Ķ���� ó���ϱ� --%>
							<tr>
								<td class="nowrap">������*</td>
								<td class="team-checkboxes"><label><input
										type="radio" name="favteam" value="�λ꺣�"><img
										src="resources/img/DOOSANBEARS.svg" alt="doosan"
										class="team-logo">�λ꺣�</label> <label><input
										type="radio" name="favteam" value="��ȭ�̱۽�"><img
										src="resources/img/HANWHAEAGLES.svg" alt="��ȭ�̱۽�"
										class="team-logo">��ȭ�̱۽�</label> <label><input
										type="radio" name="favteam" value="KIAŸ�̰���"><img
										src="resources/img/KIATIGERS.svg" alt="kia" class="team-logo">KIAŸ�̰���</label>
									<label><input type="radio" name="favteam"
										value="Ű���������"><img
										src="resources/img/KIWOOMHEROES.svg" alt="kiwoom"
										class="team-logo">Ű���������</label> <label><input
										type="radio" name="favteam" value="KT����"><img
										src="resources/img/KTWIZ.svg" alt="kt" class="team-logo">KT����</label>
									<label><input type="radio" name="favteam" value="LGƮ����"><img
										src="resources/img/LGTWINS.svg" alt="lg" class="team-logo">LGƮ����</label>
									<label><input type="radio" name="favteam"
										value="�Ե����̾���"><img
										src="resources/img/LOTTEGIANTS.svg" alt="lotte"
										class="team-logo">�Ե����̾���</label> <label><input
										type="radio" name="favteam" value="NC���̳뽺"><img
										src="resources/img/NCDINOS.svg" alt="nc" class="team-logo">NC���̳뽺</label>
									<label><input type="radio" name="favteam"
										value="�Ｚ���̿���"><img
										src="resources/img/SAMSUNGLIONS.svg" alt="samsung"
										class="team-logo">�Ｚ���̿���</label> <label><input
										type="radio" name="favteam" value="SSG������"><img
										src="resources/img/SSGLADERS.svg" alt="ssg" class="team-logo">SSG������</label>
								</td>
							</tr>
						</table>
						<button type="submit">
							<i class="fa-solid fa-user"></i>&nbsp;ȸ������
						</button>
						<p style="font-size: 1.1rem; line-height: 1.5;">
							<a href="main"><i class="fa-solid fa-rotate-left"></i>&nbsp;����ȭ������
								���ư���</a>
						</p>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<%-- id �ߺ� üũ �ڹٽ�ũ��Ʈ �Լ� --%>
<script>
	//window�� ���۾ �ε� �� �� �����ϴ� �Լ� 
	window.onload = function() {
		// ��ư Ŭ�� ���� �� �̺�Ʈ�� �����ϴ� �Լ� �����ϱ� 
		document.querySelector("#idChkBtn").onclick = function(e) {
			/* alert("Test Clicked!"); */
			// �������� ���� ��� 
			e.preventDefault();
			let param = "id=" + document.getElementById("id").value;
			// Ajax�Լ��� ������ ��ο� �Ķ���͵��� �Ű������� �����ؼ� ȣ���� 
			sendRequest("idcheck", param, res, "get");
		};
		// callback �Լ� ����
		function res() {
			if (xhr.readyState === 4) {
				if (xhr.status === 200) {
					// ���� ��� ��� �غ���  -> 0, 1 �� ������ �� �ֿܼ� ���
					console.log(xhr.responseText);
					let idCnt = parseInt(xhr.responseText);
					let msg = "";
					if (idCnt === 0) {
						msg = "��밡���� ���̵� �Դϴ�.";
						document.getElementById("target").style.backgroundColor = "orange";
					} else {
						msg = "������� ���̵� �Դϴ�.";
						document.getElementById("target").style.backgroundColor = "red";
						document.getElementById("target").style.color = "white";
					}
					document.getElementById("target").innerHTML = msg;
				} else {
					// ���� ó��
					console.error("Request failed. Returned status of "
							+ xhr.status);
				}
			}
		}
	};

	$(document).ready(function() {
		$(".inputEng").keyup(function() {
			let tmpElement = event.target;
			let tmpValue = tmpElement.value;
			tmpElement.value = tmpValue.replace(/[^ a-z A-Z 0-9 \.]/g, ''); // A~Z, a~z, 0~9���������� �Է� �����ϵ��� ������			
		}); //keyup
	});//ready

	$(document).ready(function() {
		$(".inputNum").keyup(function() {
			let tmpElement = event.target;
			let tmpValue = tmpElement.value;
			tmpElement.value = tmpValue.replace(/[^ 0-9 - \.]/g, ''); // 0~9����, -�� �Է� �����ϵ��� ������			
		}); //keyup
	});//ready

	$(document).ready(function() {
		$(".inputEmail").keyup(function() {
			let tmpElement = event.target;
			let tmpValue = tmpElement.value;
			tmpElement.value = tmpValue.replace(/[^ a-z A-Z 0-9 @ \.]/g, ''); // A~Z, a~z, 0~9����, @�� �Է� �����ϵ��� ������			
		}); //keyup
	});//ready
</script>
<%@include file="../temp/footer.jsp"%>