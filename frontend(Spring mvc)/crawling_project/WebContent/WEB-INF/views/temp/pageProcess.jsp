<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- temp/pageProcess.jsp --%>
<style>
.pagination {
	display: flex; /* Flexbox�� Ȱ���Ͽ� �׸���� �Ϸķ� ���� */
	justify-content: center; /* �߾� ���� */
	padding-left: 0; /* �⺻ �е� ���� */
	list-style: none; /* ��� ��Ÿ�� ���� */
}

.pagination li {
	margin: 0 5px; /* �¿� �׸� �� ���� ���� */
}

.pagination a {
	text-decoration: none; /* ��ũ ���� ���� */
	color: #004aad;
	background-color: #fff; /* ���� */
	border: 1px solid #dee2e6; /* �׵θ� */
	padding: 5px 10px; /* �е� */
}

.pagination .active a {
	background-color: #b80c3b; /* Ȱ�� �������� ���� */
	color: #fff; /* Ȱ�� �������� ���ڻ� */
	border: none;
}

.pagination .active a:hover {
	background-color: #d11a45;
	color: #f8f8f8;
	cursor: pointer;
}

.pagination .disabled a {
	color: #6c757d; /* ��Ȱ�� �������� ���ڻ� */
	pointer-events: none; /* Ŭ�� ��Ȱ��ȭ */
	border: none;
}
</style>

<c:set var="pageurl"
	value="?searchType=${searchType}&searchValue=${searchValue}&cPage" />
<tr>
	<th colspan="6" style="text-align: center;">
		<ul class="pagination" style="margin: 0 auto; width: 35%">
			<%-- ���������� 
      pagePerBlock=5 ���ؼ� ${startPage} �� 5���� �۰ų� ���ٸ� �������� �ʴ°��̰�
      �ƴ϶�� �����ϴ� ��
      --%>
			<c:choose>
				<c:when test="${startPage <= page.pagePerBlock}">
					<li class="page-item disabled"><a class="page-link" href="#"><i class="fa-solid fa-backward"></i>&nbsp;Previous</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item active"><a class="page-link"
						href="${pageurl}=${startPage - 1}"><i class="fa-solid fa-backward"></i>&nbsp;Previous</a></li>
				</c:otherwise>
			</c:choose>
			<%-- ���� ������ startPage, endPage--%>
			<%--nowPage �� �ش��� ���� ������ ��ũ�� �ɾ ������ �޴� ���� ����--%>
			<c:forEach varStatus="i" begin="${startPage}" end="${endPage}">
				<%--���� �������� ��ũ�� ���� , ��ũ�� ���� --%>
				<c:choose>
					<c:when test="${i.index == page.nowPage}">
						<li class="page-item active"><a class="page-link" href="#">${i.index }</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="${pageurl}=${i.index }">${i.index }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<%-- ���������� --%>
			<c:choose>
				<c:when test="${endPage >= page.totalPage }">
					<li class="page-item disabled"><a class="page-link" href="#">Next&nbsp;<i class="fa-solid fa-forward"></i></a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item active"><a
						href="${pageurl }=${endPage + 1 }" class="page-link">Next&nbsp;<i class="fa-solid fa-forward"></i></a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</th>
</tr>






