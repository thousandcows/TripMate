<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행 게시판</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<jsp:include page="../base/header.jsp"></jsp:include>

    <!-- fontawesome cdn -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">

    <style>
        *{
            box-sizing: border-box;
        }

        body{
            margin: 0;  /* 임시로 body margin 0px */
        }

        /* 링크 속성 지우기 */
        a { text-decoration:none  } 
        a:hover { text-decoration:none; color: black; }
        a:link {text-decoration: none; color: black; }
        a:visited {text-decoration: none; color: black; }
        a:active {text-decoration: none; color: black; }

        /* div{border:1px solid black} */

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

        /* 컨테이너 ----------------------------------------------------- */
        .container{
            /* border:1px solid red; */
        }

        /* 미니 사이트맵 루트 */
        .container>.root{
            padding-left: 80px;
            overflow: auto;
        }

        .root>div{
           /*  border:1px solid red; */
            float:left;
            margin: 40px 0px 40px 0px;
            padding-right: 10px;
        }

        .fa-home{
            color: rgb(56, 181, 174);
        }

        /* 검색창 */
        .searchbar{
            /* border: 1px solid red; */
            text-align: right;
            padding-right: 80px;
            height: 30px;
        }
        
        .searchbar > button{
        	height: 30px;
        	border: none;
        }
        
        .searchbar > select{
        	height: 30px;
        }

        /* 게시글 올라오는 목록 부분 */
        .board{
            /* border: 1px solid red; */
            width: 100%;
            padding : 20px 80px 0px 80px;
            text-align: center;
        }

        .board_header{
            overflow: auto;
        }

        .board_header>div{
            float: left;
            padding: 8px 0px 8px 0px;
            border-top: solid 1px black;
            border-bottom: solid 1px #404040; 
            background-color :rgb(240, 240, 240);
            font-weight: 700;
        }

        .board_enroll{
            overflow: auto;
        }
        
        .board_enroll>div{
            float: left;
            padding: 8px 0px 8px 0px;
            /* border-top: solid 1px #404040; */
            border-bottom: solid 1px rgb(207, 207, 207);
        }

        /* 작성 버튼 및 페이지네이션  */
        .button{
            /* border: 1px solid red; */
            text-align: right;
            padding: 20px 80px 0px 0px ;
        }

        .page{
            /* border: 1px solid red; */
            text-align: center;
            padding: 20px 0px 0px 0px;
            line-height: 20px;
        }

       

    </style>
    
    <style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
	</style>

</head>
<body>
	<div class = "banner">  <!-- 추후 banner background로 이미지 넣을 예정입니다. 지금은 임시로 단색채움.-->
        <div class="banner_title"> 동행 게시판 </div>
        <div class="banner_content"> 함께 여행갈 친구들을 만들어 보세요 </div>
    </div>

    <div class="container">
        <div class="root">
            <div class="home"><a href="/"><i class="fas fa-home"></i></a></div>
            <div> > </div>
            <div class="community"><a href="/companyboard/list?cpage=1">커뮤니티</a></div>
            <div> > </div>
            <div class="partyboard"><a href="/companyboard/list?cpage=1">동행게시판</a></div>
        </div>

        <div class="searchbar">
            <select>
                <option value="search_title" selected>제목</option>
                <option value="search_writer">작성자</option>
                <option value="search_tour">여행지</option>
            </select>
            <input id="searchInput" type="text" placeholder="Search">
            <button type=button id=search class="btn btn-primary btn-sm" style="background-color: rgb(56, 181, 174);"><span style="font-size: small;">검색</span></button>
        </div>

        <div class="board">
            <div class="board_header">
                <div class="seq" style="width: 5%;">No</div>
                <div class="tour" style="width: 7%;">여행지</div>
                <div class="title" style="width: 44%;">제목</div>
                <div class="recruit" style="width: 9%;">모집 인원</div>
                <div class="mem_seq" style="width: 10%;">작성자</div>
                <div class="write_date" style="width: 10%;">작성일</div>
                <div class="view_count" style="width: 7%;">조회수</div>
                <div class="expired" style="width: 8%;">마감 여부</div>
            </div>
            
            <div class="board_enroll">
            	<c:forEach var="l" items="${list }">
            		<div class="seq" style="width: 5%;">${l.seq }</div>
                	<div class="tour" style="width: 7%; color: rgb(56, 181, 174); font-weight: bold">${l.tour }</div>
                	<div class="title" style="width: 44%; text-align:left; padding-left:10px"><a href="/companyboard/detail?seq=${l.seq}">${l.title }&nbsp</a>
                		<i class="far fa-comment-dots" style="color: rgb(161, 161, 161)"></i><span id="rep_count" name="rep_count" style="color: rgb(161, 161, 161)"> ${l.rep_count}</span></div>
                	<div class="recruit" style="width: 9%;">${l.recruit }</div>
                	<div class="mem_seq" style="width: 10%;">${l.mem_seq}</div>
                	<div class="writen_date" style="width: 10%;">${l.writen_date }</div>
                	<div class="view_count" style="width: 7%;">${l.view_count}</div>
                	<div class="expired" style="width: 8%;">${l.expired }</div>
            	</c:forEach> 
            </div>
        </div>

		
        <div class="button">
        	<button type=button id=write class="btn btn-primary btn-sm" style="background-color: rgb(56, 181, 174); border: none;"><span style="font-size: small;">작성하기</span></button>
        </div>

        <div class="page">
			<div class="paging">
               <div>${navi  }</div>
            </div>
		</div>
    </div>
    
    <script>
    	$("#write").on("click", function(){
 	   		location.href="/companyboard/write";
    	})
    </script>
</body>
</html>