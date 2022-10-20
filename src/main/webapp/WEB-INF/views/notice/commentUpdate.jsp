<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/commentUpdate.css">
<html>
<head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>게시판</title>
</head>
<body>

	<div id="root">
		<hr class="line">
		<div class="page-header">
			<h3 class="page-name">댓글 수정</h3>
		</div>

		<section class="FormWrap">
			<form name="updateForm" role="form" method="post" class="updateForm"
				action="<%=request.getContextPath()%>/notice/commentUpdate">
				<input type="hidden" name="nId" value="${commentUpdate.nId}" readonly="readonly" />
				<input type="hidden" id="cId" name="cId" value="${commentUpdate.cId}" />
				<div class="modiWrap">
					<input type="text" id="content" name="content" value="${commentUpdate.content}" />
				</div>
				<div class="buttonWrap">
					<button type="submit" class="update_btn">저장</button>
					<a
						href="<%=request.getContextPath()%>/notice/read?nId=${commentUpdate.nId}"
						class="cancle_btn">취소</a>
				</div>
			</form>
		</section>
		<hr class="line">
	</div>

</body>
</html>