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
					<h3>회원가입</h3>
					<form method="post" action="memberIn" class="signupform">
						<table>
							<tr>
								<td>아이디*</td>
								<td><input type="text" name="id" id="id" maxlength="10"
									style="width: 68%;" class="inputEng">&nbsp;<input
									type="button" value="ID 중복확인" id="idChkBtn"></td>
							</tr>
							<tr>
								<td colspan="2" id="target"></td>
							</tr>
							<tr>
								<td>비밀번호*</td>
								<td><input type="password" name="pwd" id="pwd"
									maxlength="10"></td>
							</tr>
							<tr>
								<td>이름*</td>
								<td><input type="text" id="name" name="name"></td>
							</tr>
							<tr>
								<td>이메일*</td>
								<td><input type="email" id="email" name="email"
									class="inputEmail"></td>
							</tr>
							<tr>
								<td>연락처*</td>
								<td><input type="text" id="tel" name="tel" class="inputNum"></td>
							</tr>
							<tr>
								<td>성별*</td>
								<td style="text-align: left; padding-left: 20px;"><input
									type="radio" id="male" name="gender" value="male"> <label
									for="male">남성</label> <input type="radio" id="female"
									name="gender" value="female"> <label for="female">여성</label></td>
							</tr>
							<%-- 배열타입의 파라미터 처리하기 --%>
							<tr>
								<td class="nowrap">응원팀*</td>
								<td class="team-checkboxes"><label><input
										type="radio" name="favteam" value="두산베어스"><img
										src="resources/img/DOOSANBEARS.svg" alt="doosan"
										class="team-logo">두산베어스</label> <label><input
										type="radio" name="favteam" value="한화이글스"><img
										src="resources/img/HANWHAEAGLES.svg" alt="한화이글스"
										class="team-logo">한화이글스</label> <label><input
										type="radio" name="favteam" value="KIA타이거즈"><img
										src="resources/img/KIATIGERS.svg" alt="kia" class="team-logo">KIA타이거즈</label>
									<label><input type="radio" name="favteam"
										value="키움히어로즈"><img
										src="resources/img/KIWOOMHEROES.svg" alt="kiwoom"
										class="team-logo">키움히어로즈</label> <label><input
										type="radio" name="favteam" value="KT위즈"><img
										src="resources/img/KTWIZ.svg" alt="kt" class="team-logo">KT위즈</label>
									<label><input type="radio" name="favteam" value="LG트윈스"><img
										src="resources/img/LGTWINS.svg" alt="lg" class="team-logo">LG트윈스</label>
									<label><input type="radio" name="favteam"
										value="롯데자이언츠"><img
										src="resources/img/LOTTEGIANTS.svg" alt="lotte"
										class="team-logo">롯데자이언츠</label> <label><input
										type="radio" name="favteam" value="NC다이노스"><img
										src="resources/img/NCDINOS.svg" alt="nc" class="team-logo">NC다이노스</label>
									<label><input type="radio" name="favteam"
										value="삼성라이온즈"><img
										src="resources/img/SAMSUNGLIONS.svg" alt="samsung"
										class="team-logo">삼성라이온즈</label> <label><input
										type="radio" name="favteam" value="SSG랜더스"><img
										src="resources/img/SSGLADERS.svg" alt="ssg" class="team-logo">SSG랜더스</label>
								</td>
							</tr>
						</table>
						<button type="submit">
							<i class="fa-solid fa-user"></i>&nbsp;회원가입
						</button>
						<p style="font-size: 1.1rem; line-height: 1.5;">
							<a href="main"><i class="fa-solid fa-rotate-left"></i>&nbsp;메인화면으로
								돌아가기</a>
						</p>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<%-- id 중복 체크 자바스크립트 함수 --%>
<script>
	//window가 시작어서 로딩 될 때 감지하는 함수 
	window.onload = function() {
		// 버튼 클릭 했을 때 이벤트를 감지하는 함수 정의하기 
		document.querySelector("#idChkBtn").onclick = function(e) {
			/* alert("Test Clicked!"); */
			// 폼전송을 막는 기능 
			e.preventDefault();
			let param = "id=" + document.getElementById("id").value;
			// Ajax함수로 서버측 경로와 파라미터등을 매개변수로 전달해서 호출함 
			sendRequest("idcheck", param, res, "get");
		};
		// callback 함수 정의
		function res() {
			if (xhr.readyState === 4) {
				if (xhr.status === 200) {
					// 응답 결과 출력 해보기  -> 0, 1 즉 서버의 값 콘솔에 출력
					console.log(xhr.responseText);
					let idCnt = parseInt(xhr.responseText);
					let msg = "";
					if (idCnt === 0) {
						msg = "사용가능한 아이디 입니다.";
						document.getElementById("target").style.backgroundColor = "orange";
					} else {
						msg = "사용중인 아이디 입니다.";
						document.getElementById("target").style.backgroundColor = "red";
						document.getElementById("target").style.color = "white";
					}
					document.getElementById("target").innerHTML = msg;
				} else {
					// 에러 처리
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
			tmpElement.value = tmpValue.replace(/[^ a-z A-Z 0-9 \.]/g, ''); // A~Z, a~z, 0~9까지까지만 입력 가능하도록 제한함			
		}); //keyup
	});//ready

	$(document).ready(function() {
		$(".inputNum").keyup(function() {
			let tmpElement = event.target;
			let tmpValue = tmpElement.value;
			tmpElement.value = tmpValue.replace(/[^ 0-9 - \.]/g, ''); // 0~9까지, -만 입력 가능하도록 제한함			
		}); //keyup
	});//ready

	$(document).ready(function() {
		$(".inputEmail").keyup(function() {
			let tmpElement = event.target;
			let tmpValue = tmpElement.value;
			tmpElement.value = tmpValue.replace(/[^ a-z A-Z 0-9 @ \.]/g, ''); // A~Z, a~z, 0~9까지, @만 입력 가능하도록 제한함			
		}); //keyup
	});//ready
</script>
<%@include file="../temp/footer.jsp"%>