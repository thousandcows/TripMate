<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
 <style>
        * {box-sizing: border-box;}

        body{
            margin: 0;  /* 임시로 body margin 0px */
        }

        /* div{border:1px solid black} */

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

        .container{
            border:1px solid red;
        }

        .container>.root{
            padding-left: 80px;
            overflow: auto;
        }

        .root>div{
            border:1px solid red;
            float:left;
            margin: 40px 0px 40px 0px;
            padding-right: 10px;
        }

        .writeForm{
            border: 1px solid red;
        }
    
        .writeForm>div{
            border: 1px solid red;
        }

        .writeForm>.title>input{
            width: 100%;
        }

        .writeForm>.contents>input{
            width: 100%;
            height: 300px;
        }
        .btn{
            border: 1px solid red;
            width: 100%;
            text-align: right;
        }
        
        /* 링크 속성 지우기 */
        a { text-decoration:none  } 
        a:hover { text-decoration:none; color: black; }
        a:link {text-decoration: none; color: black; }
        a:visited {text-decoration: none; color: black; }
        a:active {text-decoration: none; color: black; }
        
        .fa-home{
            color: rgb(56, 181, 174);
        }
	</style>
</head>
   
<body>
	<form action="/tourboard/writeProc" method="post" enctype="multipart/form-data">
    <!-- .banner에 이미지 추가해야한다.-->
    <div class="banner">
        <div class="banner_title" href="">여행지 게시판</div>
        <div class="banner_content">각 지역의 여행 후기를 남겨보세요</div>
    </div>
    <div class="container">
        <div class="root">
            <div class="home"><i class="fas fa-home" href=""></i></div>
            <div> > </div>
            <div class="community" href="">커뮤니티</div>
            <div> > </div>
            <div class="tourboard" href="">여행지 게시판</div>
        </div>
        <div class="writeForm">
            <div class="title">
                <input type=text placeholder="제목을 입력하세요" name="title">
            </div><br>
            <div class="contents">
                <input type=text placeholder="내용을 입력하세요" name="contents">
            </div>
        </div>
        <div class="btn">
        	<input type=button id="list_btn" value="목록으로">
            <input type=submit id="write_btn" value="작성하기">
        </div>
    </div>    
    </form>
    <script>
    $("#list_btn").on("click", function(){
	    	history.back();
	    })
    </script>
</body>
</html>