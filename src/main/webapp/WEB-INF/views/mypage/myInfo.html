<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>PlaceHolder</title>
      <link rel="shortcut icon" type="image/x-icon" href="/semi-img/favicon.ico" />
      <!-- 제이쿼리CDN -->
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <!-- 부트스트랩CDN -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
      <!-- 폰트어썸CDN -->
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
        integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
      <!-- 구글 폰트CDN -->
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">
      <!-- 슬라이드CDN -->
      <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
      <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
      <!-- 카카오API -->
      <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=385b023a616a407040b812a825f84bdf"></script>
      <link rel="stylesheet" href="/semi-css/hotelDetail.css">
    </head>

    <body>
      <div class="container">

        <!-- 사이드바 코드 시작 -->
          <div class="row header">
            <div class="col-3 align-self-center">
              <a href="index.jsp"><img src="/semi-img/logos.png" id="logo"></a>
            </div>
            <div class="col-8 align-self-center">

              <input type="text" placeholder="HotelName" id="topSearch">
              <button type="button" class="top-search" id="topSearchBtn">
                <i class="fas fa-search"></i>
              </button>

            </div>
            <!-- 햄버거메뉴 -->
            <div class="col-1  align-self-center justify-content-end">
              <nav class="navbar navbar-light">
                <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas"
                  data-bs-target="#offcanvasNavbar">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar"
                  aria-labelledby="offcanvasNavbarLabel">
                  <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasNavbarLabel">PlaceHolder</h5>

                    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                      aria-label="Close"></button>
                  </div>
                  <hr>
                  <div class="offcanvas-body">

                    <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                      <c:choose>
                        <c:when test="${loginId != null}">
                          <!-- 로그인 이후 보일 내용 -->
                          <li class="nav-item" id="loginAcc">
                            <div class="row">
                              <div class="col-12 loginAcc"></div>
                            </div>
                            <div class="row">
                              <div class="col-8 loginMent">${loginId}님, 안녕하세요.</div>
                              <div class="col-4"><a href="/logout.user"><button class="logOut">로그아웃</button></a></div>
                            </div>
                            <div class="row loginAccBannerH">
                              <div class="col-3">
                                <a href="/list.hotel"><button class="loginAccBanner">Hotels</button></a>
                              </div>
                              <div class="col-3">
                                <a href="/inquiryList.qna"><button class="loginAccBanner">고객센터</button></a>
                              </div>
                              <div class="col-3">
                                <a href="/likeList.like?loginId=${loginId}"><button
                                    class="loginAccBanner">찜목록</button></a>
                              </div>
                              <div class="col-3">
                                <a href="/mypage.home"><button class="loginAccBanner">MyPage</button></a>
                              </div>
                            </div>
                          </li>

                          <c:if test="${loginId == 'admin00'}">
                            <button id="adminBtn">관리자 창으로</button>
                          </c:if>

                          <!-- 빠른예약 -->
                          <li class="nav-item" id="speedRevMargin">
                            <form action="/confirm.book" method="get" id="form">
                              <div class="row">
                                <hr>
                                <p class="sidetxt">빠른 예약</p>
                                <div class="nav3 col-12">
                                  <select id="sideHotelSelect" onchange="selectBoxChange(this.value);">
                                        <option >----- 호텔 선택 -----</option>
                                    <c:forEach var="list" items="${hotelListS }">
                                      <option value=${list.hotelId}>${list.hotelName}</option>
                                    </c:forEach>
                                  </select>
                                  <input type="text" name="hotelId" id="sideHotelId">
                                </div>
                                <div class="nav3 row">
                                  <div class="col-6 speedRevIn">
                                    CheckIn
                                    <input type=date name="checkIn" id="speedRevIn" min="2021-12-25" max="2022-12-30">
                                  </div>
                                  <div class="col-6 speedRevOut">
                                    CheckOut
                                    <input type=date name="checkOut" id="speedRevOut" min="2021-12-26" max="2022-12-31" onchange="onChange()">
                                  </div>
                                </div>

                                <div class="row sideRoomTypeBox">
                                  <div calss="col-8" id="sideRoomTypeBox">
                                  <span class="sideFontS">RoomType</span>
                                    <select id="selectRoomType" onchange="selectRoomChange(this.value);">
                                      <option >----- 방 선택 -----</option>   
                                      <option value="스탠다드룸">스탠다드룸</option>
                                      <option value="더블룸">더블룸</option>
                                      <option value="디럭스룸">디럭스룸</option>
                                      <option value="스위트룸">스위트룸</option>
                                      <option value="이그제큐티브룸">이그제큐티브룸</option>
                                    </select>
                                    <input type="text" name="revRoomType" id="revRoomType" display="none">
                                  </div>
                                  <div class="col-2">
                                  <span class="sideFontS">방갯수</span>
                                    <select name="revQuantity" id="revQuantity">
                                      <option value="1">1 개</option>
                                      <option value="2">2 개</option>
                                      <option value="3">3 개</option>
                                      <option value="4">4 개</option>
                                      <option value="5">5 개</option>
                                    </select>
                                  </div>
                                  <div class="col-2 align-self-right">
                                  <span class="sideFontS">객실당</span>
                                    <select name="addPrice" id="addPrice">
                                      <option value="1">1 명</option>
                                      <option value="2">2 명</option>
                                      <option value="3">3 명</option>
                                      <option value="4">4 명</option>
                                      <option value="5">5 명</option>
                                      <option value="6">6 명</option>
                                    </select>
                                  </div>
                                </div>

                                <button type="button" class="nav-2" id="sideReserveBtn">
                                  Reservation
                                </button>
                              </div>
                            </form>
                          </li>
                          <!-- 빠른예약 끝 -->

                        </c:when>
                        <c:otherwise>
                          <!-- 로그인 폼 -->
                          <li class="nav-item">
                            <div class="row signBox">
                              <form action="/login.user" method="post">
                                <div class="col-12 signInput">
                                  <input type="text" placeholder="Input ID" class="inputId" name="id" id="inputId">
                                  <input type="password" placeholder="Input PW" class="inputPw" name="pw" id="inputPw">
                                </div>
                                <div class="row">
                                  <div class="col-6 sign">
                                    <button type="button" class="signBtns" id="loginBtn">로그인</button>
                                  </div>
                                  <div class="col-6 sign">
                                    <a href="/signupPage.user"><button type="button"
                                        class="signBtns signUp">회원가입</button></a>
                                  </div>
                                </div>
                              </form>
                            </div>
                          </li>

                          <!-- 로그인 밑 캐러셀 -->

                          <li class="nav-item" id="sideC">
                            <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
                              <div class="carousel-inner sideCBackBox">
                                <div class="sideCBack">PlaceHolder</div>
                                <div class="carousel-item active">
                                  <img src="/semi-img/sideC1.jpg" class="d-block w-100" alt="여행을 해보세요">
                                </div>
                                <div class="carousel-item">
                                  <img src="/semi-img/sideC2.jpg" class="d-block w-100" alt="나만의 공간">
                                </div>
                                <div class="carousel-item">
                                  <img src="/semi-img/sideC3.jpg" class="d-block w-100" alt="PlaceHolder">
                                </div>
                              </div>
                            </div>
                          </li>

                        </c:otherwise>
                      </c:choose>
                      <li class="nav-item nav-banner">
                        <a href="/main.home"><button type="button" class="sideBanner">처음으로</button></a>
                      </li>
                      <li class="nav-item nav-banner">
                        <a href="/articleList.article"><button type="button" class="sideBanner">자유게시판</button></a>
                      </li>
                    </ul>
                  </div>
                </div>
              </nav>
            </div>
          </div>
          <!-- 사이드바 코드 끝 -->

        <!-- 위 배너 -->
        <div class="row" id="banner">
          <div class="col-2 goHome bannerIn">
            <p id="goHome">메인으로</p>
          </div>
          <div class="col-3 reservation bannerIn">
            <p id="listGoBar">호텔 리스트</p>
          </div>
          <div class="col-3 community bannerIn">
            <p id="commuGobar" class="boardGo">커뮤니티</p>
          </div>
          <div class="col-3 qna bannerIn">
            <p id="gogakGobar">고객센터</p>
          </div>
          <div class="col-3 mypage bannerIn">
            <p id="mypageGobar">마이페이지</p>
          </div>
        </div>

        <!-- 호텔설명칸 -->
        <div class="row">
          <div class="col-6 mainPhoto">
            <img src="${hotelImgList}">
          </div>
          <div class="col-6 mainInfo">
            <div class="row">
              <div class="col-6">
                <p class="hotelName">${hotelList.hotelName}</p>
                <!-- 호텔 이름 -->
              </div>
              <div class="col-6">
                <div class="star">
                  <img src="/semi-img/star.png">
                  <p>${hotelList.hotelScore}</p>
                  <c:choose>
                    <c:when test="${likeCheck == false}">
                      <div id="heart">
                        <img src="/semi-img/heart.png" id="heartAjax">
                      </div>
                    </c:when>
                    <c:when test="${likeCheck == true}">
                      <div id="heart">
                        <img src="/semi-img/heartOn.png" id="heartAjax">
                      </div>
                    </c:when>
                  </c:choose>
                  <div id="share"></div>
                </div>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-12 options">
                <span>위치 : </span><span>${hotelList.hotelRoadAddress}</span><br>
                <!-- 호텔 주소 -->
                <span>룸 옵션 : </span> <select>
                  <option>스탠다드룸</option>
                  <option>더블룸</option>
                  <option>디럭스룸</option>
                  <option>패밀리룸</option>
                  <option>이그제큐티브룸</option>
                </select> <br> <span>전화 번호 : </span><span>${hotelList.hotelPhone}</span><br>
                <br> <span>1박당 가격 : </span><span>${RoomList[0].roomPrice}
                  부터~</span> <a href="#banner1"><button class="reservationGo">룸
                    선택</button></a>
              </div>
            </div>
          </div>
        </div>
        <hr class="bannerCutLine">
        <!-- 각각의 배너에 해당하는 html -->
        <div class="row" id="banner1">
          <div class="col-12 detail">
            <!-- 각 방의 form -->
				<c:forEach var="room" items="${RoomList}" varStatus="status">
					<form action="/confirm.book" method="get" id="form${status.index }">
						<div class="row roomInfoBox">
							<div class="col-3 roomImg" id="roomImgs">
								<img src=${RoomImgList[status.index].roomImg } alt="룸1입니다">
							</div>
							<div class="col-5 roomInfo">
								<input type="text" name="hotelId" id="hotelId${status.index }"
									class="throwRun" value=${hotelList.hotelId}> <input
									type="text" name="hotelName" class="throwRun"
									value=${hotelList.hotelName}> <input type="text"
									name="revRoomType" id="revRoomType${status.index }"
									class="throwRun" value=${room.roomType}> <input
									type="text" name="hotelPhone" class="throwRun"
									value=${hotelList.hotelPhone}> <input type="text"
									name="hotelRoadAddress" class="throwRun"
									value=${hotelList.hotelRoadAddress}> <input type="text"
									id="pHotelId" value="${hotelList.hotelId}"
									style="display: none">
								<p>${room.roomType}</p>
								<p>기본제공 : 드라이, 샤워가운, 조식, 룸서비스..</p>
								<p>1박당 가격 : ${room.roomPrice}원</p>
								<p>1인 추가시 +${room.addPrice}원 (기본인원 : 2명)</p>
							</div>
							<div class="col-4 roomDate">
								<p>예약 날짜 입력</p>
								<input type="date" id="checkIn${status.index }" name="checkIn"
									min="2021-12-25" max="2022-12-30"> 부터<br> <input
									type="date" id="checkOut${status.index }" class="roomDateEnd"
									name="checkOut" min="2021-12-26" max="2022-12-31" onchange="onChangeList(${status.index })"> 까지<br>
								객실 <input type="number" id="revQuantity${status.index }" min="1"
									max="5" class="revQuantity" name="revQuantity"> 개, 인원 <input
									type="number" id="addPrice${status.index }" min="1" max="6"
									class="addPrice" name="addPrice"> 명(객실 당) 
									<input type="button" class="roomSubmit justify-content-end" value="예약" onclick="bookCheck(${status.index })">
							</div>
						</div>
					</form>
				</c:forEach>

          </div>
        </div>

        <hr class="bannerCutLine">
        <br>
        <div class="row" id="banner4">
          <div class="col-6">
            <h2 class="hotelinfoName">${hotelList.hotelName}</h2>
            <div class="hotelInfo">
              <p>${hotelList.hotelDetail}</p>
            </div>
          </div>
          <div class="col-6 hotelInfossBr">
            <br>
            <span class="hotelInfoss">호텔주소 : </span><span>${hotelList.hotelRoadAddress}</span><br>
            <span class="hotelInfoss">전화번호 : </span><span>${hotelList.hotelPhone}</span>
            <br> <input type=button value="고객센터에 문의하기" id="inquiry" onclick="openInquiry()"><br>
            <!-- ***** 현우 수정 : 문의하기 버튼 -->
            <span class="hotelInfoss">Location</span>
            <div id="map"></div>
          </div>
        </div>

        <!-- 비슷한 상품 -->
        <div class="row moreHotels">
          <h4>More Hotels</h4>
          <div class="col-12 slideBox">

            <c:forEach var="cardHotel" items="${hotelListAll}">
              <div class="card">
                <form action="/goods.room" method="get">
                  <div id="cardImgBox">
                    <img src=${cardHotel.hotelImg } class="card-img-top" alt="...">
                  </div>
                  <div class="card-body">
                    <h5 class="card-title">${cardHotel.hotelName}</h5>
                    <p class="card-text">${cardHotel.hotelDetail}</p>
                    <input type="text" name="hotelId" class="throwRun" value=${cardHotel.hotelId}>
                    <button class="cardbtn justify-content-center">보러가기</button>
                  </div>
                </form>
              </div>
            </c:forEach>

          </div>
        </div>


        <!-- 푸터 -->
        <div class="container-fluid footBack">
          <div class="container">
            <div id="footer">
              <div id="footerIn">
                <div class="row">
                  <div class="col-3 footer-left">

                    <a href="index.jsp" class="fot_logo"></a>

                  </div>
                  <div class="col-3 footer-center"></div>
                  <div class="col-6 footer-right">
                    <ul class="foot-ul-blog">
                      <li><a href="https://section.blog.naver.com/BlogHome.naver?directoryNo=0&currentPage=1&groupId=0"
                          target='_blank'>블로그</a></li>
                      <li><a href="/footer.jsp" target='_blank'>이용약관</a></li>
                      <li><a href="/footer2.jsp" target='_blank'>개인정보처리방침</a></li>
                      <li><a href="/inquiryList.qna">고객 문의</a></li>
                    </ul>
                  </div>
                </div>

                <div class="row">

                  <div class="col-4">
                    <ul class="foot-sangho">
                      <li>상호명 : <a href="index.jsp" class="foot-sangho-a">PlaceHolder</a></li>
                      <li>공동대표 : 기억해조</li>
                      <li>사업자등록번호 : 230-00-12345</li>
                      <li>동신판매업신고번호 : 2021-서울종로-05000</li>
                    </ul>
                  </div>

                  <div class="col-5">
                    <ul class="foot-sangho">
                      <!-- url복사할 input 가져다놓기 -->
                      <li><input type="text" id="shareUrl"></li>
                      <li>대표전화 : 02-1234-5678</li>
                      <li>이메일 : PlaceHolder@LoremIpsum.com</li>
                      <li>영업소재지 : 서울특별시 중구 남대문로 120 대일빌딩 2F, 3F</li>
                    </ul>
                  </div>

                  <div class="col-3">
                    <ul class="foot-logos">
                      <li><a href="https://section.blog.naver.com/BlogHome.naver?directoryNo=0&currentPage=1&groupId=0"
                          target='_blank' class="nblog"></a></li>
                      <li><a href="https://twitter.com/" target='_blank' class="twitter"></a></li>
                      <li><a href="https://www.instagram.com/" target='_blank' class="instargram"></a></li>
                      <li><a href="https://www.facebook.com/" target='_blank' class="facebook"></a></li>

                    </ul>
                  </div>

                </div>
                <hr>
                <div class="row">
                  <div class="col-9">
                    <p class="foot_caution">PlaceHolder는 통신판매중개자이자 통신판매 당사자 입니다.
                      따라서 PlaceHolder는 공간 거래정보 및 거래내역을 소유할 수 있습니다.</p>
                  </div>
                  <div class="col-3">
                    <p class="foot_caution">Copyright PLACEHOLDER Corp. All
                      Rights Reserved.</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <script>
          // 사이드바 관련 스크립트 시작
        $("#loginBtn").on("click", () => {
          let logId = $("#inputId").val();
          let logPw = $("#inputPw").val();
          $.ajax({
            type: "POST",
            url: "/login.user",
            data: {
              "id": logId,
              "pw": logPw
            }
          }).done(function (res) {
            if (res == 'true') {
              if (logId == 'admin00') {
                console.log("어드민 로그인");
                location.href = "/user.admin";
              } else {
                alert(`\${logId}님 환영합니다.`);
                location.reload();
              }
            } else if (res == 'false') {
              alert("아이디와 비밀번호를 확인해주세요.");
            }
          })
        })

        $(".signUp").on("click", function () {
          location.href = "/signupPage.user";
        })

        // 빠른 예약 select box 함수 ***** 현우 : 호텔 select box
        let selectBoxChange = function (value) {
          console.log(value);
          $("#sideHotelId").val(value);
        }
        // 룸 타입 selectbox 함수
        let selectRoomChange = function (value) {
          console.log(value);
          $("#revRoomType").val(value);
        }

        $(".logOut").on("click", () => {
          alert("로그아웃 되었습니다.");
        })

        // 체크인 체크아웃 날짜 확인
        function onChange(){
        	
        	let checkIn = new Date(document.getElementById("speedRevIn").value);
        	let checkOut = new Date(document.getElementById("speedRevOut").value);
        	console.log(checkIn + '' +checkOut);
        	if(checkOut <= checkIn){
        		alert("체크아웃은 체크인 날짜 다음날부터 가능합니다.");
        		$("#speedRevOut").val("");
        	}
        }
        
        // 예약 제출 전
        $("#sideReserveBtn").on("click", function () {
          let hotelId = document.getElementById("sideHotelId").value;
          let checkIn = document.getElementById("speedRevIn").value;
          let checkOut = document.getElementById("speedRevOut").value;
          let revRoomType = document.getElementById("revRoomType").value;
          let revQuantity = document.getElementById("revQuantity").value;
          let addPrice = document.getElementById("addPrice").value;

          console.log(checkIn + checkOut + revRoomType + revQuantity + addPrice);
			if(hotelId == ''){
				alert("호텔을 선택해주세요");
        }else if (checkIn == '' || checkOut == '') {
            alert("체크인, 체크아웃 날짜를 입력해주세요");
            return false;
          } else if (checkIn >= checkOut) {
            alert("체크아웃 날짜는 체크인 다음날부터 가능합니다.");
            return false;
          } else if (revRoomType == '') {
            alert("방 타입을 선택해주세요.");
            return false;
          } else if (revQuantity == '') {
            alert("방 개수를 선택해주세요.");
            return false;
          } else if (addPrice == '') {
            alert("방 1개 당 인원을 선택해주세요.");
            return false;
          } else {
            if (confirm("예약 하시겠습니까?")) {
              alert("예약이 완료되었습니다.");
              $("#form").submit();
            }
          }
        })

        // 관리자 이동버튼
        $("#adminBtn").on("click", () => {
          location.href = "/user.admin";
        })

        // 사이드바 관련 스크립트 끝
          
          // 본 예약창 ***** 현우 수정, 통으로 붙여넣기
          
          	function onChangeList(index){
        	
        	let checkIn = new Date(document.getElementById("checkIn"+index).value);
        	let checkOut = new Date(document.getElementById("checkOut"+index).value);
        	console.log(checkIn + '' +checkOut);
        	if(checkOut <= checkIn){
        		alert("체크아웃은 체크인 날짜 다음날부터 가능합니다.");
        		document.getElementById("checkOut"+index).value = '';
        	}
        }
			
            function bookCheck(index) {
              let hotelId = document.getElementById("hotelId" + index).value;
              let checkIn = document.getElementById("checkIn" + index).value;
              let checkOut = document.getElementById("checkOut" + index).value;
              let revRoomType = document.getElementById("revRoomType" + index).value;
              let revQuantity = document.getElementById("revQuantity" + index).value;
              let addPrice = document.getElementById("addPrice" + index).value;
              
              console.log(checkIn + checkOut + revRoomType + revQuantity + addPrice);
              if('${loginId}' == '') {
      			alert("로그인 후 이용 부탁드립니다.");
      			return false;
              }else if (checkIn == '' || checkOut == '') {
                alert("체크인, 체크아웃 날짜를 입력해주세요");
                return false;
              } else if (checkIn >= checkOut) {
                alert("체크아웃 날짜는 체크인 다음날부터 가능합니다.");
                return false;
              } else if (revRoomType == '') {
                alert("방 타입을 선택해주세요.");
                return false;
              } else if (revQuantity == '') {
                alert("방 개수를 선택해주세요.");
                return false;
              } else if (addPrice == '') {
                alert("방 1개 당 인원을 선택해주세요.");
                return false;
              } else {
                if (confirm("예약 하시겠습니까?")) {
                  alert("예약이 완료되었습니다.");
                  document.getElementById("form"+index).submit();
                }
              }
            }


          $(function () {
            $('.slideBox').slick({
              slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li 
              infinite: true, 	//무한 반복 옵션	 
              slidesToShow: 4,		// 한 화면에 보여질 컨텐츠 개수
              slidesToScroll: 1,		//스크롤 한번에 움직일 컨텐츠 개수
              speed: 100,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
              arrows: true, 		// 옆으로 이동하는 화살표 표시 여부
              dots: false, 		// 스크롤바 아래 점으로 페이지네이션 여부
              autoplay: true,			// 자동 스크롤 사용 여부
              autoplaySpeed: 10000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
              pauseOnHover: true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
              vertical: false,		// 세로 방향 슬라이드 옵션
              nextArrow: "<button type='button' class='slick-prev'>></button>",		// 이전 화살표 모양 설정
              prevArrow: "<button type='button' class='slick-next'><</button>",		// 다음 화살표 모양 설정
              dotsClass: "slick-dots", 	//아래 나오는 페이지네이션(점) css class 지정
              draggable: true, 	//드래그 가능 여부 

              responsive: [ // 반응형 웹 구현 옵션
                {
                  breakpoint: 960, //화면 사이즈 960px
                  settings: {
                    //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                    slidesToShow: 3
                  }
                },
                {
                  breakpoint: 768, //화면 사이즈 768px
                  settings: {
                    //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                    slidesToShow: 2
                  }
                }
              ]

            });
          })

          // 상단배너 바로가기 버튼
          document.getElementById("goHome").addEventListener("click", () => {
            location.href = "/index.jsp";
          })
          document.getElementById("listGoBar").addEventListener("click", () => {
            location.href = "/list.hotel";
          })
          $(".boardGo").on("click", () => {
            location.href = "/articleList.article";
          })
           document.getElementById("gogakGobar").addEventListener("click", () => {
             location.href="/inquiryList.qna";
           })
          document.getElementById("mypageGobar").addEventListener("click", () => {
            if ('${loginId}' == '') {
              alert("로그인을 해주세요.");
            } else {
              location.href = "/mypage.home";
            }
          })


          // 공유하기 누르면 url 복사시키기. 모바일에선 shareAPI사용하면 됨
          $("#share").on("click", function () {
            let url = document.location.href;
            let shareUrl = document.getElementById("shareUrl");
            shareUrl.value = url;
            shareUrl.select();
            document.execCommand('copy');
            alert("url이 복사되었습니다.");
          })


          let heart = document.getElementById("heart");

          heart.addEventListener("click", () => {
            if ('${loginId}' == '') {
              alert("로그인을 해주세요");
              return
            } else {
              $.ajax({
                url: "/detailClick.like",
                data: {
                  "loginId": '${loginId}',
                  "hotelId": '${hotelList.hotelId}'
                }
              }).done(function (res) {
                if (res == 'add') { // 추가가 오면 하트 빨간색
                  document.getElementById("heartAjax").src = "/semi-img/heartOn.png";
                  console.log("빨강으로 변경");
                } else if (res == 'del') { // 삭제가 오면 하트 검정색
                  document.getElementById("heartAjax").src = "/semi-img/heart.png";
                  console.log("검정으로 변경");
                }
              })
            }
          })

          $(".cardbtn").on("click", () => {
            console.log($(this).prev().val());
          })

          // 최상단 버튼
          document.getElementById("topSearchBtn").addEventListener("click", () => {
            let keyword = document.getElementById("topSearch").value;
            location.href = "/listSearch.hotel?option=이름" + "&Keyword=" + keyword;
          })

          ///////////////////// 카카오맵API ////////////////////
          let latitude = '${hotelList.hotelLatitude}';
          console.log("래티" + latitude);
          let longitude = '${hotelList.hotelLongitude}';
          console.log("롱티" + longitude);

          var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
              center: new kakao.maps.LatLng(latitude, longitude), // ***** 지도의 중심좌표(latitude, longitude)
              level: 5 // 지도의 확대 레벨
            };

          var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
          // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성
          var mapTypeControl = new kakao.maps.MapTypeControl();

          // 지도에 컨트롤을 추가해야 지도위에 표시
          // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미
          map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

          // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성
          var zoomControl = new kakao.maps.ZoomControl();
          map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

          var marker = new kakao.maps.Marker({
            map: map,
            position: new kakao.maps.LatLng(latitude, longitude) // ***** 마커 위치 생성(latitude, longitude)
          });

          var iwContent =
            // ***** RoomController에서 받은 HotelDTO 객체에서 hotelName, 좌표(latitude, longitude)을 뽑아서 삽입
            // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능
            `<div id="infoWin"> ${hotelList.hotelName} <br><a href="https://map.kakao.com/link/map/${hotelList.hotelName},${hotelList.hotelLatitude}, ${hotelList.hotelLongitude}" target="_blank">큰지도보기</a>  <a href="https://map.kakao.com/link/to/${hotelList.hotelName},${hotelList.hotelLatitude}, ${hotelList.hotelLongitude}" target="_blank">길찾기</a></div>`,

            iwPosition = new kakao.maps.LatLng(latitude, longitude); //인포윈도우 표시 위치(latitude, longitude)

          // 인포윈도우를 생성
          var infowindow = new kakao.maps.InfoWindow({
            position: iwPosition,
            content: iwContent
          });

          // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
          infowindow.open(map, marker);

					// 인포윈도우 설정
          var infoTitle = document.querySelectorAll('#infoWin');
          infoTitle.forEach(function (e) {
            var w = e.offsetWidth + 10;
            var ml = w / 2;
            e.parentElement.style.top = "112px";
            e.parentElement.style.left = "50%";
            e.parentElement.style.marginLeft = -ml + "px";
            e.parentElement.style.width = w + "px";
            e.parentElement.previousSibling.style.display = "none";
            e.parentElement.parentElement.style.border = "0px";
            e.parentElement.parentElement.style.background = "unset";
          });


       // **** 현우 수정 팝업창  띄워서 문의하기
    		function openInquiry(){
          if ('${loginId}' == '') {
              alert("로그인을 해주세요.");
          } else {
    			let openWin;
    			// 부모창 이름
    			window.name = "parentForm";
    			
    			//window.open("open할 window", "자식창 이름", "팝업창 옵션")
    			openWin = window.open("/views/inquiry/inquiryQuick.jsp","inquiryForm","width=500px,height=300px,resizable=no,scrollbars=no,left=100,top=250");
          }
    		}

          function setChileText() {
            openWin.document.getElementById("cHotelId").value = doucment.getElementById("pHotelId").value;
            openWin.document.getElementById("cUserId").value = doucment.getElementById("${loginId}").value;
          }        
        </script>
    </body>

    </html>