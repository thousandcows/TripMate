<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- fontawesome cdn -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">

<!-- datepicker -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
<style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            /* 임시로 body margin 0px */
        }

        /* 링크 속성 지우기 */
        a {
            text-decoration: none
        }

        a:hover {
            text-decoration: none;
            color: black;
        }

        a:link {
            text-decoration: none;
            color: black;
        }

        a:visited {
            text-decoration: none;
            color: black;
        }

        a:active {
            text-decoration: none;
            color: black;
        }

        /* 헤더----------------------------------------------------- */
        .banner {
            background-color: rgb(56, 181, 174);
            height: 200px;
        }

        .banner_title {
            width: 100%;
            height: 70%;
            color: white;
            font-size: 35px;
            font-weight: 600;
            padding: 60px 0px 10px 100px;
        }

        .banner_content {
            width: 100%;
            height: 30%;
            color: white;
            font-size: 15px;
            font-weight: 500;
            padding-left: 100px;
        }

        /* 컨테이너 ----------------------------------------------------- */
        .container {
            border: 1px solid red;
        }

        /* 미니 사이트맵 루트 */
        .container>.root {
            padding-left: 80px;
            overflow: auto;
        }

        .root>div {
            border: 1px solid red;
            float: left;
            margin: 40px 0px 40px 0px;
            padding-right: 10px;
        }

        .fa-home {
            color: rgb(56, 181, 174);
        }

        /* 글쓰기 창 */
        .board {
            border: 1px solid red;
            width: 100%;
            padding: 20px 80px 0px 80px;
        }

        .select_tour {
            width: 100%;
            padding: 10px;
            border: 1px solid red;
        }

        .select_recruit {
            width: 100%;
            padding: 10px;
            border: 1px solid red;
        }

        .select_gender {
            width: 100%;
            padding: 10px;
            border: 1px solid red;
        }

        .title {
            width: 100%;
            padding: 5px;
            border: 1px solid red;
        }

        .title>input {
            width: 100%;
            height: 30px;
        }

        .write_con {
            width: 100%;
            padding: 5px;
            border: 1px solid red;
        }

        .write_con>textarea {
            width: 100%;
            height: 500px;
            resize: none;
        }

        /* 버튼 */
        .button {
            border: 1px solid red;
            text-align: right;
            padding: 20px 5px 0px 0px;
        }
    </style>
    
</head>
<body>
	<div class="banner">
        <!-- 추후 banner background로 이미지 넣을 예정입니다. 지금은 임시로 단색채움.-->
        <div class="banner_title"> 동행 게시판 </div>
        <div class="banner_content"> 함께 여행갈 친구들을 만들어 보세요 </div>
    </div>

    <div class="container">
        <div class="root">
            <div class="home"><a href=""><i class="fas fa-home"></i></a></div>
            <div> > </div>
            <div class="community"><a href="">커뮤니티</a></div>
            <div> > </div>
            <div class="partyboard"><a href="">동행게시판</a></div>
        </div>

        <!-- enctype="multipart/form-data" -->
        <form action="/companyboard/writeProc" method="post" >
            <div class="board">
                <div class="select_tour">여행지 :
                    <select name="tour">
                        <option value="seoul">서울</option>
                        <option value="incheon">인천</option>
                        <option value="gyeonggi">경기</option>
                        <option value="gangwon">강원</option>
                        <option value="daejeon">대전</option>
                        <option value="chungnam">충남</option>
                        <option value="chungbuk">충북</option>
                        <option value="sejong">세종</option>
                        <option value="gyeongbuk">경북</option>
                        <option value="gyeongnam">경남</option>
                        <option value="busan">부산</option>
                        <option value="daegu">대구</option>
                        <option value="ulsan">울산</option>
                        <option value="jeolbuk">전북</option>
                        <option value="jeolnam">전남</option>
                        <option value="gwangju">광주</option>
                        <option value="jeju">제주</option>
                    </select>
                </div>

                <div class="select_recruit">모집 인원 :
                    <select name="recruit">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                    </select>
                </div>

                <div class="select_gender">
                    [ 여행 기간 ]<br>
					<input type="text" id="startDate" name="start_date"/> - 
                    <input type="text" id="endDate" name="end_date"/>
                    
                </div>

                <div class="select_gender">성별 :
                    <input type="radio" name="gender" value="man" >남자
                    <input type="radio" name="gender" value="woman">여자
                </div>

                <div class="title">
                    <input type="text" placeholder="제목을 입력해 주세요" name=title autocomplete='off'>
                </div>

                <div class="write_con">
                    <textarea placeholder="내용을 입력해 주세요" name=contents></textarea>
                </div>

                <div class="button">
                    <button id="back" type=button>목록</button>
                    <button>작성 완료</button>
                </div>
            </div>
        </form>
    </div>

<!-- 목록으로  -->
	<script>
		$("#back").on("click", () => {
			location.href="/companyboard/list";
		})
	</script>
	
<!-- datepicker  -->
    <script type="text/javascript">
        $(document).ready(function () {
            $("#startDate").datepicker({
                dateFormat: "yy-mm-dd", // 날짜의 형식
                minDate: 0,
                nextText: ">",
                prevText: "<",
                onSelect: function (date) {
                    var endDate = $('#endDate');
                    var startDate = $(this).datepicker('getDate');
                    var minDate = $(this).datepicker('getDate');
                    endDate.datepicker('setDate', minDate);
                    startDate.setDate(startDate.getDate() + 30);
                    endDate.datepicker('option', 'maxDate', startDate);
                    endDate.datepicker('option', 'minDate', minDate);
                }
            });
            $('#endDate').datepicker({
                dateFormat: "yy-mm-dd", // 날짜의 형식
                nextText: ">",
                prevText: "<"
            });
        });
	</script>
</body>
</html>