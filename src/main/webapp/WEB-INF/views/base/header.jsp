<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
      <!DOCTYPE html>
      <html>

      <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/css/login.css" type="text/css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
          integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
        <link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
        <script defer src="/js/login.js"></script>
      </head>
      <style>
		@import url('https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css');
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
        * {
          box-sizing: border-box;
          margin: 0;
          padding: 0;
          font-family: 'NanumSquare', sans-serif;
        }

        body {
          position: relative;
        } 
        input[type=password]{
          font-family: 'Noto Sans KR', sans-serif;
        }
        /* 헤더 */
        .navbar{
          min-height:80px !important;
          margin:0 !important;
        }
        /* 임시 추가 부분*/
        .navbar-nav > li{
        	font-size : large;
        }
        
        .navbar-brand{
        	position: relative;
        }
        
        .navbar-brand>img{
        	/* position:absolute; */
        	top:0px;
        }
        
        /* --------------*/
        
        header li {
          display: inline;
          padding-left: 50px;
          font-size: 22px;
        }

        header li a {
          color: white;
          text-decoration: none;
          transition: .3s ease;
        }

        header li a:hover {
          color: #000000;
          cursor: pointer;
        }

        .headerLi {
          color: white;
        }
        .headerMypage{
          color:white !important;
        }
        .headerMypage:hover{
          color:black !important;
        }
        /* 헤더끝 */
        .modal-header {
          background-color: #2cd4c6;
        }

        .modal-title {
          color: white;
        }

        .loginBtn {
          width: 70px;
          display: inline-block;
          height: 30px;
          margin-top:10px;
          font-size: 16px;
          border-radius: 3px;
          text-align: center;
          border: none;
          background-color: #2cd4c6;
          color: white !important;
        }
        .loginBtn:hover{
          color:black !important;
        }

        .noticeListBtn {
          color: red;
          font-weight: bold;
          font-size: 18px;
          cursor: pointer;
        }
        .noticeListBtn:hover{
          color:black;
        }

        #loginAfterBox {
          margin-top: 8px;
        }

        .headerLogOut {
          color:white !important;
          margin-left: 10px;
          margin-right: 10px;
        }
        .headerLogOut:hover{
          color:black !important;
        }

        #noticeGround {
          display: flex;
          flex-direction: column-reverse;
          position: fixed;
          bottom: 80px;
          right: 100px;
          z-index: 9999;
        }

        .websocLine {
          color: black;
          font-size: 14px;
          text-decoration: none;
          z-index: 9999;
        }

        .websocTest {
          width: fit-content;
          background-color: #EEEEEE;
          border-radius: 3px;
          padding: 1px 4px 2px 4px;
          margin: 2px;
          z-index: 9999;
          border:2px solid #003366;
        }
        .websocTest:hover{
          opacity:0.9;
        }

        /* 헤더 알림글씨 */
        .noticeListBox {
          width: 350px;
          height: 320px;
          border: 1px solid gray;
          border-radius:4px;
          position: absolute;
          top: 50px;
          opacity:0.95;
          background-color: white;
          right: 200px;
          z-index: 9999;
        }

        .noticeListBoxIn {
          height: 270px;
          overflow: auto;
          z-index: 9999;
        }

        .noticeLista {
          color: #5B5B5B;
          font-size: 13px;
        }

        .noticeLista:hover {
          color: #2cd4c6;
        }

        .noticeList {
          margin-left: 5px;
          margin-top: 15px;
        }

        .noticeListBoxClose {
          width: 100%;
          text-align: center;
        }

        .noticeListBoxCloseBtn {
          width: 80px;
          height: 30px;
          background-color: white;
          border: 1px solid gray;
          border-radius: 4px;
          margin: 5px;
        }
        .noticeListBoxCloseBtn:hover{
          box-shadow:1px 1px 2px 1px #EFECEA;
        }
        .headerNickB{
          font-size:16px;
        }
        @media (max-width: 480px) {
          .noticeListBox {
            right: 50px;
          }
          #noticeGround {
            right: 30px;
            bottom: 30px;
          }
        }
      </style>

      <body>
        <!-- 로그인 모달창 -->
        <div class="modal" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel"
          tabindex="-1">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalToggleLabel"><img width="180" src="/images/trip2.png"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body modal-first-body">
                <div class="loginInputBox">
                  <input type="text" id="normalLoginID" class="loginInput" placeholder="이메일 주소" required>
                  <div class="signupInputConfirm normalLoginConfirm"></div>
                  <input type="password" id="normalLoginPW" class="loginInput" placeholder="비밀번호" onkeydown="enterLog()"
                    required>
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
                    <span class="genderHead">성별<span class="genderHeadIn">(선택)</span></span><input type="radio" class="genderInput" value="male"
                      name="gender">
                    남성&nbsp;&nbsp;&nbsp;<input type="radio" class="genderInput" name="gender" value="female"> 여성
                    <div class="nickNameConfirm signupInputConfirm"></div>
                  </div>
                  <div class="signupBoxs">
                    <span class="phoneInput" id="signupPhone1">010</span> -
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
                  <button type="button" class="findPwBtnt" id="findPwBtnt">발송</button>
                  <div class="findPwEmailCheckConfirm signupInputConfirm"></div>
                  <input type="text" class="findPwInput" id="verificationInput" placeholder="인증번호 입력">
                  <button type="button" class="findPwBtnt" id="verificationBtn">인증</button>
                  <div class="verificationCodeConfirm signupInputConfirm"></div>
                </div>
                <div class="verificationOkT">
                  <form action="/member/findPwChange" method="post" id="changePwForm">
                    <input type="password" class="changePwInput" id="changePwInput" name="pw"
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
            <a class="navbar-brand d-lg-block order-lg-1" href="/">
              <img width="142" src="/images/trip2.png" alt="TripMate" />
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
                <li class="nav-item"><a class="nav-link headerLi" id="triplist">여행지</a></li>
                <li class="nav-item"><a class="nav-link headerLi" id="tripPlan">여행일정</a></li>
                <li class="nav-item"><a class="nav-link headerLi" id="tourboard">여행게시판</a></li>
                <li class="nav-item"><a class="nav-link headerLi" id="companyboard">동행게시판</a></li>

                <li class="nav-item">
                  <c:choose>
                    <c:when test="${loginSeq != null}">
                      <div id="loginAfterBox">
                        <span class="noticeListBtn"><i class="far fa-bell" id="noticeListBtn"></i></span>
                        <div class="noticeListBox" id="noticeListBox" style="display: none;">
                          <div class="noticeListBoxIn" id="noticeListBoxIn">
                            <c:forEach var="reactions" items="${reactions}">
                              <c:choose>
                                <c:when test="${reactions.reaction eq 'comment'}">
                                  <c:if test="${reactions.board_num eq 1}">
                                    <div class="noticeList"><a href="/tourboard/detail?seq=${reactions.seq}#rep_write"
                                        class="noticeLista">${reactions.time} 여행게시판
                                        ${reactions.title} 글에 ${reactions.reactioner} 님이 댓글을 달았습니다.</a></div>
                                  </c:if>
                                  <c:if test="${reactions.board_num eq 2}">
                                    <div class="noticeList"><a
                                        href="/companyboard/detail?seq=${reactions.seq}#rep_write"
                                        class="noticeLista">${reactions.time} 동행게시판
                                        ${reactions.title} 글에 ${reactions.reactioner} 님이 댓글을 달았습니다.</a></div>
                                  </c:if>
                                </c:when>
                                <c:when test="${reactions.reaction eq 'like'}">
                                  <c:if test="${reactions.board_num eq 1}">
                                    <div class="noticeList"><a href="/tourboard/detail?seq=${reactions.seq}"
                                        class="noticeLista">${reactions.time} 여행게시판
                                        ${reactions.title} 글에 좋아요 반응이 있습니다.</a></div>
                                  </c:if>
                                  <c:if test="${reactions.board_num eq 2}">
                                    <div class="noticeList"><a href="/companyboard/detail?seq=${reactions.seq}"
                                        class="noticeLista">${reactions.time} 동행게시판
                                        ${reactions.title} 글에 좋아요 반응이 있습니다.</a></div>
                                  </c:if>
                                </c:when>
                                <c:when test="${reactions.reaction eq 'joinTrip'}">
                                  <div class="noticeList"><a href="/companyboard/detail?seq=${reactions.seq}"
                                      class="noticeLista">${reactions.time} 동행게시판
                                      ${reactions.title} 글에 ${reactions.reactioner} 님이 동행을 요청하였습니다.</a></div>
                                </c:when>
                              </c:choose>
                            </c:forEach>
                            <c:if test="${fn:length(reactions) == 0}">
                              새로운 알림이 없습니다.
                            </c:if>
                          </div>
                          <div class="noticeListBoxClose">
                            <c:if test="${fn:length(reactions) != 0}">
                              <button type="button" class="noticeListBoxCloseBtn" id="noticeListRemoveBtn">모두삭제</button>
                            </c:if>
                            <button type="button" class="noticeListBoxCloseBtn" id="noticeListBoxCloseBtn">닫기</button>
                          </div>
                        </div>
                        <span class="headerNickB">${loginNick}</span> 님
                        <c:if test="${loginSeq == -1}">
                          <a href="/member/normalLogout" class="headerLogOut">로그아웃</a>
                          <a href="/admin/dashboard" class="headerMypage">관리창으로</a>
                        </c:if>
                        <c:if test="${loginSeq != -1}">
                          <a href="/member/normalLogout" class="headerLogOut">로그아웃</a>
                          <a href="/member/mypageGo" class="headerMypage">마이페이지</a>
                        </c:if>
                      </div>
                    </c:when>
                    <c:otherwise>
                      <a class="loginBtn" id="loginBtn" data-bs-toggle="modal" href="#exampleModalToggle"
                        role="button">로그인</a>
                    </c:otherwise>
                  </c:choose>
                </li>
              </ul>
            </div>
          </div>
        </header>

        <div id="noticeGround">

        </div>

        <script>
          $("#tourboard").on("click", function () {
            location.href = "/tourboard/list?cpage=1";
          })

          $("#tripPlan").on("click", function () {
            if (${loginEmailID ne null }){
            location.href = "/plan/main?page=1";
          }else {
            alert("회원 전용 기능입니다.");
          }
        })
          $("#companyboard").on("click", function () {
            location.href = "/companyboard/list?cpage=1";

          })

          $("#triplist").on("click", function () {
            location.href = "/area/main?area=0&contentType=0&page=1";
          })

          function enterLog() {
            if (window.event.keyCode == 13) {
              let emailID = document.querySelector("#normalLoginID").value
              let pw = document.querySelector("#normalLoginPW").value
              $.ajax({
                type: "post",
                url: "/member/normalLogin",
                data: {
                  "emailID": emailID,
                  "pw": pw
                }
              }).done(function (res) {
                if (res == 0) {
                  document.querySelector(".normalLoginConfirm").style.color = "red";
                  document.querySelector(".normalLoginConfirm").innerHTML = "계정과 패스워드를 확인해주세요.";
                } else if (res == 1) {
                  location.reload();
                } else if (res == 2) {
                  location.href = "/admin/dashboard";
                }
              });
            }
          }

          if(window.location.pathname == "/"){
            $(".navbar-nav").prepend(`<li class="nav-item"><a href='/fullpage' class="nav-link headerLi">서비스 소개</a></li>`);
          }
        </script>
      </body>

      </html>