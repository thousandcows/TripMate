<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>Trip Mate</title>
      <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Poor+Story&display=swap"
        rel="stylesheet">
      <link rel="stylesheet" href="/css/login.css" type="text/css">
      <link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
      <script defer src="/js/login.js"></script>
    </head>
    <style>
      * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
      }

      body {
        position: relative;
        background-color: #ffffff;
        margin: 0px;
      }

      header li {
        display: inline;
        padding-left: 50px;
        font-family: 'Poor Story', cursive;
        font-size: 25px;
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
      <!-- 로그인 모달창 -->
      <div class="modal" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel"
        tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalToggleLabel">TripMate(로고가 올듯)</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body modal-first-body">
              <div class="loginInputBox">
                <input type="text" id="normalLoginID" class="loginInput" placeholder="이메일 주소" required>
                <div class="signupInputConfirm normalLoginConfirm"></div>
                <input type="password" id="normalLoginPW" class="loginInput" placeholder="비밀번호" required>
              </div>
              <div class="loginBtns">
                <button id="normalLoginBtn">로그인</button>
                <button type="button" data-bs-target="#exampleModalToggle3" data-bs-toggle="modal">PW찾기</button>
              </div>
              <button type="button" id="signupModalBtn" class="btn btn-primary" data-bs-target="#exampleModalToggle2"
                data-bs-toggle="modal">회원가입</button><br>
              <img src="/images/kakao_login.png" id="kakaoLogin">
            </div>
          </div>
        </div>
      </div>
      <!-- 회원가입 모달창 -->
      <div class="modal" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2"
        tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content modal-signup-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalToggleLabel2">회원가입</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body modal-signupBody">
              <form action="/member/normalSignup" method="post" id="signupForm">
                <div class="signupBoxs">
                  <input type="text" placeholder="이메일 주소" id="signupEmail" class="signupEmailInput" name="emailID"
                    required><button type="button" class="signupCheckBtn" id="signupEmailCheckBtn">중복확인</button>
                  <div class="emailConfirm signupInputConfirm"></div>
                </div>
                <div class="signupBoxs">
                  <input type="text" placeholder="닉네임" class="signupNickNameInput" id="signupNickName" name="nick"
                    required><button type="button" class="signupCheckBtn" id="signupNickNameCheckBtn">중복확인</button>
                  <div class="nickNameConfirm signupInputConfirm"></div>
                </div>
                <div class="signupBoxs">
                  <span class="genderHead">성별</span><input type="radio" class="genderInput" value="male" name="gender">
                  남성&nbsp;&nbsp;&nbsp;<input type="radio" class="genderInput" name="gender" value="female"> 여성
                  <div class="nickNameConfirm signupInputConfirm"></div>
                </div>
                <div class="signupBoxs">
                  <input type="text" value="010" class="phoneInput" id="signupPhone1" readonly> -
                  <input type="text" maxlength="4" placeholder="1234" class="phoneInput" id="signupPhone2" required>
                  -
                  <input type="text" maxlength="4" placeholder="5678" class="phoneInput" id="signupPhone3"
                    required><button type="button" class="signupCheckBtn" id="signupPhoneCheckBtn">체크</button>
                  <div class="phoneConfirm signupInputConfirm"></div>
                  <input type="text" name="phone" id="signupPhone">
                </div>
                <div class="signupBoxs">
                  <input type="password" placeholder="비밀번호 (8자 ~ 16자)" class="signupLongInput" id="signupPw" required>
                  <div class="pwConfirm signupInputConfirm"></div>
                </div>
                <div class="signupBoxs">
                  <input type="password" placeholder="비밀번호 확인" class="signupLongInput" id="signupPwRe" name="pw"
                    required>
                  <div class="pwReConfirm signupInputConfirm"></div>
                </div>
                <div class="signupBoxs">
                  <button type="button" class="signupGoBtn" id="signupGoBtn">회원가입</button>
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button class="btn btn-primary signupBack" data-bs-target="#exampleModalToggle"
                data-bs-toggle="modal">돌아가기</button>
            </div>
          </div>
        </div>
      </div>
      <!-- PW찾기 모달창 -->
      <div class="modal" id="exampleModalToggle3" aria-hidden="true" aria-labelledby="exampleModalToggleLabel"
        tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalToggleLabel">PW찾기</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body modal-first-body">
              <div class="loginInputBox">
                <input type="text" class="findPwInput" id="findPwInput" placeholder="찾으실 Email을 입력해주세요." required>
                <button type="button" class="findPwBtn" id="findPwBtn">발송</button>
                <div class="findPwEmailCheckConfirm signupInputConfirm"></div>
                <input type="text" class="findPwInput" id="verificationInput" placeholder="인증번호 입력">
                <button type="button" class="findPwBtn" id="verificationBtn">인증</button>
                <div class="verificationCodeConfirm signupInputConfirm"></div>
              </div>
              <div class="verificationOk">
                <form action="/member/findPwChange" method="post" id="changePwForm">
                  <input type="text" class="changePwInput" id="changePwInput" name="pw"
                    placeholder="변경할 비밀번호를 입력해주세요."><button type="button" class="changePwBtn"
                    id="changePwBtn">변경</button>
                  <div class="changePwConfirm signupInputConfirm"></div>
                </form>
              </div>
              <div class="modal-footer">
                <button class="btn btn-primary signupBack" data-bs-target="#exampleModalToggle"
                  data-bs-toggle="modal">돌아가기</button>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- 로그인&회원가입 모달창 끝 -->

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
              <li class="nav-item">
                <c:choose>
                  <c:when test="${loginEmailID != null}">
                    <div id="loginAfterBox">
                      ${loginNick} 님
                      <a href="/member/normalLogout">로그아웃</a>
                      <a href="/member/mypageGo">마이페이지</a>
                    </div>
                  </c:when>
                  <c:otherwise>
                    <a class="btn btn-primary" id="loginBtn" data-bs-toggle="modal" href="#exampleModalToggle"
                      role="button">로그인</a>
                  </c:otherwise>
                </c:choose>
              </li>
            </ul>
          </div>
        </div>
      </header>

      <script>
        $("#tourboard").on("click", function () {
          location.href = "/tourboard/list?cpage=1";
        })
      </script>

      <script>
        $("#companyboard").on("click", function () {
          location.href = "/companyboard/list?cpage=1";

        })
      </script>

      <script>
        $("#triplist").on("click", function () {
          location.href = "/area/main?area=0&contentType=0&page=1";
        })
      </script>
    </body>

    </html>