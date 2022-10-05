<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"
	integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/update.css">
<script type="text/javascript">
	function getContextPath() {
		var hostIndex = location.href.indexOf(location.host)
				+ location.host.length;
		return location.href.substring(hostIndex, location.href.indexOf('/',
				hostIndex + 1));
	};

	$(document).ready(function() {
		var formObj = $("form[name='updateForm']");

		$(document).on("click", "#fileDel", function() {
			$(this).parent().remove();
		})

		fn_addFile();

	})

	/* $(document).ready(function() {
		fn_addFile();
	}) */

	$(document).ready(function() {

		$("#cancel").on("click", function() {
			event.preventDefault();
			location.href = getContextPath() + "/notice/list";
		})
	})

	function fn_addFile() {
		var fileIndex = 1;
		//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
		$("#fileAdd_btn")
				.on(
						"click",
						function() {
							$("#fileIndex")
									.append(
											"<div class='upload-file'><input type='file' style='float:left;' name='file_"
													+ (fileIndex++)
													+ "'>"
													+ "</button>"
													+ "<button type='button' style='float:right;' id='fileDelBtn'>"
													+ "삭제" + "</button></div>");
						});
		$(document).on("click", "#fileDelBtn", function() {
			$(this).parent().remove();

		});
	}

	var fileNoArry = new Array();
	var fileNameArry = new Array();

	function fn_del(value, name) {

		fileNoArry.push(value);
		fileNameArry.push(name);
		$("#fileNoDel").attr("value", fileNoArry);
		$("#fileNameDel").attr("value", fileNameArry);
	}
</script>
<%@ include file="../include/header.jspf"%>

<body id="body">

	<section class="pageWrap">
		<div class="page-header">
			<h3 class="page-name">MODIFY</h3>
		</div>
		<div class="table-responsive">
			<form name="updateForm" role="form" method="post"
				action="<%=request.getContextPath()%>/notice/update"
				enctype="multipart/form-data">
				<input type="hidden" id="fileNoDel" name="fileNoDel[]" value="">
				<input type="hidden" id="fileNameDel" name="fileNameDel[]" value="">

				<table>
					<tbody>
						<tr>
							<div class="form-group">
								<label for="nId">No</label> <input type="text" name='cNo'
									class="form-control" value="${NoticeVO.nId}"
									readonly="readonly">
							</div>
						</tr>

						<tr>
							<div class="form-group">
								<label for="mId">작성자</label></br> <input type="text" name='mId'
									class="form-control" value="${NoticeVO.mId}"
									readonly="readonly">
							</div>
						</tr>

						<tr>
							<div class="form-group">
								<label for="title">제목</label> </br> <input type="text" name='title'
									class="form-control" value="${NoticeVO.title}"
									readonly="readonly">
							</div>
						</tr>

						<tr>
							<div class="form-group">
								<label for="content">내용</label></br>
								<textarea class="form-content" name="content" rows="7">${NoticeVO.content}</textarea>
							</div>
						</tr>

						<tr>
							<td id="fileIndex"><c:forEach var="file" items="${file}" varStatus="var">
									<div class="upload-file">
										<input type="hidden" id="fId" name="fId_${var.index}"
											value="${file.fId}"> <input type="hidden"
											id="FILE_NAME" name="FILE_NAME" value="fId_${var.index}">
										<a href="#" id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE} kb)
										<button id="fileDel"
											onclick="fn_del('${file.fId}','fId_${var.index}');"
											type="button">삭제</button>
										<br>
									</div>
								</c:forEach></td>
						</tr>
					</tbody>
				</table>
				<div class="box-footer">
					<button type="submit" class="listBtn">수정하기</button>
					<button type="submit" class="listBtn" id="cancel">목록으로</button>
					<button id="fileAdd_btn" class="listBtn" type="button">파일첨부</button>
				</div>


			</form>
		</div>
	</section>
</body>

<%@ include file="../include/footer.jspf"%>