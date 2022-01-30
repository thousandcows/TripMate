<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
      <!DOCTYPE html>
      <html>

      <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
          <link rel="stylesheet" href="/css/writenList.css" type="text/css">
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
            <div class="notPost">
            <c:if test="${fn:length(list) == 0}">
              작성한 게시글이 없습니다.
            </c:if>
            검색된 게시글 수 : ${postCount}
          </div>
            <div class="mypostBottoms">
              <div class="myPostSearchBox"><input type="text" id="myPostSearchInput" class="myPostSearchInput" placeholder="검색 제목.."><button type="button"
                  id="myPostSearchBtn" class="myPostSearchBtn">검색</button></div>
              <div class="myPostNaviBox">${navi}</div>
              <div class="delBtnBox"><button type="button" id="delBtn" class="delBtn">삭제</button></div>
            </div>
          </div>
        </div>
        <footer>
    	    <jsp:include page="../base/footer.jsp"></jsp:include>
        </footer>

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
          });
        </script>
      </body>

      </html>