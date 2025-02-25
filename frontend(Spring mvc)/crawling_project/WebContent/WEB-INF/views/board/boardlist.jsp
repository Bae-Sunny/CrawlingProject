<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="../temp/header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- �����Խ��� --%>
<style>
.label-group {
	display: flex;
	align-items: center;
	flex-wrap: wrap;
	gap: 10px;
	background-color: #f7f7f7;
	margin-top: 20px;
	padding: 20px;
	border-radius: 8px;
	font-size: 1.1rem;
}

.label-group .label-item {
	flex-grow: 1; /* ��� ������ ������ ä�쵵�� �� */
}

.label-group form {
	flex-grow: 2; /* �˻� ���� �� �� ���� ������ �����ϵ��� ���� */
	margin-left: 600px;
}

#cheerboard {
	margin-right: 10px;
	font-size: 1.1rem;
	border-radius: 4px;
	left: 30px;
}

.write-button {
	background-color: #004aad;
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

.write-button:hover {
	background-color: #005bcc;
	color: #f8f8f8;
	cursor: pointer;
	opacity: 0.5;
}

.search-button {
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

.search-button:hover {
	background-color: #333333;
	color: #f8f8f8;
	opacity: 0.5;
}
</style>
<section id="cheerboard">
	<div class="cheerboard_list">
		<div class="container">
			<div class="row">
				<h2>
					<em>�����Խ���</em>
				</h2>
				<div class="label-group">
					<%-- �˻����� --%>
					<%-- ������ ����Ʈ �𵨷� ��û�� ������. --%>
					<form class="d-flex" method="post" action="boardlist">
						<select class="form-control btn-mini" name="searchType"
							id="searchType"
							style="width: 14%; margin-right: 13px; font-size: 1.1rem;">
							<option value="">�˻�</option>
							<option value="1">����</option>
							<option value="2">�̸�</option>
							<option value="3">����</option>
						</select> <input class="form-control me-2" type="text"
							placeholder="Search.." name="searchValue" id="searchValue"
							style="width: 300px; margin-right: 13px; font-size: 1.1rem;">
						<button class="search-button" type="submit">
							<i class="fa-solid fa-magnifying-glass"></i>&nbsp;�˻�
						</button>
					</form>
					<%-- //�˻����� --%>
				</div>
				<table>
					<thead>
						<tr>
							<th>��ȣ</th>
							<th class="title" style="width: 50%;" colspan="2">����</th>
							<th>�ۼ���</th>
							<th>��ȸ��</th>
							<th>�ۼ�����</th>
						</tr>
					</thead>
					<tbody>
						<%-- �ݺ�����  --%>
						<c:forEach var="e" items="${list}">
							<tr>
								<td>${e.row_num}</td>
								<td colspan="2"><a href="boarddetail?num=${e.num}"><span
										style="color: #005bcc;"><b>[${e.favteam}]</b></span>&nbsp;${e.title}<span
										style="color: #d11a45;">&nbsp;[${e.cnt}]</span></a></td>
								<td>${e.writer}</td>
								<td>${e.hit}</td>
								<td>${e.rdate}</td>
							</tr>
						</c:forEach>
						<%-- �ݺ� �� --%>
					</tbody>
					<%@include file="../temp/pageProcess.jsp"%>
				</table>
				<%-- �α��� �� --%>
				<c:choose>
					<c:when test="${sessionScope.sessionID == null }">
						<div
							style="text-align: center; font-size: 1.1rem; margin-top: 20px; margin-bottom: 20px;">
							<span style="color: #d11a45;"><b><i
									class="fa-solid fa-triangle-exclamation"></i>&nbsp;������/����� �α��� ��
									�ۼ��� �� �ֽ��ϴ�.</b></span><br>
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
							<button type="button" class="write-button"
								onclick="location='boardwrite'">
								<i class="fa-solid fa-pen-to-square"></i>&nbsp;�۾���
							</button>
						</div>
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>
</section>
<%@include file="../temp/footer.jsp"%>
