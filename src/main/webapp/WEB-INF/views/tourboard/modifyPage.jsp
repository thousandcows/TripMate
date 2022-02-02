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
<jsp:include page="../base/header.jsp"></jsp:include>
<style>

* {
	box-sizing: border-box;
}

body {
	margin: 0; /* 임시로 body margin 0px */
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
.root{
    padding-left: 150px;
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

/* 컨테이너 */
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
	padding-left: 80px;
}

.write_con>textarea {
     width: 100%;
     height: 500px;
     resize: none;
}

/* 버튼 */

.button {
     text-align: right;
     padding: 50px 80px 0px 0px;
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

	/* 제목, 글 */
	.board {
		width: 100%;
		padding: 20px 0px 0px 0px;
	}

	.category {
		width: 10%;
		float: left;
		padding: 0px 80px 0px 0px;
	}

	.catetitle {
		padding: 0px 0px 0px 0px;
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
</head>

<body>

	<!-- .banner에 이미지 추가해야한다.-->
	<div class="banner">
		<div class="banner_title" href=""> 여행지 게시판 </div>
		<div class="banner_content"> 각 지역의 여행 후기를 남겨보세요 </div>
	</div>
	
	<div class="container_c">
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
					<span>
                        <h3 id="categoryValue_txt">${dto.category }</h3> 
                    </span> 
                    <span>
                    	<input type=hidden value="${dto.seq}" name=seq>
                        <input type=text placeholder="제목을 입력하세요" id=title name=title value="${dto.title }" >
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
				
				
				<div class="category">
                    <select name="category" id="category" >
                        <option value="">말머리</option>
                        <option value="명소">명소</option>
                        <option value="문화">문화</option>
                        <option value="생태">생태</option>
                        <option value="체험">체험</option>
                    </select>
                </div><br><br>
				<div class="contents">
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
	
	<footer>
    	    <jsp:include page="../base/footer.jsp"></jsp:include>
    </footer>


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