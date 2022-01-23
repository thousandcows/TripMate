<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<div class="row">
					<div class="col-6">
						제목
					</div>
					<div class="col-2">
						여행 시작일
					</div>
					<div class="col-2">
						여행 종료일
					</div>
					<div class="col-2">
						진행 상황
					</div>
				</div>
							<c:set var="now" value="<%=new java.util.Date()%>" />
				<c:forEach var="i" items="${list }">
					<div class="row">
						<div class="col-6">
						<a href="/plan/modify?seq=${i.seq }">${i.title }</a>
						</div>
						<div class="col-2">
							${i.startDate }
						</div>
						<div class="col-2">
							${i.endDate }
						</div>
						<div class="col-2">
							<fmt:parseDate value="${i.startDate }" var="startDate" pattern="yyyy.MM.dd"/>
							<fmt:parseDate value="${i.endDate }" var="endDate" pattern="yyyy.MM.dd"/>
							<fmt:parseNumber value="${startDate.time / (1000*60*60*24)}" integerOnly="true" var="start"/>
							<fmt:parseNumber value="${endDate.time / (1000*60*60*24)}" integerOnly="true" var="end"/>
							<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowD"/>
							<c:if test="${start-nowD > 0 }">
								<div>예정</div>
							</c:if>
							<c:if test="${start-nowD < 0 and end-nowD >= 0}">
								<div>진행중</div>
							</c:if>
							<c:if test="${end-nowD < 0}">
								<div>완료</div>
							</c:if>
							
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<c:forEach var="i" items="${paging }">
				<button type="button btn paging btn-primary">
				<a href="/plan/main?page=${i }">
				<c:choose>
				<c:when test="${i eq firstNum and (i%10) eq 0 }">
				<
				</c:when>
				<c:when test="${i eq lastNum and (i%10) eq 1 }">
				>
				</c:when>
				<c:when test="${i eq page }">
				${i }
				</c:when>
				<c:otherwise>
				${i }
				</c:otherwise>
				</c:choose>
				</button>
				</a>
				
				</c:forEach>
				
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