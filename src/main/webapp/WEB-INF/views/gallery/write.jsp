<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/galleryWrite.css">
<!DOCTYPE html>
<html>
<head>
<title></title>
<style>
	.result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
	.result_card {
		position: relative;
	}
	.imgDeleteBtn, .thumbDeleteBtn{
	    position: absolute;
	    top: 10px;
	    right: 10px;
	    background-color: #ef7d7d;
	    color: wheat;
	    font-weight: 900;
	    width: 30px;
	    height: 30px;
	    border-radius: 50%;
	    line-height: 26px;
	    text-align: center;
	    border: none;
	    display: block;
	    cursor: pointer;	
	}
	
</style>
</head>
<%@ include file="../include/header.jspf"%>

<body id="body">

		<div class="pageWrap">
			<div class="page-header">
				<h2 class="page-name">작품 등록</h2>
			</div>
						<form class="formWrap" id="insertArt" name="insertArt" role="form" method="post">
							<h6 style="text-align:center;">*은 필수 입력사항</h6> 
							<div class="form-group">
								<input
									type="text" class="form-control" placeholder=" *작가코드"
									name="aId" id="aId"> <span
									style="font-size: 0.8em;">&nbsp; 1:정예슬 &nbsp; 2:Olivia Dean &nbsp;</span>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="*작품명"
									name="gName" id="gName">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="*작품설명"
									name="gDesc" id="gDesc">
							</div>
							<!-- <div class="form-group">
								<span style="font-size: 0.8em;">작업날짜</span>
								<input type="date" class="form-control" placeholder="*작업날짜"
									name="workDate" id="workDate" value="sysdate">
							</div> -->
							<div class="form-group">
								<span style="font-size: 0.8em;">썸네일이미지 [이미지파일만 첨부가능]</span>
								<input type="file" class="form-control"
									placeholder="썸네일" name="thumbnail" id="thumbnail">
								<div id="thumbnailUploadResult">
								</div>
							</div>
							<div class="form-group">
								<span style="font-size: 0.8em;">상세이미지 [이미지파일만 첨부가능]</span>
								<input type="file" class="form-control"
									placeholder="이미지" name="image" id="image">
								<div id="imageUploadResult">
								</div>
							</div>
							<div class="buttonWrap">
								<button type="button" class="listBtn" id="list" style="cursor:pointer">
									<a href='<%=request.getContextPath()%>/gallery/list'>뒤로가기</a></button>
								<button type="submit" class="writeBtn" onclick="checkForm();">등록하기</button>
							</div>

						</form>
						
					</div>


