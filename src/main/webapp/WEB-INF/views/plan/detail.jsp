<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${dto.title }</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<jsp:include page="../base/header.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-12 text-center">
				<h2>${dto.title }</h2>
			</div>
			<div class="col">
				<c:forEach var="i" items="${list }">
					<c:set var="k" value="${k+1 }"/>
					<div class="row">
						<div class="col-12">
							${k }일차				
						</div>
						<div class="col-12">
							<c:forEach var="j" items="${i }">
								<div class="row mt-2">
									<div class="col-3">
										<img src="${j.photo }" style="width:200px;">
									</div>
									<div class="col-3">
										${j.name }<br>
										${j.location }										
									</div>
								</div>
							</c:forEach>						
						</div>
					</div>	
				</c:forEach>

			</div>
		</div>
	</div>
	<div>${dto.memo }</div>
	
	<a href="/plan/modify?seq=${dto.seq }"><button>수정</button></a>	
</body>
</html>