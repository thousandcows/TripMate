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

          /* 링크 속성 지우기 */
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
            height: 40px;
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

          /* 임시 색상 지정 */
          .tBoardHeader {
            color: rgb(12, 102, 64);
            font-weight: bold;
          }

          .cBoardHeader {
            color: rgb(133, 121, 19);
            font-weight: bold;
          }

          .myPostSearchBox{
            text-align: left;
          }
          .myPostNaviBox{
            text-align: center;
          }
          /* 삭제버튼 */
          .delBtnBox {
            text-align: right;
          }

          .nowPage{
            color:red;
            font-size:17px;
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
              <li>전체선택 <input type="checkbox" name="selectAllBox" onclick="selectAll(this)"></li>
            </ul>
            <!-- if문으로 board_num에 따라 각자의 detail페이지로 이동하는 a태그 만들어줘야함. -->
            <!-- 체크박스도 if문 써야될듯 -->
            <c:if test="${fn:length(list) == 0}">
              작성한 게시글이 없습니다.
            </c:if>
            검색된 게시글 수 : ${postCount}
            <c:forEach var="list" items="${list}">
              <ul class="postContents">
                <li>${list.writen_date}</li>
                <li>
                  <c:if test="${list.board_num == 1}">
                    <a href="/tourboard/list?cpage=1" class="tBoardHeader">여행 게시판</a>
                  </c:if>
                  <c:if test="${list.board_num == 2}">
                    <a href="/companyboard/list?cpage=1" class="cBoardHeader">동행 게시판</a>
                  </c:if>
                  <!-- if문으로 번호에 따라 게시판 이름 분기 -->
                </li>
                <li>
                  <c:if test="${list.board_num == 1}">
                    <a href="/tourboard/detail?seq=${list.seq}">${list.title}</a><i class="far fa-comment-dots"
                      style="color: rgb(161, 161, 161)"></i><span id="rep_count" name="rep_count"
                      style="color: rgb(161, 161, 161)">${list.rep_count}</span>
                  </c:if>
                  <c:if test="${list.board_num == 2}">
                    <a href="/companyboard/detail?seq=${list.seq}">${list.title}</a><i class="far fa-comment-dots"
                      style="color: rgb(161, 161, 161)"></i><span id="rep_count" name="rep_count"
                      style="color: rgb(161, 161, 161)">${list.rep_count}</span>
                  </c:if>
                </li>
                <li>${list.view_count}</li>
                <li>${list.rec_count}</li>
                <li><input type="checkbox" name="postCheckBox" onclick="checkSelectAll()"
                    value="${list.board_num},${list.seq}"></li>
              </ul>
            </c:forEach>
            <div class="row">
              <div class="col-4 myPostSearchBox"><input type="text" id="myPostSearchInput"><button type="button"
                  id="myPostSearchBtn">검색</button></div>
              <div class="col-4 myPostNaviBox">${navi}</div>
              <div class="col-4 delBtnBox"><button type="button" id="delBtn">삭제</button></div>
            </div>
          </div>
        </div>

        <script>
          'use strict'
          // 각 체크박스 컨트롤
          function checkSelectAll() {
            let postCheckBox = document.querySelectorAll("input[name='postCheckBox']");
            let checkedPostCheckBox = document.querySelectorAll("input[name='postCheckBox']:checked");
            let selectAllBox = document.querySelector("input[name='selectAllBox']");
            if (postCheckBox.length == checkedPostCheckBox.length) {
              selectAllBox.checked = true;
            } else {
              selectAllBox.checked = false;
            }
          }

          // 전체선택 컨트롤
          function selectAll(selectAll) {
            let checkBoxs = document.getElementsByName('postCheckBox');
            checkBoxs.forEach((checkBox) => {
              checkBox.checked = selectAll.checked
            });
          }

          // 게시글 선택삭제
          document.querySelector("#delBtn").addEventListener("click", () => {
            let checkBoxLength = document.querySelectorAll("input[name='postCheckBox']").length;
            let delList = new Array();
            for (let i = 0; i < checkBoxLength; i++) {
              if (document.querySelectorAll("input[name='postCheckBox']")[i].checked == true) {
                let beforeSplit = document.querySelectorAll("input[name='postCheckBox']")[i].value;
                let afterSplit = beforeSplit.split(",");
                let list = new Object();
                list.board_num = afterSplit[0];
                list.seq = afterSplit[1];
                delList.push(list);
              }
            }
            if (delList.length == 0) {
              alert("삭제할 게시글을 선택해주세요.");
              return false;
            } else {
              if (confirm("정말 삭제하시겠습니까?")) {
                $.ajax({
                  url: "/member/myPostDelList",
                  data: { list: JSON.stringify(delList) },
                  contentType: "application/json; charset=UTF-8",
                  async: false
                }).done(function (res) {
                  if (res == 0) {
                    alert("삭제할 게시글을 선택해주세요.");
                  } else {
                    alert("삭제되었습니다.");
                    location.reload();
                  }
                })
              }
            }
          });

          document.querySelector("#myPostSearchBtn").addEventListener("click", () => {
            let searchTitle = document.querySelector("#myPostSearchInput").value;
            console.log(searchTitle);
            location.href="/member/writenList?searchTitle="+searchTitle;
          })
        </script>
      </body>

      </html>