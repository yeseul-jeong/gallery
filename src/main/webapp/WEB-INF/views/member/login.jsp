<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Oxhibition | Login</title>
</head>
<body id="body">

	<%@ include file="../include/header.jspf"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/login.css">
	<!-- Login box -->
	<section class="loginPage">
		<div class="loginWrap">
						<h2 class="text-center-h2">Login</h2>
						<form class="text-left clearfix" action="submitLogin.do" method="post">
							<div class="form-group">
								<input type="text" name="mId" class="form-control" placeholder="아이디" value="${saveIdCookie}">
							</div>
							<div class="form-group">
								<input type="password" name="pw" class="form-control" placeholder="비밀번호">
							</div>
							<input type="checkbox" class="idcheck" name="saveId" <c:if test="${saveIdCookie != null}">checked</c:if> >
							<span style="font-size: 11px; position: relative; top: -2px;">아이디 저장</span>
							<div class="text-center">
								<button type="submit" class="loginBtn">로그인</button>
							</div>
						</form>
						<p class="mt-20"><b>Oxhibition</b>이 처음이신가요?☞<a href="signUp.do">회원가입</a></p>
						<p class="mt-20">비밀번호를 잊으셨나요?☞<a href="forgetPwd.do">비밀번호 찾기</a></p>
					</div>
	</section>

	<%@ include file="../include/footer.jspf"%>

</body>
</html>