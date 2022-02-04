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
    
     	.navbar-brand{
            height:70px !important;
        }
        
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

        /* input style */
        input:focus {outline:none;}
        
        input{autocomplete:"off";}

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
        .root {
            padding-left: 150px;
            overflow: auto;
            text-align: center;
            font-size: 16px;
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

        /* 컨테이너 ----------------------------------------------------- */
        .container_c {
            margin-left: 200px;
            margin-right: 200px;
            padding-bottom: 30px;
            overflow: auto;
        }

        /* 제목, 글 */
        .board {
            width: 100%;
            padding: 20px 80px 0px 80px;
        }

        #categoryValue_txt{
            color: rgb(56, 181, 174); 
            font-weight:500; 
            display: inline; 
            font-size: 30px;
            padding: 5px;
        }

        #title{
            display: inline; 
            font-size: 20px; 
            font-weight: bold; 
            width: 90%;
        }

        .catetitle {
            padding: 0px 80px 0px 80px;
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

        .board_con{
            padding-left: 80px;
            padding-right: 80px;
        }

        /* 버튼 */
        .button {
            /* border: 1px solid red; */
            text-align: right;
            padding: 20px 80px 0px 0px;
        }
        
        .button> button{
        	margin: 2px;
        }        
         
        /* 작성자/조회수칸 */
        .writer_con{
            border-bottom: 1px solid black;
            margin-bottom: 20px;
            margin-left: 80px;
            margin-right: 80px;
            padding-bottom: 20px;
            padding-left: 10px;
        }

        .writer_nick{
            width: 100%;
            height: 50px;
        }

        .writer_nick>div{
            line-height: 50px; 
            padding-top: 10px;
        }

        .view_con{
            width: 100%;
            height: 30px;
            color: gray;
        }

        .view_con>div{
            line-height: 30px; 
        }
        
       
        /* 1400px ~  */
        @media (min-width: 1400px){}
  
        /* 800 ~ 1400px */
        @media (max-width: 1400px) and (min-width: 800px){
            
            /* 컨테이너 */
            .container_c {
                margin-left: 50px;
                margin-right: 50px;
                padding-bottom: 30px;
                overflow: auto;
            }

            /* 미니 사이트맵 루트 */
            .root{
                padding-left: 80px;
                overflow: auto;
                text-align: center;
            }

            /* 제목 카테고리 */
            #categoryValue_txt{
                color: rgb(56, 181, 174); 
                font-weight:500; 
                display: inline; 
                font-size: 25px;
                padding: 5px;
            }

            #title{
                display: inline; 
                font-size: 25px; 
                font-weight: 500; 
                width: 80%;
                padding-left: 10px;
            }
            
            /* 제목, 글 */
            .board {
                width: 100%;
                padding: 20px 0px 0px 0px;
            }

            /* 버튼 */

            .button {
                text-align: right;
                padding: 50px 80px 0px 0px;
            }
                    
            .button> button{
                margin: 2px;
            }
        }

        /* ~ 800px */
        /* 작은 화면일 때 */
        @media (max-width: 800px){

            
            /* 컨테이너 */
            .container_c {
                margin-left: 10px;
                margin-right: 10px;
                padding-bottom: 30px;
                overflow: auto;
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

            /* 제목 카테고리 */
            #categoryValue_txt{
                color: rgb(56, 181, 174); 
                font-weight:500; 
                display: inline; 
                font-size: 25px;
                padding: 5px;
            }

            #title{
                display: inline; 
                font-size: 25px; 
                font-weight: 500; 
                width: 80%;
                padding-left: 10px;
            }

            .catetitle {
                padding: 0px 0px 0px 0px;
            }	

            /* 제목, 글 */
            .board {
                width: 100%;
                padding: 20px 0px 0px 0px;
            }

             /* 작성자/조회수칸 */
            .writer_con{
                border-bottom: 1px solid black;
                margin-bottom: 20px;
                margin-left: 0px;
                margin-right: 0px;
                padding-bottom: 20px;
            }

            .contents {
                padding-right: 0px;
                padding-left: 0px;
            }

            .board_con{
                padding-left: 0px;
                padding-right: 0px;
            }

            /* 버튼 */

            .button {
                text-align: right;
                padding: 50px 0px 0px 0px;
            }
                    
            .button> button{
                margin: 2px;
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
    
    <div class="container_c">
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
            	<div class="catetitle"> <!-- catetitle -->
                    <span>
                        <h3 id="categoryValue_txt">${dto.tour}</h3> 
                    </span>
                    <span>
                        <input type=text id=title name=title value="${dto.title }">
                    </span>
                </div>
                <div class = writer_con>
					<div class="writer_nick">
						<div> ${dto.nick}</div>
					</div>
					<div class="view_con">
						<div>조회수 ${dto.view_count}</div>
					</div>
				</div>
            	
                <div class="board_con">
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
                        <input type="text" id="startDateAfter" name="start_date" value="${dto.start_date }" style="width:100px; text-align:center;" autocomplete='off'/> <span id="datetxt2"> ~ </span>
                        <input type="text" id="endDateAfter" name="end_date" value="${dto.end_date }" style="width:100px; text-align:center;" autocomplete='off'/>
                    </div>
        
                    <div class="select_gender"><span style="font-weight: bold;">성별 : </span><!-- 남자 -->
                        <c:if test="${dto.gender eq '남자' }">
                            <input type="radio" id="manRadio" name="gender" value="남자" checked> 남자
                            <input type="radio" id="womanRadio" name="gender" value="여자"> 여자
                            <input type="radio" name="gender" value="혼성"> 혼성
                        </c:if>
                        <c:if test="${dto.gender eq '여자' }">
                            <input type="radio" id="manRadio" name="gender" value="남자"> 남자
                            <input type="radio" id="womanRadio" name="gender" value="여자" checked> 여자
                            <input type="radio" name="gender" value="혼성"> 혼성
                        </c:if>
                        <c:if test="${dto.gender eq '혼성' }">
                            <input type="radio" id="manRadio" name="gender" value="남자"> 남자
                            <input type="radio" id="womanRadio" name="gender" value="여자" checked> 여자
                            <input type="radio" name="gender" value="혼성"> 혼성
                        </c:if>
                        
                    </div>
        
                    <div class="write_con">
                        <textarea id="summernote"  name="contents">${dto.contents }</textarea>
                    </div>

                </div>
    
    			<div class="button">
                		<button type=button id=back class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">목록</span></button>
                		<button type=submit id=modOk class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">수정완료</span></button>
                		<a href="/companyboard/detail?seq=${dto.seq}"><button type=button id=modCancel class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">취소</span></button></a>
                </div>
            </div>
        </form>
     </div>

	<script>
		$("#modOk").on("click", function(){
			
			if($("#title").val()==""){
    			
    			alert("제목을 입력해주세요");
    			return false;
    		}
			
			let summernote = $("#summernote").val();
			summernote = summernote.replace(/&nbsp;/g, " ");
			if(summernote == ""){    			
    			alert("내용을 입력해주세요");
    			return false;
    			
    		}else if(summernote.length>800){
	    		
	    		alert("입력한도를 초과하였습니다.");
	    		return false;
	    	}
			
			if (confirm("이대로 작성하시겠습니까?")) {
				
			}else{				
				return false;
			}
		})
	</script>
	
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
    		  placeholder: '내용을 입력해주세요.', 	//placeholder 설정
    		  
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