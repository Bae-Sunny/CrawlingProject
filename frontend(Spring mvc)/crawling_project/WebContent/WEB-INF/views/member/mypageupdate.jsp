<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="../temp/header.jsp"%>
<%-- 마이페이지, 정보수정 구현 --%>
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
	display: none; /* 초기 상태는 숨김 */
	text-align: center;
	width: 100%;
	margin-top: 20px; /* 상단 여백 */
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
					<em>마이페이지</em>
				</h2>
				<p>
					아래는 <span style="color: #005bcc;"><b>${dto.name}</b></span>님의 가입
					정보입니다.<br> 확인해주시고, 수정 후 '수정완료' 버튼을 클릭해 주세요.
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
							<th><i class="fa-solid fa-baseball-bat-ball"></i>&nbsp;응원팀</th>
							<td><select name="favteam">
									<option value="두산베어스"
										${dto.favteam == "두산베어스" ? "selected" : ""}>두산베어스</option>
									<option value="한화이글스"
										${dto.favteam == "한화이글스" ? "selected" : ""}>한화이글스</option>
									<option value="KIA타이거즈"
										${dto.favteam == "KIA타이거즈" ? "selected" : ""}>KIA타이거즈</option>
									<option value="키움히어로즈"
										${dto.favteam == "키움히어로즈" ? "selected" : ""}>키움히어로즈</option>
									<option value="KT위즈" ${dto.favteam == "KT위즈" ? "selected" : ""}>KT위즈</option>
									<option value="LG트윈스"
										${dto.favteam == "LG트윈스" ? "selected" : ""}>LG트윈스</option>
									<option value="롯데자이언츠"
										${dto.favteam == "롯데자이언츠" ? "selected" : ""}>롯데자이언츠</option>
									<option value="NC다이노스"
										${dto.favteam == "NC다이노스" ? "selected" : ""}>NC다이노스</option>
									<option value="삼성라이온즈"
										${dto.favteam == "삼성라이온즈" ? "selected" : ""}>삼성라이온즈</option>
									<option value="SSG랜더스"
										${dto.favteam == "SSG랜더스" ? "selected" : ""}>SSG랜더스</option>
							</select></td>
						</tr>
					</table>

					<!-- <button type="submit" onclick="return update();">
						<i class="fa-solid fa-gear"></i>&nbsp;수정완료
					</button> -->
					<div id="passwordContainer"
						style="text-align: center; display: none;">
						<span style="color: #d11a45;"><b><i
								class="fa-solid fa-triangle-exclamation"></i>&nbsp;정보수정은 비밀번호를
								입력해야 합니다.</b></span><br> <input type="password" id="pwd" name="pwd"
							placeholder="비밀번호를 입력해 주세요."
							style="margin-bottom: 15px; font-size: 1.1rem;"> <br>
					</div>
					<button type="button" id="updateBtn">
						<i class="fa-solid fa-gear"></i>&nbsp;수정완료
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
			// 비밀번호 입력 필드를 처음으로 보여줌
			passwordContainer.style.display = "block";
		} else {
			// 비밀번호 입력 후, 검증 절차 수행
			if (update()) {
				document.forms["updateForm"].submit(); // 폼 제출
			}
		}
	});

	function update() {
		const passwordDB = '${dto.pwd}';
		const password = document.getElementById("pwd").value;
		if (passwordDB === password) {
			return true;
		} else {
			alert("비밀번호가 일치하지 않습니다!");
			return false;
		}
	}
</script>
<%@ include file="../temp/footer.jsp"%>
