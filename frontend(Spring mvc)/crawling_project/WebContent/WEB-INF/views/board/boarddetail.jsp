<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="../temp/header.jsp"%>
<!-- �����Խ��� �󼼺��� -->
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
					<em>�����Խ��� �󼼺���</em>
				</h2>
				<form method="post" action="boardedetail"
					class="cheerboard_detailform">
					<table>
						<tr>
							<th>��ȣ</th>
							<td>${vo.num}</td>
						</tr>
						<tr>
							<th>����</th>
							<td><span style="color: #005bcc;"><b>[${vo.favteam}]</b></span>&nbsp;${vo.title}</td>
						</tr>
						<tr>
							<th>�ۼ���</th>
							<td>${vo.writer}</td>
						</tr>
						<tr>
							<th>��ȸ��</th>
							<td>${vo.hit}</td>
						</tr>
						<tr>
							<th>�ۼ�����</th>
							<td>${vo.rdate}</td>
						</tr>
						<tr>
							<th>�۳���</th>
							<td><textarea readonly style="font-size: 1.1rem;">${vo.content}</textarea></td>
						</tr>
					</table>
					<%-- �α��� �� --%>
					<c:choose>
						<c:when test="${sessionScope.sessionID == null }">
							<div
								style="text-align: center; font-size: 1.1rem; margin-top: 20px; margin-bottom: 20px;">
								<button type="button" class="list-button"
									onclick="location='boardlist'">
									<i class="fa-solid fa-bars"></i>&nbsp;���
								</button>
								<br> <span style="color: #d11a45;"><b><i
										class="fa-solid fa-triangle-exclamation"></i>&nbsp;������/����� �α���
										�� �ۼ��� �� �ֽ��ϴ�.</b></span><br>

								<p style="line-height: 1.5;">
									<a href="login"><i class="fa-solid fa-rotate-left"></i>&nbsp;�α���
										ȭ������ �̵�</a>
								</p>
							</div>
						</c:when>
						<c:when test="${sessionScope.sessionID != null }">
							<%-- �α��� �� --%>
							<div
								style="text-align: center; margin-top: 20px; margin-bottom: 20px;">
								<button type="button" class="update-button"
									onclick="location='boardupdate?num=${vo.num}'">
									<i class="fa-solid fa-pen"></i>&nbsp;����
								</button>
								<button type="button" class="list-button"
									onclick="location='boardlist'">
									<i class="fa-solid fa-bars"></i>&nbsp;���
								</button>
								<button type="button" class="delete-button"
									onclick="location='boarddelete?num=${vo.num}'">
									<i class="fa-solid fa-trash"></i>&nbsp;����
								</button>
							</div>
				</form>
				<%-- ��� ���� ���� --%>
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
											style="margin-right: 10px;">�ۼ���</label> <input type="text"
											name="uwriter" id="uwriter" value="${sessionID}" />
										<textarea name="ucontent" class="form-control" id="ucontent"
											rows="3"></textarea>
									</div>
									<div class="mt-2 col-sm-10 d-flex justify-content-end">
										<button type="submit" id="btn1" class="btn btn-info">
											<i class="fa-solid fa-comments"></i>&nbsp;��۵��
										</button>
									</div>
									</c:when>
									</c:choose>
									<div class="col-sm-10" style="margin-top: 20px;">
										<table class="table">
											<thead style="background-color: #f2f2f2;">
												<tr>
													<td>��ȣ</td>
													<td>�ۼ���</td>
													<td style="width: 50%;">��۳���</td>
													<td>�ۼ�����</td>
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
				<%-- ��� ���� �� --%>
			</div>
		</div>
	</div>
</section>
<%@include file="../temp/footer.jsp"%>
