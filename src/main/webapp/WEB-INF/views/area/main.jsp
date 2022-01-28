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

<jsp:include page="../base/header.jsp"></jsp:include>

</head>
<style>
* {
	 font-family: 'paybooc-Bold';
}

body {
	 font-family: 'paybooc-Bold';
}

.btn-toolbar {
	position: relative;
	top: 50px;
}

.triplist {
	cursor: pointer;
}

@font-face {
    font-family: 'paybooc-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/paybooc-Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>

<body>
		<div class="triplist">
				<img src="/images/trip-1.jpg" class="d-block w-100" alt="…">
		</div>
			<div class="container">
				<div class="row">
					<div class="col-6 d-flex align-items-start">
						<form action="/area/main" style="float: right; margin-top: 20px; position: relative; top: 30px; margin-bottom: 40px;">
								<input type="text" name="target"> 
								<input type="hidden" value=1 name="page"> 
								<input type="hidden" value="${contentType }" name="contentType"> 
								<input type="hidden" value="${areaCode }" name="area"> 
								<input type="submit" style="background-color: #f5e3b9; border-radius: 10px; width: 60px;">
						</form>
					</div>
					<div class="col-3 d-flex justify-content-end">
						<form action="/area/main" style="float: left; margin-top: 20px; position: relative;  top: 30px;">
								<select id=area name="area" style="width: 100px; height: 40px;">
									<option value="1">서울</option>
									<option value="2">인천</option>
									<option value="3">대전</option>
									<option value="4">대구</option>
									<option value="5">광주</option>
									<option value="6">부산</option>
									<option value="7">울산</option>
									<option value="8">세종</option>
									<option value="31">경기도</option>
									<option value="32">강원도</option>
									<option value="33">충청북도</option>
									<option value="34">충청남도</option>
									<option value="35">경상북도</option>
									<option value="36">경상남도</option>
									<option value="37">전라북도</option>
									<option value="38">전라남도</option>
									<option value="39">제주도</option>
								</select> 
								<input type=submit style="width: 50px; background-color: #f5e3b9; border-radius: 10px; width: 60px;">
								<input type="hidden" value=1 name="page"> 
								<input type="hidden" value="${contentType }" name="contentType">
								<c:if test="${target ne null}">
									<input type="hidden" value="${target }" name="target">
								</c:if>
						</form>
					</div>
					<div class="col-3 d-flex justify-content-end">
						<form action="/area/main" style="float: left; margin-top: 20px; position: relative; top: 30px;">
							<select id=contentType name=contentType style="width: 100px; height: 40px;">
								<option value=12>관광지</option>
								<option value=14>문화시설</option>
								<option value=15>행사/공연/축제</option>
								<option value=28>레포츠</option>
								<option value=32>숙박</option>
								<option value=38>쇼핑</option>
								<option value=39>음식점</option>
							</select> 
							<input type="hidden" value=1 name="page"> 
							<input type="hidden" value="${areaCode }" name="area">
							<c:if test="${target ne null}">
							<input type="hidden" value="${target }" name="target">
							</c:if>
							<input type=submit style="width: 50px; background-color: #f5e3b9; border-radius: 10px; width: 60px;">
						</form>
					</div>
				</div>
				<br>
				<c:if test="${list.size() > 0}">
					<div class="row">
						<c:forEach var="item" items="${list }">
							<div id="${item.contentid }" class="detail col-6 col-md-4 col-lg-3 align-items-center justify-content-center text-center">
								<c:if test="${item.firstimage ne null }">
									<img src="${item.firstimage}" style="width: 200px; height: 200px;">
								</c:if>
								<br>${item.title }
								<br>${item.contenttypeid }
								<br>${item.addr1 }
								<br>${item.cat1 }
							</div>
						</c:forEach>
					</div>
					<c:if test="${pageView.size()>0 }">

						<div class="btn-toolbar  d-flex justify-content-center" role="toolbar" aria-label="Pagination">
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