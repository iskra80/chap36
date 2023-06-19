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

<title>page.jsp</title>
</head>
<body>
<h1>Country Page <span>pageNum = ${paging.pageNum}</span></h1>
<hr>
<div id="home"><a href="/">Home</a></div>
<hr>
<section class="container table-responsive">
<div>	
	<table class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th>code</th>
				<th>name</th>
				<th>continent</th>
				<th>region</th>
				<th>surfaceArea</th>
				<th>indepYear</th>
				<th>population</th>
				<th>lifeExpectancy</th>
				<th>gnp</th>
				<th>gnpOld</th>
				<th>localName</th>
				<th>governmentForm</th>
				<th>headOfState</th>
				<th>capital</th>
				<th>code2</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="e" items="${list}">
			<tr>
				<td>${e.code}</td>
				<td><a href="/country/detail/${e.code}?pageNum=${paging.pageNum}&pageSize=${paging.pageSize}">${e.name}</a></td>
				<td>${e.continent.symbol}</td>
				<td>${e.region}</td>
				<td>${e.surfaceArea}</td>
				<td>${e.indepYear}</td>
				<td>${e.population}</td>
				<td>${e.lifeExpectancy}</td>
				<td>${e.gnp}</td>
				<td>${e.gnpOld}</td>
				<td>${e.localName}</td>
				<td>${e.governmentForm}</td>
				<td>${e.headOfState}</td>
				<td>${e.capital}</td>
				<td>${e.code2}</td>
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