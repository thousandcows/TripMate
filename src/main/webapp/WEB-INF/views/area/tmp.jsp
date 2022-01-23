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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Poor+Story&display=swap" rel="stylesheet">
</head>
<style>
    
    * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
                font-family: 'Poor Story', cursive;
                font-size: 25px;
            }
    
            body {
                position: relative;
                background-color: #ffffff;
                margin: 0px;
                font-family: 'Poor Story', cursive;
            }

    header li{
                 display:inline;
                 padding-left: 50px;
                
      
    }

    header li a{
      color:white;
      text-decoration: none;
      padding: 15px;
      transition: .3s ease;
      
    }
    header li a:hover{
      color: #000000;
    }

    

    </style>
<body>
 <!-- Basic navbar -->
    <header class="navbar navbar-expand-lg navbar-light" style="background-color: #2cd4c6;">
    <div class="container">
  
      <!-- Brand -->
      <a class="navbar-brand d-none d-lg-block order-lg-1" href="Tripmate main.html">
        <img width="142" src="/images/tripmate.png" alt="TripMate"/>
      </a>
      
   
      <!-- Toolbar -->
      <div class="navbar-toolbar d-flex align-items-center order-lg-3">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
          <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-tool" href="#">
          <div class="navbar-tool-icon-box"></div>
        </a>
        <a class="navbar-tool ms-1 me-n1" href="#">
          <div class="navbar-tool-icon-box">
            <i class="navbar-tool-icon ci-user"></i>
          </div>
        </a>
       
      </div>
  
      <!-- Collapsible menu -->
      <div class="collapse navbar-collapse me-auto order-lg-2" id="navbarCollapse">
        <hr class="d-lg-none my-3">
        <ul class="navbar-nav">
          <li class="nav-item active"><a class="nav-link" href="Tripmate List.html">여행지</a></li>
          <li class="nav-item"><a class="nav-link" href="#">여행일정</a></li>
          <li class="nav-item active"><a class="nav-link" href="/tourboard/list">여행게시판</a></li>
          <li class="nav-item"><a class="nav-link" href="/companyboard/list">동행게시판</a></li>
          <li class="searchbar"> <i class="fas fa-search"></i><input class="form-control rounded-start" type="text" placeholder="Search for products" size="20">
          
          </div>
          
          </li>
        </ul>
      </div>
    </div>
  </header>
  
   <div id="tirp list" class="triplist">
    
    <div class="triplist">
      <div class="triplist">
        <src="/images/trip-1.jpg" class="d-block w-100" alt="…">
        
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
				let target = '${target}';
			
			if(target == ""){
				location.href="/area/main?area="+${areaCode}+"&contentType="+${contentType}+"&page="+val;				
			}else{
				location.href="/area/main?area="+${areaCode}+"&contentType="+${contentType}+"&target=${target}&page="+val;
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
	
	 <script>
	$("#click").on("click", function(){
		 location.href = "/tourboard/list";
	})
	</script>
	
	<script>
		$("#toParyBoard").on("click", function() {
			location.href = "/companyboard/list";
		})
	</script>
	
	<script>
		document.querySelector("#loginProc").addEventListener("click", () => {
			location.href = "/member/Proc";
		})
	</script>
	
	<script>
		$("#triplist").on("click", function() {
			location.href="/area/main?area=0&contentType=0&page=1";
		})
	</script>
</body>
</html>