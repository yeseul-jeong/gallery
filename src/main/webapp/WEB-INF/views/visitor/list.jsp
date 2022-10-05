<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jspf"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/visitorList.css">
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
				<h1 class="page-name">Guest Book</h1>
			</div>
		</section>
		
		<!-- <section class="writeWrap">
				<div class="formWrap">
					<form name="writeForm" class="form-group" method="post" enctype="multipart/form-data">
						<table class="contentWriteTable">
							<tbody>
								<tr>
									<div class="contentWrap">
										<textarea class="form-content" name="content" rows="15" placeholder="작성내용"></textarea>
									</div>
								</tr>
								<tr>
								<div class="writeBtnWrap">
									<td>
										<button type="submit" class="writeBtn">등록</button>
									</td>
								</div>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
		</section> -->
	
		<section class="containWrap">
			<div class="container">
				<form role="form" method="get">
					<table class="table">
						<colgroup>
							<col width="80">
							<col width="100">
							<col width="300">
							<col width="200">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>작성자</th>
								<th>내용</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="VisitorVO" items="${list}">
								<tr>
									<td><b>${VisitorVO.vId}</b></td>
									<td>${VisitorVO.mId}</td>
									<td>${VisitorVO.content}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${VisitorVO.regDate}" /></td>
									<td><hr/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

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

					<form id='actionForm' action="/visitor/list" method='get'>
						<input type='hidden' name='pageNum' value='${pageMaker.cri.page}'>
						<input type='hidden' name='amount'value='${pageMaker.cri.perPageNum}'>
					</form>

				</div>
			</div>

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