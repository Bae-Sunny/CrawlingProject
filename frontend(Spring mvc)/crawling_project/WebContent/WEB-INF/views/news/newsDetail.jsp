<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rPath" value="${pageContext.request.contextPath}/resources"
	scope="application" />
<%@include file="../temp/header.jsp"%>



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

<style>
#container {
	width: 80%;
	text-align: center;
	margin-left: 250px;
	padding-top: 50px;
	/* display: flex; */
	justify-content: center;
	align-items: center;
	margin-bottom: 10%;
}

.titleDiv {
	padding-right: 5%
}

#container img {
	width: 100%;
	height: 600px;
	text-align: center;
	margin-top: 5%
}

.project-info>div {
	text-align: left;
}

.project-info>div>span {
	size: 50%;
	text-align: left;
	padding-top: 3%;
}

#content {
	overflow: auto;
	max-height: 600px;
}

.back-btn {
	background-color: #ffB92e;
	padding: 10px 20px;
	cursor: pointer;
	border-radius: 5px;
	width: 280px;
	border: none;
	color: #ffffff;
	font-size: 1.1rem;
	opacity: 1;
	transition: opacity 0.3s ease;
}

.back-btn:hover {
	background-color: #d8911a;
	color: #f8f8f8;
	cursor: pointer;
	opacity: 0.5;
}
</style>


<!-- Start details-->

<div id="container">
	<div id="single-project">
		<div id="slidingDiv${vo.num}" class="rows-fluid " idx="${vo.num}">

			<div class="span6 titleDiv">
				<div class="project-Divtitle ">
					<h3>${vo.title}</h3>
				</div>
				<img src="${vo.imgn}" />
			</div>
			<div class="span6">
				<div class="project-description">

					<div class="project-info">
						<div>
							<span>작성자</span>${vo.writer}
						</div>
						<div>
							<span>언론사</span>${vo.company}<div id="hNum${vo.num}"></div>
						</div>
						<div>
							<span>작성일</span>${vo.gdate}
						</div>
					</div>
					<p id="content">${vo.content}</p>
				</div>
			</div>
		</div>
	</div>
	<div>
		<button class="back-btn" onclick="goBack()"
			style="text-align: center; margin: 50px;">
			<i class="fa-solid fa-rotate-left" aria-hidden="true"></i> <span
				aria-hidden="true">&nbsp;뉴스 목록으로 돌아가기</span>
		</button>
	</div>
</div>
<script>
	function goBack() {
		window.history.back(); // 브라우저의 이전 페이지로 이동
	}
</script>
<%@include file="../temp/footer.jsp"%>