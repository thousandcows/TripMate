<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행 게시판</title>
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
    
<!-- include libraries(jQuery, bootstrap) -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            /* 임시로 body margin 0px */
        }



        /* 헤더----------------------------------------------------- */
        .banner {
            background-image:url("/images/community_banner.png");
           	height:200px;
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
            /* border: 1px solid red; */
            padding-bottom :30px;
        }

        /* 미니 사이트맵 루트 */
        .container>.root {
            padding-left: 80px;
            overflow: auto;
        }

        .root>div {
            /* border: 1px solid red; */
            float: left;
            margin: 40px 0px 40px 0px;
            padding-right: 10px;
        }

        .fa-home {
            color: rgb(56, 181, 174);
        }

        /* 제목, 글 */
        .board {
            /* border: 1px solid red; */
            width: 100%;
            padding: 20px 80px 0px 80px;
        }

        .select_tour {
            width: 100%;
            padding: 10px;
           	/* border: 1px solid red; */
        }

        .select_recruit {
            width: 100%;
            padding: 10px;
            /* border: 1px solid red; */
        }
        
        .select_date {
            width: 100%;
            padding: 10px;
            /* border: 1px solid red; */
        }

        .select_gender {
            width: 100%;
            padding: 10px;
            /* border: 1px solid red; */
        }

        .title {
            width: 100%;
            padding: 5px;
            /* border: 1px solid red; */
        }

        #title{
            /* width: 100%;
            height: 30px;  */
        }

        .write_con {
            width: 100%;
            padding: 5px;
            /* border: 1px solid red; */
        }

        .write_con>textarea {
            width: 100%;
            height: 500px;
            resize: none;
        }

        /* 버튼 */
        .button {
            /* border: 1px solid red; */
            text-align: right;
            padding: 20px 5px 0px 0px;
        }
        
        .button> button{
        	margin: 2px;
        }
        
        /* 좋아요, 댓글란  */
        .like_n_rep{
        	/* border: 1px solid red; */
        	width: 100%;
        	height: 30px;
        	text-align: right;
        }
        
        .like_n_rep>div{
        	/* border: 1px solid red; */
        	height:30px;
        	width: 55px;
        	text-align:center;
        	float: left;
        	line-height:30px;
        }
        
        #heart, #cant_heart, .recruit_list_see{
        	cursor: pointer;
        }

             
         /* 작성자/조회수칸 */
        .writer_con{
            width: 100%;
            height: 50px;
        }

        .view_con{
            width: 100%;
            height: 30px;
            color: gray;
        }
        
        /* input style */
        input:focus {outline:none;}
        
        input{
        	autocomplete="off" ;
        }
        
        /* 댓글 쓰기창 */
        .rep_con{
            width: 100%;
            height: 70px;
            padding: 10px;
            /* border: 1px solid red; */
        }

        .rep_con > textarea{
            width: 100%;
            height: 50px;
            resize: none;
        }

        .button2 {
           /*  border: 1px solid red; */
            text-align: right;
            padding: 5px 5px 0px 0px;
            height: 50px;
        }
        
        /* 댓글 리스트 */
        .rep_list{ /* border: 1px solid red; */ padding:10px; margin-top:10px; }
        
        .each_rep{/*  border: 1px solid red; */ width: 100%; border-bottom: solid 1px rgb(190, 190, 190); padding-bottom:10px; float:left;}
        
        .rep_top{ /* border: 1px solid red; */ width: 100%; padding-top:10px; }
        
        .rep_txt{ /* border: 1px solid red; */ width: 100%; }
        
        .rep_btn{/*  border: 1px solid red; */ width: 100%; text-align:right; padding-right:20px; }
        
        .rep_writer{ font-weight: bolder; /* border: 1px solid red; */ width: 50%; display:inline-block; padding-left: 20px ; }
        
        .rep_date{ /* border: 1px solid red; */ color: gray; width:  49%; display:inline-block; text-align: right; padding-right: 20px; }
        
        .e_rep_con{ width: 100%; padding: 5px 20px 5px 20px; border: none; }
        
        .rep_btn > button {margin: 2px;}
        
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

