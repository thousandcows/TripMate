<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            display: flex;
            margin: auto;
          }

          /* 사이드바 시작 */
          .sideBar {
            width: 200px;
            height: 1000px;
            background-color: rgb(240, 240, 240);
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

          .sideBarMenuBox li:nth-child(2) a {
            background-color: rgb(255, 223, 181);
          }

          /* 사이드바 끝 */
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
              <li><a href="/member/myplan?page=1">내 여행계획</a></li>
              <li><a href="/member/saveList">찜 여행 목록</a></li>
              <li><a href="/member/writenList">게시글 관리</a></li>
            </ul>
          </div>
          <div class="container">
            <div class="row">
              <div class="col">
                <div class="row">
                  <div class="col-6">
                    제목
                  </div>
                  <div class="col-2">
                    여행 시작일
                  </div>
                  <div class="col-2">
                    여행 종료일
                  </div>
                  <div class="col-2">
                    진행 상황
                  </div>
                </div>
                <c:set var="now" value="<%=new java.util.Date()%>" />
                <c:forEach var="i" items="${list }">
                  <div class="row">
                    <div class="col-6">
                      <a href="/plan/detail?seq=${i.seq }">${i.title }</a>
                    </div>
                    <div class="col-2">
                      ${i.startDate }
                    </div>
                    <div class="col-2">
                      ${i.endDate }
                    </div>
                    <div class="col-2">
                      <fmt:parseDate value="${i.startDate }" var="startDate" pattern="yyyy.MM.dd" />
                      <fmt:parseDate value="${i.endDate }" var="endDate" pattern="yyyy.MM.dd" />
                      <fmt:parseNumber value="${startDate.time / (1000*60*60*24)}" integerOnly="true" var="start" />
                      <fmt:parseNumber value="${endDate.time / (1000*60*60*24)}" integerOnly="true" var="end" />
                      <fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowD" />
                      <c:if test="${start-nowD > 0 }">
                        <div>예정</div>
                      </c:if>
                      <c:if test="${start-nowD < 0 and end-nowD >= 0}">
                        <div>진행중</div>
                      </c:if>
                      <c:if test="${end-nowD < 0}">
                        <div>완료</div>
                      </c:if>

                    </div>
                  </div>
                </c:forEach>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <c:forEach var="i" items="${paging }">
                  <button type="button btn paging btn-primary">
                    <a href="/plan/main?page=${i }">
                      <c:choose>
                        <c:when test="${i eq firstNum and (i%10) eq 0 }">
                          < </c:when>
                            <c:when test="${i eq lastNum and (i%10) eq 1 }">
                              >
                            </c:when>
                            <c:when test="${i eq page }">
                              ${i }
                            </c:when>
                            <c:otherwise>
                              ${i }
                            </c:otherwise>
                      </c:choose>
                  </button>
                  </a>

                </c:forEach>

              </div>
            </div>
          </div>
      </body>

      </html>