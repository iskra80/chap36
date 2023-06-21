<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
#steve{
	text-align: center;
}
#bill {
	text-align: center;
}
#head {
	margin:0px;
	padding:0px;
	background: url("img/homeback.jpg"") repeat;
	
}
body{
	margin: 10px;
}
/* div{ */
/* 	border: 1px solid lightgrey; */
/* 	padding: 20px; */
/* } */
section{
	margin: 10px;
	text-align: center;
	font-size: 15pt;
}
#img{
	text-align: center;
}
#user{
	text-align: right;
}
#login {
	text-align: right;
}
</style>
<title>home.jsp</title>
</head>
<body class="container-fluid">

<div id="head">
	<img alt="homeback" src="/img/homeback.jpg">
</div>
<!-- 		<h1>Home Page</h1> -->
<br>

<section id="login">
	<sec:authorize access="isAuthenticated()">
		<h5>Welcome <sec:authentication property="name"/>!</h5>
	</sec:authorize>
</section>
<section>
	<sec:authorize access="isAnonymous()">
		<a href="/user/login" class="btn btn-dark">User Login </a>
	</sec:authorize>
	
	<sec:authorize access="isAuthenticated()">
		<a href="/user/logout" class="btn btn-dark">User Logout</a>
	</sec:authorize>
	<sec:authorize access="hasRole('ADMIN')">
	<a href="/user/list" class="btn btn-secondary">/user/list</a>	
<!-- 	<a href="/user/update">/user/update</a> -->
	</sec:authorize>	
	<a href="/user/create" class="btn btn-dark">User Create</a>
</section>
<hr>
<div class="row">
	<div  id="steve" class="col">
		<h1>Employee</h1>
		<h5>Steve Jobs is an architect and engineer</h5>
		<section>
			<menu class="btn-group, container-fluid" >
				<a href="/dept/list" class="btn btn-secondary">DEPT List</a>
				<a href="/emp/list" class="btn btn-success">EMP List</a>
				<a href="/salgrade/list" class="btn btn-secondary">Salgrade</a>	
			</menu>
		</section>
		<section id="img">
			<img alt="steve" src="img/steve.jpg" height="500px">
		</section>
	</div>		
<!-- 			<hr> -->
<!-- 			<ul> -->
<!-- 				<li><a href="/dept/detail/10">/dept/detail/10</a></li> -->
<!-- 				<li><a href="/emp/detail/1001">/emp/detail/1001</a></li> -->
<!-- 				<li><a href="/salgrade/detail/1">/salgrade/detail/1</a></li> -->
<!-- 			</ul> -->
<!-- 			<hr> -->
<!-- 			<ul> -->
<!-- 				<li><a href="/dept/create    ">/dept/create</a></li> -->
<!-- 				<li><a href="/emp/create     ">/emp/create</a></li> -->
<!-- 				<li><a href="/salgrade/create">/salgrade/create</a></li> -->
<!-- 			</ul> -->
<!-- 			<hr> -->
<!-- 			<ul> -->
<!-- 				<li><a href="/dept/update?deptno=10">/dept/update?deptno=10</a></li> -->
<!-- 				<li><a href="/emp/update?empno=1001">/emp/update?empno=1001</a></li> -->
<!-- 				<li><a href="/salgrade/update?grade=1">/salgrade/update?grade=1</a></li> -->
<!-- 			</ul> -->
<!-- 			<hr> -->
<!-- 			<ul> -->
<!-- 				<li><a href="/dept/delete?deptno=10    ">/dept/delete?deptno=10</a></li> -->
<!-- 				<li><a href="/emp/delete?empno=1001     ">/emp/delete?empno=1001</a></li> -->
<!-- 				<li><a href="/salgrade/delete?grade=1 ">/salgrade/delete?grade=1</a></li> -->
<!-- 			</ul> -->
		
	<div id="bill" class="col">
		<h1>World</h1>
		<h5>Bill Gates is an architect and engineer</h5>
		<section>
			<menu class="btn-group, container-fluid">
				<a href="/city/page/1/10" class="btn btn-success">City List</a>
				<a href="/country/page/1/5" class="btn btn-secondary">Country List</a>
				<a href="/language/page/1/10" class="btn btn-success">Language List</a>
			</menu>
		</section>
		<section id="img">
			<img alt="bill" src="img/billgates.jpg" height="500px">
		</section>
<!-- 			<ul> -->
<!-- 				<li><a href="/city/list">/city/list</a></li> -->			
<!-- 				<li><a href="/country/list">/country/list</a></li> -->			
<!-- 				<li><a href="/language/list">/language/list</a></li> -->			
<!-- 			</ul> -->
<!-- 			<hr> -->
<!-- 			<ul> -->
<!-- 				<li><a href="/city/create">/city/create</a></li> -->
<!-- 				<li><a href="/city/update?id=2331">/city/update?id=2331</a></li> -->
<!-- 				<li><a href="/city/delete?id=2331">/city/delete?id=2331</a></li> -->
<!-- 			</ul> -->
		
	</div>
</div>
</section>
</body>
</html>