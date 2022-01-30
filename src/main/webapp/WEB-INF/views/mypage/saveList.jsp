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
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="/css/saveList.css" type="text/css">
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
          <div class="contentsBoxIn">
            <div class="contentsTop">
              찜 목록
            </div>
            <c:forEach var='cnt' items="${saveList}" varStatus="status">
              <div class="delParent">
                <div class="left-img">
                  <a href="/area/detail?num=${mySaveListSeq[status.index]}">
                    <img class="contPic" src="${cnt.photo}">
                  </a>
                </div>
                <div class="right-content">
                  <div>
                    <div class="savedTitle"><a href="/area/detail?num=${mySaveListSeq[status.index]}">${cnt.name}</a>
                    </div>
                    <div class="savedDelBtnBox text-end">
                      <input type="text" class="delSeq" value="${mySaveListSeq[status.index]}">
                      <span class="material-icons md-36 red myHeart" id=save>
                        close</span>
                    </div>
                  </div>
                  <div>
                    <div class="savedLocation">${cnt.lo_detail}</div>
                  </div>
                  <div>
                    <div class="savedPhone">
                      <c:if test="${cnt.phone == 'null'}">등록된 번호가 없습니다.</c:if>
                      <c:if test="${cnt.phone != 'null'}">${cnt.phone}</c:if>
                    </div>
                    <div class="starBox">
                      <ul class="list-group-horizontal star p-0 text-end">
                        <li>평점 :&nbsp;</li>
                        <li>
                          <c:if test="${empty savedListRate[status.index]}">
                            -
                          </c:if>
                          ${savedListRate[status.index]}
                        </li>
                      </ul>
                    </div>
                  </div>
                  <div class="savedDetail">
                    <div class="detailEllipsis">${cnt.detail}</div>
                  </div>
                </div>
              </div>
            </c:forEach>
            <div id="seeMoreTag"></div>
            <c:if test="${fn:length(isMySaveListMore) == 1}">
              <div class="row mt-4 mb-4" id="seeMoreDel">
                <div class="col text-center">
                  <button type="button" class="btn btn-success" id="seeMore">더보기</button>
                </div>
              </div>
            </c:if>
            </div>
          </div>
        </div>
        <footer>
          푸우터
        </footer>


        <script>
          'use strict'
          let btn = 1;
          let isMore;
          $("#seeMore").on("click", function () {
            btn += 7;
            $.ajax({
              url: "/member/moreSaving",
              data: { btn: btn }
            }).done(function (res) {
              let result = JSON.parse(res);
              for (let i = 0; i < result.length; i++) {
                $("#seeMoreTag").before(
                  `<div class="delParent">
                <div class="left-img">
                  <a href="/area/detail?num=\${result[i].seq}">
                    <img class="contPic" src="\${result[i].photo}">
                  </a>
                </div>
                <div class="right-content">
                  <div>
                    <div class="savedTitle"><a href="/area/detail?num=\${result[i].seq}">\${result[i].name}</a>
                    </div>
                    <div class="savedDelBtnBox text-end">
                      <input type="text" class="delSeq" value="\${result[i].seq}">
                      <span class="material-icons md-36 red myHeart" id=save>
                        close</span>
                    </div>
                  </div>
                  <div>
                    <div class="savedLocation">\${result[i].lo_detail}</div>
                  </div>
                  <div>
                    <div class="savedPhone">
                      \${result[i].phone}
                    </div>
                    <div class="starBox">
                      <ul class="list-group-horizontal star p-0 text-end">
                        <li>평점 :&nbsp;</li>
                        <li>
                          \${result[i].savedListRate}
                        </li>
                      </ul>
                    </div>
                  </div>
                  <div class="savedDetail">
                    <div class="detailEllipsis">\${result[i].detail}</div>
                  </div>
                </div>
              </div>`
                )
                isMore = result[i].isMore;
              }
              if (isMore == 0) {
                $("#seeMoreDel").empty();
              }
            })
          });

          $(document).on("click", ".myHeart", function () {
            const $HEART = $(this);
            if (confirm("해당 여행지의 찜을 취소하시겠습니까?")) {
              $.ajax({
                url: "/area/save?area_seq=" + $HEART.prev().val()
              }).done(function (res) {
                $HEART.parents(".delParent").remove();
              });
            }
          })

        </script>

      </body>

      </html>