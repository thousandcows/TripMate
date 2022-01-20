<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동향 게시판</title>
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
            /* border: 1px solid red; */
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
        
        #heart{
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
        
        .each_rep{/*  border: 1px solid red; */ width: 100%; border-bottom: solid 1px rgb(190, 190, 190); padding-bottom:10px; }
        
        .rep_top{ /* border: 1px solid red; */ width: 100%; }
        
        .rep_txt{ /* border: 1px solid red; */ width: 100%; }
        
        .rep_btn{/*  border: 1px solid red; */ width: 100%; text-align:right; padding-right:20px; }
        
        .rep_writer{ font-weight: bolder; /* border: 1px solid red; */ width: 50%; display:inline-block; padding-left: 20px ; }
        
        .rep_date{ /* border: 1px solid red; */ color: gray; width:  49%; display:inline-block; text-align: right; padding-right: 20px; }
        
        .e_rep_con{ width: 100%; padding: 5px 20px 5px 20px; border: none; }
        
        .rep_btn > button {margin: 2px;}
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
            <div class="home"><a href="/"><i class="fas fa-home"></i></a></div>
            <div> > </div>
            <div class="community"><a href="/companyboard/list?cpage=1">커뮤니티</a></div>
            <div> > </div>
            <div class="partyboard"><a href="/companyboard/list?cpage=1">동행게시판</a></div>
        </div>
    
        <form action="/companyboard/modify" method="post" id="frmDetail">
            <div class="board">
            	<input type=hidden value="${dto.seq}" name=seq > <!-- 글 번호에 맞춰 불러오기 위한 꼼수 -->
            	
            	<div class="title">
                    <span style="width: 20%;">
                        <h3 style="color: rgb(56, 181, 174); font-weight: bold; display: inline; padding: 5px;">${dto.tour}</h3> 
                        <h3 style="display: inline; color: rgb(153, 153, 153); padding: 5px;">|</h3>
                    </span>
                    <span style="width: 80%;">
                        <input type=text id=title name=title readonly value="${dto.title }" style="display: inline; font-size: 20px; font-weight: bold; border: none; width: 90%;">
                    </span>
                </div>
                <div class="writer_con">
                    <div style="line-height: 50px; padding-left: 100px; padding-top: 10px;">작성자</div>
                </div>
                <div class="view_con">
                    <div style="line-height: 30px; padding-left: 100px;">조회수 ${dto.view_count}</div>
                </div>
            	
            	<hr style="margin:20px 0px 30px 0px;">
 
                <div class="select_tour"><span style="font-weight: bold;">여행지 : </span>
                    <input type=text id=tourInput readonly value="${dto.tour }" style="border:none;">
               		<select id="tourSelect" name="tour" style="display:none">
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
                    <input type=text id=recruitInput readonly value="${dto.recruit }" style="border:none;">
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
                    <span style="font-weight: bold;">여행 기간 : </span>
                    <input type="text" id="startDateBefore" readonly value="${dto.start_date }" autocomplete='off' style="border:none; width:100px; text-align:center;"/> <span id="datetxt1"> ~ </span>
                    <input type="text" id="endDateBefore" readonly value="${dto.end_date }" autocomplete='off' style="border:none; width:100px; text-align:center;"/>
                    <input type="text" id="startDateAfter" name="start_date" readonly value="${dto.start_date }" style="display: none; width:100px; text-align:center;" autocomplete='off'/> <span style="display:none" id="datetxt2"> ~ </span>
                    <input type="text" id="endDateAfter" name="end_date" readonly value="${dto.end_date }" style="display: none; width:100px; text-align:center;" autocomplete='off'/>
                </div>
    
                <div class="select_gender"><span style="font-weight: bold;">성별 : </span>
                    <input type=text id=genderInput readonly value="${dto.gender }" style="border:none;">
                	<input type="radio" id="manRadio" name="gender" value="남자" style="display:none"><p style="display:none" id="mantxt">남자</p>
                    <input type="radio" id="womanRadio" name="gender" value="여자" style="display:none"><p style="display:none" id="womantxt">여자</p>
                </div>
    
                <div class="write_con">
                    <textarea id="summernote"  name="contents">${dto.contents }</textarea>
                </div>
    
                <div class="button">
                	<button type=button id=back class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">목록</span></button>
                	<button type=button id=modify class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">수정</span></button>
                	<button type=button id=delete class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">삭제</span></button>
                	<button type=button id=recruitEnd class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">모집마감</span></button>
                	<button type=button id=modOk class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174); display: none;"><span style="font-size: small;">수정완료</span></button>
                	<button type=button id=modCancel class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174); display: none;"><span style="font-size: small;">취소</span></button>
                </div>
                
                <div class="like_n_rep">
                	<div id=like_icon>
                		<a class="heart">
           					<img id="heart" src="" style="width:20px; height:20px;"><span id="rec_count" name="rec_count"> ${dto.rec_count}</span>
       					</a>
                	</div>
                	<div id=rep_icon>
                		<i class="far fa-comment-dots" style="color: black"></i><span id="rep_count" name="rep_count"> ${dto.rep_count}</span>
                	</div>
                </div>
         	</form> 
               	<form action="/comreply/reply" method="post" id="frmReply" enctype="multipart/form-data">
					<input type=hidden value="${dto.seq}" name=rseq>
					<div class="rep_con">
                    	<textarea id=rep_con name=reply placeholder=" 댓글을 입력해주세요" ></textarea>
                	</div>
                	<div class="button2">
                    	<button type="submit"  id="rep_write" class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">댓글 작성</span></button>
                	</div>
                </form> 
                <c:forEach var="repl" items="${rep_list }">
                	<div class="rep_list">
                    	<div class="each_rep">
                        	<div class="rep_top">
                        		<input type=hidden value="${repl.seq}" name=seq>
            					<input type=hidden value="${repl.par_seq}" name=par_seq>
                            	<span class="rep_writer">
                                	${repl.mem_seq }
                            	</span>
                            	<span class="rep_date" > 
                            		${repl.writen_date }
                            	</span>
                        	</div>
                        	<div class="rep_txt">
                            	<input type="text" id="e_rep_con${repl.seq }" class="e_rep_con"  name="contents" value=${repl.contents }  readonly>
                        	</div>
                        	<div class="rep_btn">
                            	<button type=button id="rep_del${repl.seq }" class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">댓글 삭제</span></button>
                            	<button type=button id="rep_mod${repl.seq }" class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">댓글 수정</span></button>
                        		<button type=button id="rep_modok${repl.seq }" class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174); display: none;"><span style="font-size: small;">수정 완료</span></button>
                            	<button type=button id="rep_modcancel${repl.seq }" class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174); display: none;"><span style="font-size: small;">수정 취소</span></button>
                        	</div>
                    	</div>
                	</div>
                </c:forEach>
                
                <%-- <form action="/comreply/modify" method="post" id="frmRpMod" enctype="multipart/form-data">
        			<div class="reply_list">
            			<hr>
            			<div class="reply_title">
           					<input type=hidden value="${rp.seq}" name=seq>
            				<input type=hidden value="${rp.par_seq}" name=par_seq>
                			<div class="rp_id">${rp.mem_seq }</div>
                			<div class="rp_time" name="writen_date">${rp.writen_time }</div>
            			</div>
            			<br>            
            			<div class="reply_contents " style="text-align: right;">
                			<div class="rp_content"><input type=text value="${rp.contents }" class="rp_contents" id="rp_contents${rp.seq }" name="contents" readonly></div>
                			<div class="rp_btns">
                    			<button type=button class="rp_mod_btn" id="rp_mod_btn${rp.seq }">fix</button>
                    			<button type=button class="rp_del_btn" id="rp_del_btn${rp.seq }" style="color: red;"><b>del</b></button>
                    			<button type=submit class="rp_modOk_btn" id="rp_modOk_btn${rp.seq }" style="display: none;">mod</button>  
                    			<button type=button class="rp_cancle_btn" id="rp_cancle_btn${rp.seq }" style="color: red; display: none;"><b>can</b></button>                                       
                			</div>                
           		 		</div><br>
        			</div>
        		</form> --%>
    </div>
    
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
			backupTour = $("#tourInput").val();
			backupRecruit = $("#recruitInput").val();
			backupStartDate = $("#startDateBefore").val();
			backupEndDate = $("#endDateBefore").val();
			backupGender = $("#genderInput").val();
			backupTitle = $("#title").val();
			backupContents = $("#summernote").val();		

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
			$("#title").css("border", "1px solid gray");
			$("#contents").removeAttr("readonly");
			
			
			// 여행지역 기존 체크값 불러오기
			$("#tourSelect").val(backupTour).attr("selected", "selected");
			
			// 모집인원 기존 체크값 불러오기
			$("#recruitSelect").val(backupRecruit).attr("selected", "selected");

			// 라디오 버튼 기존 체크값 불러오기
			if(backupGender == "남자"){
				$("#manRadio").attr('checked', 'checked');
			}
			else {
				$("#womanRadio").attr('checked', 'checked');
			}
	
			//버튼 형태 바꾸기
			$("#modify").css("display", "none");
			$("#delete").css("display", "none");
			$("#recruitEnd").css("display", "none");
			$("#modOk").css("display", "inline");
			$("#modCancel").css("display", "inline");	
			
			// 썸머노트 쓰기 활성화
			$('#summernote').summernote('enable');
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
	
			// 썸머노트 쓰기 비활성화
			$('#summernote').summernote('disable');
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
    		  height: 300,				 // 에디터 높이
    		  minHeight: 300,             // 최소 높이
    		  maxHeight: null,             // 최대 높이
    		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
    		  lang: "ko-KR",					// 한글 설정 
    		  placeholder: '최대 2048자까지 쓸 수 있습니다' 	//placeholder 설정
    	});
    	
    	$('#summernote').summernote('disable');
    });
    </script> 
    
    <!-- 좋아요 -->
    <script>
    $(document).ready(function () {

        var heartval = ${heart};

        if(heartval>0) {
        	 //console.log("heartval>0 "+heartval + " : " + ${heart});
            $("#heart").prop("src", "/images/like.png");
            $(".heart").prop('name',heartval)
        }
        else {
        	 //console.log("else "+heartval + " : " + ${heart});
            $("#heart").prop("src", "/images/dislike.png");
            $(".heart").prop('name',heartval)
        }

    });
    
    $(".heart").on("click", function () {

        var that = $(".heart");

        var sendData = {'boardId' : '${dto.seq}','heart' : that.prop('name'), 'rec_count_no' : '${dto.rec_count}'};
        
        //console.log(that.prop('name'));
        
        $.ajax({
            url :'/companyboard/heart',
            type :'POST',
            data : sendData,
            success : function(data){
                that.prop('name',data.heart);   
    		    
                var heart = data.heart;
                var rec_count_no = data.rec_count_no;
                
                if(heart==1) {
                    $('#heart').prop("src","/images/like.png");
                   /*  console.log("heart값이 1일때 dto의 추천수 : " + rec_count_no); */
                    $('#rec_count').html(" " + data.rec_count_no);
                }
                else{
                    $('#heart').prop("src","/images/dislike.png");
                    /* console.log("heart값이 0일때 dto의 추천수 : " + rec_count_no); */
                    $('#rec_count').html(" " + data.rec_count_no);
                }
            }
        });
    });
    </script>
    
    <!-- 댓글 -->
	<script>
	 	$("#rep_write").on("click", function() {
			if (confirm("이대로 작성하시겠습니까?")) {
				$("#frmReply").submit();
			}
		});
	</script>    
</body>
</html>