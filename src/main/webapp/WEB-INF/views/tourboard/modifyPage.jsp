<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행지 게시판</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" 	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"	crossorigin="anonymous"><!-- include libraries(jQuery, bootstrap) -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<style>

* {
	box-sizing: border-box;
}

body {
	margin: 0; /* 임시로 body margin 0px */
}

/* input style */
input:focus {outline:none;}
        
input{autocomplete="off" ;}
        

/* div{border:1px solid black} */
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

/* 컨테이너 */
.container {
/* border: 1px solid red; */
    padding-bottom :30px;
}
        
.container>.root {
	padding-left: 80px;
	overflow: auto;
}

.root>div {
	float: left;
	margin: 40px 0px 40px 0px;
	padding-right: 10px;
}

/* 제목, 글 */
.board {
     /* border: 1px solid red; */
     width: 100%;
     padding: 20px 80px 0px 80px;
}

.catetitle {
	padding: 0px 80px 0px 80px;
}

.category {
	width: 10%;
	float: left;
	padding: 0px 80px 0px 80px;
}

.title {
 	width: 100%;
    padding: 5px;
}

.contents {
	padding-right: 80px;
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

/* 댓글쓰기창 */
.rep_con{
    width: 100%;
    height: 70px;
    padding: 10px;
}

.rep_con > textarea{
    width: 100%;
    height: 50px;
    resize: none;
}

.button2 {
    text-align: right;
    padding: 5px 5px 0px 0px;
    height: 50px;
}


/* 댓글 리스트 */
.rep_list{ /* border: 1px solid red; */ padding:10px; margin-top:10px; }
        
.each_rep{/*  border: 1px solid red; */ width: 100%; border-bottom: solid 1px rgb(190, 190, 190); padding-bottom:10px; float:left;}

.reply_title{ /* border: 1px solid red; */ width: 100%; padding-top:10px; }

.reply_title>.rp_id {font-weight: bolder; /* border: 1px solid red; */ width: 50%; display:inline-block; padding-left: 20px ;}

.reply_title>.rp_time {/* border: 1px solid red; */ color: gray; width:  49%; display:inline-block; text-align: right; padding-right: 20px;}

.reply_contents {/* border: 1px solid red; */ width: 100%;}

.rep_btn{/*  border: 1px solid red; */ width: 100%; text-align:right; padding-right:20px; }

.rep_btn > button {margin: 2px;}

.rp_contents{ width: 100%; padding: 5px 20px 5px 20px; border: none; }

/* 
.re_reply{
    width: 100%;
    float: left;
    padding: 0px 5px 0px 80px;
}

.re_reply>.re_rp_title{
    overflow: auto;
}

.re_rp_title>div{
    float: left;
}

.re_rp_title>.re_rp_id{
    width: 85%;
}

.re_rp_title>.re_rp_time{
    width: 15%;
}

.re_rp_contents>.re_rp_content{
    width: 100%;
}
 */
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


/* 좋아요, 댓글란  */
        .like_n_rep{
        	width: 100%;
        	height: 30px;
        	text-align: right;
        }
        
        .like_n_rep>div{
        	height:30px;
        	width: 55px;
        	text-align:center;
        	float: left;
        	line-height:30px;
        }
        
        #heart, #cant_heart{
        	cursor: pointer;
        }
</style>
</head>

