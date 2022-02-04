<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행지 게시판</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 
<!-- fontawesome cdn -->
<!--     <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
    integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"> -->


<!-- datepicker -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
<!-- include libraries(jQuery, bootstrap) -->
<!-- 	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
	
<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <jsp:include page="../base/header.jsp"></jsp:include>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            /* 임시로 body margin 0px */
        }

        /* 링크 속성 지우기 */
        a {
            text-decoration: none
        }

        a:hover {
            text-decoration: none;
            color: black;
        }

        a:link {
            text-decoration: none;
            color: black;
        }

        a:visited {
            text-decoration: none;
            color: black;
        }

        a:active {
            text-decoration: none;
            color: black;
        }

        /* input style */
        input:focus {outline:none;}
        
        input{autocomplete:"off";}

        /* 헤더----------------------------------------------------- */
        .banner {
            background-image:url("/images/community_banner.png");
           	height:200px;
        }

        .banner_title {
            width: 100%;
            height: 70%;
            color: white;
            font-size: 35px;
            font-weight: 600;
            padding: 60px 0px 10px 100px;
        }

        .banner_content {
            width: 100%;
            height: 30%;
            color: white;
            font-size: 15px;
            font-weight: 500;
            padding-left: 100px;
        }

         /* 미니 사이트맵 루트 */
         .root {
            padding-left: 80px;
            overflow: auto;
            text-align: center;
            font-size: 16px;
        }

        .root>div {
            
            float: left;
            margin: 40px 0px 40px 0px;
            padding-right: 10px;
        }

        .fa-home {
            color: rgb(56, 181, 174);
        }

        /* 컨테이너 ----------------------------------------------------- */
        .container_c {
            margin-left: 200px;
            margin-right: 200px;
            padding-bottom: 30px;
            overflow: auto;
        }

        /* 제목, 글 */
        .board {
            width: 100%;
            padding: 20px 80px 0px 80px;
        }

        .title {
            width: 100%;
            padding: 5px;
            
        }

        #title{
			display: inline; 
			font-size: 30px; 
			font-weight: 500; 
			border: none; 
			width: 80%;
			padding-left: 10px;
		}

        .write_con {
            width: 100%;
            padding: 5px;
        }

        .write_con>textarea {
            width: 100%;
            height: 500px;
            resize: none;
        }

        /* 버튼 */
        .button {
            text-align: right;
            padding: 20px 5px 0px 0px;
        }
        
        .button> button{
        	margin: 2px;
        }
        
         /* 작성자/조회수칸 */
         .writer_con{
            width: 100%;
            height: 100%;
            border-bottom: 1px solid black;
            margin-top: 20px;
			margin-bottom: 20px;
            padding-bottom: 20px;
            padding-left: 15px;
        }
        
        .writer_con>div{
            width: 100%;
            height: 50%;
            line-height:25px;
            color: gray;
        }

        /* 1400px ~  */
        @media (min-width: 1400px){}
  
        /* 800 ~ 1400px */
        @media (max-width: 1400px) and (min-width: 800px){

            /* 컨테이너 */
			.container_c {
				margin-left: 50px;
				margin-right: 50px;
				padding-bottom: 30px;
				overflow: auto;
			}

			/* 미니 사이트맵 루트 */
			.root{
				padding-left: 5px;
				overflow: auto;
				text-align: center;
				font-size: 16px;
			}

            #title{
				display: inline; 
				font-size: 25px; 
				font-weight: 500; 
				border: none; 
				width: 80%;
				padding-left: 10px;
			}

            /* 제목, 글 */
			.board {
				width: 100%;
				padding: 20px 0px 0px 0px;
			}
        }

        /* ~ 800px */
        /* 작은 화면일 때 */
        @media (max-width: 800px){

            /* 컨테이너 */
			.container_c {
				margin-left: 10px;
				margin-right: 10px;
				padding-bottom: 30px;
				overflow: auto;
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

            #title{
				display: inline; 
				font-size: 25px; 
				font-weight: 500; 
				border: none; 
				width: 80%;
				padding-left: 10px;
			}

            /* 제목, 글 */
			.board {
				width: 100%;
				padding: 20px 0px 0px 0px;
			}


        }
        
       
        
    </style>
    
</head>
           
<body>

	<div class="banner">
        <!-- 추후 banner background로 이미지 넣을 예정입니다. 지금은 임시로 단색채움.-->
        <div class="banner_title"> 여행지 게시판 </div>
        <div class="banner_content"> 각 지역의 여행 후기를 남겨보세요 </div>
    </div>
    
    <div class="container_c">
        <div class="root">
            <div class="home"><a href="/"><i class="fas fa-home"></i></a></div>
            <div> > </div>
            <div class="community"><a href="/companyboard/list?cpage=1">커뮤니티</a></div>
            <div> > </div>
            <div class="partyboard"><a href="/companyboard/list?cpage=1">여행지 게시판</a></div>
        </div>
    
        <form  action="/companyboard/modify" method="post" id="frmDetail">
            <div class="board">
            	<input type=hidden value="${dto.seq}" name=seq > <!-- 글 번호에 맞춰 불러오기 위한 꼼수 -->
            	<div class="title">
                    <span style="width: 80%;">
                        <input type=text id=title name=title readonly value="${dto.title }" style="display: inline; font-size: 20px; font-weight: bold; border: none; width: 90%;">
                    </span>
                </div>
                <div class = writer_con>
                    <div class="writer_nick">
                           <input type=hidden value="${dto.nick}" name=nick >
                        <div> ${dto.nick}</div>
                    </div>
                    <div class="view_con">
                        <div>조회수 ${dto.view_count}</div>
                    </div>
                </div>
    
                <div class="write_con">
                    ${dto.contents }
                </div>
    
    			<div class="button">
                		<button type=button id=back class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">목록</span></button>
                </div>
           </div>
      </form>
      </div>
      
	<footer>
    	    <jsp:include page="../base/footer.jsp"></jsp:include>
    </footer>

	    
    
    <!-- 목록으로 / 삭제하기 -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		var $j360 = jQuery.noConflict();	
	
		$j360("#back").on("click", function(){
			history.back();
		})
	</script>
	

</body>
</html>