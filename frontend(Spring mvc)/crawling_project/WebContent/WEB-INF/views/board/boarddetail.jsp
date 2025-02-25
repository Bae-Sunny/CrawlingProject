<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="../temp/header.jsp"%>
<!-- 응원게시판 상세보기 -->
<style>
#cheerboard {
	margin-bottom: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
	width: 20%;
	text-align: center;
}

textarea {
	border: none;
	resize: none;
	background-color: #f8f9fa;
	color: #000;
	width: 100%;
	height: 100px;
}

.update-button {
	background-color: #004aad;
	padding: 10px 20px;
	cursor: pointer;
	border-radius: 5px;
	width: 150px;
	border: none;
	color: #ffffff;
	font-size: 1.1rem;
	padding: 10px 20px;
	cursor: pointer;
	border-radius: 5px;
	width: 150px;
	border: none;
	color: #ffffff;
	opacity: 1;
	transition: opacity 0.3s ease;
}

.update-button:hover {
	background-color: #005bcc;
	color: #f8f8f8;
	cursor: pointer;
	opacity: 0.5;
}

.list-button {
	background-color: #ffB92e;
	padding: 10px 20px;
	cursor: pointer;
	border-radius: 5px;
	width: 150px;
	border: none;
	color: #ffffff;
	font-size: 1.1rem;
	opacity: 1;
	transition: opacity 0.3s ease;
}

.list-button:hover {
	background-color: #d8911a;
	color: #f8f8f8;
	cursor: pointer;
	opacity: 0.5;
}

.delete-button {
	background-color: #b80c3b;
	padding: 10px 20px;
	cursor: pointer;
	border-radius: 5px;
	width: 150px;
	border: none;
	color: #ffffff;
	font-size: 1.1rem;
	opacity: 1;
	transition: opacity 0.3s ease;
}

.delete-button:hover {
	background-color: #d11a45;
	color: #f8f8f8;
	cursor: pointer;
	opacity: 0.5;
}

#btn1 {
	background-color: #000000;
	padding: 10px 20px;
	cursor: pointer;
	border-radius: 5px;
	width: 150px;
	border: none;
	color: #ffffff;
	font-size: 1.1rem;
	opacity: 1;
	transition: opacity 0.3s ease;
}

#btn1:hover {
	background-color: #333333;
	color: #f8f8f8;
	opacity: 0.5;
}

#uwriter, #ucontent {
	margin-top: 10px;
	font-size: 1.1rem;
}
</style>
<section id="cheerboard">
	<div class="cheerboard_detail">
		<div class="container">
			<div class="row">
				<h2>
					<em>응원게시판 상세보기</em>
				</h2>
				<form method="post" action="boardedetail"
					class="cheerboard_detailform">
					<table>
						<tr>
							<th>번호</th>
							<td>${vo.num}</td>
						</tr>
						<tr>
							<th>제목</th>
							<td><span style="color: #005bcc;"><b>[${vo.favteam}]</b></span>&nbsp;${vo.title}</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>${vo.writer}</td>
						</tr>
						<tr>
							<th>조회수</th>
							<td>${vo.hit}</td>
						</tr>
						<tr>
							<th>작성일자</th>
							<td>${vo.rdate}</td>
						</tr>
						<tr>
							<th>글내용</th>
							<td><textarea readonly style="font-size: 1.1rem;">${vo.content}</textarea></td>
						</tr>
					</table>
					<%-- 로그인 전 --%>
					<c:choose>
						<c:when test="${sessionScope.sessionID == null }">
							<div
								style="text-align: center; font-size: 1.1rem; margin-top: 20px; margin-bottom: 20px;">
								<button type="button" class="list-button"
									onclick="location='boardlist'">
									<i class="fa-solid fa-bars"></i>&nbsp;목록
								</button>
								<br> <span style="color: #d11a45;"><b><i
										class="fa-solid fa-triangle-exclamation"></i>&nbsp;응원글/댓글은 로그인
										후 작성할 수 있습니다.</b></span><br>

								<p style="line-height: 1.5;">
									<a href="login"><i class="fa-solid fa-rotate-left"></i>&nbsp;로그인
										화면으로 이동</a>
								</p>
							</div>
						</c:when>
						<c:when test="${sessionScope.sessionID != null }">
							<%-- 로그인 후 --%>
							<div
								style="text-align: center; margin-top: 20px; margin-bottom: 20px;">
								<button type="button" class="update-button"
									onclick="location='boardupdate?num=${vo.num}'">
									<i class="fa-solid fa-pen"></i>&nbsp;수정
								</button>
								<button type="button" class="list-button"
									onclick="location='boardlist'">
									<i class="fa-solid fa-bars"></i>&nbsp;목록
								</button>
								<button type="button" class="delete-button"
									onclick="location='boarddelete?num=${vo.num}'">
									<i class="fa-solid fa-trash"></i>&nbsp;삭제
								</button>
							</div>
				</form>
				<%-- 댓글 영역 시작 --%>
				<div class="card mb-4" style="font-size: 1.1rem;">
					<div class="card-body">
						<fieldset>
							<form method="post" action="bcominsert">
								<input type="hidden" name="reip"
									value="<%=request.getRemoteAddr()%>"> <input
									type="hidden" name="ucode" value="${vo.num}">
								<div class="row mb-3">
									<div class="col-sm-10">
										<label class="col-sm-2 col-form-label"
											style="margin-right: 10px;">작성자</label> <input type="text"
											name="uwriter" id="uwriter" value="${sessionID}" />
										<textarea name="ucontent" class="form-control" id="ucontent"
											rows="3"></textarea>
									</div>
									<div class="mt-2 col-sm-10 d-flex justify-content-end">
										<button type="submit" id="btn1" class="btn btn-info">
											<i class="fa-solid fa-comments"></i>&nbsp;댓글등록
										</button>
									</div>
									</c:when>
									</c:choose>
									<div class="col-sm-10" style="margin-top: 20px;">
										<table class="table">
											<thead style="background-color: #f2f2f2;">
												<tr>
													<td>번호</td>
													<td>작성자</td>
													<td style="width: 50%;">댓글내용</td>
													<td>작성일자</td>
												</tr>
											</thead>
											<tbody id="comm">
												<c:forEach var="e" items="${listcomm}">
													<tr>
														<td>${e.num}</td>
														<td>${e.uwriter}</td>
														<td>${e.ucontent}</td>
														<td>${e.uregdate}</td>
													</tr>
												</c:forEach>
											</tbody>
											<%-- <%@include file="../temp/pageProcess.jsp"%> --%>
										</table>
									</div>
								</div>
							</form>
						</fieldset>
					</div>
				</div>
				<%-- 댓글 영역 끝 --%>
			</div>
		</div>
	</div>
</section>
<%@include file="../temp/footer.jsp"%>
