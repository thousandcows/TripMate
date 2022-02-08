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
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
<!-- fontawesome cdn -->
<!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
 -->
 
<style>

@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);

body, talbe, th, td, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6,
	pre, form, fieldset, textarea, blockquote, span, * {
	font-family: 'Noto Sans KR', sans-serif;
}
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

            /* 헤더----------------------------------------------------- */
            .banner{
                background-image:url("/images/community_banner.png");
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

            /* 미니 사이트맵 루트 */
            .root{
                padding-left: 150px;
                overflow: auto;
                text-align: center;
            }
    
            .root>div{
                float:left;
                margin: 40px 0px 40px 0px;
                padding-right: 10px;
            }
    
            .fa-home{
                color: rgb(56, 181, 174);
            }

            /* 검색창 */
            .searchbar{
                text-align: right;
                padding-right: 150px;
                height: 30px;
            }
            
            .searchbar > select{
                height: 30px;
            }
            
            .searchbar>span{
                position: relative;
            }
            
            .searchbar>input{
            	height: 30px;
            }
            
            .fa-search{
                line-height:30px;
                position: absolute;
                right: 8px;
                color: rgb(153, 153, 153);
                padding-top: 7px;
            }

            a:hover{
                cursor: pointer;
            }

            /* 게시글 올라오는 목록 부분 */
            .board_header{
                overflow: auto;
                width:100%;
            }

            .board_header>div{
                float: left;
                padding: 8px 0px 8px 0px;
                border-top: solid 3px rgb(56, 181, 174);
                border-bottom: solid 1.2px #404040; 
                background-color :white;
                width: 100%
            }

            .notice_enroll{
                overflow: auto;
                border-bottom: solid 1px rgb(207, 207, 207);  
            }
            
            .notice_enroll>div{
                float: left;
                padding: 8px 0px 8px 0px;
                /* border-top: solid 1px #404040; */
                          
            }

            .hide_nt_con{
                padding-left: 20px;
                display: none;
            }

            .board_enroll{
                overflow: auto;
                border-bottom: solid 1px rgb(207, 207, 207);  
            }

            .board_enroll>div{
                    float: left;
                    padding: 8px 0px 8px 0px;
            }

            .page{
                text-align: center;
                padding: 20px 0px 0px 0px;
                line-height: 20px;
            }

            /* 1400px ~  */
            @media (min-width: 1400px){
                /* 컨테이너 ----------------------------------------------------- */
                .container_c{
                    margin-left: 100px;
                    margin-right: 100px;
                    margin-bottom:50px;
                }
                
                .searchbar{
                	/* border: 1px solid red; */
                	text-align: right;
                	padding-right: 150px;
                	height: 30px;
            	}

                /* 게시글 올라오는 목록 부분 */
                .board{
                    width: 100%;
                    padding : 20px 150px 0px 150px;
                    text-align: center;
                }

                /* 작성 버튼 및 페이지네이션  */
                .button{
                    /* border: 1px solid red; */
                    text-align: right;
                    padding: 20px 150px 0px 0px ;
                }
               
            }
            

            /* 800 ~ 1400px */
            @media (max-width: 1400px) and (min-width: 800px){
                /* 컨테이너 ----------------------------------------------------- */
                .container_c{
                    margin-left: 0px;
                    margin-right: 0px;
                    margin-bottom:50px;
                }

                 /* 미니 사이트맵 루트 */
                 .root{
                    padding-left: 50px;
                    overflow: auto;
                    text-align: center;
                }

                /* 검색창 */
                .searchbar{
                    /* border: 1px solid red; */
                    text-align: right;
                    padding-right: 50px;
                    height: 30px;
                }

                /* 게시글 올라오는 목록 부분 */
                .board{
                    width: 100%;
                    padding : 20px 50px 0px 50px;
                    text-align: center;
                }	

                .board_header>div{
                    float: left;
                    padding: 8px 0px 8px 0px;
                    border-top: solid 1.5px rgb(56, 181, 174);
                    border-bottom: solid 1.2px #404040; 
                    background-color :white;
                    width: 100%;
                    font-size: small;
                }

                .notice_enroll>div{
                    float: left;
                    padding: 8px 0px 8px 0px;
                    font-size: small;       
                }

                .board_enroll>div{
                    float: left;
                    padding: 8px 0px 8px 0px;
                    font-size: small;
                }

                /* 작성 버튼 및 페이지네이션  */
                .button{
                    /* border: 1px solid red; */
                    text-align: right;
                    padding: 20px 50px 0px 0px ;
                }
            }


            /* ~ 800px */
            /* 작은 화면일 때 */
            @media (max-width: 800px){
            	/* 컨테이너 ----------------------------------------------------- */
                .container_c{
                    margin-left: 0px;
                    margin-right: 0px;
                    margin-bottom:50px;
                }
                
                /* 헤더 banner contents*/
                .banner_title{
                    width: 100%;
                    height: 70%;
                    color: white;
                    font-size: 35px;
                    font-weight: 600;
                    padding: 60px 0px 10px 0px;
                    text-align: center;
                }
    
                .banner_content{
                    width: 100%;
                    height: 30%;
                    color: white;
                    font-size: 15px;
                    font-weight: 500;
                    padding-left: 0px;
                    text-align: center;
                }

                 /* 미니 사이트맵 루트 */
                .root{
                    padding-left: 0px;
                    overflow: auto;
                    text-align: center;
                    display: none;
                }


                /* 검색창 */
                .searchbar{
                    text-align: center; 
                    height: 30px;
                    padding: 30px 0px 30px 0px;
                }

                #searchText{
                    width: 300px;
                }

                /* 게시글 올라오는 목록 부분 */
                .board{
                    width: 100%;
                    padding : 20px 15px 0px 15px;
                    text-align: center;
                }

                .board_header{
                    overflow: auto;
                    width:100%;
                    display: none;
                }
                
                .notice_enroll{
                    overflow: auto;
                    border-bottom: solid 1px rgb(207, 207, 207);  
                }

                .notice_enroll>div{
                    float: left;
                    padding: 8px 0px 8px 0px;
                             
                }

                .nt_seq{
                    width:8% !important;
                }
                .nt_title{
                    width: 80% !important;
                }

                .nt_tour, .nt_recruit, .nt_nick, .nt_writen_time, .nt_view_count, .nt_rec_count, .nt_gender{
                    display: none;
                }  

                .hide_nt_con{
                    padding-left: 10px !important;
                    display: block;
                    font-size: small;
                    color: rgb(172, 172, 172);
                }

                .board_enroll{
                    overflow: auto;
                    border-bottom: solid 1px rgb(207, 207, 207);  
                }

                .board_enroll>div{
                    float: left;
                    padding: 8px 0px 8px 0px;
                }

                .seq{
                    width:8% !important;
                }
                .title{
                    width: 80% !important;
                }

                .tour, .recruit, .mem_seq, .writen_date, .view_count, .expired, .gender{
                    display: none;
                }

                /* 작성 버튼 및 페이지네이션  */
                .button{
                    /* border: 1px solid red; */
                    text-align: right;
                    padding: 20px 15px 0px 0px ;
                }
            
            }     

