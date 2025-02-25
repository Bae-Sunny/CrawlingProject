<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="../temp/header.jsp"%>
<%-- ����������, �������� ���� --%>
<style>
#mypageupdate {
	font-size: 1.1rem;
}

.mypage_upmenu {
	flex: 1;
	text-align: center;
}

#mypageupdate h2 {
	font-size: 30px;
	font-weight: 500;
	margin-top: 20px;
	margin-bottom: 20px;
}

#mypageupdate p {
	font-size: 1.1rem;
}

#mypageupdate table {
	font-size: 1.1rem;
	text-align: center;
	width: 500px;
	margin: auto;
}

#passwordContainer {
	display: none; /* �ʱ� ���´� ���� */
	text-align: center;
	width: 100%;
	margin-top: 20px; /* ��� ���� */
}

#mypageupdate th, #mypageupdate td {
	vertical-align: middle;
	border: none;
	padding: 8px;
	margin-bottom: 10px;
}

#mypageupdate input[type="text"], #mypageupdate input[type="email"] {
	font-size: 1.1rem;
	width: 65%;
}

select {
	width: 65%;
	font-size: 1.1rem;
}

#mypageupdate button {
	cursor: pointer;
	background-color: #007bff;
	color: white;
	border: none;
	padding: 10px 15px;
	border-radius: 5px;
	text-align: center;
	display: inline-block;
	box-sizing: border-box;
	margin-bottom: 20px;
	width: 150px;
	font-size: 1.1rem;
	opacity: 1;
    transition: opacity 0.3s ease;
}

#mypageupdate button:hover {
	background-color: #005bcc;
	opacity: 0.5;
}
</style>
<section id="mypageupdate">
	<div class="mypage_upmenu">
		<div class="container">
			<div class="row">
				<h2>
					<img src="resources/img/logo3.png" alt="hat" style="width: 100px;">
				</h2>
				<h2>
					<em>����������</em>
				</h2>
				<p>
					�Ʒ��� <span style="color: #005bcc;"><b>${dto.name}</b></span>���� ����
					�����Դϴ�.<br> Ȯ�����ֽð�, ���� �� '�����Ϸ�' ��ư�� Ŭ���� �ּ���.
				</p>
				<br>
				<!-- Corrected tag closing -->
				<form method="post" action="updateProcess" name="updateForm">
					<input type="hidden" name="num" value="${dto.num}">
					<table style="font-size: 1.1rem;">
						<tr>
							<th><i class="fa-solid fa-id-card"></i>&nbsp;ID</th>
							<td>${dto.id}</td>
						</tr>
						<tr>
							<th><i class="fa-solid fa-id-card"></i>&nbsp;Name</th>
							<td><input type="text" name="name" value="${dto.name}"></td>
						</tr>
						<tr>
							<th><i class="fa-solid fa-envelope"></i>&nbsp;E-mail</th>
							<td><input type="email" name="email" value="${dto.email}"></td>
						</tr>
						<tr>
							<th><i class="fa-solid fa-phone"></i>&nbsp;Tel</th>
							<td><input type="text" name="tel" value="${dto.tel}"></td>
						</tr>
						<tr>
							<th><i class="fa-solid fa-baseball-bat-ball"></i>&nbsp;������</th>
							<td><select name="favteam">
									<option value="�λ꺣�"
										${dto.favteam == "�λ꺣�" ? "selected" : ""}>�λ꺣�</option>
									<option value="��ȭ�̱۽�"
										${dto.favteam == "��ȭ�̱۽�" ? "selected" : ""}>��ȭ�̱۽�</option>
									<option value="KIAŸ�̰���"
										${dto.favteam == "KIAŸ�̰���" ? "selected" : ""}>KIAŸ�̰���</option>
									<option value="Ű���������"
										${dto.favteam == "Ű���������" ? "selected" : ""}>Ű���������</option>
									<option value="KT����" ${dto.favteam == "KT����" ? "selected" : ""}>KT����</option>
									<option value="LGƮ����"
										${dto.favteam == "LGƮ����" ? "selected" : ""}>LGƮ����</option>
									<option value="�Ե����̾���"
										${dto.favteam == "�Ե����̾���" ? "selected" : ""}>�Ե����̾���</option>
									<option value="NC���̳뽺"
										${dto.favteam == "NC���̳뽺" ? "selected" : ""}>NC���̳뽺</option>
									<option value="�Ｚ���̿���"
										${dto.favteam == "�Ｚ���̿���" ? "selected" : ""}>�Ｚ���̿���</option>
									<option value="SSG������"
										${dto.favteam == "SSG������" ? "selected" : ""}>SSG������</option>
							</select></td>
						</tr>
					</table>

					<!-- <button type="submit" onclick="return update();">
						<i class="fa-solid fa-gear"></i>&nbsp;�����Ϸ�
					</button> -->
					<div id="passwordContainer"
						style="text-align: center; display: none;">
						<span style="color: #d11a45;"><b><i
								class="fa-solid fa-triangle-exclamation"></i>&nbsp;���������� ��й�ȣ��
								�Է��ؾ� �մϴ�.</b></span><br> <input type="password" id="pwd" name="pwd"
							placeholder="��й�ȣ�� �Է��� �ּ���."
							style="margin-bottom: 15px; font-size: 1.1rem;"> <br>
					</div>
					<button type="button" id="updateBtn">
						<i class="fa-solid fa-gear"></i>&nbsp;�����Ϸ�
					</button>
				</form>
			</div>
		</div>
	</div>
</section>
<script>
	document.getElementById("updateBtn").addEventListener("click", function() {
		const passwordContainer = document.getElementById("passwordContainer");
		if (passwordContainer.style.display === "none") {
			// ��й�ȣ �Է� �ʵ带 ó������ ������
			passwordContainer.style.display = "block";
		} else {
			// ��й�ȣ �Է� ��, ���� ���� ����
			if (update()) {
				document.forms["updateForm"].submit(); // �� ����
			}
		}
	});

	function update() {
		const passwordDB = '${dto.pwd}';
		const password = document.getElementById("pwd").value;
		if (passwordDB === password) {
			return true;
		} else {
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�!");
			return false;
		}
	}
</script>
<%@ include file="../temp/footer.jsp"%>
