<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행지 탐색</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<c:if test="${pageNo ne 1 }">
<script>
window.onload = function(){
	window.scrollTo({left:0,top:500,behavior:'auto'});
};
</script>
</c:if>
<jsp:include page="../base/header.jsp"></jsp:include>

</head>
<style>

.btn-toolbar {
	position: relative;
	top: 50px;
}

.detail:hover{
	cursor:pointer;
}
.form{
	float: left;
	margin-top: 20px;
	position: relative; 
	top: 30px;
}
.formSearch{
	float: right;
	margin-top: 20px; 
	position: relative; 
	top: 30px; 
	margin-bottom: 40px;"
}
.triplist{
	height:200px;
	overflow:hidden;
	margin:0 auto;
}
.triplist>img{
	width:100%;
	height:100%;
	object-fit:cover;
}
.select{
	width: 100px; 
	height: 40px;
}
.searchSubmit{
	background-color: #f5e3b9; 
	border-radius: 10px; 
	width: 60px;
}
.listPhoto{
	height: 250px;
}
.card{
	border:none;
}

.detail:hover>*>*{
	opacity:1;
}
.card-text{
	background-color:black;
	opacity:0.6;
}
.card-img-overlay{
	padding-right:13px;
	padding-left:13px;
}
</style>

<body>
		<div class="triplist">
				<img src="/images/trip-1.jpg" class="d-block w-100" alt="…">
		</div>
			<div class="container" id="container">
				<div class="row">

					<div class="col-4 d-flex justify-content-start">
						<div class="me-2">
						<form action="/area/main" class="form">
								<select id=area name="area" onchange="this.form.submit()" class="select">								
									<option value="0" <c:if test="${areaCode eq 0}">selected</c:if>>전지역</option>
									<option value="1" <c:if test="${areaCode eq 1}">selected</c:if>>서울</option>
									<option value="2" <c:if test="${areaCode eq 2}">selected</c:if>>인천</option>
									<option value="3" <c:if test="${areaCode eq 3}">selected</c:if>>대전</option>
									<option value="4" <c:if test="${areaCode eq 4}">selected</c:if>>대구</option>
									<option value="5" <c:if test="${areaCode eq 5}">selected</c:if>>광주</option>
									<option value="6" <c:if test="${areaCode eq 6}">selected</c:if>>부산</option>
									<option value="7" <c:if test="${areaCode eq 7}">selected</c:if>>울산</option>
									<option value="8" <c:if test="${areaCode eq 8}">selected</c:if>>세종</option>
									<option value="31"<c:if test="${areaCode eq 31}">selected</c:if>>경기도</option>
									<option value="32" <c:if test="${areaCode eq 32}">selected</c:if>>강원도</option>
									<option value="33" <c:if test="${areaCode eq 33}">selected</c:if>>충청북도</option>
									<option value="34" <c:if test="${areaCode eq 34}">selected</c:if>>충청남도</option>
									<option value="35" <c:if test="${areaCode eq 35}">selected</c:if>>경상북도</option>
									<option value="36" <c:if test="${areaCode eq 36}">selected</c:if>>경상남도</option>
									<option value="37" <c:if test="${areaCode eq 37}">selected</c:if>>전라북도</option>
									<option value="38" <c:if test="${areaCode eq 38}">selected</c:if>>전라남도</option>
									<option value="39" <c:if test="${areaCode eq 39}">selected</c:if>>제주도</option>
								</select> 
								<input type="hidden" value=1 name="page"> 
								<input type="hidden" value="${contentType }" name="contentType">
								<c:if test="${target ne null}">
									<input type="hidden" value="${target }" name="target">
								</c:if>
						</form>
						</div>
						<div>
						<form action="/area/main" class="form">
							<select id=contentType name=contentType class="select" onchange="this.form.submit()">
								<option value=0 <c:if test="${contentType eq 0}">selected</c:if>>카테고리</option>
								<option value=12 <c:if test="${contentType eq 12}">selected</c:if>>관광지</option>
								<option value=14 <c:if test="${contentType eq 14}">selected</c:if>>문화시설</option>
								<option value=15 <c:if test="${contentType eq 15}">selected</c:if>>행사/공연/축제</option>
								<option value=28 <c:if test="${contentType eq 28}">selected</c:if>>레포츠</option>
								<option value=32 <c:if test="${contentType eq 32}">selected</c:if>>숙박</option>
								<option value=38 <c:if test="${contentType eq 38}">selected</c:if>>쇼핑</option>
								<option value=39 <c:if test="${contentType eq 39}">selected</c:if>>음식점</option>
							</select> 
							<input type="hidden" value=1 name="page"> 
							<input type="hidden" value="${areaCode }" name="area">
							<c:if test="${target ne null}">
							<input type="hidden" value="${target }" name="target">
							</c:if>
						</form>
						</div>
					</div>
					<div class="col-8 d-flex justify-content-end">
						<form action="/area/main" class="formSearch">
								<input type="text" name="target" required placeholder="장소명을 입력해 주세요."> 
								<input type="hidden" value=1 name="page"> 
								<input type="hidden" value="${contentType }" name="contentType"> 
								<input type="hidden" value="${areaCode }" name="area"> 
								<input type="submit" value="검색" class="searchSubmit">
						</form>
					</div>
				</div>
				<br>
				<c:if test="${empty list }">
					<div class="text-center mt-4">
					<span>검색 결과가 없습니다.</span>
					</div>
				</c:if>
				<c:if test="${list.size() > 0}">
					<div class="row">

						<c:forEach var="item" items="${list }">
							<div id="${item.contentid }" class="detail col-6 col-md-4 col-lg-3 card text-center mt-2">
								<c:if test="${item.firstimage ne 'null' }">
									<img src="${item.firstimage}" class="listPhoto card-img ">
								</c:if>
								<c:if test="${item.firstimage eq 'null' }">
									<img src="/images/noPhoto.png" class="listPhoto card-img ">
								</c:if>
								<div class="card-img-overlay d-flex align-items-end flex-column mt-2 pb-0 pt-1">
								<p class="card-text text-white w-100 mt-auto ">
								${item.title }<br>
								${item.contenttypeid }<br>
								${item.addr1 }</p>
								</div>
							</div>
						</c:forEach>
					</div>
					<c:if test="${pageView.size()>0 }">

						<div class="btn-toolbar  d-flex justify-content-center mb-5" role="toolbar" aria-label="Pagination">
							<div class="btn-group me-2 mb-2" role="group" aria-label="First group">
								<c:forEach var="i" items="${pageView }">
									<c:choose>
										<c:when test="${i eq -1 }">
											<button type="button" class="btn btn-outline-secondary page"
												id=${i }><</button>
										</c:when>
										<c:when test="${i eq -2 }">
											<button type="button" class="btn btn-outline-secondary page"
												id=${i }>></button>
										</c:when>
										<c:when test="${i eq pageNo }">
											<button type="button" class="btn btn-outline-secondary page"
												style="background-color: #f5e3b9;" id=${i }>${i }
											</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn btn-outline-secondary page"
												id=${i }>${i }</button>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</div>
					</c:if>
				</c:if>
			</div>
    	  <jsp:include page="../base/footer.jsp"></jsp:include>
				<script>
					$(".detail").on("click", function() {
						location.href = "/area/detail?num=" + this.id;
					})

					$(".page").on("click", function() {
						let val = 0;
						let arr = ${pageView};
						if (this.id == -1) {
							val = arr[1] - 1;
						} else if (this.id == -2) {
							val = arr[arr.length - 2] + 1;
						} else {
							val = this.id;
						}
						let target = '${target}';

						if (target == "") {
							location.href = "/area/main?area=" + ${areaCode}+"&contentType=" + ${contentType}+"&page=" + val;
						} else {
							location.href = "/area/main?area=" + ${areaCode}+"&contentType=" + ${contentType}+"&target=${target}&page=" + val;
						}
					})
				</script>
</body>
</html>