</style>
    
<style type="text/css">
	li {list-style: none; float: left; padding: 6px;}
</style>
		<jsp:include page="../base/header.jsp" flush="true"></jsp:include>

</head>
<body>
	<div class = "banner">  <!-- 추후 banner background로 이미지 넣을 예정입니다. 지금은 임시로 단색채움.-->
        <div class="banner_title"> 동행 게시판 </div>
        <div class="banner_content"> 함께 여행갈 친구들을 만들어 보세요 </div>
    </div>

    <div class="container_c">
        <div class="root">
            <div class="home"><a href="/"><i class="fas fa-home"></i></a></div>
            <div> > </div>
            <div class="community"><a href="/companyboard/list?cpage=1">커뮤니티</a></div>
            <div> > </div>
            <div class="partyboard"><a href="/companyboard/list?cpage=1">동행게시판</a></div>
        </div>

		<form action="/companyboard/list?cpage=1" method="post" id="frmSearch">
		<input type=hidden name="cpage" value=1>
        <div class="searchbar">
            <select name="searchOption">
                <option name="searchTitle" value="search_title" selected>제목</option>
                <option name="searchId" value="search_writer">작성자</option>
            </select>
            <span>
            	<input id="searchText" name="searchText" type="text" placeholder="Search">
            	<a class="fas fa-search" onclick="$('#frmSearch').submit()"></a>
            </span>
            <!-- <button type=submit id=search class="btn btn-primary btn-sm" style="background-color: rgb(56, 181, 174);"><span style="font-size: small;">검색</span></button> -->
        </div>
        </form>

        <div class="board">
            <div class="board_header">
                <div class="seq" style="width: 5%;">No</div>
                <div class="tour" style="width: 7%;">여행지</div>
                <div class="title" style="width: 38%;">제목</div>
                <div class="recruit" style="width: 9%;">모집 인원</div>
                <div class="mem_seq" style="width: 10%;">작성자</div>
                <div class="write_date" style="width: 10%;">작성일</div>
                <div class="view_count" style="width: 7%;">조회수</div>
                <div class="gender" style="width: 7%;">모집</div>
                <div class="expired" style="width: 7%;">마감 여부</div>
            </div>
            
            <c:forEach var="n" items="${nt_list }">
    	  		<div class="notice_enroll">
       		        <div class="nt_seq" style="width: 5%;"><i class="fas fa-bullhorn"></i></div>
       		        <div class="nt_tour" style="width: 7%;">공지</div>
       		        <div class="nt_title" style="width: 38%; text-align:left; padding-left:10px;"><a href="/companyboard/noticeDetail?seq=${n.seq}">${n.title }</a></div>
       		        <div class="nt_recruit" style="width: 9%;">-</div>
       		        <div class="nt_nick" style="width: 10%;">${n.nick }</div>
       		        <div class="nt_writen_time" style="width: 10%;">${n.writen_date }</div>
       		        <div class="nt_view_count" style="width: 7%;">${n.view_count }</div>
       		        <div class="nt_gender" style="width: 7%;">-</div>
       		        <div class="nt_rec_count" style="width: 7%;">-</div>
       		        <div class="hide_nt_con">${n.nick } &nbsp/&nbsp <i class="far fa-clock"></i> ${n.writen_date } &nbsp/&nbsp <i class="far fa-eye"></i> ${n.view_count }</div>
       		    </div>
            </c:forEach>
            
            <c:forEach var="l" items="${list }">
            <div class="board_enroll">
            		<div class="seq" style="width: 5%;">${l.seq }</div>
                	<div class="tour" style="width: 7%; color: rgb(56, 181, 174); font-weight: bold">${l.tour }</div>
                	<div class="title" style="width: 38%; text-align:left; padding-left:10px"><a href="/companyboard/detail?seq=${l.seq}">${l.title }&nbsp</a>
                		<i class="far fa-comment-dots" style="color: rgb(161, 161, 161)"></i><span id="rep_count" name="rep_count" style="color: red"> [${l.rep_count}] </span></div>
                	<div class="recruit" style="width: 9%;">${l.recruit }</div>
                	<div class="mem_seq" style="width: 10%;">${l.nick}</div>
                	<div class="writen_date" style="width: 10%;">${l.writen_date }</div>
                	<div class="view_count" style="width: 7%;">${l.view_count}</div>
                	<div class="gender" style="width: 7%;">${l.gender }</div>
                	<div class="expired" style="width: 7%;">
                		<c:if test="${l.expired == '마감'}">
                			<span class="badge bg-danger">${l.expired }</span>
                		</c:if>
                		<c:if test="${l.expired == '진행'}">
                			<span class="badge bg-primary">${l.expired }</span>
                		</c:if>
                	</div>
                	<div class="hide_nt_con">${l.nick} &nbsp/&nbsp <i class="far fa-clock"></i> ${l.writen_date } &nbsp/&nbsp <i class="far fa-eye"></i> ${l.view_count} &nbsp/&nbsp ${l.gender } &nbsp/&nbsp<i class="far fa-user"></i> ${l.recruit } &nbsp/&nbsp
                		<c:if test="${l.expired == '마감'}">
                			<span class="badge bg-danger">${l.expired }</span>
                		</c:if>
                		<c:if test="${l.expired == '진행'}">
                			<span class="badge bg-primary">${l.expired }</span>
                		</c:if>
                	</div>	    	
            </div>
            </c:forEach> 
        </div>

		<c:if test="${!empty loginNick}">
        <div class="button">
        	<button type=button id=write class="btn btn-primary btn-sm" style="background-color: rgb(56, 181, 174); border: none;"><span style="font-size: small;">작성하기</span></button>
        </div>
        </c:if>

        <div class="page">
			<div class="paging">
               <div>${navi  }</div>
            </div>
		</div>
    </div>
    
    <div class="footer">
    	<jsp:include page="../base/footer.jsp"></jsp:include>
    </div>
    
    <script>
    	$("#write").on("click", function(){
 	   		location.href="/companyboard/write";
    	})
    </script>
    
    <!-- 검색기능 -->
    <script>
    $("#search").on("click", function(){
		
    	if($("#searchText").val()==""){
    		alert("검색어를 입력해주세요");
    		return false;
    	}
    	if($("#searchOption").val()==""){
    		alert("검색어를 선택해주세요");
    		return false;
    	}
    })
    </script>
</body>
</html>