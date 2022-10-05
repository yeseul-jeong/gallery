<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/header.jspf"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/forgetPWD.css">

<section class="pwdPage">
	<div class="pwdWrap">
					<h2 class="text-center">Find Password</h2>
					<form class="text-center" action="email.do" method="get">
						<p>
							가입한 계정의 아이디와 이메일를 입력하세요.<br> 이메일로 인증 코드가 전송됩니다.
						</p>
						<br>
						<div class="form-group">
							<input type="text" class="form-control" name="mId" placeholder="아이디" required>
						</div>
						<div class="form-group">
							<input type="email" class="form-control" name="email" placeholder="이메일" required>
						</div>
						<br>
						<div class="text-center">
							<button type="submit" class="pwdBtn" style="cursor:pointer">인증코드 전송</button>
						</div>
					</form>
					<p class="mt-20">
						<span> <a href="login.do" class="underline">로그인</a></span> &nbsp; / &nbsp; 
						<span> <a href="signUp.do">회원가입</a></span>
					</p>
				</div>
</section>

<%@ include file="../include/footer.jspf"%>