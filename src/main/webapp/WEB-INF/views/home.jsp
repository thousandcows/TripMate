<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>
    <head>
          <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <title>Trip Mate</title>
    	  <jsp:include page="base/header.jsp"></jsp:include>
    
    </head>
    
    <style>
    
    * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
                font-family: 'paybooc-Bold';
                font-size: 26px;
            }
    
            body {
                position: relative;
                background-color: #ffffff;
                margin: 0px;
                font-family:'paybooc-Bold';
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

    h6, .h6 {
   
    line-height: 50px;
    color: #2c2c2c;
    width: 360px;
    height: 80px;
   
    
    
}

h5, .h5 {
   
   line-height: 150px;
   color: #2c2c2c;
   font-weight: 600;
   
   
}



.intro-box{
  width: 380px;
  height: 550px;
}

hr{
  height: 100px;
  background-color: #000000;
}

.section-notice {
  background-color: rgba(163, 216, 230, 0.671);
}

.footer-menu {background-color: #ffffff;}

.footer-copy {background-color: #f5e3b9;}

ul{
  list-style-type: none;
}

.notice-list>li:hover{
    background-color: #F0F0F0;
}

@font-face {
    font-family: 'paybooc-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/paybooc-Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}


    </style>
    
<body>

 
   
  <div id="tirp list" class="triplist">
    
    <div class="triplist">
      <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="국내여행1.jpg" class="d-block w-100" alt="...">
          </div>
          <div class="carousel-item">
            <img src="국내여행2.jpg" class="d-block w-100" alt="...">
          </div>
          <div class="carousel-item">
            <img src="국내여행4.jpg" class="d-block w-100" alt="...">
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
      
      <section class='section-intro'>
        <div class='container'>
        <h1 class='f-primary' style="text-align: center; line-height: 160px; font-size: 50px;"> 국내 여행의 모든 것 'Trip Mate' </h1>
        
        <div class='intro-box-wrapper row'>
        <div class='intro-box col-xs-4' style="text-align: center;">
        <img src="여행지리스트.png" style="width: 93px; height: 96px;">
        <br>
        <h5>국내 다양한 여행지</h5>
        <hr style="width:100%;height:10px;">
        <h6>
        4만 개의 국내 여행지
        </h6>
        </div>
        <div class='intro-box col-xs-4'  style="text-align: center;">
        <img src="여행일정.png" style="width: 93px; height: 96px;">
        <h5>여행 일정 플래너</h5>
        <hr style="width:100%;height:10px;">
        <h6>
        여행 일자, 숙소, 가고 싶은 장소
        <br>
        만 선택하면 일정이 자동으로 완성되는 쉽고 간편한 
        <br>
        여행 일정 플래너  
        </h6>
        </div>
        <div class='intro-box col-xs-4'  style="text-align: center;">
        <img src="게시판.png" style="width: 93px; height: 96px;">
        <h5>게시판</h5>
        <hr style="width:100%;height:10px;">
        <h6>
        여행을 좋아 하는 사람들과 함께
        <br>
        동행 하거나 여행 정보를 받아보세요
        </h6>
        </div>
        </div>
        </div>
        </section>
      
        
        <section class='section-notice'>
          <div class='container' >
          <div class="col-xs-12">
          <h1 class='f-primary' style="text-align: center; line-height: 160px; font-size: 50px;">Trip Mate Communitty</h1>
          <h5 class='section-subtitle' style="text-align: center;">공지사항과 게시판을 통해 다양한 소식들을 확인하세요.</h5>
        </div>

          <div class='row'>
          
              <div class='col-8'style="background-color: #ffffff; height: 840px;">
              <div class='main-notice' style="background-color: #ffffff; height: 840px;">
              <h5 class='f-primary' style="text-align: center;">Notice</h5> 
              <ul class='notice-list'>
              <li>
              <a href="/boards/"><h6>1</h6>
              <p class='date'>22.01.01 23:29</p>
              </a></li>
              <li>
              <a href="/boards/"><h6>2</h6>
              <p class='date'>22.01.05 08:45</p>
              </a></li>
              <li>
              <a href="/boards/"><h6>3</h6>
              <p class='date'>22.01.11 10:49</p>
              </a></li>
              <li>
              <a href="/"><h6>4</h6>
              <p class='date'>22.01.25 01:48</p>
              </a></li>
              </ul>
              <a class='add-link' href='/boards'>More</a>
              
              </div>
              </div>

              <div class='main-banner col-4'>
              <a href="/faqs"><img src="tel.png" />
              </a>
              <a href="/boards/35"><img src="faq.png" class="mt-4"/>
              </a>
            </div>
              </div>
              </div>
              
              
              
              
              <div class='top-btn'>
              <a href="#"><img src="up1.png"/>
              </a></div>
              </div>
              </div>
              </div>
            
              
              </section>
              
              </main>
              <footer class='footer'>
              <div class='footer-menu'>
              <div class='container cleafix'>
              <div class='footer-sns pull-right'>
              <a target ="_blank" href="https://ko-kr.facebook.com/Earthtory/"><img src="페북.png" />
              </a><a target="_blank" href="" style="width: 32px; height: 32px;"><img src="인스타1-1.png" />
             
              </a></div>
              </div>
              </div>
              
              

              
              <div class='footer-copy'>
              <div class='container'>
              <div class='row'>
              <div class='col-xs-2'>
              <img class="web" src= "footer.png"/>
              <img class="mobile" src="" />
              </div>
              <div class='col-xs-10'>
              <p>Since : 2022 년 01월 12일  Owner : 서승희 임도혁 정혜주 이진호 홍진규 천현우 </p>
              <p>ComPany : 트립메이트, Tel : 02-2022-0112  E-mail : 6trip@tripmate.com</p>
              <p>Address : 서울특별시 중구 남대문로 120 대일빌딩 2층,3층</p>
              <p>Copyrightⓒ 2022 TripMate.Ltd. All rights reserved.</p>
              </div>
              </div>
              </div>
              </div>
              </footer>
              
            




         



<script>
let us = new WebSocket("ws://localhost/user"); // 웹소켓
</script>

</body>

    </html>