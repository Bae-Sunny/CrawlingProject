<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="../temp/header.jsp"%>
<style>/* membership-login css */
.login_menu .lm_left, .login_menu .lm_right {
	flex: 1;
	text-align: center;
}

.login_menu .lm_left img, .login_menu .lm_right form {
	max-width: 100%;
	height: auto;
	object-fit: cover;
}

.login_menu .lm_right h2 {
	width: 80px;
	margin: auto;
}

.login_menu .lm_right h3 {
	font-size: 30px;
	font-weight: 500;
	margin-top: 20px;
	margin-bottom: 10px;
}

.login_menu .lm_right .input-group input, .login_menu .lm_right button {
	margin-bottom: 15px;
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #ccc;
	width: 50%;
	font-size: 1.1rem;
	opacity: 1;
    transition: opacity 0.3s ease;
}

.login_menu .lm_right button {
	background-color: #004aad;
	color: #ffffff;
	border: none;
	cursor: pointer;
	width: 150px;
	opacity: 1;
    transition: opacity 0.3s ease;
}

.login_menu .lm_right button:hover {
	background-color: #005bcc;
	color: #f8f8f8;
	cursor: pointer;
	opacity: 0.5;
}
</style>
<section id="membership">
	<div class="login_menu">
		<div class="container">
			<div class="row">
				<div class="lm_left">
					<img src="resources/img/field.png" alt="field">
				</div>
				<div class="lm_right">
					<form class="login_form" method="post" action="loginProcess"
						id="loginInfo">
						<h2>
							<img src="resources/img/logo.png" alt="bat">
						</h2>
						<h3>로그인</h3>
						<div class="input-group">
							<input type="text" id="id" name="id" placeholder="ID" required>
						</div>
						<div class="input-group">
							<input type="password" id="pwd" name="pwd" placeholder="Password"
								required>
						</div>
						<button type="submit">
							<i class="fa-solid fa-lock"></i>&nbsp;로그인
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
	<hr>
	<div class="signup_menu">
		<h2>
			<img src="resources/img/logo111.png" alt="baseball"
				style="width: 80px; margin: auto;">
		</h2>
		<h3>
			아직 회원이 아니라면 지금 가입하세요!
			<button onclick="location='signup'">
				<i class="fa-solid fa-user"></i>&nbsp;회원가입
			</button>
		</h3>
	</div>
</section>
<%@include file="../temp/footer.jsp"%>