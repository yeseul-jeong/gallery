<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Oxhibition | 다른 감각 전시회</title>

<%@ include file="./include/header.jspf"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/header.css">
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
																					600);
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

<body id="body">
	<div class="wrapper">

		<!-- header -->
		<%-- <div class="headerbar">
			<p id="headerTitle">
				<a href="<%=request.getContextPath()%>/">Oxhibition.<a />
			</p>
			<p id="headerSub">다른 감각 전시회</p>
			<ul id="headerleft">
				<li class="menulines"><a
					href="<%=request.getContextPath()%>/notice/list">공지사항</a></li>
				<li class="menulines"><a href="<%=request.getContextPath()%>#!">갤러리</a></li>
				<li class="menulines"><a href="<%=request.getContextPath()%>#!">방명록</a></li>
			</ul>

			<ul id="headerright">
				<c:if test="${member == null}">
					<li class="menulines"><a
						href="<%=request.getContextPath()%>/signUp.do">회원가입</a></li>
					<li class="menulines"><a
						href="<%=request.getContextPath()%>/login.do">로그인</a></li>
				</c:if>
				<c:if test="${member != null}">
					<li class="loginMenu">안녕하세요, <b>${member.mName}</b>님</li>
					<li><a href="<%=request.getContextPath()%>/checkPwd.do">My Page</a></li>
					<li class="loginMenu"><a href="<%=request.getContextPath()%>/logout.do"><b>Logout</b></a></li>
				</c:if>
			</ul>
		</div> --%>
		<!-- header end -->

		<!-- home -->
		<div class="works">
			<p class="workTitle">an works of exhibition</p>
			<div class="slider">
				<div class="sliderContents">
					<img
						src="<%=request.getContextPath()%>/resources/images/main/lastisland.jpg"
						title="정예슬 | 마지막 제주">
				</div>
				<div class="sliderContents">
					<img
						src="<%=request.getContextPath()%>/resources/images/main/reunion.jpg"
						title="정예슬 | 재회">
				</div>
				<div class="sliderContents">
					<img
						src="<%=request.getContextPath()%>/resources/images/main/suddenly.jpg"
						title="정예슬 | 문득 들었던 생각">
				</div>
				<div class="sliderContents">
					<img
						src="<%=request.getContextPath()%>/resources/images/main/tearful.jpg"
						title="정예슬 | 눈물 흘리는 소녀">
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
		
		
		<!-- footer -->

		<%-- <footer class="footerbar">
			<div class="footerdiv">
				<ul class="footer-menu text-uppercase">
					<li>
						<a href="<%=request.getContextPath()%>">CONTACT</a>
					</li>
					<li>
						<a href="<%=request.getContextPath()%>/product/listAll">SHOP</a>
					</li>
					<li>
						<a href="<%=request.getContextPath()%>">Pricing</a>
					</li>
					<li>
						<a href="<%=request.getContextPath()%>">PRIVACY POLICY</a>
					</li>
				</ul>
				<p class="copyright-text">Copyright &copy;2021, Designed &amp;
					Developed by Jeong-yeseul</p>
				<p class="copyright-text">정예슬 개인 프로젝트 | 온라인 전시회 Oxhibition</p>

			</div>
		</footer> --%>
		
		<%@ include file="./include/footer.jspf"%>
	</div>
</body>
</html>
<!-- footer end -->