<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jspf"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/list.css">
<style type="text/css">
#keywordInput {
	border-radius: 0;
	box-shadow: none;
	width: 200px;
	height: 23px;
	outline: none;
	font-weight: 200;
	font-size: 12px;
}
</style>


<body id="body">

	<!-- Main Menu Section -->
	<div class="pageWrap">
		<section class="page-header">
			<div class="content">
				<h1 class="page-name">Notice</h1>
			</div>
		</section>
		<section class="containWrap">
			<div class="container">
				<form role="form" method="get">
					<table class="table">
						<colgroup>
							<col width="100">
							<col width="100">
							<col width="200">
							<col width="180">
							<col width="120">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>작성자</th>
								<th>제목</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="NoticeVO" items="${list}">
								<tr>
									<td><b>${NoticeVO.nId}</b></td>
									<td>${NoticeVO.mId}</td>
									<td><a
										href='<%=request.getContextPath()%>/notice/read?nId=${NoticeVO.nId}'>${NoticeVO.title}</a></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${NoticeVO.regDate}" /></td>
									<td><c:out value="${NoticeVO.hit}"/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<c:if test="${sessionScope.member.mLevel == 2}">
						<div id="write_btn">
							<a class="writeBtn"
								href="<%=request.getContextPath()%>/notice/write">Write</a>
						</div>
					</c:if>
			</div>

			<div class="box-footer">
				<div class="text-center">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li><a
								href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="idx">
							<li <c:out value="${pageMaker.cri.page == idx?'active':''}"/>>
								<a href="list${pageMaker.makeSearch(idx)}" style="float: left;"><b>${idx}</b></a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
						</c:if>

					</ul>

					<form id='actionForm' action="/notice/list" method='get'>
						<input type='hidden' name='pageNum' value='${pageMaker.cri.page}'>
						<input type='hidden' name='amount'value='${pageMaker.cri.perPageNum}'>
					</form>

				</div>
			</div>

			<div class="search">
				<select type="text" name="searchType">
					<option value="n"
						<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
					<option value="t"
						<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
					<option value="c"
						<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
					<option value="w"
						<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
					<option value="tc"
						<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
				</select> <input type="text" name="keyword" id="keywordInput"
					value="${scri.keyword}" />

				<button id="searchBtn">검색</button>


				<script>
					$(function() {
						$('#searchBtn').click(
								function() {
									self.location = "list"
											+ '${pageMaker.makeQuery(1)}'
											+ "&searchType="
											+ $("select option:selected").val()
											+ "&keyword="
											+ encodeURIComponent($(
													'#keywordInput').val());
								});
					});
					
					/* var actionForm = $("#actionForm");

					$(".pagination_button a").on("click", function(e) {

						e.preventDefault();
						actionForm.find("input[name='page']").val($(this).attr("href"));
						actionForm.submit();
					}); */
				</script>

				</form>
			</div>
		</section>
	</div>
	<script>
		var result = '${msg}';

		if (result == 'SUCCESS') {
			alert("처리가 완료되었습니다.");
		}
	</script>
	<%@ include file="../include/footer.jspf"%>