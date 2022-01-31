<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행지 게시판</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<jsp:include page="../base/header.jsp"></jsp:include>
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
        .container_c>.root{
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
        
        .fa-search{
            line-height: 30px;
            position: absolute;
            right: 8px;
            color: rgb(153, 153, 153);
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

                .nt_category, .nt_recruit, .nt_nick, .nt_writen_time, .nt_view_count, .nt_rec_count{
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

                .category, .mem_nick, .writen_time, .view_count, .rec_count{
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
</head>
<body>

    <!-- .banner에 이미지 추가해야한다.-->
    <div class="banner">
        <div class="banner_title">여행지 게시판</div>
        <div class="banner_content">각 지역의 여행 후기를 남겨보세요</div>
    </div>
    <div class="container_c">
        <div class="root">
            <div class="home"><a href="/"><i class="fas fa-home"></i></a></div>
            <div> > </div>
            <div class="community" href="/tourboard/list?cpage=1">커뮤니티</div>
            <div> > </div>
            <div class="tourboard"><a href="/tourboard/list?cpage=1">여행지 게시판</a></div>
        </div>
        <form action="/tourboard/list?cpage=1" method="post" id="frmSearch">
        <input type=hidden name="cpage" value=1>
        <div class="searchbar">
            <select name="searchOption">
                <option name="searchTitle" value="search_title">제목</option>
                <option name="searchId" value="search_writer">작성자</option>
            </select>
            <span>
            	<input id="searchText" name="searchText" type="text" list="trip" placeholder="Search">
            		<datalist id="trip">
            			<option value="여행지 추천">
            			<option value="맛집">
            			<option value="명소">
            			<option value="재미있게 다녀오는 방법">
            		</datalist>
            	<a class="fas fa-search" id="search_btn" onclick="$('#frmSearch').submit()"></a>
            </span>
        </div>
        </form>
        
        <div class="board">
            <div class="board_header">
                <div class="seq" style="width: 5%;">No</div>
                <div class="category" style="width: 10%;">머리말</div>
                <div class="title" style="width: 45%; text-align:center;">제목</div>
                <div class="mem_seq" style="width: 10%;">작성자</div>
                <div class="writen_time" style="width: 10%;">작성일</div>
                <div class="view_count" style="width: 10%;">조회수</div>
                <div class="rec_count" style="width: 10%;">추천수</div>     
            </div>
			
            <c:forEach var="n" items="${nt_list }">
    	  		<div class="notice_enroll">
       		        <div class="nt_seq" style="width: 5%;"><i class="fas fa-bullhorn"></i></div>
       		        <div class="nt_category" style="width: 10%;">공지</div>
       		        <div class="nt_title" style="width: 45%; text-align:left; padding-left:10px;"><a href="/tourboard/noticeDetail?seq=${n.seq}">${n.title }</a></div>
       		        <div class="nt_nick" style="width: 10%;">${n.nick }</div>
       		        <div class="nt_writen_time" style="width: 10%;">${n.writen_date }</div>
       		        <div class="nt_view_count" style="width: 10%;">${n.view_count }</div>
       		        <div class="nt_rec_count" style="width: 10%;">-</div>
       		        <div class="hide_nt_con">${n.nick } &nbsp/&nbsp <i class="far fa-clock"></i> ${n.writen_date } &nbsp/&nbsp <i class="far fa-eye"></i> ${n.view_count }</div>
       		    </div>
            </c:forEach>
            
            <c:forEach var="i" items="${list }">
    	  		<div class="board_enroll">
       		        <div class="seq" style="width: 5%;">${i.seq }</div>
       		        <div class="category" style="width: 10%; color: rgb(56, 181, 174); font-weight: bold">${i.category }</div>
       		        <div class="title" style="width: 45%; text-align:left; padding-left:10px;"><a href="/tourboard/detail?seq=${i.seq}">${i.title }&nbsp</a>
       		        	<i class="far fa-comment-dots" style="color: rgb(161, 161, 161)"></i><span id="rep_count" name="rep_count" style="color: red"> [${i.rep_count}] </span>
       		        </div>
       		        <div class="mem_nick" style="width: 10%;">${i.nick }</div>
       		        <div class="writen_time" style="width: 10%;">${i.writen_date }</div>
       		        <div class="view_count" style="width: 10%;">${i.view_count }</div>
       		        <div class="rec_count" style="width: 10%;">${i.rec_count }</div>
       		        <div class="hide_nt_con">${i.nick} &nbsp/&nbsp <i class="far fa-clock"></i> ${i.writen_date } &nbsp/&nbsp <i class="far fa-eye"></i> ${i.view_count} &nbsp/&nbsp <i class="far fa-heart"></i> ${i.rec_count } </div>	    	
       		    </div>
            </c:forEach>
        </div>
        <c:if test="${!empty loginEmailID}">
        <div class="button">
        	<input type=button class="btn btn-primary btn-sm" style="background-color: rgb(56, 181, 174); border: none;" value="작성하기" id="toWrite_btn">
        </div>
        </c:if>
        <div class="page">
            <div class="paging">
                <div>${navi  }</div>
            </div>
        </div>       
    </div>
    
    <footer>
    	    <jsp:include page="../base/footer.jsp"></jsp:include>
    </footer>
    
    <script>
    $("#search_btn").on("click", function(){
		
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
    
    <script>
    $("#toWrite_btn").on("click", function(){
		 location.href = "/tourboard/write";
	})
    </script>
</body>
</html>