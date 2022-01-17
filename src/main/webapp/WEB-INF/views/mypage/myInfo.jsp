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
          height: 100%;
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
          height: 100%;
          background-color: rgb(153, 204, 245);
          padding-top: 30px;
        }

        .contentsMiddleIn {
          width: 800px;
          margin: auto;
          height: 100%;
          background-color: cornsilk;
        }

        .contentsMiddleIn ul:first-child {
          width: 300px;
          margin: 0;
          padding: 0;
          float: left;
        }

        .contentsMiddleIn ul:first-child li {
          height:70px;
          margin-left: 120px;
          text-align: left;
        }

        .contentsMiddleIn ul:last-child {
          margin: 0;
          padding: 0;
          width: 500px;
          float: left;
        }

        .contentsMiddleIn ul:last-child li {
          height:70px;
        }

        /* input들 */
        .emailInput, .nickInput, .phoneInput{
          width:280px;
          height:40px;
          padding-left:10px;
          border-radius: 5px;
          border:1px solid rgb(190, 190, 190);
        }
        .ageInput{
          height:40px;
          width:50px;
          padding-left: 7px;
        }
        .preferenceInput{
          width:340px;
          height:40px;
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
            초상화
          </div>
          <div class="sideMyNick">OO회원님 안녕하세요.</div>
          <ul class="sideBarMenuBox">
            <li><a href="#">개인정보 수정</a></li>
            <li><a href="#">여행 기록</a></li>
            <li><a href="#">찜 여행 목록</a></li>
            <li><a href="#">게시글 관리</a></li>
          </ul>
        </div>
        <div class="contentsBox">
          <div class="contentsTop">
            개인 정보 수정(배경사진이쁜걸로 넣으면될듯)
          </div>
          <div class="contentsMiddle">
            <div class="contentsMiddleIn">
              <ul>
                <li>Email-ID</li>
                <li>닉네임</li>
                <li>나이</li>
                <li>성별</li>
                <li>연락처</li>
                <li>여행 선호방식</li>
                <li>신고 횟수</li>
                <li>자기소개</li>
              </ul>
              <ul>
                <li><input type="text" value="Test1234@naver.com" class="emailInput" disabled></li>
                <li><input type="text" value="닉네임" class="nickInput"></li>
                <li><input type="number" min="14" max="100" class="ageInput"></li>
                <li><input type="radio" name="gender" value="male"> 남성 &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="female"> 여성</li>
                <li><input type="text" value="걍 합쳐버릴까.." class="phoneInput"></li>
                <li>
                  <select class="preferenceInput">
                    <option value="0">선택하세요</option>
                    <option value="1">여행선호1</option>
                    <option value="2">여행선호3</option>
                    <option value="3">여행선호3</option>
                    <option value="4">여행선호4</option>
                    <option value="5">여행선호5</option>
                  </select>
                </li>
                <li>0</li>
                <li><textarea cols="50" rows="5" maxlength="120" style="resize: none;" placeholder="자기소개를 입력해주세요."></textarea></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <footer>
        푸우터
      </footer>
    </body>

    </html>