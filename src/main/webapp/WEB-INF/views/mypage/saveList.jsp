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
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
          height: 1200px;
          background-color: rgb(240, 240, 240);
        }

        /* 초상화 공간 */
        .sideMyPortrait {
          width: 150px;
          height: 150px;
          margin-left: 25px;
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

        .sideBarMenuBox li:nth-child(3) a {
          background-color: rgb(255, 223, 181);
        }

        .portraitPhoto {
          width: 150px;
          height: 150px;
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
          height: 50px;
          line-height: 50px;
          text-align: center;
          font-size: 26px;
        }

        .star {
          float: right;
        }

        .star>li {
          float: left;
        }

        /* 정보수정 끝 */
        /* 좋아요관련 */
        .detailEllipsis {
          height: 70px;
          border: 1px solid rgb(243, 243, 243);
          border-radius: 5px;
          overflow: hidden;
          text-overflow: ellipsis;
          display: -webkit-box;
          -webkit-line-clamp: 3;
          /* 라인수 */
          -webkit-box-orient: vertical;
          word-wrap: break-word;
          padding-left: 10px;
        }

        .delSeq {
          display: none;
        }

        .myHeart {
          cursor: pointer;
        }

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
            <img src="${loginInfo.photo}" class="portraitPhoto">
          </div>
          <!--           <div class="sideMyNick">${loginInfo.nick}</div> -->
          <ul class="sideBarMenuBox">
            <li><a href="/member/mypageGo">개인정보 수정</a></li>
            <li><a href="/member/tourList">여행 기록</a></li>
            <li><a href="/member/saveList">찜 여행 목록</a></li>
            <li><a href="/member/writenList">게시글 관리</a></li>
          </ul>
        </div>
        <div class="contentsBox">
          <div class="contentsTop">
            찜 목록
          </div>
          <div class="container">
            <div class="row justify-content-center mt-4">
              <c:forEach var='cnt' items="${saveList}" varStatus="status">
                <div class="col-9 align-self-center mt-4 delParent">
                  <div class="row">
                    <div class="col-4">
                      <a href="/area/detail?num=${mySaveListSeq[status.index]}">
                        <img style="height:170px;" class="w-100" src="${cnt.photo}">
                      </a>
                    </div>
                    <div class="col-8">
                      <div class="row">
                        <div class="col-10"><a href="/area/detail?num=${mySaveListSeq[status.index]}">${cnt.name}</a>
                        </div>
                        <div class="col-2 text-end">
                          <input type="text" class="delSeq" value="${mySaveListSeq[status.index]}">
                          <span class="material-icons md-36 red myHeart" id=save>
                            close</span>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col">${cnt.lo_detail}</div>
                      </div>
                      <div class="row">
                        <div class="col">
                          <c:if test="${cnt.phone == 'null'}">등록된 번호가 없습니다.</c:if>
                          <c:if test="${cnt.phone != 'null'}">${cnt.phone}</c:if>
                        </div>
                      </div>
                      <div class="row align-items-end mb-0  h-50">
                        <div class="col-10 detailEllipsis">${cnt.detail}</div>
                        <div class="col-2">
                          <ul class="list-group-horizontal star p-0">
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
                    </div>
                  </div>
                </div>
              </c:forEach>
              <div id="seeMoreTag"></div>
            </div>

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
                `<div class="col-9 align-self-center mt-4 delParent">
                  <div class="row">
                    <div class="col-4">
                      <a href="/area/detail?num=\${result[i].seq}">
                        <img style="height:170px;" class="w-100" src="\${result[i].photo}">
                      </a>
                    </div>
                    <div class="col-8">
                      <div class="row">
                        <div class="col-10"><a
                            href="/area/detail?num=\${result[i].seq}">\${result[i].name}</a></div>
                        <div class="col-2 text-end">
                          <input type="text" class="delSeq" value="\${result[i].seq}">
                          <span class="material-icons md-36 red myHeart" id=save>
                            close</span>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col">\${result[i].lo_detail}</div>
                      </div>
                      <div class="row">
                        <div class="col">\${result[i].phone}</div>
                      </div>
                      <div class="row align-items-end mb-0  h-50">
                        <div class="col-10 detailEllipsis">\${result[i].detail}</div>
                        <div class="col-2">
                          <ul class="list-group-horizontal star p-0">
                            <li>평점 :&nbsp;</li>
                            <li>
                              \${result[i].savedListRate}
                            </li>
                          </ul>
                        </div>
                      </div>
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
          if(confirm("해당 여행지의 찜을 취소하시겠습니까?")){
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