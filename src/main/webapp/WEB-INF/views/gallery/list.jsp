<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@page import="java.text.DecimalFormat"%>

<%@ include file="../include/header.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/galleryList.css">

<body id="body">
	<div class="listWrap">
		<div class="page-header">
			<div class="page-name">
				<h2>Gallery</h2>
			</div>
		</div>

		<div class="pageWrap" id="pageGallery">
			<ul class="post-pagination">

				<!-- href값을 페이지 번호로 대체하여 이를 자바스크립트에서 href값을 통해 form 태그 내 input hidden에 값을 대체하여 form으로 submit -->
				<c:if test="${pageMaker.prev}">
					<li class="paginate_button previous"><a
						href="<%=request.getContextPath()%>/gallery/list?page=${pageMaker.startPage-1}">
							prev </a></li>
				</c:if>

				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li
						class="paginate_button ${pageMaker.cri.page == num ? 'active' :''}">
						<a href="<%=request.getContextPath()%>/gallery/list?page=${num}">${num}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next}">
					<li class="paginate_button next"><a
						href="<%=request.getContextPath()%>/gallery/list?page=${pageMaker.endPage+1}">
							next </a></li>
				</c:if>

			</ul>


			<form id='actionForm' action="/gallery/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.page}'>
				<input type='hidden' name='amount'
					value='${pageMaker.cri.perPageNum}'>
			</form>

		</div>

		<div class="galleryWrap">
			<c:forEach var="gallery" items="${galleryList}">
				<div class="galleryListForm">
					<div class="galleryThumb">
						<a href="<%=request.getContextPath()%>/gallery/detail?gId=${gallery.gId}"><img class="galleryImg"
							src="<%=request.getContextPath()%>/gallery/display?fileName=${gallery.thumbnail}"
							alt="product-img" /></a>
						<%-- <div class="preview-meta">
								<ul>
									<li><a
										href="<%=request.getContextPath()%>/gallery/detail?gId=${gallery.GId}"><i
											class="tf-ion-ios-search-strong"></i></a></li>
								
										<input type="hidden" name=mId value="${member.mId}">
										<input type="hidden" name="gId" value="${gallery.GId}">
										<li><a
											href="<%=request.getContextPath()%>/addCart.do?mId=${member.MId}&pId=${product.PId}&cquantity=1"><i
												class="tf-ion-android-cart"></i></a></li>
								</ul>
							</div> --%>
					</div>
					<div class="galleryContent">
						<h4>
							<a href="<%=request.getContextPath()%>/gallery/detail?gId=${gallery.gId}">${gallery.aName}
								| ${gallery.gName}</a>
						</h4>
						<p class="galleryDesc">${gallery.gDesc}</p>
					</div>
				</div>
			</c:forEach>
		
		</div>
	</div>
	
	<div class="pageWrap" id="pageGallery">
			<ul class="post-pagination">
				<!-- href값을 페이지 번호로 대체하여 이를 자바스크립트에서 href값을 통해 form 태그 내 input hidden에 값을 대체하여 form으로 submit -->
				<c:if test="${pageMaker.prev}">
					<li class="paginate_button previous"><a
						href="<%=request.getContextPath()%>/gallery/list?page=${pageMaker.startPage-1}">
							prev </a></li>
				</c:if>

				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li
						class="paginate_button ${pageMaker.cri.page == num ? 'active' :''}">
						<a href="<%=request.getContextPath()%>/gallery/list?page=${num}">${num}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next}">
					<li class="paginate_button next"><a
						href="<%=request.getContextPath()%>/gallery/list?page=${pageMaker.endPage+1}">
							next </a></li>
				</c:if>

			</ul>


			<form id='actionForm' action="/gallery/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.page}'>
				<input type='hidden' name='amount'
					value='${pageMaker.cri.perPageNum}'>
			</form>

		</div>
		<c:if test="${sessionScope.member.mLevel == 2}">
						<div id="write_btn">
							<a class="writeBtn"
								href="<%=request.getContextPath()%>/gallery/write">신규작품 등록</a>
						</div>
			</c:if>
	
	<script>
		var actionForm = $("#acionForm");

		$(".pagination_button a").on("click", function(e) {

			e.preventDefault();
			actionForm.find("input[name='page']").val($(this).attr("href"));
			actionForm.submit();
		});

		$(document).ready(function() {
			$(window).scroll(function() {
				$('.galleryThumb').each(function(i) {
					var bottom_of_element = $(this).offset().top+ $(this).outerHeight()/5;
					var bottom_of_window = $(window).scrollTop()+ $(window).height();
						if (bottom_of_window > bottom_of_element) {
							$(this).animate({'opacity' : '1'},600);
						}
					});
				});
			});
		
	</script>
	<%@ include file="../include/footer.jspf"%>