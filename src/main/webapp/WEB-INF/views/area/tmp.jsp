<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
	<button id=btn>hi</button>
	<script>
		$("#btn").on("click",function(){
			location.href="/area/main?page=2";
		})
	</script>
	
	
	<c:forEach var="i" items="${pageView }">
		<c:choose>
		<c:when test="${i eq -1 }">
			<
		</c:when>
		<c:when test="${i eq -2 }">
			>
		</c:when>
		<c:otherwise>
			${i }
		</c:otherwise>
		</c:choose>
		
	</c:forEach>
	<br>
	${pageNo }현재페이지<br>

	<c:forEach var="item" items="${list }">
		${item.title }<br>
		${item.contentid }<br>
		${item.contenttypeid }<br>
		${item.addr1 }<br>
		${item.areacode}<br>
		${item.cat3}<br>
		${item.cat1 }<br>
		${item.readcount }<br>
		<c:if test="${item.firstimage ne null }">
		<img src="${item.firstimage}"><br>
		</c:if>
		<p> 
	</c:forEach>
</body>
</html>