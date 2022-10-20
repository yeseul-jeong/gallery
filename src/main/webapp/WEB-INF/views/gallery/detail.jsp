<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"
	integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/galleryDetail.css">
<script type="text/javascript">
	function getContextPath() {
		var hostIndex = location.href.indexOf(location.host)
				+ location.host.length;
		return location.href.substring(hostIndex, location.href.indexOf('/',
				hostIndex + 1));
	};
	$(document).ready(function() {
		var formObj = $("form[name='readForm']");

		// 수정 
		$("#update").on("click", function() {
			formObj.attr("action", getContextPath() + "/gallery/update");
			formObj.attr("method", "get");
			formObj.submit();
		})

		// 삭제
		$("#delete").on("click", function() {
			formObj.attr("action", getContextPath() + "/gallery/delete");
			//formObj.attr("method", "post");
			formObj.submit();
		})

		// 취소
		$("#list").on("click", function() {

			location.href = getContextPath() + "/gallery/list";
		})

		$(".commentWriteBtn").on("click", function() {
			var formObj = $("form[name='commentForm']");
			formObj.attr("action", "/gallery/commentWrite");
			formObj.submit();
		});
	})
</script>
<style type="text/css">
</style>
<%@ include file="../include/header.jspf"%>
<body id="body">

	<section class="pageWrap">
		<div class="page-header">
			<h3 class="page-name">${galleryOne.aName}|${galleryOne.gName}</h3>
		</div>

		<form name="readForm" role="form" method="post">
			<input type='hidden' id="gId" name="gId" value="${galleryOne.gId}">
		</form>

		<div class="formWrap">
			<div class="galleryImage">
				<img class="galleryImg"
					src="<%=request.getContextPath()%>/gallery/display?fileName=${galleryOne.image}" />
			</div>

			<div class="form-group">
				<div class="artContent">
					<h1 class="artTitle">Description</h1>
					<p class="artDesc">${galleryOne.gDesc}</p>
				</div>
				<div class="artistContent">
					<h1 class="artistTitle"
						style="text-align: left; font-size: 1.5em; margin-left: 20px;">${galleryOne.aName}</h1>
					<p class="artistDesc">${galleryOne.aDesc}</p>
				</div>
			</div>

			<%-- <div class="form-group">
				<label>첨부파일</label>
				<div style="border: 1px solid #dbdbdb;">
					<c:forEach var="file" items="${file}">
						<a href="#" onclick="fn_fileDown('${file.fId}'); return false;" style="text-decoration-line:none; color:#777;">${file.ORG_FILE_NAME}</a> (${file.FILE_SIZE}kb)<br>
					</c:forEach>
				</div>
				</div> --%>
		</div>


		<div class="box-footer">
			<c:if test="${sessionScope.member.mLevel == '2'}">
				<button type="submit" class="listBtn" id="update"
					style="cursor: pointer">수정</button>
				<button type="submit" class="listBtn" id="delete"
					style="cursor: pointer">삭제</button>
			</c:if>
			<button type="submit" class="listBtn" id="list"
				style="cursor: pointer">목록</button>
		</div>

	</section>
</body>

<%@ include file="../include/footer.jspf"%>