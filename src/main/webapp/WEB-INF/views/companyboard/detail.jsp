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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
    integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">


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

        /* 제목, 글 */
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
        
        .select_date {
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
    
        <form action="/companyboard/modify" method="post" id="frmDetail">
            <div class="board">
            	<input type=hidden value="${dto.seq}" name=seq> <!-- 글 번호에 맞춰 불러오기 위한 꼼수 -->
                <div class="select_tour">여행지 :
                    <input type=text id=tourInput readonly value="${dto.tour }">
               		<select id="tourSelect" name="tour" style="display:none">
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
                    <input type=text id=recruitInput readonly value="${dto.recruit }">
                	<select id="recruitSelect" name="recruit" style="display:none">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                    </select>
                </div>
    
                <div class="select_date">
                    [ 여행 기간 ]<br>
                    <input type="text" id="startDateBefore" readonly value="${dto.start_date }" autocomplete='off'/> <span id="datetxt1">-</span>
                    <input type="text" id="endDateBefore" readonly value="${dto.end_date }" autocomplete='off'/>
                    <input type="text" id="startDateAfter" name="start_date" readonly value="${dto.start_date }" style="display: none;" autocomplete='off'/> <span style="display:none" id="datetxt2">-</span>
                    <input type="text" id="endDateAfter" name="end_date" readonly value="${dto.end_date }" style="display: none;" autocomplete='off'/>
                </div>
    
                <div class="select_gender">성별 :
                    <input type=text id=genderInput readonly value="${dto.gender }">
                	<input type="radio" id="manRadio" name="gender" value="man" style="display:none"><p style="display:none" id="mantxt">남자</p>
                    <input type="radio" id="womanRadio" name="gender" value="woman" style="display:none"><p style="display:none" id="womantxt">여자</p>
                </div>
    
                <div class="title">
                    <input type=hidden value="${dto.seq}" name=seq>
                    <input type=text id=title name=title readonly value="${dto.title }">
                </div>
    
                <div class="write_con">
                    <textarea id=contents name=contents readonly>${dto.contents }</textarea>
                </div>
    
                <div class="button">
                    <button type=button id=back>목록으로</button>
                    <button type=button id=modify>수정하기</button>
                    <button type=button id=delete>삭제하기</button>
                    <button type=button id=modOk style="display: none;">수정완료</button>
                    <button type=button id=modCancel style="display: none;">취소</button>
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
	
	<!-- 삭제하기 -->
	<script>
		$("#del").on("click", function(){
			if(confirm("정말 삭제하시겠습니까?")){
				location.href="/board/deleteProc?seq=${dto.seq}"; 
			}
		})
	</script>
	
	<!-- 수정하기, 버튼 클릭시 -->
	<script>
		let backupTour="";
		let backupRecruit="";
		let backupStartDate="";
		let backupEndDate="";
		let backupGender="";
		let backupTitle = "";
		let backupContents = "";
		
		$("#modify").on("click", function(){
			
			// 기존 데이터 담기
			backupTour = $("tourInput").val();
			backupRecruit = $("recruitInput").val();
			backupStartDate = $("#startDateBefore").val();
			backupEndDate = $("#endDateBefore").val();
			backupGender = $("#genderInput").val();
			backupTitle = $("#title").val();
			backupContents = $("#contents").val();		

			// 폼 형태 바꾸기 및 읽기 전용 해제
			$("#tourInput").css("display", "none");
			$("#recruitInput").css("display", "none");
			$("#startDateBefore").css("display", "none");
			$("#datetxt1").css("display", "none");
			$("#endDateBefore").css("display", "none");
			$("#genderInput").css("display", "none");
			
			$("#tourSelect").css("display", "inline");
			$("#recruitSelect").css("display", "inline");
			$("#startDateAfter").css("display", "inline");
			$("#datetxt2").css("display", "inline");
			$("#endDateAfter").css("display", "inline");
			$("#manRadio").css("display", "inline");
			$("#womanRadio").css("display", "inline");
			$("#mantxt").css("display", "inline");
			$("#womantxt").css("display", "inline");
			$("#title").removeAttr("readonly");
			$("#contents").removeAttr("readonly");
	
			//버튼 형태 바꾸기
			$("#modify").css("display", "none");
			$("#delete").css("display", "none");
			$("#modOk").css("display", "inline");
			$("#modCancel").css("display", "inline");	
		})
		
		$("#modOk").on("click",function(){
			if(confirm("이대로 수정하시겠습니까?")){
				$("#frmDetail").submit(); // 수정완료시 submit
			}
		})
		
		
		$("#modCancel").on("click", function(){
			if(confirm("정말 취소하시겠습니까?")){
				location.reload();
			}
	
		})
	</script>
	
	<!-- datepicker  -->
    <script type="text/javascript">
        $(document).ready(function () {
            $("#startDateAfter").datepicker({
                dateFormat: "yy-mm-dd", // 날짜의 형식
                minDate: 0,
                nextText: ">",
                prevText: "<",
                onSelect: function (date) {
                    var endDate = $('#endDateAfter');
                    var startDate = $(this).datepicker('getDate');
                    var minDate = $(this).datepicker('getDate');
                    endDate.datepicker('setDate', minDate);
                    startDate.setDate(startDate.getDate() + 30);
                    endDate.datepicker('option', 'maxDate', startDate);
                    endDate.datepicker('option', 'minDate', minDate);
                }
            });
            $('#endDateAfter').datepicker({
                dateFormat: "yy-mm-dd", // 날짜의 형식
                nextText: ">",
                prevText: "<"
            });
        });
	</script>
</body>
</html>