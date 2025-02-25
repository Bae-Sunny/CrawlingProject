<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="../temp/header.jsp"%>
<!-- �����Խ��� �۾��� -->
<style>
table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
	font-size: 1.1rem;
}

th {
	background-color: #f2f2f2;
	width: 20%;
	text-align: center;
}

select, option {
	font-size: 1.1rem;
}

textarea, input[type="text"] {
	border: 1px solid #ddd;
	resize: none;
	width: 100%;
	font-size: 1.1rem;
}

textarea {
	background-color: #f8f9fa;
	color: #000;
	height: 100px;
	font-size: 1.1rem;
}

.list-button {
	background-color: #ffB92e;
	padding: 10px 20px;
	cursor: pointer;
	border-radius: 5px;
	width: 200px;
	border: none;
	color: #ffffff;
	font-size: 1.1rem;
	opacity: 1;
    transition: opacity 0.3s ease;
}

.list-button:hover {
	background-color: #ffc83c;
	color: #f8f8f8;
	cursor: pointer;
	opacity: 0.5;
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
</style>
<section id="cheerboard">
	<div class="cheerboard_write">
		<div class="container">
			<div class="row">
				<h2>
					<em>�����Խ��� �۾���</em>
				</h2>
				<form method="post" action="addboard" autocomplete="off"
					class="cheerboard_writeform">
					<table>
						<tr>
							<th>����</th>
							<td><select name="favteam" required style="width: 14%; margin-right: 13px;">
									<option value="�λ꺣�">�λ꺣�</option>
									<option value="��ȭ�̱۽�">��ȭ�̱۽�</option>
									<option value="KIAŸ�̰���">KIAŸ�̰���</option>
									<option value="Ű���������">Ű���������</option>
									<option value="KT����">KT����</option>
									<option value="LGƮ����">LGƮ����</option>
									<option value="�Ե����̾���">�Ե����̾���</option>
									<option value="NC���̳뽺">NC���̳뽺</option>
									<option value="�Ｚ���̿���">�Ｚ���̿���</option>
									<option value="SSG������">SSG������</option>
							</select> <input type="text" name="title" required style="width: 84%;"></td>
						</tr>
						<tr>
							<th>�ۼ���</th>
							<td><input type="text" name="writer" required></td>
						</tr>
						<tr>
							<th>�۳���</th>
							<td><textarea name="content" required></textarea></td>
						</tr>
					</table>
					<div
						style="text-align: center; margin-top: 20px; margin-bottom: 20px;">
						<button type="submit" class="write-button">
							<i class="fa-solid fa-floppy-disk"></i>&nbsp;����/�۾���
						</button>
						<button type="button" class="list-button"
							onclick="location='boardlist'">
							<i class="fa-solid fa-rotate-left"></i>&nbsp;������� ���ư���
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

<%@include file="../temp/footer.jsp"%>
