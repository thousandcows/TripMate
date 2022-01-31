<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>MyPage</title>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
      <link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
      <link rel="stylesheet" href="/css/myInfo.css" type="text/css">
      <jsp:include page="../base/header.jsp"></jsp:include>
    </head>

    <body>
      <div class="myPageContainer">
        <div class="sideBar">
          <div class="sideMyPortrait">
            <img src="${loginInfo.photo}" class="portraitPhoto">
          </div>
          <div class="sideMyNick">${loginInfo.nick}</div>
          <ul class="sideBarMenuBox">
            <li><a href="/member/mypageGo">개인정보 수정</a></li>
            <li><a href="/member/myplan?page=1">내 여행계획</a></li>
            <li><a href="/member/saveList">찜 여행 목록</a></li>
		    <li><a href="/member/writenList">게시글 관리</a></li>
          </ul>
        </div>
        <div class="contentsBox">
          <div class="contentsTop">
            개인 정보 수정
          </div>
          <div class="contentsMiddle">
            <div class="contentsMiddleIn">
              <form action="/member/myInfoChangeOk" method="post" enctype="multipart/form-data" id="myInfoChangeForm">
                <div class="nickAndPhotoBox">
                  <div class="sideMyPortrait MyPortrait">
                    <img src="${loginInfo.photo}" class="portraitPhoto" id="portraitPhoto" onchange="">
                    <input type="file" class="portraitInput" id="portraitInput" name="file"
                      accept="image/gif, image/jpeg, image/png">
                  </div>
                  <div class="myInfoNickBox">
                    <label for="nickname">닉네임</label><br>
                    <input type="text" value=${loginInfo.nick} class="longInput myInfoNickInput" name="nick"
                      id="myInfoNickInput">
                    <button type="button" class="myInfoNickCheck" id="myInfoNickCheck">중복확인</button>
                    <div class="myInfoCheckTxt myInfoNickConfirm">&nbsp;</div>
                    <c:if test="${loginInfo.sns_division == 0}">
                      <button type="button" class="changePwBtn2" data-bs-toggle="modal"
                        data-bs-target="#exampleModal">
                        비밀번호 변경
                      </button>
                    </c:if>
                  </div>
                </div>
                <table class="myInfoForm">
                  <c:if test="${loginInfo.sns_division == 0}">
                    <tr>
                      <th class="text-center">Email</th>
                      <td><input type="text" value=${loginInfo.emailID} readonly class="longInput" name="emailID"></td>
                    </tr>
                  </c:if>
                  <tr>
                    <th class="text-center">나이</th>
                    <td><input type="number" min="0" max="100" class="ageInput" id="ageInput" name="age"
                        value=${loginInfo.age}> 세</td>
                  </tr>
                  <tr>
                    <th class="text-center">성별</th>
                    <td>
                      <c:choose>
                        <c:when test="${loginInfo.gender == 'male'}">
                          <input type="radio" name="gender" value="male" class="genderInput" checked> 남성
                          &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="female" class="genderInput">
                          여성
                        </c:when>
                        <c:when test="${loginInfo.gender == 'female'}">
                          <input type="radio" name="gender" value="male" class="genderInput"> 남성
                          &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="female" class="genderInput"
                            checked> 여성
                        </c:when>
                        <c:otherwise>
                          <input type="radio" name="gender" value="male" class="genderInput"> 남성
                          &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="female" class="genderInput">
                          여성
                        </c:otherwise>
                      </c:choose>
                    </td>
                  </tr>
                  <tr>
                    <th class="text-center">연락처</th>
                    <td><input type="text" value="${loginInfo.phone}" maxlength="11" class="longInput"
                        id="myInfoPhoneInput" name="phone">
                      <button type="button" class="myInfoPhoneCheck" id="myInfoPhoneCheck">중복확인</button><input
                        type="checkbox" class="phOpen" name="ph_Open" <c:if test="${loginInfo.ph_Open == 'on'}">checked
                      </c:if>><span class="phOpenTxt">공개</span>
                      <div class="myInfoCheckTxt myInfoPhoneConfirm">&nbsp;</div>
                    </td>
                  </tr>
                  <tr>
                    <th class="text-center">여행 선호방식</th>
                    <td><select class="preferenceInput" name="preference" value=${loginInfo.preference}>
                        <option value="0" <c:if test="${loginInfo.preference == '0'}">selected</c:if>>선택해주세요.</option>
                        <option value="힐링 여행" <c:if test="${loginInfo.preference == '힐링 여행'}">selected</c:if>>힐링여행
                        </option>
                        <option value="먹거리 여행" <c:if test="${loginInfo.preference == '먹거리 여행'}">selected</c:if>>먹거리 여행
                        </option>
                        <option value="관광지 투어" <c:if test="${loginInfo.preference == '관광지 투어'}">selected</c:if>>관광지 투어
                        </option>
                        <option value="액티비티" <c:if test="${loginInfo.preference == '액티비티'}">selected</c:if>>액티비티
                        </option>
                        <option value="기분따라" <c:if test="${loginInfo.preference == '기분따라'}">selected</c:if>>기분따라
                        </option>
                      </select></td>
                  </tr>
                  <tr>
                    <th class="txtHead text-center">자기 소개</th>
                    <td><textarea cols="50" rows="5" maxlength="110" style="resize: none;" placeholder="자기소개를 입력해주세요."
                        class="txtInput" name="text">${loginInfo.text}</textarea></td>
                  </tr>
                </table>
                <div class="submitBtnss">
                  <button type="button" class="changeSubmitBtn" id="myInfoChangeGo">정보 수정</button>
                  <br>
                  <div class="submitBtns">
                    <c:if test="${loginInfo.sns_division != 0}">
                      <button type="button" id="kakaoLogOutBtn" class="deleteAccountBtn">카카오 로그아웃</a>
                    </c:if>
                    <button type="button" class="deleteAccountBtn" id="deleteAccountBtn">탈퇴하기</button>
                  </div>
                </div>
              </form>
              <form action="/member/deleteAccount" method="post" id="deleteAccountForm">
                <input type="text" value=${loginInfo.seq} name="seq" class="deleteAccountInput">
              </form>
            </div>
          </div>
        </div>
      </div>

      <!-- 비밀번호 변경Modal -->
      <div class="modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">비밀번호 변경</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form action="/member/myInfoPwChange" method="post" class="myInfoPwChangeForm" id="myInfoPwChangeForm">
                <input type="password" placeholder="새로운 비밀번호 입력" class="myInfoPwChangeInput" id="myInfoPwChangeInput"
                  name="pw">
                <div class="myInfoCheckTxt myInfoPwChangeConfirm">&nbsp;</div>
                <input type="password" placeholder="비밀번호 확인" class="myInfoPwChangeInput" id="myInfoPwChangeInputRe">
                <button type="button" class="myInfoPwChangeBtn" id="myInfoPwChangeBtn">변경</button>
              </form>
            </div>
          </div>
        </div>
      </div>

      <footer>
    	  <jsp:include page="../base/footer.jsp"></jsp:include>
      </footer>

      <script>
        'use strict'
        // 사진 미리보기및 파일 용량 제한
        document.querySelector("#portraitInput").onchange = function () {
          let maxSize = "5242880";
          if (this.files[0].size > maxSize) {
            alert("5MB이하의 파일만 가능합니다.");
            return false;
          }
          let reader = new FileReader();
          reader.onload = function (e) {
            document.querySelector("#portraitPhoto").src = e.target.result;
          }
          reader.readAsDataURL(this.files[0]);
        }

        // 일반사용자 가입폼 정규식
        let myInfoNickSubmitCheck = false;
        let myInfoPhoneSubmitCheck = false;

        // 현재 닉네임
        let nowNick = "${loginInfo.nick}";
        document.querySelector("#myInfoNickCheck").addEventListener("click", () => {
          if (document.querySelector("#myInfoNickInput").value == nowNick) {
            document.querySelector(".myInfoNickConfirm").style.color = "cornflowerblue";
            document.querySelector(".myInfoNickConfirm").innerHTML = "현재 닉네임을 유지합니다.";
            myInfoNickSubmitCheck = true;
          } else {
            let nickNameRegex = /^([a-zA-Z0-9가-힣]){1,8}$/;
            let myInfoNickInput = document.querySelector("#myInfoNickInput").value
            if (nickNameRegex.test(myInfoNickInput)) {
              $.ajax({
                url: "/member/nickNameCheck",
                data: { nickName: myInfoNickInput }
              }).done(function (res) {
                if (res == "1") {
                  document.querySelector(".myInfoNickConfirm").style.color = "red";
                  document.querySelector(".myInfoNickConfirm").innerHTML = "사용중인 닉네임입니다.";
                  myInfoNickSubmitCheck = false;
                } else {
                  document.querySelector(".myInfoNickConfirm").style.color = "cornflowerblue";
                  document.querySelector(".myInfoNickConfirm").innerHTML = "사용 가능한 닉네임입니다.";
                  myInfoNickSubmitCheck = true;
                }
              })
            } else {
              document.querySelector(".myInfoNickConfirm").style.color = "red";
              document.querySelector(".myInfoNickConfirm").innerHTML = "완성된 한글, 영문, 숫자를 포함한 8글자 이내";
              myInfoNickSubmitCheck = false;
            }
          }
        });

        // 현재 핸드폰 번호
        let nowPhone = "${loginInfo.phone}";
        document.querySelector("#myInfoPhoneCheck").addEventListener("click", () => {
          if (document.querySelector("#myInfoPhoneInput").value == nowPhone) {
            document.querySelector(".myInfoPhoneConfirm").style.color = "cornflowerblue";
            document.querySelector(".myInfoPhoneConfirm").innerHTML = "현재 연락처를 유지합니다.";
            myInfoPhoneSubmitCheck = true;
          } else {
            let phoneRegex = /^[0-9]{11}$/;
            let myInfoPhoneInput = document.querySelector("#myInfoPhoneInput").value
            if (phoneRegex.test(myInfoPhoneInput)) {
              $.ajax({
                url: "/member/phoneCheck",
                data: { phone: myInfoPhoneInput }
              }).done(function (res) {
                if (res == "1") {
                  document.querySelector(".myInfoPhoneConfirm").style.color = "red";
                  document.querySelector(".myInfoPhoneConfirm").innerHTML = "사용중인 번호입니다.";
                  myInfoPhoneSubmitCheck = false;
                } else {
                  document.querySelector(".myInfoPhoneConfirm").style.color = "cornflowerblue";
                  document.querySelector(".myInfoPhoneConfirm").innerHTML = "사용가능한 번호입니다.";
                  myInfoPhoneSubmitCheck = true;
                }
              })
            } else {
              document.querySelector(".myInfoPhoneConfirm").style.color = "red";
              document.querySelector(".myInfoPhoneConfirm").innerHTML = "유효한 번호를 입력해주세요.";
              myInfoPhoneSubmitCheck = false;
            }
          }
        });

        // 일반회원 수정완료 누르기
        document.querySelector("#myInfoChangeGo").addEventListener("click", () => {
          if (document.querySelector("#myInfoNickInput").value == nowNick) {
            myInfoNickSubmitCheck = true;
          } else {
            let nickNameRegex = /^([a-zA-Z0-9가-힣]){1,8}$/;
            let myInfoNickInput = document.querySelector("#myInfoNickInput").value
            if (nickNameRegex.test(myInfoNickInput)) {
              $.ajax({
                url: "/member/nickNameCheck",
                async: false,
                data: { nickName: myInfoNickInput }
              }).done(function (res) {
                if (res == "1") {
                  document.querySelector(".myInfoNickConfirm").style.color = "red";
                  document.querySelector(".myInfoNickConfirm").innerHTML = "사용중인 닉네임입니다.";
                  myInfoNickSubmitCheck = false;
                } else {
                  document.querySelector(".myInfoNickConfirm").style.color = "cornflowerblue";
                  document.querySelector(".myInfoNickConfirm").innerHTML = "사용 가능한 닉네임입니다.";
                  myInfoNickSubmitCheck = true;
                }
              })
            } else {
              document.querySelector(".myInfoNickConfirm").style.color = "red";
              document.querySelector(".myInfoNickConfirm").innerHTML = "완성된 한글, 영문, 숫자를 포함한 8글자 이내";
              myInfoNickSubmitCheck = false;
            }
          }

          if (document.querySelector("#myInfoPhoneInput").value == nowPhone) {
            myInfoPhoneSubmitCheck = true;
          } else {
            let phoneRegex = /^[0-9]{11}$/;
            let myInfoPhoneInput = document.querySelector("#myInfoPhoneInput").value
            if (phoneRegex.test(myInfoPhoneInput)) {
              $.ajax({
                url: "/member/phoneCheck",
                async: false,
                data: { phone: myInfoPhoneInput }
              }).done(function (res) {
                if (res == "1") {
                  document.querySelector(".myInfoPhoneConfirm").style.color = "red";
                  document.querySelector(".myInfoPhoneConfirm").innerHTML = "사용중인 번호입니다.";
                  myInfoPhoneSubmitCheck = false;
                } else {
                  document.querySelector(".myInfoPhoneConfirm").style.color = "cornflowerblue";
                  document.querySelector(".myInfoPhoneConfirm").innerHTML = "사용가능한 번호입니다.";
                  myInfoPhoneSubmitCheck = true;
                }
              })
            } else {
              document.querySelector(".myInfoPhoneConfirm").style.color = "red";
              document.querySelector(".myInfoPhoneConfirm").innerHTML = "유효한 번호를 입력해주세요.";
              myInfoPhoneSubmitCheck = false;
            }
          }

          if (!myInfoNickSubmitCheck) {
            alert("닉네임을 확인 해주세요.");
            return false;
          }
          if (!myInfoPhoneSubmitCheck) {
            alert("연락처를 확인 해주세요.");
            return false;
          }

          let ageInput = document.querySelector("#ageInput").value
          if (!(0 <= ageInput && ageInput <= 100)) {
            alert("나이를 정수로 입력해주세요.");
            return false;
          }
          if (ageInput == "") {
            alert("나이를 정수로 입력해주세요.");
            return false;
          }
          if (confirm("수정하시겠습니까?")) {
            document.querySelector("#myInfoChangeForm").submit();
          }
        });

        // 비밀번호 변경
        document.querySelector("#myInfoPwChangeBtn").addEventListener("click", () => {
          let pwRegex = /^[A-Za-z0-9\S]{8,16}$/;
          let myInfoPwChangeInput = document.querySelector("#myInfoPwChangeInput").value;
          let myInfoPwChangeInputRe = document.querySelector("#myInfoPwChangeInputRe").value;
          if (myInfoPwChangeInput != myInfoPwChangeInputRe) {
            document.querySelector(".myInfoPwChangeConfirm").style.color = "red";
            document.querySelector(".myInfoPwChangeConfirm").innerHTML = "입력된 비밀번호가 다릅니다.";
            return false;
          }
          if (!pwRegex.test(myInfoPwChangeInput)) {
            document.querySelector(".myInfoPwChangeConfirm").style.color = "red";
            document.querySelector(".myInfoPwChangeConfirm").innerHTML = "공백 없는 8~16자로 입력해주세요.";
            return false;
          }
          if (confirm("비밀번호를 변경하시겠습니까?")) {
            document.querySelector("#myInfoPwChangeForm").submit();
          }
        });

        // 회원 탈퇴
        document.querySelector("#deleteAccountBtn").addEventListener("click", () => {
          if (confirm("모든정보가 삭제됩니다. 정말 탈퇴하시겠습니까?")) {
            alert("탈퇴되었습니다. 이용해주셔서 감사합니다.");
            document.getElementById("deleteAccountForm").submit();
          }
        });

        if (document.querySelector("#kakaoLogOutBtn") != null) {
          document.querySelector("#kakaoLogOutBtn").addEventListener("click", () => {
            let seq = "${loginInfo.seq}";
            alert("사이트에서 로그아웃 되었습니다.");
            $.ajax({
              type: "post",
              url: "/member/kakaoLogOut",
              data: { seq: seq }
            }).done(function (res) {
              location.href = res;
            })
          });
        }
      </script>
    </body>

    </html>