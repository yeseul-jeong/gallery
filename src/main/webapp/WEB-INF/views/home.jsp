<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Oxhibition | 다른 감각 전시회</title>

<%@ include file="./include/header.jspf"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/home.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script>
	$(document).ready(function() {
		$('.works').fadeTo(700, 1);
	})

	$(document)
			.ready(
					function() {
						$(window)
								.scroll(
										function() {

											$('.artist')
													.each(
															function(i) {

																var bottom_of_element = $(
																		this)
																		.offset().top
																		+ $(
																				this)
																				.outerHeight()
																		/ 5;
																var bottom_of_window = $(
																		window)
																		.scrollTop()
																		+ $(
																				window)
																				.height();

																if (bottom_of_window > bottom_of_element) {
																	$(this)
																			.animate(
																					{
																						'opacity' : '1'
																					},
																					1300);
																}

															});
										});
					});

	$(document)
			.ready(
					function() {
						$(window)
								.scroll(
										function() {

											$('.artist')
													.each(
															function(i) {

																var bottom_of_element = $(
																		this)
																		.offset().top
																		+ $(
																				this)
																				.outerHeight()
																		/7;
																var bottom_of_window = $(
																		window)
																		.scrollTop()
																		+ $(
																				window)
																				.height();

																if (bottom_of_window > bottom_of_element) {
																	$(this)
																			.animate(
																					{
																						'opacity' : '1'
																					},
																					800);
																}

															});
										});
					});

	$(document).ready(function() {
		$('.headerbar').fadeTo(700, 1);
	})

	$(document).ready(function() {
		$('.slider').bxSlider({
			auto : true, //자동으로 애니메이션 시작
			speed : 700, //애니메이션 속도
			pause : 4000, //애니메이션 유지시간(1000 = 1초)
			mode : 'fade', //슬라이드 모드('fade','horizontal',vertcal' 이 있음)
			autoControls : false, //시작 및 중지버튼이 보여짐
			captions : true
		});
	});

	$(document).ready(function() {
		$('.2slider').bxSlider({
			auto : true, //자동으로 애니메이션 시작
			speed : 700, //애니메이션 속도
			pause : 4000, //애니메이션 유지시간(1000 = 1초)
			mode : 'fade', //슬라이드 모드('fade','horizontal',vertcal' 이 있음)
			autoControls : false, //시작 및 중지버튼이 보여짐
			captions : true
		});
	});
</script>
<style>
.works {
	opacity: 0;
}

.artist {
	opacity: 0;
}

.bx-wrapper {
	width: 40%;
	position: relative;
	margin: 20px auto 60px auto;
	padding: 0;
	*zoom: 1;
	-ms-touch-action: pan-y;
	touch-action: pan-y;
	-moz-box-shadow: 0 0 5px #ccc;
	-webkit-box-shadow: 0 0 5px #ccc;
	box-shadow: none;
	border: none;
}

.bx-wrapper img {
	width: 600px;
	height: 830px;
}

.bx-wrapper .bx-caption {
	background: none;
}

.bx-wrapper .bx-prev {
	left: 10px;
	background: none;
}

.bx-wrapper .bx-next {
	right: 10px;
	background: none;
}

.bx-wrapper .bx-pager.bx-default-pager a {
	background: white;
	border: 1px solid black;
}
</style>

</head>

<body class="body">
	<div class="wrapper">

		<!-- home -->
		<div class="works">
			<p class="workTitle">an works of exhibition</p>
			<div class="slider">
				<div class="sliderContents">
					<a href="<%=request.getContextPath()%>/gallery/detail?gId=77"><img
						src="<%=request.getContextPath()%>/resources/images/main/lastisland.jpg"
						title="정예슬 | 마지막 제주"></a>
				</div>
				<div class="sliderContents">
					<a href="<%=request.getContextPath()%>/gallery/detail?gId=78"><img
						src="<%=request.getContextPath()%>/resources/images/main/reunion.jpg"
						title="Olivia Dean | 재회"></a>
				</div>
				<div class="sliderContents">
					<a href="<%=request.getContextPath()%>/gallery/detail?gId=82"><img
						src="<%=request.getContextPath()%>/resources/images/main/suddenly.jpg"
						title="정예슬 | 문득 들었던 생각"></a>
				</div>
				<div class="sliderContents">
					<a href="<%=request.getContextPath()%>/gallery/detail?gId=81"><img
						src="<%=request.getContextPath()%>/resources/images/main/tearful.jpg"
						title="Olivia Dean | 눈물 흘리는 소녀"></a>
				</div>
			</div>
		</div>

		<div class="artist">
			<p class="artistTitle">artists</p>
			<div class="2slider">
				<div class="sliderContents">
					<img
						src="<%=request.getContextPath()%>/resources/images/main/yeseul.jpg"
						title="Artist | Jeong YeSeul">
				</div>
				<div class="sliderContents">
					<img
						src="<%=request.getContextPath()%>/resources/images/main/artist.jpg"
						title="Artist | Olivia">
				</div>
			</div>
		</div>
		<!-- home end -->
		
		
	</div>
		<%@ include file="./include/footer.jspf"%>
</body>
</html>
<!-- footer end -->