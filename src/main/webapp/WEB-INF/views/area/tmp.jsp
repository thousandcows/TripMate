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
	<form action="/area/main">
		<input type="text" name="target">
			<input type="hidden" value=1 name="page">
	<input type="hidden" value="${contentType }" name="contentType">
	<input type = "hidden" value="${areaCode }" name="area">
	
		<input type="submit">
	</form>

	<form action="/area/main">
	<select id=area name="area">
		<option value="1">서울</option>
		<option value ="2">인천</option>
		 <option value ="3">대전</option>
		 <option value ="4">대구</option>
		 <option value ="5">광주</option>
		 <option value ="6">부산</option>
		 <option value ="7">울산</option>
		 <option value ="8">세종</option>
		 <option value ="31">경기도</option>
		 <option value ="32">강원도</option>
		 <option value ="33">충청북도</option>
		 <option value ="34">충청남도</option>
		 <option value ="35">경상북도</option>
		 <option value ="36">경상남도</option>
		 <option value ="37">전라북도</option>
		 <option value ="38">전라남도</option>
		 <option value ="39">제주도</option>
	</select>
	<input type=submit>
	<input type="hidden" value=1 name="page">
	<input type="hidden" value="${contentType }" name="contentType">
		<c:if test="${target ne null}">
			<input type="hidden" value="${target }" name="target">
		</c:if>

	</form>

	<form action="/area/main">
		<select id=contentType name=contentType>
		<option value =12>관광지</option>
		<option value =14>문화시설</option>
		<option value =15>행사/공연/축제</option>
		<option value =25>여행코스</option>
		<option value =28>레포츠</option>
		<option value =32>숙박</option>
		<option value =38>쇼핑</option>
		<option value =39>음식점</option>
		</select>		 
		<input type = "hidden" value=1 name="page">
		<input type = "hidden" value="${areaCode }" name="area">
		<c:if test="${target ne null}">
			<input type="hidden" value="${target }" name="target">
		</c:if>
		<input type=submit>
		
	</form>
	<c:if test="${pageView.size()>0 }">
	<c:forEach var="i" items="${pageView }">
		<div class=page id=${i }>
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
		</div>		
	</c:forEach>
	</c:if>
	<script>
		$(".page").on("click",function(){
			let val = 0;
			let arr = ${pageView};
				if(this.id==-1){
					val = arr[1]-1;
				}else if(this.id==-2){
					val = arr[arr.length-2]+1;
				}else{
					val = this.id;
				}
			let target =${target};
			if(target ==null){
				location.href="/area/main?area="+${areaCode}+"&contentType="+${contentType}+"&page="+val;				
			}else{
				location.href="/area/main?area="+${areaCode}+"&contentType="+${contentType}+"&target="+target+"&page="+val;
			}
		})
	</script>
	<br>
	${pageNo }현재페이지<br>
	
	<c:if test="${list.size() > 0}">
	<c:forEach var="item" items="${list }">
		<div class="detail" id="${item.contentid }">
		${item.title }<br>
		${item.contenttypeid }<br>
		${item.addr1 }<br>
		${item.areacode}<br>
		${item.cat3}<br>
		${item.cat1 }<br>
		${item.readcount }<br>
		<c:if test="${item.firstimage ne null }">
			<img src="${item.firstimage}"><br>
		</c:if>
		</div>
		
		<p></p> 
	</c:forEach>
	</c:if>
	<script>
		$(".detail").on("click",function(){
			location.href = "/area/detail?num="+this.id;
		})
	</script>
</body>
</html>