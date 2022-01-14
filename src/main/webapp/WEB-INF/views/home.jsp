<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>title here</title>
      <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Poor+Story&display=swap"
        rel="stylesheet">
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

      header li {
        display: inline;
        padding-left: 50px;


      }

      header li a {
        color: white;
        text-decoration: none;
        padding: 15px;
        transition: .3s ease;

      }

      header li a:hover {
        color: #000000;
      }
    </style>

    <body>
      <!-- Basic navbar -->
      <header class="navbar navbar-expand-lg navbar-light" style="background-color: #2cd4c6;">
        <div class="container">

          <!-- Brand -->
          <a class="navbar-brand d-none d-lg-block order-lg-1" href="#">
            <img width="142" src="trip2.png" alt="TripMate" />
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
              <li class="nav-item active"><a class="nav-link" id="triplist">여행지</a></li>
              <li class="nav-item"><a class="nav-link" href="">여행일정</a></li>
              <li class="nav-item active"><a class="nav-link" id="tourboard">여행게시판</a></li>
              <li class="nav-item"><a class="nav-link" id="companyboard">동행게시판</a></li>
              <li class="searchbar"> <i class="fas fa-search"></i><input class="form-control rounded-start" type="text"
                  placeholder="Search for products" size="20">
              </li>
              <li class="nav-item"><button id="loginProc">로그인</button></li>
            </ul>
          </div>
        </div>
      </header>

      <script>
        $("#click").on("click", function () {
          location.href = "/tourboard/list";
        })
      </script>

      <script>
        $("#toParyBoard").on("click", function () {
          location.href = "/companyboard/list";
        })
      </script>

      <script>
        document.querySelector("#loginProc").addEventListener("click", () => {
          location.href = "/member/Proc";
        })
      </script>

      <script>
        $("#triplist").on("click", function () {
          location.href = "/area/main?area=0&contentType=0&page=1";
        })
      </script>
    </body>





    </html>