<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/commentDelete.css">
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>게시판</title>
	</head>
	<body>
	
		<div id="root">
			<hr class="line">
			<div class="page-header">
				<h3 class="page-name">댓글 삭제</h3>
			</div>
			
			<section id="container">
				<form name="updateForm" class="updateForm" role="form" method="post" action="<%=request.getContextPath()%>/notice/commentDelete">
					<input type="hidden" name="nId" value="${commentDelete.nId}" readonly="readonly"/>
					<input type="hidden" id="cId" name="cId" value="${commentDelete.cId}" />
						
					<div class="buttonWrap">
						<p>삭제 하시겠습니까?</p>
						<button type="submit" class="delete_btn">예</button>
						<a href="<%=request.getContextPath()%>/notice/read?nId=${commentDelete.nId}" class="cancel_btn">아니오</a>
					</div>
				</form>
			</section>
			<hr class="line">
		</div>
	</body>
</html>