.fa-home {
	color: rgb(56, 181, 174);
}

        /* 참가자리스트 */
        .recruit_list{
            /* border: 1px solid red; */
            text-align: center;
            width: 100%;
            padding: 10px 300px 10px 300px;
            overflow: auto;
        }
        
        .recruit_list>div{
         	text-align: center;
         	padding-top: 10px;
         	padding-bottom : 10px;
            border-bottom: solid 1px rgb(207, 207, 207);
        }
    </style>
    
</head>
           
<body>
	<div class="header">		
		<jsp:include page="../base/header.jsp"></jsp:include>
	</div>
	<div class="banner">
        <!-- 추후 banner background로 이미지 넣을 예정입니다. 지금은 임시로 단색채움.-->
        <div class="banner_title"> 동행 게시판 </div>
        <div class="banner_content"> 함께 여행갈 친구들을 만들어 보세요 </div>
    </div>
    
    <div class="container">
        <div class="root">
            <div class="home"><a href="/"><i class="fas fa-home"></i></a></div>
            <div> > </div>
            <div class="community"><a href="/companyboard/list?cpage=1">커뮤니티</a></div>
            <div> > </div>
            <div class="partyboard"><a href="/companyboard/list?cpage=1">동행게시판</a></div>
        </div>
    
        <form  action="/companyboard/modify" method="post" id="frmDetail" enctype="multipart/form-data">
            <div class="board">
            	<input type=hidden value="${dto.seq}" name=seq > <!-- 글 번호에 맞춰 불러오기 위한 꼼수 -->
            	<div class="title"> <!-- catetitle -->
                    <span style="width: 20%;">
                        <h3 style="color: rgb(56, 181, 174); font-weight: bold; display: inline; padding: 5px;">${dto.tour}</h3> 
                        <h3 style="display: inline; color: rgb(153, 153, 153); padding: 5px;">|</h3>
                    </span>
                    <span style="width: 80%;">
                        <input type=text id=title name=title value="${dto.title }" style="display: inline; font-size: 20px; font-weight: bold; width: 90%;">
                    </span>
                </div>
                <div class="writer_con">
                    <div style="line-height: 50px; padding-left: 100px; padding-top: 10px;"> ${dto.nick}</div>
                </div>
                <div class="view_con">
                    <div style="line-height: 30px; padding-left: 100px;">조회수 ${dto.view_count}</div>
                </div>
            	
            	<hr style="margin:20px 0px 30px 0px;">
 
                <div class="select_tour"><span style="font-weight: bold;">여행지 : </span>
               		<select id="tourSelect" name="tour">
                        <option value="서울">서울</option>
                        <option value="인천">인천</option>
                        <option value="경기">경기</option>
                        <option value="강원">강원</option>
                        <option value="대전">대전</option>
                        <option value="충남">충남</option>
                        <option value="충북">충북</option>
                        <option value="세종">세종</option>
                        <option value="경북">경북</option>
                        <option value="경남">경남</option>
                        <option value="부산">부산</option>
                        <option value="대구">대구</option>
                        <option value="울산">울산</option>
                        <option value="전북">전북</option>
                        <option value="전남">전남</option>
                        <option value="광주">광주</option>
                        <option value="제주">제주</option>
                    </select>              
                </div>
    
                <div class="select_recruit" ><span style="font-weight: bold;">모집 인원 : </span>
                	<select id="recruitSelect" name="recruit">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                    </select>
                </div>
    
                <div class="select_date">
                    <span style="font-weight: bold;">여행 기간 : </span><!-- 1.31~2.09 -->
                    <input type="text" id="startDateAfter" name="start_date" value="${dto.start_date }" style="width:100px; text-align:center;" autocomplete='off'/> <span style="display:none" id="datetxt2"> ~ </span>
                    <input type="text" id="endDateAfter" name="end_date" value="${dto.end_date }" style="width:100px; text-align:center;" autocomplete='off'/>
                </div>
    
                <div class="select_gender"><span style="font-weight: bold;">성별 : </span><!-- 남자 -->
                	<c:if test="${dto.gender eq '남자' }">
                		<input type="radio" id="manRadio" name="gender" value="남자" checked> 남자
                   		<input type="radio" id="womanRadio" name="gender" value="여자"> 여자
                    </c:if>
                    <c:if test="${dto.gender eq '여자' }">
                		<input type="radio" id="manRadio" name="gender" value="남자"> 남자
                   		<input type="radio" id="womanRadio" name="gender" value="여자" checked> 여자
                    </c:if>
                    
                </div>
    
                <div class="write_con">
                    <textarea id="summernote"  name="contents">${dto.contents }</textarea>
                </div>
    
    			<div class="button">
                		<button type=button id=back class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">목록</span></button>
                		<button type=submit id=modOk class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">수정완료</span></button>
                		<a href="/companyboard/detail?seq=${dto.seq}"><button type=button id=modCancel class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">취소</span></button></a>
                </div>
            </div>
        </form>
     </div>

	<!-- 여행지&모집인원 선택되어있던 값 입력 -->
	<script>
		$("#tourSelect").val("${dto.tour}");
		$("#recruitSelect").val("${dto.recruit}");
	</script>
	
	<script>
		let wsObj = new Object();
		wsObj.seq = "${dto.seq}";
		wsObj.mem_seq = "${dto.mem_seq}";
		wsObj.loginSeq = "${loginSeq}";
		wsObj.title = "${dto.title}";
		wsObj.nick = "${dto.nick}";
		wsObj.board_num = "${dto.board_num}";
		wsObj.reactioner = "${loginNick}";
	</script>
    
    <!-- 목록으로 / 삭제하기 -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		var $j360 = jQuery.noConflict();
	
	
		$j360("#back").on("click", function(){
			location.href="/companyboard/list?cpage=1";
		})
		
		$j360("#delete").on("click", function(){
			if(confirm("정말 삭제하시겠습니까?")){
				location.href="/companyboard/deleteProc?seq=${dto.seq}"; 
			}
		})
	</script>
	
	<!-- datepicker  -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <!--DatePicker용 쿼리 충돌 방지-->
	<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
    <script type="text/javascript">
    	var $j112 = jQuery.noConflict();
    	/* var $j1124 = jQuery.noConflict();  */
    	
    	$j112(document).ready(function () {
    		$j112("#startDateAfter").datepicker({
                dateFormat: "yy-mm-dd", // 날짜의 형식
                minDate: 0,
                nextText: ">",
                prevText: "<",
                onSelect: function (date) {
                    var endDate = $j112('#endDateAfter');
                    var startDate = $j112(this).datepicker('getDate');
                    var minDate = $j112(this).datepicker('getDate');
                    endDate.datepicker('setDate', minDate);
                    startDate.setDate(startDate.getDate() + 10000);
                    endDate.datepicker('option', 'maxDate', startDate);
                    endDate.datepicker('option', 'minDate', minDate);
                    $j112("#endDateAfter").val("");
                }
            });
    		$j112('#endDateAfter').datepicker({
                dateFormat: "yy-mm-dd", // 날짜의 형식
                nextText: ">",
                prevText: "<"
            });
        });
	</script>
	
	<!-- 썸머노트 -->
	<script>
	$(document).ready(function() {
		//여기 아래 부분
		$('#summernote').summernote({
              height:500, // 에디터 높이
    		  minHeight: 500,             // 최소 높이
    		  maxHeight: null,             // 최대 높이
    		  lang: "ko-KR",					// 한글 설정
    		  toolbar: [
				    // [groupName, [list of button]]
				    ['fontname', ['fontname']],
				    ['fontsize', ['fontsize']],
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    ['color', ['forecolor','color']],
				    ['table', ['table']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['height', ['height']],
				    ['insert',['picture','link','video']],
				    ['view', ['fullscreen', 'help']]],
			  fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			  fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
    		  placeholder: '최대 2048자까지 쓸 수 있습니다', 	//placeholder 설정
    		  
    		  callbacks: {	//여기 부분이 이미지를 첨부하는 부분
					onImageUpload : function(files) {
						sendFile(files[0],this);
					}
				}
    	});
	});
	
	/**
	* 이미지 파일 업로드
	*/
	function sendFile(file, editor) {
        var form_data = new FormData();
        form_data.append('file', file);
        $.ajax({
            data : form_data,
            type : "POST",
            url : "/companyboard/imageUpload",
            cache : false,
            contentType : false,
            enctype : "multipart/form-data",
            processData : false,
            success : function(sysName) {
                console.log(sysName + "b")
				console.log("write에 왔습니다.")
                $(editor).summernote('insertImage', sysName);
            }
        });
    }
	
	let title = $("#title").val();
	$("#title").val("");
	$("#title").focus();
	$("#title").val(title);
    </script> 
</body>
</html>