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
<style>
       /* 링크 속성 지우기 */
        a { text-decoration:none  } 
        a:hover { text-decoration:none; color: black; }
        a:link {text-decoration: none; color: black; }
        a:visited {text-decoration: none; color: black; }
        a:active {text-decoration: none; color: black; }
        
           /* 헤더----------------------------------------------------- */
        .banner{
            background-color: rgb(56, 181, 174);
            height:200px;
        }

        .banner_title{
            width: 100%;
            height: 70%;
            color: white;
            font-size: 35px;
            font-weight: 600;
            padding: 60px 0px 10px 100px;
        }

        .banner_content{
            width: 100%;
            height: 30%;
            color: white;
            font-size: 15px;
            font-weight: 500;
            padding-left: 100px;
        }
</style>
</head>
<body>
	<div class = "banner">  <!-- 추후 banner background로 이미지 넣을 예정입니다. 지금은 임시로 단색채움.-->
		<div class="banner_title"> 여행계획 관리 </div>
		<div class="banner_content"> 여행 계획을 세워보세요. </div>
	</div>
	<div class="container mt-4">
		<div class="row border mt-4">
			<div class="col">
				<div class="row border">
					<div class="col-3 col-xl-8 text-center">
						<span>제목</span>
					</div>
					<div class="col-3 col-xl-1 text-center">
						<span>분류</span>
					</div>
					<div class="col-2 col-xl-1 text-center">
						<span>여행 시작일</span>
					</div>
					<div class="col-2 col-xl-1 text-center">
						<span>여행 종료일</span>
					</div>
					<div class="col-2 col-xl-1 text-center">
						<span>진행 상황</span>
					</div>
				</div>
							<c:set var="now" value="<%=new java.util.Date()%>" />
				<c:forEach var="i" items="${list }">
					<div class="row border">
						<div class="col-3 col-xl-8">
						<a href="/plan/detail?seq=${i.seq }"><span>${i.title }</span></a>
						</div>
						<div class="col-3 col-xl-1 text center">
							<span>${i.theme }</span>
						</div>
						<div class="col-2 col-xl-1 text-center">
							<span>${i.startDate }</span>
						</div>
						<div class="col-2 col-xl-1 text-center">
							<span>${i.endDate }</span>
						</div>
						<div class="col-2 col-lg-1 text-center">
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
		<div class="row mt-4">
			<div class="col text-end">
				<button type="button" class="btn btn-primary" id="planMakeBtn">신규 일정 생성</button>
			</div>
		</div>
		<div class="row">
			<div class="col  d-flex justify-content-center">
				<div class="btn-toolbar" role="toolbar" aria-label="Pagination">
					<div class="btn-group me-2 mb-2" role="group" aria-label="First group">
				
						<c:forEach var="i" items="${paging }">
						<a href="/plan/main?page=${i }">
						<button type="button" class="btn paging btn-primary m-2">
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