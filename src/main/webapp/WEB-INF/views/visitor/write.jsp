<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"
	integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI="
	crossorigin="anonymous"></script>

<%@ include file="../include/header.jspf"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/write.css">
<script type="text/javascript">
		$(document).ready(function(){
			fn_addFile();
		})
		
		function fn_addFile(){
			var fileIndex = 1;
			$("#fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div><input type='file' style='float:left; ' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
			});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
			});
		}
	</script>


<body id="body">

	<section class="pageWrap">
				<div class="page-header">
					<h3 class="page-name">WRITE</h3>
				</div>
				<div class="formWrap">
					<form name="writeForm" class="form-group" method="post"
						enctype="multipart/form-data">
						<table>
							<tbody>
								<tr>
									<div class="form-group"><input type="text" name='mId' class="form-control"
										placeholder="작성자" value="${member.mId}" readonly="readonly">
									</div>
								</tr>
								<tr>
									<div class="form-group"><input type="text" name='title' class="form-control"
										placeholder="제목"></div>
								</tr>
								<tr>
									<div class="form-group"><textarea class="form-content" name="content"
											rows="15" placeholder="작성내용"></textarea></div>
								</tr>

								<tr>
									<td id="fileIndex"></td>
								</tr>
								<tr>
								<div class="box-footer">
									<td>
										<button id="fileAdd_btn" class ="listBtn" type="button">파일첨부</button>
										<button type="submit" class="listBtn">등록</button>
									</td>
								</div>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
	</section>
</body>

<%@ include file="../include/footer.jspf"%>