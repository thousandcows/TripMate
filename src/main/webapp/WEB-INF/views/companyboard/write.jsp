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
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
<!-- fontawesome cdn -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">

<!-- datepicker -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
   
<!-- include libraries(jQuery, bootstrap)  -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js  -->
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

        /* 링크 속성 지우기 */
        a { text-decoration:none  } 
        a:hover { text-decoration:none; color: black; }
        a:link {text-decoration: none; color: black; }
        a:visited {text-decoration: none; color: black; }
        a:active {text-decoration: none; color: black; }
        .navbar-brand{
            height:70px !important;
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

        /* 미니 사이트맵 루트 */
        .root{
            padding-left: 80px;
            overflow: auto;
            text-align: center;
            font-size: 16px;
        }

        .root>div{
            float:left;
            margin: 40px 0px 40px 0px;
            padding-right: 10px;
        }

        .fa-home{
            color: rgb(56, 181, 174);
        }
        

        /* 글쓰기 창 */
        .board {
           /*  border: 1px solid red; */
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
           /*  border: 1px solid red; */
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

        .title>input {
            width: 100%;
            height: 30px;
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

        
        /* 1400px ~  */
        @media (min-width: 1400px){
             /* 컨테이너 ----------------------------------------------------- */
            .container_c{
                margin-left: 100px;
                margin-right: 100px;
                margin-bottom:50px;
            }
        }

        /* 800 ~ 1400px */
        @media (max-width: 1400px) and (min-width: 800px){

             /* 컨테이너 ----------------------------------------------------- */
             .container_c{
                margin-left: 50px;
                margin-right: 50px;
                margin-bottom:50px;
            }

             /* 미니 사이트맵 루트 */
            .root{
                padding-left: 0px;
                overflow: auto;
                text-align: center;
            }

            /* 제목, 글 */
            .board {
                width: 100%;
                padding: 20px 0px 0px 0px;
            }
        }

         /* ~ 800px */
        /* 작은 화면일 때 */
        @media (max-width: 800px){

             /* 컨테이너 ----------------------------------------------------- */
             .container_c{
                margin-left: 0px;
                margin-right: 0px;
                margin-bottom:50px;
            }

            /* 헤더 banner contents*/
            .banner_title{
                width: 100%;
                height: 70%;
                color: white;
                font-size: 35px;
                font-weight: 600;
                padding: 60px 0px 10px 0px;
                text-align: center;
            }
    
            .banner_content{
                width: 100%;
                height: 30%;
                color: white;
                font-size: 15px;
                font-weight: 500;
                padding-left: 0px;
                text-align: center;
            }

             /* 미니 사이트맵 루트 */
             .root{
                padding-left: 0px;
                overflow: auto;
                text-align: center;
                display: none;
            }

            /* 제목, 글 */
            .board {
                width: 100%;
                padding: 20px 0px 0px 0px;
            }
        }


    </style>
    		<jsp:include page="../base/header.jsp"></jsp:include>
    
</head>
<body>
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

        <!-- enctype="multipart/form-data" -->
        <form action="/companyboard/writeProc" method="post" >
            <div class="board">
                <div class="select_tour"><span style="font-weight: bold;">여행지 : </span>
                    <select name="tour" id="tour">
                    	<option value="" selected disabeled hidden>여행지</option>
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

                <div class="select_recruit"><span style="font-weight: bold;">모집 인원 : </span>
                    <select name="recruit" id="recruit">
                    	<option value="" selected disabeled hidden>인원</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                    </select>
                </div>

                <div class="select_date">
                    <span style="font-weight: bold;">여행 기간 : </span>
					<input type="text" id="startDate" name="start_date" autocomplete='off' style="width:100px; text-align:center;"/> ~ 
                    <input type="text" id="endDate" name="end_date" autocomplete='off' style="width:100px; text-align:center;"/>
                    
                </div>

                <div class="select_gender"><span style="font-weight: bold;">성별 : </span>
                    <input type="radio" name="gender" value="남자" >남자
                    <input type="radio" name="gender" value="여자">여자
                    <input type="radio" name="gender" value="혼성">혼성
                </div>

                <div class="title">
                    <input type="text" placeholder="제목을 입력해 주세요" name=title id="title" autocomplete='off'>
                </div>

                <div class="write_con">
                    <textarea id="summernote" placeholder="내용을 입력해 주세요" name=contents></textarea>
                </div>

                <div class="button">
                	<button type=button id=back class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">목록</span></button>
                    <button id="write_btn" class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">작성완료</span></button>
                </div>
            </div>
        </form>
    </div>
    
    <div class="footer">
    	<jsp:include page="../base/footer.jsp"></jsp:include>
    </div>

<!-- 목록으로  -->
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		var $j360 = jQuery.noConflict();
	
		$j360("#back").on("click", function(){
			if(confirm("목록으로 돌아가시겠습니까?")){
				location.href="/companyboard/list?cpage=1";	
			}else{
				return false;
			}
			
	    })
	</script>
	
<!-- 썸머노트  -->
	<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> --> <!--Summernote용 쿼리 충돌 방지-->
	<script>
		/* var $j351 = jQuery.noConflict(); */
		
		$(document).ready(function() {
    		//여기 아래 부분
			$('#summernote').summernote({
	              height:500, // 에디터 높이
	    		  minHeight: 500,             // 최소 높이
	    		  maxHeight: null,             // 최대 높이
	    		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
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
    </script>    
	
<!-- datepicker  -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <!--DatePicker용 쿼리 충돌 방지-->
	<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
    <script type="text/javascript">
    	var $j112 = jQuery.noConflict();
    	/* var $j1124 = jQuery.noConflict();  */
    	
    	$j112(document).ready(function () {
    		$j112("#startDate").datepicker({
                dateFormat: "yy-mm-dd", // 날짜의 형식
                minDate: 0,
                nextText: ">",
                prevText: "<",
                onSelect: function (date) {
                    var endDate = $j112('#endDate');
                    var startDate = $j112(this).datepicker('getDate');
                    var minDate = $j112(this).datepicker('getDate');
                    endDate.datepicker('setDate', minDate);
                    startDate.setDate(startDate.getDate() + 10000);
                    endDate.datepicker('option', 'maxDate', startDate);
                    endDate.datepicker('option', 'minDate', minDate);
                    $j112("#endDate").val("");
                }
            });
    		$j112('#endDate').datepicker({
                dateFormat: "yy-mm-dd", // 날짜의 형식
                nextText: ">",
                prevText: "<"
            });
        });
	</script>
	
	<!-- 공란시 alert창 띄우기 -->
    <script>
    $("#write_btn").on("click", function() {
    	
    	 	if($("#tour").val()==""){
    			
    			alert("여행지를 선택해주세요");
    			return false;
    		}
    		
    		if($("#recruit").val()==""){
    			
    			alert("인원수를 선택해주세요");
    			return false;
    		} 
    		
			if($("#startDate").val()=="" && $("#endDate").val()==""){
    			
    			alert("여행 날짜를 선택해주세요");
    			return false;
    		}
    		
    		if($("#startDate").val()=="" ){
    			
    			alert("여행 시작 날짜를 선택해주세요");
    			return false;
    		}
    		
			if( $("#endDate").val()==""){
    			
    			alert("여행 종료 날짜를 선택해주세요");
    			return false;
    		}
    		
    		if(!$('input:radio[name=gender]').is(':checked') ){
    			
    			alert("성별을 선택해주세요");
    			return false;
    		} 
    	    
    	    if($("#title").val()==""){
    			
    			alert("제목을 입력해주세요");
    			return false;
    		}
    		
    	    let summernote = $("#summernote").val();
        	summernote = summernote.replace(/&nbsp;/g, " ");
    		if(summernote==""){
    			
    			alert("내용을 입력해주세요");
    			return false;
    		}else if(summernote.length>800){
        		
        		alert("입력한도를 초과하였습니다.");
        		return false;
        	}
    		
    		if(confirm("글을 작성하시겠습니까?")==true){
    			
    		}else{
    			return false;
    		}
    	
    }); 
    
   
    </script>
	
</body>
</html>