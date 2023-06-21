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
<style type="text/css">
body{
	margin: 10px;
}
</style>

<title>login.jsp</title>
</head>
<body>
<h1>Login 로그인</h1>
<hr>

<section class="container">
	<form action="/user/login" method="post">
		<div class="mb-3">
            <label class="form-lable mb-2" for="username">User ID<span>*</span></label>
            <input class="form-control"    id="username" name="username"  placeholder="username" value="${param.username}"/>
        </div>
        <div class="mb-3">
            <label class="form-lable mb-2" for="password">Password<span>*</span></label>
            <input class="form-control"    id="password"  name="password"  placeholder="password" value="${param.password}" type="password"/>
        </div>
		<input name="remember-me" type="checkbox">Remember me
		<br>
		<br>
		<button type="submit" class="btn btn-secondary">Submit</button>
		<a href="/user/create" class="btn btn-dark">Register</a>
		<a href="/" class="btn btn-success">Home</a>		
	</form>
</section>
<c:if test="${exception ne null}">
	<h1>${exception.message}</h1>
</c:if>
</body>
</html>