<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <jsp:include page="../base/header.jsp"></jsp:include>
        <style>
          * {
            box-sizing: border-box;
            padding: 0;
            margin: 0;
            list-style: none;
            font-family: 'Noto Sans KR', sans-serif;
          }

          a {
            text-decoration: none;
            color: #5B5B5B;
          }

          /* 전체영역 크기 조절 */
          .myPageContainer {
            width: 1200px;
            min-height:620px;
            display: flex;
            margin: auto;
          }

          /* 사이드바 시작 */
          .sideBar {
            width: 200px;
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
            border-radius: 10px;
            line-height: 40px;
            text-align: center;
            background-color: #198c8c;
            display: block;
            color: white;
            box-shadow: 1px 1px 2px 1px rgb(224, 224, 224);
          }

          .sideBarMenuBox li a:hover {
            opacity: 0.9;
            box-shadow: 1px 1px 2px 1px rgb(211, 211, 211);
          }

          .sideBarMenuBox li:nth-child(2) a {
            background-color: #005757;
          }

          .portraitPhoto {
            width: 150px;
            height: 150px;
            position: absolute;
          }

          /* 사이드바 끝 */
          .topTxt {
            font-size: 20px;
            color: #5B5B5B;
          }

          @media (max-width: 480px) {
            .myPageContainer {
              width: 100%;
            }

            /* 사이드바 시작 */
            .sideBar {
              width: 100px;
              background-color: white;
            }

            /* 초상화 공간 */
            .sideMyPortrait {
              width: 80px;
              height: 80px;
              margin-left: 10px;
              margin-top: 50px;
              position: relative;
            }

            .savedTitle a {
              font-size: 14px;
            }

            .savedLocation {
              font-size: 14px;
            }

            .sideMyNick {
              height: 40px;
              line-height: 40px;
              text-align: center;
              font-size: 12px;
              color: black;
            }

            /* 사이드바 메뉴 */
            .sideBarMenuBox {
              margin-top: 20px;
              padding-left: 10px;
            }

            .sideBarMenuBox li {
              margin-top: 20px;
            }

            .sideBarMenuBox li a {
              width: 80px;
              height: 34px;
              border-radius: 4px;
              font-size: 12px;
              line-height: 34px;
              text-align: center;
              background-color: #ffffff;
              display: block;
              color: rgb(75, 75, 75);
              box-shadow: 1px 1px 2px 1px rgb(224, 224, 224);
            }

            .sideBarMenuBox li:nth-child(2) a {
              color: white;
            }

            .sideBarMenuBox li a:hover {
              opacity: 1;
              box-shadow: 1px 1px 2px 1px rgb(211, 211, 211);
            }

            .portraitPhoto {
              width: 80px;
              height: 80px;
              border-radius: 10px;
              position: absolute;
            }

            /* 사이드바 끝 */
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
              <li><a href="/member/myplan?page=1">내 여행계획</a></li>
              <li><a href="/member/saveList">찜 여행 목록</a></li>
              <li><a href="/member/writenList">게시글 관리</a></li>
            </ul>
          </div>
          <div class="container mt-4">
            <div class="row">
              <div class="col-12 topTxt text-center">최근 등록한 여행계획입니다.</div>
            </div>
            <div class="row mt-4 d-flex justify-content-center">
              <c:set var="now" value="<%=new java.util.Date()%>" />
              <c:forEach var="i" items="${list }">
                <div class="card p-2 m-2" style="width: 18rem;
						<c:choose>
							<c:when test=" ${i.theme eq '힐링 여행' }">
                  background-color: #FF8C94;
                  </c:when>
                  <c:when test="${i.theme eq '먹거리 투어'}">
                    background-color: #FFAAA6;
                  </c:when>
                  <c:when test="${i.theme eq '관광지 투어'}">
                    background-color: #FFD3B5;
                  </c:when>
                  <c:when test="${i.theme eq '액티비티'}">
                    background-color: #DCEDC2;
                  </c:when>
                  <c:when test="${i.theme eq '기분따라'}">
                    background-color: #A8E6EC;
                  </c:when>
                  </c:choose>
                  ">
                  <a href="/plan/detail?seq=${i.seq }">

                    <div class="card-body">
                      <h5 class="card-title">${i.title }</h5>
                      <h6 class="card-subtitle mb-2 text-muted">${i.theme }</h6>
                      <p class="card-text">
                        <span>시작일 : ${i.startDate }</span><br>
                        <span>종료일 : ${i.endDate }</span>
                      </p>
                    </div>
                  </a>
                </div>

              </c:forEach>
            </div>
          </div>
        </div>
        <footer>
          <jsp:include page="../base/footer.jsp"></jsp:include>
        </footer>
      </body>

      </html>