<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행지 게시판</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
 -->
 <link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
<jsp:include page="../base/header.jsp"></jsp:include>


<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>


 <style>
 
 @import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);

 body, talbe, th, td, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, 
 	pre, form, fieldset, textarea, blockquote, span, * {
 	font-family: 'Noto Sans KR', sans-serif;
 } 

        * {box-sizing: border-box;}

        body{
            margin: 0;  /* 임시로 body margin 0px */
        }

       /* 링크 속성 지우기 */
        a { text-decoration:none  } 
        a:hover { text-decoration:none; color: black; }
        a:link {text-decoration: none; color: black; }
        a:visited {text-decoration: none; color: black; }
        a:active {text-decoration: none; color: black; }

        /* 헤더----------------------------------------------------- */
        .banner{
            background-image:url("/images/community_banner.png");
           	height:200px;
        }

        .banner_title{
            width: 100%;
            height: 70%;
            color: white;
            font-size: 35px;
            font-weight: 600;
            padding: 60px 0px 10px 100px;
        }

        .banner_content{
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
        
        
        

         /* 1400px ~  */
        @media (min-width: 1400px){

            /* 컨테이너 ----------------------------------------------------- */
            .container_c{
                margin-left: 100px;
                margin-right: 100px;
                margin-bottom:50px;
            }

            /* 글작성 부분 */
            .writeForm{
                padding : 20px 150px 0px 150px;
            }

            /* 카테고리 */
            .catetitle{
                overflow: auto;
                padding: 0px;
                text-align: left;
            }
            
            .category{
                width:7%;
                float:left;
            }
            

            /* 제목 */
            .title{
                width:93%;
                float:left;
            }
            
            .title>input{
                width:100%;
            }      
            
            /* 내용 */
            .contents{
                
            }

            /* 버튼 */
            .ft_btn {
                text-align: right;
                padding: 20px 150px 0px 0px;
            }
            .ft_btn> button{
                margin: 2px;
            }
        }

          /* 800 ~ 1400px */
        @media (max-width: 1400px) and (min-width: 800px){

            /* 컨테이너 ----------------------------------------------------- */
            .container_c{
                margin-left: 0px;
                margin-right: 0px;
                margin-bottom:50px;
            }

             /* 미니 사이트맵 루트 */
            .root{
                padding-left: 50px;
                overflow: auto;
                text-align: center;
            }

            /* 글작성 부분 */
            .writeForm{
                padding : 20px 50px 0px 50px;
            }

            /* 카테고리 */
            .catetitle{
                overflow: auto;
                padding: 0px;
                text-align: left;
            }
            
            .category{
                width:10%;
                float:left;
            }
            

            /* 제목 */
            .title{
                width:90%;
                float:left;
            }
            
            .title>input{
                width:100%;
            }   
            
            /* 내용 */
            .contents{
                
            }

            /* 버튼 */
            .ft_btn {
                text-align: right;
                padding: 20px 50px 0px 0px;
            }
            .ft_btn> button{
                margin: 2px;
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

            /* 글작성 부분 */
            .writeForm{
                padding : 20px 15px 0px 15px;
            }

            /* 카테고리 */
            .catetitle{
                overflow: auto;
                padding: 0px;
                text-align: left;
            }
            
            .category{
                width:17%;
                float:left;
            }
            

            /* 제목 */
            .title{
                width:83%;
                float:left;
            }
            
            .title>input{
                width:100%;
            }      
            
            /* 내용 */
            .contents{
                
            }

            /* 버튼 */
            .ft_btn {
                text-align: right;
                padding: 20px 15px 0px 0px;
            }
            .ft_btn> button{
                margin: 2px;
            }
        }


	</style>
</head>
   
<body>

	<form action="/tourboard/writeProc" method="post" id="frmWrite" enctype="multipart/form-data">
    <!-- .banner에 이미지 추가해야한다.-->
    <div class="banner">
        <div class="banner_title" href="">여행지 게시판</div>
        <div class="banner_content">각 지역의 여행 후기를 남겨보세요</div>
    </div>
    <div class="container_c">
        <div class="root">
            <div class="home"><a href="/"><i class="fas fa-home"></i></a></div>
            <div> > </div>
            <div class="community" href="">커뮤니티</div>
            <div> > </div>
            <div class="tourboard"><a href="/tourboard/list?cpage=1">여행지 게시판</a></div>
        </div>
        <div class="writeForm">
        	<div class="catetitle">
                <div class="category">
                    <select name="category" id="category">
                        <option value="">말머리</option>
                        <option value="명소">명소</option>
                        <option value="문화">문화</option>
                        <option value="생태">생태</option>
                        <option value="체험">체험</option>
                    </select>
                </div>
                <div class="title">
                    <input type=text placeholder="제목을 입력하세요" name="title" id="title">
                </div>
            </div><br>
        	<div class="contents">
 				<textarea id="summernote" rows="5" name="contents" style="width:100%; height:250px;"></textarea>
 			</div>
        </div>
        <div class="ft_btn">
        	<button type=button id="list_btn" class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">목록</span></button>
            <button id="write_btn" class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">작성완료</span></button>
        </div>
    </div>    
    </form>
    
	<footer>
    	    <jsp:include page="../base/footer.jsp"></jsp:include>
    </footer>
    
    <script>
    $(document).ready(function() {
    	//여기 아래 부분
    	$('#summernote').summernote({
              height:300, // 에디터 높이
    		  minHeight: 300,             // 최소 높이
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
    		  placeholder: '내용을 작성해주세요', 	//placeholder 설정

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
				console.log("write에 왔습니다.")
                $(editor).summernote('insertImage', sysName);
            }
        });
    }

    // 이미지삽입 모달닫기
    $(document).on("click", ".close", function(){
        $(".note-modal").modal('hide');
    });
    </script>
	
    <script>
    $("#list_btn").on("click", function(){
    	if(confirm("목록으로 돌아가시겠습니까?")==true){

    	  	history.back();
    	}else{

    		return false;
    	}
	})
    </script>

    <script>
    $("#write_btn").on("click", function() {
    	if($("#category").val()==""){

    		alert("말머리를 선택해주세요");
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

		if (confirm("이대로 작성하시겠습니까?")==true) {			
			$("#frmWrite").submit();

		}else{

			return false;
		}
	});   
    </script>
</body>
</html>