<body>

	<div class="header">		
		<jsp:include page="../base/header.jsp"></jsp:include>
	</div>
	
	<!-- .banner에 이미지 추가해야한다.-->
	<div class="banner">
		<div class="banner_title" href=""> 여행지 게시판 </div>
		<div class="banner_content"> 각 지역의 여행 후기를 남겨보세요 </div>
	</div>
	
	<div class="container">
		<div class="root">
			<div class="home"><a href="/"><i class="fas fa-home"></i></a></div>
			<div>></div>
			<div class="community" href="/tourboard/list?cpage=1">커뮤니티</div>
			<div>></div>
			<div class="tourboard"><a href="/tourboard/list?cpage=1">여행지 게시판</a></div>
		</div>
		<form action="/tourboard/modify" method="post" id="frmDetail" enctype="multipart/form-data">
			<div class="board">
				<div class="catetitle">
					<!-- <div class="category"> -->
					<span style="width: 20%;">
                        <h3 style="color: rgb(56, 181, 174); font-weight: bold; display: inline; padding: 5px;" id="categoryValue_txt">${dto.category }</h3> 
                        <h3 style="display: inline; color: rgb(153, 153, 153); padding: 5px;">|</h3>
                    </span> 
                    <span style="width: 80%;">
                    	<input type=hidden value="${dto.seq}" name=seq>
                        <input type=text placeholder="제목을 입력하세요" id=title name=title value="${dto.title }" style="display: inline; font-size: 20px; font-weight: bold; width: 90%;">
                    </span>
				</div>
				<div class="writer_con">
                    <div style="line-height: 50px; padding-left: 100px; padding-top: 10px;"> ${dto.nick}</div>
                </div>
                <div class="view_con">
                    <div style="line-height: 30px; padding-left: 100px;">조회수 ${dto.view_count}</div>
                </div>
				
				<hr style="margin:20px 0px 30px 0px;">
				
				
				<div class="category">
                    <select name="category" id="category" >
                        <option value="">말머리</option>
                        <option value="명소">명소</option>
                        <option value="문화">문화</option>
                        <option value="생태">생태</option>
                        <option value="체험">체험</option>
                    </select>
                </div><br><br>
				<div class="contents" style="margin-left: 80px;">
					<textarea class="summernote" id="summernote" name="explanation">${dto.contents }</textarea>
				</div>
				
				<div class="button">
						<a href="/tourboard/list?cpage=1"><button type=button class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">목록</span></button></a>
						<button type=submit id=modOk style="border: none;background-color: rgb(56, 181, 174);" class="btn btn-primary btn-sm"  ><span style="font-size: small;">완료</span></button>
						<a href="/tourboard/detail?seq=${dto.seq}"><button type=button id=modCancel style="border: none;background-color: rgb(56, 181, 174);" class="btn btn-primary btn-sm"><span style="font-size: small;">취소</span></button></a>
				</div>				
			</div>
		</form>
	</div>	
	
	<div class="footer">
    	<jsp:include page="../base/footer.jsp"></jsp:include>
    </div>


	<script>
		$("#category").val("${dto.category}");
	</script>
	
	<script>
		$("#del").on("click", function() {
			if (confirm("정말 삭제하시겠습니까?")) {
				location.href = "/tourboard/delete?seq=${dto.seq}";
			}
		});
	</script>

	<script>
		$("#modCancel").on("click", function() {
			if (confirm("정말 취소하시겠습니까?")) {

				location.reload();
			}
		})
	</script>

	<script>
		$("#modOk").on("click", function() {			

			if ($("#title").val() == "") {

				alert("제목을 입력해주세요");
				return false;
			}
			if ($("#category").val() == "") {

				alert("말머리를 선택해주세요");
				return false;
			}

			if ($("#summernote").val() == "") {

				alert("내용을 입력해주세요");
				return false;
			}
			if (confirm("이대로 작성하시겠습니까?")) {
				$("#frmDetail").submit();
			}
		});
	</script>

	<script>
		$(document).ready(function() {
			//여기 아래 부분
			$('#summernote').summernote({
				height : 300, // 에디터 높이
				minHeight : 300, // 최소 높이
				maxHeight : null, // 최대 높이
				lang : "ko-KR", // 한글 설정
				
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
				    ['view', ['fullscreen', 'help']]
				  ],
				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
				placeholder : '최대 2048자까지 쓸 수 있습니다', //placeholder 설정
				
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
	            url : "/tourboard/imageUpload",
	            cache : false,
	            contentType : false,
	            enctype : "multipart/form-data",
	            processData : false,
	            success : function(sysName) {
	                console.log(sysName + "b")
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