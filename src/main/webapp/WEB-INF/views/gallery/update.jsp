<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@page import="java.text.DecimalFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/galleryUpdate.css">
<!DOCTYPE html>
<html>
<head>
<style>
#updateProductForm {
	margin-top: -90px;
	margin-left: -30px;
	padding: 0px;
}
</style>
</head>
<body id="body">
<%@ include file="../include/header.jspf"%>

<c:if test="${not empty galleryOne}">
	<section class="pageWrap">
		
		<div class="page-header">
			<h3 class="page-name">Update | ${galleryOne.gName}</h3>
		</div>
				
		<div class="modyThumbWrap">
			<div class='modyThumbnail'>
				<img src='<%=request.getContextPath()%>/gallery/display?fileName=${galleryOne.thumbnail}' alt='' />
			</div>
		</div>


		<div class="updateFromWrap">
			<form id="updateForm" role="form" method="post">
				<div class="form-group">
					<span>작품번호</span> </br>
					<input type="text" class="form-control" name="gId" id="gId" value="${galleryOne.gId}" readonly/>
				</div>
				<div class="form-group">
					<span>작가코드 </span>  <span style="font-size:0.8em; color:#777;">1:정예슬 &nbsp; 2:Olivia Dean &nbsp;</span></br>
					<input type="text" class="form-control" name="aId" id="aId" value="${galleryOne.aId}">
				</div>
				<div class="form-group">
					<span>작품명*</span> </br>
					<input type="text" class="form-control" name="gName" id="gName" value="${galleryOne.gName}">
				</div>
				<div class="form-group">
					<span>작품설명</span></br>
					<input type="text" class="form-control" name="gDesc" id="gDesc" value="${galleryOne.gDesc}">
				</div>
				<button type="submit" class="listBtn" id="updateBtn">수정</button>
				<button type="button" class="listBtn" id="list"><a href='<%=request.getContextPath()%>/gallery/detail?gId=${galleryOne.gId}'>뒤로가기</a></button>
			</form>
		</div>
		
	</section>

</c:if>

<%@ include file="../include/footer.jspf"%>