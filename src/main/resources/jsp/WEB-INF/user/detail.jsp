<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="no-store">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="/favicon.png">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script src="/webjars/jquery/jquery.min.js"></script>
<style type="text/css">
body{
	margin: 10px;
}
</style>

<title>detail.jsp</title>
</head>
<body>
<h1>User Detail 사용자 정보</h1>
<hr>
<sec:authorize access="isAuthenticated()">
	name = <sec:authentication property="name"/>
</sec:authorize>
<hr>
<a href="/" class="btn btn-success">Home</a>
<hr>
<a href="/user/list">User List</a>
<hr>
<section class="container">
	<table class="table">
		<tbody>
			<tr><th>id</th><td>${user.id}</td></tr>
			<tr><th>password</th><td>${user.password}</td></tr>
			<tr><th>role</th><td>${user.role}</td></tr>
		</tbody>
	</table>
	<hr>
	<sec:authorize access="hasRole('ADMIN')">
		<menu class="btn-group">
			<a href="/user/create" class="btn btn-primary">추가</a>
			<a href="/user/update?id=${user.id}" class="btn btn-secondary">수정</a>
			<a href="/user/delete?id=${user.id}" class="btn btn-danger">삭제</a>
		</menu>
	</sec:authorize>
<!-- 	<hr> -->
<!-- 	<ul> -->
<!-- 		<li><a href="/user/create">/user/create</a></li> -->
<%-- 		<li><a href="/user/update?id=${user.id}">/user/update?id=${user.id}</a></li> --%>
<%-- 		<li><a href="/user/delete?id=${user.id}">/user/delete?id=${user.id}</a></li> --%>
<!-- 	</ul> -->
</section>

</body>
</html>