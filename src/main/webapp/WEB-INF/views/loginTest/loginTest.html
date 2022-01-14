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

        .normalLoginConfirm {
          text-align: left;
          padding-left: 50px;
        }

        /* 로그인 인풋 끝 */
        /* 회원가입 시작 */
        #signupModalBtn {
          width: 80%;
          background: linear-gradient(45deg, cornflowerblue, rgb(121, 187, 241));
          border: none;
          height: 40px;
          margin-bottom: 8px;
          margin-top: 7px;
        }

        #signupModalBtn:hover {
          opacity: 0.9;
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
          height: 20px;
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

        .signupCheckBtn:hover {
          background-color: rgb(250, 250, 250);
        }

        /* 비밀번호 */
        .signupLongInput {
          width: 96%;
          border: 1px solid gray;
          border-radius: 4px;
          padding-left: 6px;
          height: 36px;
        }

        /* 휴대폰 입력란 */
        .phoneInput {
          width: 22%;
          height: 36px;
          padding-left: 6px;
        }

        .phoneInput:first-child {
          width: 15%;
        }

        #signupPhoneCheckBtn {
          margin-left: 24px;
        }

        #signupPhone {
          display: none;
        }

        /* 회원가입Go버튼 */
        .signupGoBtn {
          width: 96%;
          height: 40px;
          border: none;
          border-radius: 6px;
          background: linear-gradient(45deg, cornflowerblue, rgb(121, 187, 241));
          color: white;
        }

        .signupGoBtn:hover {
          opacity: 0.9;
        }

        .signupBack {
          background-color: #20B2AA;
          border: none;
          height: 30px;
          width: 70px;
          padding: 0;
          font-size: 13px;
        }

        #kakaoLogin {
          margin-bottom: 20px;
        }

        #kakaoLogin:hover {
          opacity: 0.85;
          cursor: pointer;
        }

        /* 비밀번호 모달창 시작 */
        .findPwInput {
          width: 64%;
          height: 40px;
          border: 1px solid gray;
          padding-left: 10px;
          border-radius: 5px;
        }

        .findPwBtn {
          border: none;
          height: 38px;
          width: 60px;
          background-color: #20B2AA;
          border-radius: 5px;
          color: white;
          font-size: 16px;
        }

        .findPwBtn:hover {
          opacity: 0.9;
        }
      </style>
    </head>

    <body>

      <c:choose>
        <c:when test="${loginEmailID != null}">
          ${loginEmailID} 님 환영 ㅎㅎ<br>
          ${loginSeq}<br>
          ${loginNick}<br>
          <a href="/member/normalLogout">로그아웃</a>
        </c:when>
        <c:otherwise>
          <!-- 로그인 모달창 -->
          <div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel"
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
                  <button type="button" id="signupModalBtn" class="btn btn-primary"
                    data-bs-target="#exampleModalToggle2" data-bs-toggle="modal">회원가입</button><br>
                  <img src="/images/kakao_login.png" id="kakaoLogin">
                </div>
              </div>
            </div>
          </div>
          <!-- 회원가입 모달창 -->
          <div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2"
            tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
              <div class="modal-content modal-signup-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalToggleLabel2">회원가입</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body modal-signupBody">
                  <form action="/member/normalSignup" method="post" onsubmit="return signupGo()">
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
                      <input type="text" value="010" class="phoneInput" id="signupPhone1" readonly> -
                      <input type="text" maxlength="4" placeholder="1234" class="phoneInput" id="signupPhone2" required>
                      -
                      <input type="text" maxlength="4" placeholder="5678" class="phoneInput" id="signupPhone3"
                        required><button type="button" class="signupCheckBtn" id="signupPhoneCheckBtn">인증?</button>
                      <div class="phoneConfirm signupInputConfirm"></div>
                      <input type="text" name="phone" id="signupPhone">
                    </div>
                    <div class="signupBoxs">
                      <!-- 추후 password로 변경 -->
                      <input type="password" placeholder="비밀번호 (8자 ~ 16자)" class="signupLongInput" id="signupPw"
                        required>
                      <div class="pwConfirm signupInputConfirm"></div>
                    </div>
                    <div class="signupBoxs">
                      <input type="password" placeholder="비밀번호 확인" class="signupLongInput" id="signupPwRe" name="pw"
                        required>
                      <div class="pwReConfirm signupInputConfirm"></div>
                    </div>
                    <div class="signupBoxs">
                      <button class="signupGoBtn">회원가입</button>
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
          <div class="modal fade" id="exampleModalToggle3" aria-hidden="true" aria-labelledby="exampleModalToggleLabel"
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
                    <div class="signupInputConfirm normalLoginConfirm">테스트텍스트</div>
                    <input type="text" class="findPwInput" placeholder="인증번호 입력">
                    <button type="button" class="findPwBtn">인증</button>
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
          <!-- 로그인&회원가입버튼 -->
          <a class="btn btn-primary" id="loginBtn" data-bs-toggle="modal" href="#exampleModalToggle"
            role="button">로그인버튼입니다.</a>


        </c:otherwise>
      </c:choose>

      <script>
        "use strict";
        // 일반 회원가입 시작
        // 회원가입 중복확인용 변수들
        let emailSubmitCheck = false;
        let nickNameSubmitCheck = false;
        let phoneSubmitCheck = false;
        let pwSubmitCheck = false;
        let pwReSubmitCheck = false;
        // 이메일 중복확인
        let eventCheck = document.querySelector("#signupEmailCheckBtn");
        if (eventCheck != null) {
          document.querySelector("#signupEmailCheckBtn").addEventListener("click", () => {
            let emailRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
            let signupEmailValue = document.querySelector("#signupEmail").value
            if (emailRegex.test(signupEmailValue)) {
              $.ajax({
                type: "post",
                url: "/member/emailCheck",
                data: { email: signupEmailValue }
              }).done(function (res) {
                if (res == "1") {
                  document.querySelector(".emailConfirm").style.color = "red";
                  document.querySelector(".emailConfirm").innerHTML = "사용중인 이메일입니다.";
                  emailSubmitCheck = false;
                } else {
                  document.querySelector(".emailConfirm").style.color = "cornflowerblue";
                  document.querySelector(".emailConfirm").innerHTML = "사용 가능한 이메일입니다.";
                  emailSubmitCheck = true;
                }
              })
            } else {
              document.querySelector(".emailConfirm").style.color = "red";
              document.querySelector(".emailConfirm").innerHTML = "이메일 양식을 확인해주세요.";
              emailSubmitCheck = false;
            }
          });
          // 닉네임 중복확인
          document.querySelector("#signupNickNameCheckBtn").addEventListener("click", () => {
            let nickNameRegex = /^([a-zA-Z0-9가-힣]){1,8}$/;
            let signupNickNameValue = document.querySelector("#signupNickName").value
            if (nickNameRegex.test(signupNickNameValue)) {
              $.ajax({
                url: "/member/nickNameCheck",
                data: { nickName: signupNickNameValue }
              }).done(function (res) {
                if (res == "1") {
                  document.querySelector(".nickNameConfirm").style.color = "red";
                  document.querySelector(".nickNameConfirm").innerHTML = "사용중인 닉네임입니다.";
                  nickNameSubmitCheck = false;
                } else {
                  document.querySelector(".nickNameConfirm").style.color = "cornflowerblue";
                  document.querySelector(".nickNameConfirm").innerHTML = "사용 가능한 닉네임입니다.";
                  nickNameSubmitCheck = true;
                }
              })
            } else {
              document.querySelector(".nickNameConfirm").style.color = "red";
              document.querySelector(".nickNameConfirm").innerHTML = "완성된 한글, 영문, 숫자를 포함한 8글자 이내";
              nickNameSubmitCheck = false;
            }
          });
          // 휴대폰 중복확인
          document.querySelector("#signupPhoneCheckBtn").addEventListener("click", () => {
            let phoneRegex = /^[0-9]{11}$/;
            let phone1 = document.querySelector("#signupPhone1").value
            let phone2 = document.querySelector("#signupPhone2").value
            let phone3 = document.querySelector("#signupPhone3").value
            let phone4 = phone1 + phone2 + phone3 + "";
            document.querySelector("#signupPhone").value = phone4;
            if (phoneRegex.test(phone4)) {
              $.ajax({
                url: "/member/phoneCheck",
                data: { phone: phone4 }
              }).done(function (res) {
                if (res == "1") {
                  document.querySelector(".phoneConfirm").style.color = "red";
                  document.querySelector(".phoneConfirm").innerHTML = "사용중인 번호입니다.";
                  phoneSubmitCheck = false;
                } else {
                  document.querySelector(".phoneConfirm").style.color = "cornflowerblue";
                  document.querySelector(".phoneConfirm").innerHTML = "사용가능한 번호입니다.";
                  phoneSubmitCheck = true;
                }
              })
            } else {
              document.querySelector(".phoneConfirm").style.color = "red";
              document.querySelector(".phoneConfirm").innerHTML = "유효한 번호를 입력해주세요.";
              phoneSubmitCheck = false;
            }
          });

          // 비밀번호 확인
          let signupPw = document.querySelector("#signupPw");
          let signupPwRe = document.querySelector("#signupPwRe");
          signupPw.addEventListener("input", () => {
            let pwRegex = /^[A-Za-z0-9\S]{8,16}$/;
            if (pwRegex.test(signupPw.value)) {
              document.querySelector(".pwConfirm").style.color = "cornflowerblue";
              document.querySelector(".pwConfirm").innerHTML = "사용 가능한 PW입니다.";
              pwSubmitCheck = true;
            } else {
              document.querySelector(".pwConfirm").style.color = "red";
              document.querySelector(".pwConfirm").innerHTML = "공백 없는 8~16자로 입력해주세요.";
              pwSubmitCheck = false;
            }
            if (signupPw.value == signupPwRe.value) {
              document.querySelector(".pwReConfirm").style.color = "cornflowerblue";
              document.querySelector(".pwReConfirm").innerHTML = "PW가 일치합니다.";
              pwReSubmitCheck = true;
            } else {
              document.querySelector(".pwReConfirm").style.color = "red";
              document.querySelector(".pwReConfirm").innerHTML = "PW가 일치하지 않습니다.";
              pwReSubmitCheck = false;
            }
          });
          signupPwRe.addEventListener("input", () => {
            if (signupPw.value == signupPwRe.value) {
              document.querySelector(".pwReConfirm").style.color = "cornflowerblue";
              document.querySelector(".pwReConfirm").innerHTML = "PW가 일치합니다.";
              pwReSubmitCheck = true;
            } else {
              document.querySelector(".pwReConfirm").style.color = "red";
              document.querySelector(".pwReConfirm").innerHTML = "PW가 일치하지 않습니다.";
              pwReSubmitCheck = false;
            }
          })
          // 회원가입 완료 버튼
          function signupGo() {
            if (!emailSubmitCheck) {
              alert("이메일을 확인해주세요.");
              return false;
            }

            if (!nickNameSubmitCheck) {
              alert("닉네임을 확인해주세요.");
              return false;
            }

            if (!phoneSubmitCheck) {
              alert("휴대폰번호를 확인해주세요.");
              return false;
            }

            if (!pwSubmitCheck) {
              alert("비밀번호를 확인해주세요.");
              return false;
            }

            if (!pwReSubmitCheck) {
              alert("입력된 비밀번호가 다릅니다.");
              return false;
            }
          }
          // 일반 회원가입 끝

          // 일반 로그인 시작
          document.querySelector("#normalLoginBtn").addEventListener("click", () => {
            let emailID = document.querySelector("#normalLoginID").value
            let pw = document.querySelector("#normalLoginPW").value
            console.log("아이디 : " + emailID);
            console.log("비번 : " + pw);
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
              } else {
                location.reload();
              }
            })
          })

          // 카카오 로그인
          document.querySelector("#kakaoLogin").addEventListener("click", () => {
            $.ajax({
              url: '/member/getKakaoAuthUrl',
              type: 'get'
            }).done(function (res) {
              location.href = res;
            })
          })
        }
      </script>

    </body>

    </html>