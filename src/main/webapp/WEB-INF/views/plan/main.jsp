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
        
        .banner{
                background-image:url("/images/banner.png");
                height:200px;
            }
        
</style>
</head>
<body>
	<div class = "banner">  <!-- 추후 banner background로 이미지 넣을 예정입니다. 지금은 임시로 단색채움.-->
		<div class="banner_title">  </div>
		<div class="banner_content">  </div>
	</div>
	<div class="container mt-4">
		<div class="row border mt-4 d-flex justify-content-center">
				<c:set var="now" value="<%=new java.util.Date()%>" />
				<c:forEach var="i" items="${list }">
						<div class="card p-2 m-2" style="width: 18rem;
						<c:choose>
							<c:when test="${i.theme eq '힐링 여행'}">
								background-color: #FF8C94;
							</c:when>
							<c:when test="${i.theme eq '먹거리 투어'}">
								background-color: #FFAAA6;		
							</c:when>
							<c:when test="${i.theme eq '관광지 투어'}">
								background-color: #FFD3B5;
							</c:when>
							<c:when test="${i.theme eq '액티비티'}">
								background-color: #DCEDC2;
							</c:when>
							<c:when test="${i.theme eq '기분따라'}">
								background-color: #A8E6EC;
							</c:when>
						</c:choose>
						">
							<a href="/plan/detail?seq=${i.seq }">
						
								  <div class="card-body">
								    <h5 class="card-title">${i.title }</h5>
								    <h6 class="card-subtitle mb-2 text-muted">${i.theme }</h6>
								    <p class="card-text">							
									<span>시작일 : ${i.startDate }</span><br>
									<span>종료일 : ${i.endDate }</span>
									</p>	
								  </div>
						</a>
						</div>
							
				</c:forEach>
		</div>
		<div class="row mt-4">
			<div class="col text-end">
				<button type="button" class="btn btn-light" style="background-color:#f5e3b9;" id="planMakeBtn">신규 일정 생성</button>
			</div>
		</div>
		<div class="row">
			<div class="col  d-flex justify-content-center">
				<div class="btn-toolbar" role="toolbar" aria-label="Pagination">
					<div class="btn-group me-2 mb-2" role="group" aria-label="First group">
				
						<c:forEach var="i" items="${paging }">
						<a href="/plan/main?page=${i }">
						<button type="button" class="btn paging btn-light m-2" style="background-color: #f5e3b9;">
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