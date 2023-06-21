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

<title>page.jsp</title>
</head>
<body>
<h1>Language Page <span>pageNum = ${paging.pageNum}</span></h1>
<hr>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="name"/>님 !<br>
</sec:authorize>
<hr>
<div id="home"><a href="/" class="btn btn-success">Home</a></div>
<hr>
<section class="container table-responsive">
<div>
	<table class="table table-striped table-bordered table-hover">
		<thead class="table-dark">
			<tr>
				<th>countryCode</th>
				<th>language</th>
				<th>isOfficial</th>
				<th>percentage</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="e" items="${list}">
			<tr>
				<td>${e.countryCode}</td>
				<td><a href="/language/detail/${e.countryCode}?pageNum=${paging.pageNum}&pageSize=${paging.pageSize}">${e.language}</a></td>
				<td>${e.isOfficial}</td>
				<td align="right">
					<fmt:formatNumber pattern="##.##" value="${e.percentage}"/> 
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>	
<hr>
<div>
	<ul class="pagination justify-content-center">
		<c:if test="${paging.hasPreviousPage }">
			<li class="page-item"><a class="page-link" href="/city/page/1/${paging.pageSize}"><</a>
		</c:if>
		<c:choose>
			<c:when test="${paging.hasPreviousPage}">
				<li class="page-item"><a class="page-link" href="/city/page/${paging.navigateFirstPage-1}/${paging.pageSize}">Previous</a>
			</c:when>
			<c:otherwise>
				<li class="page-item disabled"><a class="page-link" href="#">Previous</a>
			</c:otherwise>
		</c:choose>
			<c:forEach var="n" items="${paging.navigatepageNums}">
				<c:choose>
					<c:when test="${n eq paging.pageNum}">		
						<li class="page-item"><a class="page-link" href="/city/page/${n}/${paging.pageSize}">${n}</a></li>
					</c:when>
					<c:when test="${n ne paging.pageNum}">		
						<li class="page-item"><a class="page-link" href="/city/page/${n}/${paging.pageSize}">${n}</a></li>
					</c:when>				
				</c:choose>
			</c:forEach>
		<c:choose>
			<c:when test="${paging.hasNextPage}">
				<li class="page-item"><a class="page-link" href="/city/page/${paging.navigateLastPage+1}/${paging.pageSize}">Next</a>
			</c:when>
			<c:otherwise>
				<li class="page-item disabled"><a class="page-link" href="#">Next</a>
			</c:otherwise>
		</c:choose>
		<c:if test="${paging.hasNextPage}">
			<li class="page-item"><a class="page-link" href="/city/page/${paging.pages}/${paging.pageSize}">></a>
		</c:if>
	</ul>
</div>
<!-- 	<div> -->
<!-- 	<pre> -->
<%-- 	${json} --%>
<!-- 	</pre> -->
<!-- 	</div> -->
</section>
</body>
</html>