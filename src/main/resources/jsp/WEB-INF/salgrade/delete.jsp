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
<title>delete.jsp</title>
</head>
<body>
<h1>Salgrade Delete 급여등급 삭제</h1>
<hr>
<a href="/" class="btn btn-success">Home</a>
<hr>
<a href="/salgrade/list">Salgrade List</a>
<hr>
<section class="container">
	<form action="/salgrade/delete" method="post">
		<div class="mb-3">
			<label class="form-lable mb-2" for="grade">grade<span>*</span></label>
			<input class="form-control"    id="grade" name="grade" placeholder="급여등급을 입력하세요." value="${salgrade.grade}" disabled="disabled"/>
			<input class="form-control"    id="grade" name="grade" placeholder="급여등급을 입력하세요." value="${salgrade.grade}" type="hidden"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="losal">losal<span>*</span></label>
			<input class="form-control"    id="losal"  name="losal"  placeholder="최저급여를 입력하세요." value="${salgrade.losal}" disabled="disabled"/>
			<input class="form-control"    id="losal"  name="losal"  placeholder="최저급여를 입력하세요." value="${salgrade.losal}" type="hidden"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="hisal">hisal</label>
			<input class="form-control"    id="hisal"	name="hisal"    placeholder="최고급여를 입력하세요." value="${salgrade.hisal}" disabled="disabled"/>
			<input class="form-control"    id="hisal"	name="hisal"    placeholder="최고급여를 입력하세요." value="${salgrade.hisal}" type="hidden"/>
		</div>
		<button type="submit" class="btn btn-dark">Submit</button>
	</form>	
</section>
<hr>
<c:if test="${binding.hasErrors()}">
<h2>Error Massage</h2>
<hr>
<c:forEach var="g" items="${binding.globalErrors}">
	<div>${g.code} ${g.defaultMessage}</div>
</c:forEach>
<hr>
<c:forEach var="f" items="${binding.fieldErrors}">
	<div>${f.field} ${f.defaultMessage}</div>
</c:forEach>

</c:if>

</body>
</html>