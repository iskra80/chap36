<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="no-cache">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="favicon.png">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<script src=/webjars/bootstrap/js/bootstrap.min.js></script>
<script src=/webjars/jquery/jquery.min.js></script>

<title>login.jsp</title>
</head>
<body>
<h1>Login 로그인</h1>
<hr>
<a href="/">HOME</a>
<section class="container">
	<form action="/user/login" method="post">
		<input class="form-control" name="username" value="${param.username}"/>
		<hr>
		<input class="form-control" name="password" type="password" value="${param.password}"/>
		<hr>
		<input name="remember-me" type="checkbox">Remember me
		<hr>
<!-- 		<input class="btn btn-secondary" id="register" type="submit" value="회원가입"> -->
<!-- 		<hr> -->
		<input class="btn btn-primary" type="submit"/>		
	</form>
</section>
<c:if test="${exception ne null}">
	<h1>${exception.message}</h1>
</c:if>
</body>
</html>