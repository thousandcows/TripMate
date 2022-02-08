<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
      <link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
      <title>Trip Mate</title>
      <jsp:include page="base/header.jsp"></jsp:include>
    </head>
    <style>
      * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
      }

      h5 {
        font-weight: bold;
      }

      .triplist {
        width: 100%;
        text-align: center;
      }

      /* 위로가기 버튼 */
      .top-btn {
        position: fixed;
        right: 30px;
        bottom: 50px;
        z-index: 9997;
      }

      /* 캐러셀 z-index지정 */
      .carousel {
        z-index: 10;
      }

      .carousel-item {
        z-index: 10;
      }

      .mainTxt {
        margin-top: 40px;
        margin-bottom: 40px;
        cursor: default;
        transition: all 0.5s;
      }

      .mainTxt:hover {
        color: #178f858e;
      }

      .mainTxtIn {
        color: cornflowerblue;
      }

      .mainTopImgs {
        width: 150px;
        margin-bottom: 30px;
      }

      @keyframes up-down {
        from {
          transform: translatey(0px);
        }

        to {
          transform: translatey(-10px);
        }
      }

      .mainTopImgs:hover {
        animation: up-down 0.4s infinite ease-in-out alternate;
        cursor:pointer;
      }

      /* 중간부분 시작 */
      .middleConBox {
        text-align: left;
        width: 100%;
        padding-top: 30px;
      }

      .cuchun {
        margin-top: 30px;
        padding-top: 20px;
        font-size: 22px;
        color: rgb(82, 82, 82);
        font-weight: bold;
        border-top: 1px solid rgb(160, 160, 160);
        cursor: default;
      }

      .cuchunB {
        font-size: 15px;
        font-weight: normal;
      }

      .middleLine {
        margin-top: 30px;
      }

      /* 카드들 */
      .card {
        box-shadow: 1px 1px 2px 1px rgb(235, 235, 235);
        transition: all 0.2s;
      }

      .card:hover {
        transform: scale(1.01);
        /* box-shadow: 1px 1px 2px 1px rgb(192, 192, 192); */
      }

      .card-text {
        height: 80px;
        overflow: hidden;
      }

      /* 카드 이미지들 */
      .card-img-top {
        width: 100%;
        height: 200px;
      }

      .btn-primarys {
        background-color: white;
        border: 1px solid gray;
        transition: all 0.3s;
      }

      .btn-primarys:hover {
        background-color: cornflowerblue;
        color: white;
      }

      /* 게시판쪽 */
      .middleCon2Txt {
        color: rgb(114, 114, 114);
        margin-top: 40px;
        font-size: 22px;
        font-weight: bold;
        margin-bottom: 38px;
        cursor: default;
      }

      .mbanner1 {
        width: 500px;
        border-radius: 5px;
      }

      .mbanner1:hover {
        opacity: 0.95;
      }

      @media (max-width: 480px) {
        .top-btn {
          right: 10px;
          bottom: 30px;
        }
        .mainTopImgs{
          width:80px;
        }
        h5{
          font-size:16px;
        }
        h6{
          font-size:14px;
        }
        .card {
          height:300px;
          width:200px !important;
          margin-bottom:10px;
        }
        .card-img-top {
          width: 100%;
          height: 180px;
        }
        .card-title{
          font-size:14px;
        }
        .card-text{
          height:70px;
          font-size:12px;
        }
        .btn-primarys{
          width:60px;
          height:30px;
          line-height:30px;
          font-size:12px;
          padding:0;
        }
        .middleCon2Txt{
          font-size:17px;
        }
        .mbanner1{
          width:180px;
        }
      }

    </style>

    <body>

      <div class="triplist">
        <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img src="/images/calPic1.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
              <img src="/images/calPic2.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
              <img src="/images/calPic3.jpg" class="d-block w-100" alt="...">
            </div>
          </div>
        </div>


        <div class='container'>
          <div class="row">
            <div class="col-12 text-center mainTxt">
              <h1 class='f-primary'> 국내 여행의 모든 것 <span class="mainTxtIn">'Trip
                  Mate'</span></h1>
            </div>
          </div>

          <div class='row'>
            <div class='intro-box col-4'>
              <a href="/area/main?area=0&contentType=0&page=1"><img src="/images/여행지리스트.png" class="mainTopImgs"></a>
              <br>
              <h5>국내 다양한 여행지</h5>
              <h6>
                4만 개의 국내 여행지
              </h6>
            </div>
            <div class='intro-box col-4'>
              <img src="/images/여행일정.png" class="mainTopImgs" id="tripPlan2"> <!-- JS로 이동 -->
              <h5>여행 일정 플래너</h5>
              <h6>
                여행 일자, 숙소, 가고 싶은 장소
                <br>
                만 선택하면 일정이 자동으로 완성되는 쉽고 간편한
                <br>
                여행 일정 플래너
              </h6>
            </div>
            <div class='intro-box col-4'>
              <a href="/tourboard/list?cpage=1"><img src="/images/게시판.png" class="mainTopImgs"></a>
              <h5>게시판</h5>
              <h6>
                여행을 좋아 하는 사람들과 함께
                <br>
                동행 하거나 여행 정보를 받아보세요
              </h6>
            </div>
          </div>
        </div>
        <div class="cuchun">추천 여행지<br><span class="cuchunB">트립메이트가 엄선한 여행지들입니다.</span></div>
        <div class="container middleConBox">
          <div class="row">
            <div class="col-6 col-sm-3">
              <div class="card" style="width: 18rem;">
                <img src="/images/mainMCon1.webp" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">다채로운 서울</h5>
                  <p class="card-text">서울은 대한민국에서 가장 큰 도시답게 모든 유행이 시작되는 곳이에요.</p>
                  <a href="/area/detail?num=126485" class="btn btn-primarys">보러가기</a>
                </div>
              </div>
            </div>
            <div class="col-6 col-sm-3">
              <div class="card" style="width: 18rem;">
                <img src="/images/mainMCon2.webp" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">낭만의 섬 제주</h5>
                  <p class="card-text">가족, 친구, 연인 등 모두가 사랑하는 한국 대표 여행지인 제주는 특히 신혼여행지로도 유명한 곳이에요.</p>
                  <a href="/area/detail?num=660972" class="btn btn-primarys">보러가기</a>
                </div>
              </div>
            </div>
            <div class="col-6 col-sm-3">
              <div class="card" style="width: 18rem;">
                <img src="/images/mainMCon3.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">아기자기한 강릉</h5>
                  <p class="card-text">바다를 사랑하는 연인이라면 강릉 여행을 놓치지 마세요.</p>
                  <a href="/area/detail?num=125790" class="btn btn-primarys">보러가기</a>
                </div>
              </div>
            </div>
            <div class="col-6 col-sm-3">
              <div class="card" style="width: 18rem;">
                <img src="/images/mainMCon4.webp" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">상반된 매력, 부산</h5>
                  <p class="card-text">바다가 아름다운 여러 명소 중에서도 해운대만큼 독특한 풍경을 보여주는 곳은 없을 거예요.</p>
                  <a href="/area/detail?num=235076" class="btn btn-primarys">보러가기</a>
                </div>
              </div>
            </div>
          </div>
          <div class="row middleLine">
            <div class="col-6 col-sm-3">
              <div class="card" style="width: 18rem;">
                <img src="/images/mainMCon5.webp" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">여수 밤바다</h5>
                  <p class="card-text">잔잔하게 흐르는 여수의 어두운 잔잔한 밤바다와 그 옆에 늘어선 포장마차는 연인들의 낭만이죠.</p>
                  <a href="/area/detail?num=1997082" class="btn btn-primarys">보러가기</a>
                </div>
              </div>
            </div>
            <div class="col-6 col-sm-3">
              <div class="card" style="width: 18rem;">
                <img src="/images/mainMCon6.webp" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">연인과의 추억 양양</h5>
                  <p class="card-text">낙산 해수욕장은 아름답기로 유명한 동해안의 해변 중에서도 절경을 선보이는 곳으로 손꼽혀요.</p>
                  <a href="/area/detail?num=2501905" class="btn btn-primarys">보러가기</a>
                </div>
              </div>
            </div>
            <div class="col-6 col-sm-3">
              <div class="card" style="width: 18rem;">
                <img src="/images/mainMCon7.webp" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">과거와 현재, 경주</h5>
                  <p class="card-text">첨성대나 석굴암, 동궁과 월지 등 신라 시대의 사적들만 방문해도 하루를 알차게 보낼 수 있죠.</p>
                  <a href="/area/detail?num=126166" class="btn btn-primarys">보러가기</a>
                </div>
              </div>
            </div>
            <div class="col-6 col-sm-3">
              <div class="card" style="width: 18rem;">
                <img src="/images/mainMCon8.webp" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">드라이브하러 남해로</h5>
                  <p class="card-text">여행의 시작은 어디라도 상관없지만, 해안도로를 따라 드라이브를 해 보는걸 추천해요.</p>
                  <a href="/area/detail?num=249950" class="btn btn-primarys">보러가기</a>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="container middleConBox2">
          <div class="middleCon2Txt">여러 사람들과 여행경험을 공유해보세요.</div>
          <div class="row">
            <div class="col-1"></div>
            <div class="col-5">
              <a href="/tourboard/list?cpage=1"><img src="/images/mBanner1.jpg" class="mbanner1"></a>
            </div>
            <div class="col-5">
              <a href="/companyboard/list?cpage=1"><img src="/images/mBanner2.jpg" class="mbanner1"></a>
            </div>
            <div class="col-1"></div>
          </div>
        </div>

        <div class='top-btn'>
          <a href="#"><img src="/images/up1.png" />
          </a>
        </div>
      </div>
      <jsp:include page="base/footer.jsp"></jsp:include>
      <script>
        let us = new WebSocket("ws://localhost/user"); // 웹소켓
        $("#tripPlan2").on("click", function () {
          if (${loginEmailID ne null }){
          location.href = "/plan/main?page=1";
        }else {
          alert("회원 전용 기능입니다.");
        }
        })
      </script>

    </body>

    </html>