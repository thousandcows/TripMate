<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>Mypage</title>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
      <link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
      <style>
        /* 간단세팅 나중에 css파일 따로 뺄거*/
        * {
          box-sizing: border-box;
          padding: 0;
          margin: 0;
          list-style: none;
        }

        a {
          text-decoration: none;
        }

        /* 전체영역 크기 조절 */
        .myPageContainer {
          width: 1200px;
          display: flex;
          margin: auto;
        }

        /* 사이드바 시작 */
        .sideBar {
          width: 200px;
          height: 100%;
          background-color: rgb(240, 240, 240);
        }

        /* 초상화 공간 */
        .sideMyPortrait {
          width: 150px;
          height: 150px;
          margin-left: 25px;
          margin-top: 50px;
          background-color: hotpink;
          position: relative;
        }

        .sideMyNick {
          width: 100%;
          height: 40px;
          line-height: 40px;
          text-align: center;
          background-color: aqua;
        }

        /* 사이드바 메뉴 */
        .sideBarMenuBox {
          margin-top: 50px;
        }

        .sideBarMenuBox li {
          margin-top: 20px;
        }

        .sideBarMenuBox li a {
          width: 140px;
          height: 40px;
          border-radius: 20px;
          line-height: 40px;
          text-align: center;
          background-color: antiquewhite;
          display: block;
          color: black;
          box-shadow: 1px 1px 2px 1px rgb(224, 224, 224);
        }

        .sideBarMenuBox li a:hover {
          box-shadow: 1px 1px 2px 1px rgb(211, 211, 211);
        }

        .sideBarMenuBox li:first-child a {
          background-color: rgb(255, 228, 193);
        }

        /* 사이드바 끝 */

        /* 정보수정 시작 */
        .contentsBox {
          display: flex;
          flex-direction: column;
        }

        .contentsTop {
          width: 1000px;
          background-color: bisque;
          height: 200px;
          line-height: 200px;
          text-align: center;
          font-size: 26px;
        }

        .contentsMiddle {
          width: 100%;
          background-color: rgb(153, 204, 245);
        }

        .contentsMiddleIn {
          width: 600px;
          margin: auto;
          height: 1050px;
          background-color: cornsilk;
        }
        .myInfoForm{
          margin-top:10px;
        }
        .myInfoForm th {
          width: 200px;
          height: 70px;
          color: rgb(94, 94, 94);
        }

        /* input들 */
        .longInput {
          width: 250px;
          height: 40px;
          border-radius: 5px;
          border: 1px solid rgb(173, 173, 173);
          padding-left: 10px;
        }

        .ageInput {
          width: 50px;
          height: 40px;
          padding-left: 10px;
        }

        .genderInput {
          width: 16px;
          height: 16px;
        }

        .preferenceInput {
          width: 300px;
          height: 40px;
        }

        .txtInput {
          margin-top: 30px;
        }

        .txtHead {
          vertical-align: top;
        }

        /* 탈퇴&수정버튼들 */
        .deleteAccountBtn{
          color:gray;
          font-size:14px;
        }
        .deleteAccountBtn:hover{
          color:lightslategray;
          border-bottom:1px solid gray;
        }
        .changeSubmitBtn{
          width:250px;
          height:40px;
          border:none;
          border-radius: 5px;
          box-shadow: 1px 1px 2px 1px rgb(177, 177, 177);
          background-color:greenyellow;
        }
        /* 사진 수정 */
        .portraitInput {
          width: 150px;
          height: 150px;
          background-color: aliceblue;
          position: absolute;
          opacity: 0;
        }

        .portraitPhoto {
          width: 150px;
          height: 150px;
          position: absolute;
        }

        .submitBtnss {
          margin-top:50px;
          width: 100%;
          height: 70px;
          background-color: hotpink;
        }
        .submitBtns{
          text-align: right;
        }

        /* 정보수정 끝 */
        footer {
          width: 100%;
          height: 300px;
          background-color: aliceblue;
        }
      </style>
    </head>

    <body>
      <div class="myPageContainer">
        <div class="sideBar">
          <div class="sideMyPortrait">
            <img src="/resources/images/default_profile.png" class="portraitPhoto">
          </div>
          <div class="sideMyNick">${loginInfo.nick}</div>
          <ul class="sideBarMenuBox">
            <li><a href="#">개인정보 수정</a></li>
            <li><a href="#">여행 기록</a></li>
            <li><a href="#">찜 여행 목록</a></li>
            <li><a href="#">게시글 관리</a></li>
          </ul>
        </div>
        <div class="contentsBox">
          <div class="contentsTop">
            개인 정보 수정
          </div>
          <div class="contentsMiddle">
            <div class="contentsMiddleIn">
              <form action="/member/myInfoChangeOk" method="post" enctype="multipart/form-data">
                <div class="sideMyPortrait">
                  <img src="/resources/images/default_profile.png" class="portraitPhoto" id="portraitPhoto">
                  <input type="file" class="portraitInput" id="portraitInput" name="file">
                </div>
                <table class="myInfoForm">
                  <tr>
                    <th>Email</th>
                    <td><input type="text" value=${loginInfo.emailID} readonly class="longInput" name="emailID"></td>
                  </tr>
                  <tr>
                    <th>비밀번호</th>
                    <td><input type="password" class="longInput"></td>
                  </tr>
                  <tr>
                    <th>비밀번호 확인</th>
                    <td><input type="password" class="longInput" name="pw"></td>
                  </tr>
                  <tr>
                    <th>닉네임</th>
                    <td><input type="text" value=${loginInfo.nick} class="longInput" name="nick"></td>
                  </tr>
                  <tr>
                    <th>나이</th>
                    <td><input type="number" min="14" max="100" class="ageInput" name="age" value="${loginInfo.age}"></td>
                  </tr>
                  <tr>
                    <th>성별</th>
                    <td><input type="radio" name="gender" value="male" class="genderInput"> 남성
                      &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="female" class="genderInput"> 여성
                    </td>
                  </tr>
                  <tr>
                    <th>연락처</th>
                    <td><input type="text" value=${loginInfo.phone} class="longInput" name="phone"></td>
                  </tr>
                  <tr>
                    <th>여행 선호방식</th>
                    <td><select class="preferenceInput" name="preference" value=${loginInfo.preference}>
                        <option value="0">선택하세요</option>
                        <option value="1">여행선호1</option>
                        <option value="2">여행선호3</option>
                        <option value="3">여행선호3</option>
                        <option value="4">여행선호4</option>
                        <option value="5">여행선호5</option>
                      </select></td>
                  </tr>
                  <tr>
                    <th>신고 횟수</th>
                    <td>${loginInfo.violation}</td>
                  </tr>
                  <tr>
                    <th calss="txtHead">자기 소개</th>
                    <td><textarea cols="50" rows="5" maxlength="120" style="resize: none;" placeholder="자기소개를 입력해주세요."
                        class="txtInput" name="text" value=${loginInfo.text}></textarea></td>
                  </tr>
                </table>
                <div class="submitBtnss">
                  <div class="submitBtns">
                    <button class="changeSubmitBtn">수정버튼</button>
                    <a href="#" class="deleteAccountBtn">탈퇴버튼</a>
                    <a href="#" class="deleteAccountBtn">카카오 탈퇴버튼</a>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <footer>
        푸우터
      </footer>

      <script>
        'use strict'
        document.querySelector("#portraitInput").onchange = function () {
          let reader = new FileReader();
          reader.onload = function (e) {
            document.querySelector("#portraitPhoto").src = e.target.result;
          }
          reader.readAsDataURL(this.files[0]);
        }
      </script>
    </body>

    </html>