<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trip Mate</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

 <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
    />
    <link rel="stylesheet" href="css/animations.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Khula:wght@800&family=Noto+Sans+KR:wght@100;300;700;900&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    

</head>

<style>
         html,body{ margin:0 !important; padding:0; width:100%; height:100%;}
         *{box-sizing: border-box;}

        .box {  width:100%; height:100%;}
    
        .box > .trip{
            width: 800px;
            height: 400px;
            margin: auto;
            padding: 100px;
            text-align: center;
        }
        .box > .sub_trip{
            width: 70%;
            height: 50%;
            margin: auto;
        }
        .sub_trip > div{
            float: left;
            width: 25%;
            height: 100%;
        }
        .sub_trip > div :nth-child(1){
            width: 100%;
            height: 50%;
            padding: 25px 40px 25px 40px;
        }
        .sub_trip > div :nth-child(2){
            width: 100%;
            height: 20%;
        }
        .sub_trip > div :nth-child(3){
            width: 100%;
            height: 30%;
        }

        .box > .trip2{
            width: 100%;
            height: 100%;
            padding: 50px 100px 150px 100px;
            /* border: 1px solid red; */
        }
        .box > .trip2 > div{
            width: 100%;
            height: 25%;
            /* border: 1px solid red; */
        }
        .box > .trip2 > div > p{
            color: white;
            font-size: 35px; 
            font-family: 'Noto Sans KR', sans-serif;
        }
        .box > .trip2 > div > p > .highlight{
            color: white;
            font-size: 80px; 
            font-family: 'Noto Sans KR', sans-serif;
            font-weight: 900px;
        }

        .box > .trip2 > div p:hover {
            color: #fff
        }
        .box > .trip2 > div .highlight {
            position: relative;
            font-weight: bold;
            color: #fff;
        }
        .box > .trip2 > div .highlight::after {
            content: '';
            display: block;
            width: 0;
            height: 5px;
            position: absolute;
            left: 0;
            bottom: 0px;
            background: rgb(255, 0, 0);
        }
        .box > .trip2 > div p:hover .highlight::after {
            width: 100%;
            transition: width .3s;
        }

        button{
        background:rgb(56, 181, 174);;
        color:#fff;
        border:none;
        position:relative;
        height:60px;
        font-size: 25px;
        font-family: 'Noto Sans KR', sans-serif;
        font-weight: 700;
        padding:0 2em;
        cursor:pointer;
        transition:800ms ease all;
        outline:none;
        }
        button:hover{
        background:#fff;
        color:rgb(56, 181, 174);;
        }
        button:before,button:after{
        content:'';
        position:absolute;
        top:0;
        right:0;
        height:2px;
        width:0;
        background: rgb(56, 181, 174);;
        transition:400ms ease all;
        }
        button:after{
        right:inherit;
        top:inherit;
        left:0;
        bottom:0;
        }
        button:hover:before,button:hover:after{
        width:100%;
        transition:800ms ease all;
        }

        @keyframes fade_in {
         0% { opacity:0; left:40%;}
         100% { opacity:1; left:50%;} 
        }
    
        </style>

        
    <style>
        @import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,500,900);
        @import url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css);
        div.snip1382 {
        font-family: 'Source Sans Pro', Arial, sans-serif;
        position: relative;
        overflow: hidden;
        margin: 0px;
        min-width: 100%;
        max-width: 100%;
        max-height: 100%;
        width: 100%;
        height: 100%;
        color: #ffffff;
        text-align: center;
        font-size: 16px;
        }
        div.snip1382 * {
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        -webkit-transition: all 0.35s ease;
        transition: all 0.35s ease;
        }
        div.snip1382 img {
        max-width: 100%;
        }
        div.snip1382:after,
        div.snip1382:before,
        div.snip1382 figcaption:after,
        div.snip1382 figcaption:before {
        background: #0a0a0a;
        height: 25%;
        position: absolute;
        content: '';
        opacity: 0;
        -webkit-transition: all 0.35s steps(4);
        transition: all 0.35s steps(4);
        z-index: 1;
        left: 50%;
        right: 50%;
        }
        div.snip1382:before {
        top: 0;
        -webkit-transition-delay: 0;
        transition-delay: 0;
        }
        div.snip1382:after {
        top: 25%;
        -webkit-transition-delay: 0.1s;
        transition-delay: 0.1s;
        }
        div.snip1382 figcaption:before {
        top: 50%;
        -webkit-transition-delay: 0.2s;
        transition-delay: 0.2s;
        z-index: -1;
        }
        div.snip1382 figcaption:after {
        top: 75%;
        -webkit-transition-delay: 0.3s;
        transition-delay: 0.3s;
        z-index: -1;
        }
        div.snip1382 figcaption {
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        z-index: 2;
        padding: 30px;
        }
        div.snip1382 h2,
        div.snip1382 p,
        div.snip1382 .icons {
        margin: 0;
        width: 100%;
        opacity: 0;
        }
        div.snip1382 .icons {
        position: absolute;
        bottom: 200px;
        left: 0;
        width: 100%;
        }
        div.snip1382 i {
        padding: 0px 10px;
        display: inline-block;
        font-size: 24px;
        color: #ffffff;
        text-align: center;
        opacity: 0.8;
        text-decoration: none;
        }
        div.snip1382 i:hover {
        opacity: 1;
        }
        div.snip1382:hover:after,
        div.snip1382.hover:after,
        div.snip1382:hover:before,
        div.snip1382.hover:before,
        div.snip1382:hover figcaption:after,
        div.snip1382.hover figcaption:after,
        div.snip1382:hover figcaption:before,
        div.snip1382.hover figcaption:before {
        left: 0;
        right: 0;
        opacity: 0.8;
        }
        div.snip1382:hover figcaption h2,
        div.snip1382.hover figcaption h2,
        div.snip1382:hover figcaption p,
        div.snip1382.hover figcaption p,
        div.snip1382:hover figcaption .icons,
        div.snip1382.hover figcaption .icons {
        -webkit-transition-delay: 0.25s;
        transition-delay: 0.25s;
        }
        div.snip1382:hover figcaption h2,
        div.snip1382.hover figcaption h2,
        div.snip1382:hover figcaption .icons,
        div.snip1382.hover figcaption .icons {
        opacity: 1;
        }
        div.snip1382:hover figcaption p,
        div.snip1382.hover figcaption p {
        opacity: 0.7;
        }
    </style>
    
    
