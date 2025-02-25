<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- temp/pageProcess.jsp --%>
<style>
.pagination {
	display: flex; /* Flexbox를 활용하여 항목들을 일렬로 나열 */
	justify-content: center; /* 중앙 정렬 */
	padding-left: 0; /* 기본 패딩 제거 */
	list-style: none; /* 목록 스타일 제거 */
}

.pagination li {
	margin: 0 5px; /* 좌우 항목 간 간격 조정 */
}

.pagination a {
	text-decoration: none; /* 링크 밑줄 제거 */
	color: #004aad;
	background-color: #fff; /* 배경색 */
	border: 1px solid #dee2e6; /* 테두리 */
	padding: 5px 10px; /* 패딩 */
}

.pagination .active a {
	background-color: #b80c3b; /* 활성 페이지의 배경색 */
	color: #fff; /* 활성 페이지의 글자색 */
	border: none;
}

.pagination .active a:hover {
	background-color: #d11a45;
	color: #f8f8f8;
	cursor: pointer;
}

.pagination .disabled a {
	color: #6c757d; /* 비활성 페이지의 글자색 */
	pointer-events: none; /* 클릭 비활성화 */
	border: none;
}
</style>

<c:set var="pageurl"
	value="?searchType=${searchType}&searchValue=${searchValue}&cPage" />
<tr>
	<th colspan="6" style="text-align: center;">
		<ul class="pagination" style="margin: 0 auto; width: 35%">
			<%-- 이전페이지 
      pagePerBlock=5 비교해서 ${startPage} 즉 5보다 작거나 같다면 존재하지 않는것이고
      아니라면 존재하는 것
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
			<%-- 현재 페이지 startPage, endPage--%>
			<%--nowPage 에 해당이 되지 않으면 링크를 걸어서 페이지 메뉴 선택 제공--%>
			<c:forEach varStatus="i" begin="${startPage}" end="${endPage}">
				<%--현재 페이지면 링크를 해제 , 링크를 지정 --%>
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
			<%-- 다음페이지 --%>
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






