<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"
	integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/read.css">
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
			formObj.attr("action", getContextPath() + "/notice/update");
			formObj.attr("method", "get");
			formObj.submit();
		})

		// 삭제
		$("#delete").on("click", function() {
			formObj.attr("action", getContextPath() + "/notice/delete");
			//formObj.attr("method", "post");
			formObj.submit();
		})

		// 취소
		$("#list").on("click", function() {

			location.href = getContextPath() + "/notice/list";
		})
	})
	
	function fn_fileDown(fileNo){
			var formObj = $("form[name='readForm']");
			$("#fId").attr("value", fileNo);
			formObj.attr("action", getContextPath()+ "/notice/fileDown");
			formObj.submit();
		}
	
</script>
<%@ include file="../include/header.jspf"%>
<body id="body">

	<section class="pageWrap">
				<div class="page-header">
					<h3 class="page-name">READ</h3>
				</div>
				<form name="readForm" role="form" method="post">
					<input type='hidden' id="nId" name="nId" value="${NoticeVO.nId}">
					<input type="hidden" id="fId" name="fId" value=""> 						
				</form>
				
				<div class="formWrap">
				<div class="form-group">
					<label for="mId">작성자</label></br>
					<input type="text" name='mId'
						class="form-control" value="${NoticeVO.mId}"
						readonly="readonly">
				</div>

				<div class="form-group">
					<label for="title">제목</label> </br>
					<input type="text" name='title'
						class="form-control" value="${NoticeVO.title}"
						readonly="readonly">
				</div>

				<div class="form-group">
					<label for="content">내용</label></br>
					<%-- <input type="text" class="form-content" name="content" rows="7"
						value="${NoticeVO.content}" readonly="readonly"> --%>
						<textarea class="form-content" name="content" rows="7"
						readonly="readonly">${NoticeVO.content}</textarea>
				</div>
				
				<div class="form-group">
				<label>첨부파일</label>
				<div style="border: 1px solid #dbdbdb;">
					<c:forEach var="file" items="${file}">
						<a href="#" onclick="fn_fileDown('${file.fId}'); return false;" style="text-decoration-line:none; color:#777;">${file.ORG_FILE_NAME}</a> (${file.FILE_SIZE}kb)<br>
					</c:forEach>
				</div>
				</div>
				</div>
				
				<div class="box-footer">
				<c:if test = "${sessionScope.member.mId == NoticeVO.mId || sessionScope.member.mLevel == '2'}">
					<button type="submit" class="listBtn" id="update" style="cursor:pointer">수정</button>
					<button type="submit" class="listBtn" id="delete" style="cursor:pointer">삭제</button>
				</c:if>	
					<button type="submit" class="listBtn" id="list" style="cursor:pointer">목록</button>
				</div>
				
	</section>
</body>

<%@ include file="../include/footer.jspf"%>