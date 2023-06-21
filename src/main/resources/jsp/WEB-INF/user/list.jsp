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

<title>list.jsp</title>
</head>
<body>
<h1>User List</h1>
<hr>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="name"/>님 !
</sec:authorize>
<hr>
<a href="/" class="btn btn-success">Home</a>
<hr>
<section class="container">
	<table class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th>id</th>
				<th>password</th>
				<th>role</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="e" items="${list}">
			<tr>
				<td><a href="/user/detail/${e.id}">${e.id}</a></td>
				<td>${e.password}</a></td>
				<td>${e.role}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</section>
</body>
</html>