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
<jsp:include page="../base/header.jsp"></jsp:include>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				일정 리스팅
			</div>
		</div>
		
		<div class="row">
			<div class="col">
				<button class="btn" id="planMakeBtn">신규 일정 생성</button>
			</div>
		</div>
	</div>	


	<script>
		$("#planMakeBtn").on("click",function(){
			location.href="/plan/newPlan";
		})
	</script>
</body>
</html>