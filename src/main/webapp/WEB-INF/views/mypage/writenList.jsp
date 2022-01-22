<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
          integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
        <jsp:include page="../base/header.jsp"></jsp:include>
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
            margin: auto;
          }

          /* 사이드바 시작 */
          .sideBar {
            width: 200px;
            height: 1000px;
            background-color: rgb(240, 240, 240);
            float: left;
          }

          /* 초상화 공간 */
          .sideMyPortrait {
            width: 150px;
            height: 150px;
            margin-left: 25px;
            margin-top: 50px;
            position: relative;
          }

          .sideMyNick {
            width: 100%;
            height: 40px;
            line-height: 40px;
            text-align: center;
            /* background-color: aqua; */
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

          .sideBarMenuBox li:last-child a {
            background-color: rgb(255, 223, 181);
          }

          .portraitPhoto {
            width: 150px;
            height: 150px;
            border-radius: 10px;
          }

          /* 사이드바 끝 */
          .postList {
            border: 1px solid hotpink;
            width: 80%;
            height: 650px;
            margin-left: 20px;
            float: left;
            display: block;
            margin-top: 100px;
          }

          .postHeader {
            width: 100%;
            height: 50px;
            border: 1px solid saddlebrown;
          }

          .postHeader li {
            float: left;
            border: 1px solid gray;
          }

          .postHeader li:nth-child(1) {
            width: 15%;
          }

          .postHeader li:nth-child(2) {
            width: 15%;
          }

          .postHeader li:nth-child(3) {
            width: 40%;
          }

          .postHeader li:nth-child(4) {
            width: 8%;
          }

          .postHeader li:nth-child(5) {
            width: 8%;
          }

          .postHeader li:nth-child(6) {
            width: 10%;
          }

          .postContents {
            width: 100%;
            height: 60px;
            border: 1px solid yellowgreen;
          }

          .postContents li {
            float: left;
            width: 180px;
            border: 1px solid gray;
          }

          .postContents li:nth-child(1) {
            width: 15%;
          }

          .postContents li:nth-child(2) {
            width: 15%;
          }

          .postContents li:nth-child(3) {
            width: 40%;
          }

          .postContents li:nth-child(4) {
            width: 8%;
          }

          .postContents li:nth-child(5) {
            width: 8%;
          }

          .postContents li:nth-child(6) {
            width: 10%;
          }
        </style>
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
              <li><a href="/member/tourList">여행 기록</a></li>
              <li><a href="/member/saveList">찜 여행 목록</a></li>
              <li><a href="/member/writenList">게시글 관리</a></li>
            </ul>
          </div>
          <div class="postList">
            <ul class="postHeader">
              <li>작성일</li>
              <li>게시판</li>
              <li>제목</li>
              <li>조회수</li>
              <li>추천수</li>
              <li>전체선택 <input type="checkbox"></li>
            </ul>
            <!-- if문으로 board_num에 따라 각자의 detail페이지로 이동하는 a태그 만들어줘야함. -->
            <!-- 체크박스도 if문 써야될듯 -->
            <c:if test="${fn:length(list) == 0}">
              작성한 게시글이 없습니다.
            </c:if>
              <c:forEach var="list" items="${list}">
                <ul class="postContents">
                  <li>${list.writen_time}</li>
                  <li>${list.board_num}
                    <!-- if문으로 번호에 따라 게시판 이름 분기 -->
                  </li>
                  <li><a href="#">${list.title}</a><i class="far fa-comment-dots"
                      style="color: rgb(161, 161, 161)"></i><span id="rep_count" name="rep_count"
                      style="color: rgb(161, 161, 161)">${list.rep_count}</span></li>
                  <li>${list.view_count}</li>
                  <li>${list.rec_count}</li>
                  <li><input type="checkbox"></li>
                </ul>
              </c:forEach>
              <div>${navi}</div>
          </div>
        </div>
      </body>

      </html>