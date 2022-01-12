<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>Insert title here</title>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
      <style>
        /* 로그인&회원가입 시작*/
        /* 로그인버튼 임시 위치지정 */
        #loginBtn {
          margin-top: 200px;
          margin-left: 200px;
        }

        .modal-first-body {
          text-align: center;
        }

        #exampleModalToggleLabel {
          width: 100%;
          height: 50px;
          text-align: center;
          font-size: 28px;
        }

        /* 아이디&비밀번호 input */
        .loginInput {
          width: 80%;
          height: 40px;
          margin-top: 10px;
          border: 1px solid rgb(185, 185, 185);
          padding-left: 15px;
          border-radius: 5px;
        }

        .loginInputBox {
          text-align: center;
        }

        .loginBtns {
          text-align: center;
        }

        .loginBtns button {
          width: 39%;
          height: 40px;
          margin-top: 10px;
          border: none;
          border-radius: 7px;
          transition: all 0.5s;
        }

        .loginBtns button:first-child {
          background-color: #20B2AA;
          color: whitesmoke;
        }

        .loginBtns button:last-child {
          background-color: #20B2AA;
          color: rgb(249, 251, 255);
        }

        .loginBtns button:hover {
          opacity: 0.9;
        }

        .loginForm {
          margin-bottom: 5px;
        }

        /* 로그인 인풋 끝 */
        /* 회원가입 시작 */
        #signupModalBtn {
          width: 80%;
        }

        /* 회원가입창 로고부분 */
        #exampleModalToggleLabel2 {
          width: 100%;
          height: 50px;
          text-align: center;
          font-size: 28px;
        }

        /* 회원가입창 전체 중앙정렬 */
        .modal-signupBody {
          width: 80%;
          text-align: center;
          margin: auto;
        }

        /* 중복확인시 나타나는 글자 */
        .signupInputConfirm {
          font-size: 12px;
          color: cornflowerblue;
        }

        .emailIdConfirm {
          text-align: left;
        }

        .nickNameConfirm {
          text-align: left;
        }

        .signupBoxs {
          text-align: left;
        }

        .signupEmailInput,
        .signupNickNameInput {
          width: 70%;
          padding-left: 6px;
          margin-right: 20px;
          height: 36px;
          border-radius: 4px;
          border: 1px solid gray;
        }

        .signupCheckBtn {
          width: 76px;
          height: 36px;
          padding: 0;
          font-size: 14px;
          border: 1px solid gray;
          border-radius: 5px;
          background-color: white;
          color: rgb(63, 63, 63);
        }

        /* 이름, 비밀번호 */
        .signupLongInput {
          width: 96%;
          margin-bottom: 15px;
          border: 1px solid gray;
          border-radius: 4px;
          padding-left: 6px;
          height: 36px;
        }

        #kakaoLogin:hover {
          opacity: 0.85;
          cursor: pointer;
        }
      </style>
    </head>

    <body>
      <!-- 로그인&회원가입모달창 -->
      <div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel"
        tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalToggleLabel">TripMate(로고가 올듯)</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body modal-first-body">
              <form action=# method="post" class="loginForm">
                <div class="loginInputBox">
                  <input type="text" id="inputID" class="loginInput" placeholder="이메일 주소"><br>
                  <input type="password" id="inputPW" class="loginInput" placeholder="비밀번호">
                </div>
                <div class="loginBtns">
                  <button>로그인</button>
                  <button type="button" id="pwFind">PW찾기</button>
                </div>
              </form>
              <button type="button" id="signupModalBtn" class="btn btn-primary" data-bs-target="#exampleModalToggle2"
                data-bs-toggle="modal">회원가입</button><br>
              <img src="/images/kakao_login.png" id="kakaoLogin">
            </div>
          </div>
        </div>
      </div>
      <div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2"
        tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content modal-signup-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalToggleLabel2">회원가입</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body modal-signupBody">
              <form action="#" method="post">
                <div class="signupBoxs">
                  <input type="text" placeholder="이메일 주소" class="signupEmailInput"><button type="button"
                    class="signupCheckBtn">중복확인</button>
                  <div class="emailIdConfirm signupInputConfirm">테스트텍스트</div>
                </div>
                <div class="signupBoxs">
                  <input type="text" placeholder="닉네임" class="signupNickNameInput"><button type="button"
                    class="signupCheckBtn">중복확인</button>
                  <div class="nickNameConfirm signupInputConfirm">테스트텍스트</div>
                </div>
                <div class="signupBoxs">
                  <input type="text" placeholder="이름" class="signupLongInput">
                </div>
                <div class="signupBoxs">
                  <!-- 추후 password로 변경 -->
                  <input type="text" placeholder="비밀번호" class="signupLongInput">
                </div>
                <div class="signupBoxs">
                  <input type="text" placeholder="비밀번호 확인" class="signupLongInput">
                </div>
                <button>회원가입</button>
              </form>
            </div>
            <div class="modal-footer">
              <button class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal">돌아가기</button>
            </div>
          </div>
        </div>
      </div>
      <!-- 로그인&회원가입 모달창 끝 -->
      <!-- 로그인&회원가입버튼 -->
      <a class="btn btn-primary" id="loginBtn" data-bs-toggle="modal" href="#exampleModalToggle"
        role="button">로그인버튼입니다.</a>


      <script>
        document.querySelector("#pwFind").addEventListener("click", () => {
          window.open()
        })
      </script>

    </body>

    </html>