<body>

<div class="box" style="background-image: URL(/images/full_img1.png); text-align: center;">
        <div class="trip">
           <h2 class="animate__animated animate__fadeInDown" style="margin:0; color: rgb(46, 46, 46); font-size: 70px; font-weight: 200; font-family: 'Khula', sans-serif;">TRIP MATE</h2>
           <h5 class="animate__animated animate__fadeInDown" style="margin:0; font-weight:300; color: rgb(46, 46, 46); font-size: 20px; font-family: 'Noto Sans KR', sans-serif;">나만의 여행 플래너</h5>
           <h5 class="animate__animated animate__fadeInDown" style="margin:0; font-weight:300; color: rgb(46, 46, 46); font-size: 20px; font-family: 'Noto Sans KR', sans-serif;">재미있게, 능동적으로 여행을 계획하고 경험을 공유해보세요!</h5>
        </div>
            
        <div class="sub_trip animate__animated animate__slideInUp">
            <div>
                <div><img src="/images/travel-bag.png" style="width: 100%; height: 100%;"></div>
                <div><h5 style="margin:0; color: rgb(46, 46, 46); font-size: 25px; font-family: 'Noto Sans KR', sans-serif; font-weight: 700; width: 100%; height: 100%;">여행지</h5></div>
                <div><h5 style="margin:0; padding:0px; font-weight:300; color: rgb(46, 46, 46); font-size: 18px; font-family: 'Noto Sans KR', sans-serif;">국내의 다양한 여행지를 <br> 구경 하고, 리뷰도 남겨보세요</h5></div>
            </div>
            <div>
                <div><img src="/images/list.png" style="width: 100%; height: 100%;"></div>
                <div><h5 style="margin:0; color: rgb(46, 46, 46); font-size: 25px; font-family: 'Noto Sans KR', sans-serif; font-weight: 700; width: 100%; height: 100%;">여행 플랜</h5></div>
                <div><h5 style="margin:0; padding:0px; font-weight:300; color: rgb(46, 46, 46); font-size: 18px; font-family: 'Noto Sans KR', sans-serif;">쉽고, 편리하게 <br> 여행 플랜을 작성해보세요</h5></div>
            </div>
            <div>
                <div><img src="/images/chat.png" style="width: 100%; height: 100%;"></div>
                <div><h5 style="margin:0; color: rgb(46, 46, 46); font-size: 25px; font-family: 'Noto Sans KR', sans-serif; font-weight: 700; width: 100%; height: 100%;">여행 게시판</h5></div>
                <div><h5 style="margin:0; padding:0px; font-weight:300; color: rgb(46, 46, 46); font-size: 18px; font-family: 'Noto Sans KR', sans-serif;">여행 후기를 남기고, <br> 사람들과 추억을 공유해보세요</h5></div>
            </div>
            <div>
                <div><img src="/images/friends.png" style="width: 100%; height: 100%;"></div>
                <div><h5 style="margin:0; color: rgb(46, 46, 46); font-size: 25px; font-family: 'Noto Sans KR', sans-serif; font-weight: 700; width: 100%; height: 100%;">동행 게시판</h5></div>
                <div><h5 style="margin:0; padding:0px; font-weight:300; color: rgb(46, 46, 46); font-size: 18px; font-family: 'Noto Sans KR', sans-serif;"> 함께 여행가고 싶은 <br> 친구들을 구해보세요</h5></div>
            </div>
        </div>
    </div>
    <div class="box" style="background-color:black;">
        <div class="trip2">
            <div>
                <p> <span class="highlight">대중성 </span>&nbsp&nbsp&nbsp&nbsp 국내 4만 여개의 여행지와 인기 있는 여행지 추천</p>
            </div>
            <div style="text-align: right;">
                <p>드래그만으로 편리하게 새로운 일정을 계획 &nbsp&nbsp&nbsp&nbsp<span class="highlight"> 가독성</span></p>
            </div>
            <div>
                <p> <span class="highlight">편의성 </span>&nbsp&nbsp&nbsp&nbsp 여행지 검색 시 필요한 카테고리별 분류</p>
            </div>
            <div style="text-align: right;">
                <p>회원간 소통할 수 있는 게시판 활성화 &nbsp&nbsp&nbsp&nbsp<span class="highlight"> 커뮤니티</span></p>
            </div>
        </div>
    </div>
    <div class="box" >
        <div class="snip1382">
            <img src="/images/full_img2.png" alt="sample99" />
            <figcaption>
              <h2 style="font-size: 100px; font-weight: 900px; font-family: 'Khula', sans-serif; margin-top: 300px; color:rgb(196, 255, 252);">W E L C O M E</h2>
              <p style="font-size: 20px; font-family: 'Noto Sans KR', sans-serif; color:white"> 트립 메이트로 당신의 여행을 계획하고, 기록하고, 저장하세요!</p>
              <div class="icons">
                  <button>TRIP MATE</button>
              </a>
              </div>
            </figcaption>
        </div>
    </div>

    <script>
       $(".hover").mouseleave(
        function () {
            $(this).removeClass("hover");
        });
    </script>

    <script>
    window.onload = function () {
        $('.box').eq(0).addClass('move');
        var elm = ".box";
        $(elm).each(function (index) {
            // 개별적으로 Wheel 이벤트 적용
            $(this).on("mousewheel DOMMouseScroll", function (e) {
                e.preventDefault();
                var delta = 0;
                if (!event) event = window.event;
                if (event.wheelDelta) {
                    delta = event.wheelDelta / 120;
                    if (window.opera) delta = -delta;
                } 
                else if (event.detail)
                    delta = -event.detail / 3;
                var moveTop = $(window).scrollTop();
                var elmSelecter = $(elm).eq(index);
                // 마우스휠을 위에서 아래로
                if (delta < 0) {
                    if ($(elmSelecter).next() != undefined) {
                        try{
                            moveTop = $(elmSelecter).next().offset().top;
                            $(elmSelecter).next().addClass('move'); //  휠 내렸을시 애니메이션 이벤트
                        }catch(e){}
                    }
                // 마우스휠을 아래에서 위로
                } else {
                    if ($(elmSelecter).prev() != undefined) {
                        try{
                            moveTop = $(elmSelecter).prev().offset().top;
                            
                        }catch(e){}
                    }
                }
                 
                // 화면 이동 0.8초(800)
                $("html,body").stop().animate({
                    scrollTop: moveTop + 'px'
                }, {
                    duration: 300, complete: function () {
                    }
                });
            });
        });
        
        $(window).resize(function(){
            $('.box').css('height',$(window).height());
        });
        
    }
    </script>
    
</body>
</html>