<script type=text/javascript>

	let insertArtForm = document.getElementById("insertArt");

	function checkForm() {

		if (insertArtForm.aId.value == ""
				|| insertProductForm.gName.value == ""
				|| insertProductForm.gDesc.value == "") {
			alert("작가코드,작품명,작품설명 필수입력!!");
			insertArtForm.aId.focus();
			return false;
		}

		insertArtForm.submit();
	}

	/* 이미지 업로드 */
	$('input[name="thumbnail"]').on("change", function(e) {
		
		/* 이미지 존재시 삭제 */
		if($(".thumbDeleteBtn").length > 0){
			deleteThumbnailFile();
		}
		
		let formData = new FormData();
		let fileInput = $('input[name="thumbnail"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
		console.log("fileObj : " + fileObj);

		console.log("fileName : " + fileObj.name);
		console.log("fileSize : " + fileObj.size);
		console.log("fileType(MimeType) : " + fileObj.type);
		
		
		formData.append("file", fileObj);
		
		
		for (let key of formData.keys()) {
			console.log(key, ":", formData.get(key));
		}
		
		$.ajax({
			url: '/gallery/gallery/uploadAjaxAction',
			enctype: 'multipart/form-data',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json',
	    	success : function(result){
	    		console.log(result);
	    		showUploadThumbnail(result);
	    	},
	    	error : function(result){
	    		alert("이미지 파일이 아닙니다.");
	    	}
		});
	});
	$('input[name="image"]').on("change", function(e) {
		
		/* 이미지 존재시 삭제 */
		if($(".imgDeleteBtn").length > 0){
			deleteImageFile();
		}
		
		let formData = new FormData();
		let fileInput = $('input[name="image"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
		console.log("fileObj : " + fileObj);

		console.log("fileName : " + fileObj.name);
		console.log("fileSize : " + fileObj.size);
		console.log("fileType(MimeType) : " + fileObj.type);
		
		
		formData.append("file", fileObj);
		
		
		for (let key of formData.keys()) {
			console.log(key, ":", formData.get(key));
		}
		
		$.ajax({
			url: '/gallery/gallery/uploadAjaxAction',
			enctype: 'multipart/form-data',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json',
	    	success : function(result){
	    		console.log(result);
	    		showUploadImage(result);
	    	},
	    	error : function(result){
	    		alert("이미지 파일이 아닙니다.");
	    	}
		});
	});

	
	
	/* 이미지 출력 */
	function showUploadThumbnail(uploadResultArr){
		
		/* 전달받은 데이터 검증 */
		if(!uploadResultArr || uploadResultArr.length == 0){return}
		
		let uploadResult = $("#thumbnailUploadResult");
		
		let obj = uploadResultArr[0];
		
		let str = "";
		
		let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/" + obj.uuid + "_" + obj.fileName);
		
		str += "<div id='result_card_thumbnail' class='result_card'>";
		str += "<img class='img-responsive' src='/gallery/gallery/display?fileName=" + fileCallPath +"'>";
		str += "<div class='thumbDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "<input type='hidden' name='thumbnail' value='" + obj.uploadPath.replace(/\\/g, '/') + "/" + obj.uuid + "_" + obj.fileName +"'>";
		str += "</div>";		
		
   		uploadResult.append(str);
	}
	function showUploadImage(uploadResultArr){
		
		/* 전달받은 데이터 검증 */
		if(!uploadResultArr || uploadResultArr.length == 0){return}
		
		let uploadResult = $("#imageUploadResult");
		
		let obj = uploadResultArr[0];
		
		let str = "";
		
		let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/" + obj.uuid + "_" + obj.fileName);
		
		str += "<div id='result_card_image' class='result_card'>";
		str += "<img class='img-responsive' src='/gallery/gallery/display?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "<input type='hidden' name='image' value='" + obj.uploadPath.replace(/\\/g, '/') + "/" + obj.uuid + "_" + obj.fileName +"'>";
		str += "</div>";		
		
   		uploadResult.append(str);
	}
	
	
	/* 이미지 삭제 버튼 동작 */
	$("#thumbnailUploadResult").on("click", ".thumbDeleteBtn", function(e){
		deleteThumbnailFile();
	});
	$("#imageUploadResult").on("click", ".imgDeleteBtn", function(e){
		deleteImageFile();
	});
	
	
	/* 이미지 삭제 메서드 */
	function deleteThumbnailFile(){
		let targetFile = $(".thumbDeleteBtn").data("file");
		
		let targetDiv = $("#result_card_thumbnail");
		
		$.ajax({
			url: '/gallery/gallery/deleteFile',
			data : {fileName : targetFile},
			dataType : 'text',
			type : 'POST',
			success : function(result){
				console.log(result);
				
				targetDiv.remove();
				$("input[name='thumbnailFile']").val("");
				
			},
			error : function(result){
				console.log(result);
				
				alert("파일을 삭제하지 못하였습니다.")
			}
		});
	}
	function deleteImageFile(){
		let targetFile = $(".imgDeleteBtn").data("file");
		
		let targetDiv = $("#result_card_image");
		
		$.ajax({
			url: '/gallery/gallery/deleteFile',
			data : {fileName : targetFile},
			dataType : 'text',
			type : 'POST',
			success : function(result){
				console.log(result);
				
				targetDiv.remove();
				$("input[name='image']").val("");
				
			},
			error : function(result){
				console.log(result);
				
				alert("파일을 삭제하지 못하였습니다.")
			}
		});
	}
	
</script>
<%@ include file="../include/footer.jspf"%>