<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
<title>관리자 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<!-- <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet"> -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- Custom fonts for this template -->
<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="/css/sb-admin-2.min.css" rel="stylesheet">
<!-- Custom styles for this page -->
<link href="/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<style>
        * {box-sizing: border-box;}

        body{
            margin: 0;  /* 임시로 body margin 0px */
        }
        
        .catetitle{
        	overflow: auto;
        	padding: 0px 80px 0px 80px;
        }
        
        .title{
        	width:100%;
        	float:left;
        }
        
        .title>input{
        	width:100%;
        }        
        
        .contents{
        	padding-right:80px;
        }
        
        .ft_btn{
            width: 100%;
            text-align: right;
            padding: 0px 80px 0px 80px;            
        }
        
        /* 링크 속성 지우기 */
        a { text-decoration:none  } 
        a:hover { text-decoration:none; color: black; }
        a:link {text-decoration: none; color: black; }
        a:visited {text-decoration: none; color: black; }
        a:active {text-decoration: none; color: black; }
        
        .fa-home{
            color: rgb(56, 181, 174);
        }
	</style>
</head>
   
<body id="page-top">
  <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-success sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="dashboard">
                <div class="sidebar-brand-icon rotate-n-15">
                	<i class="fas fa-map-marked-alt"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Admin</div>
            </a>
            
            <!-- Divider -->
            <hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="/">
                    <i class="fas fa-home"></i>
                    <span>Home</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="dashboard">
                    <i class="fas fa-chart-line"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Management
            </div>            
            
            <li class="nav-item">
                <a class="nav-link" href="member">
                    <i class="fas fa-user-circle"></i>
                    <span>Member</span></a>
            </li>
            
			<li class="nav-item">
                <a class="nav-link" href="board">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Board</span></a>
            </li>
            
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Enroll
            </div>

            
            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="notice">
                    <i class="fas fa-edit"></i>
                    <span>Notice</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">                   

                </nav>
                <!-- End of Topbar -->
                
                <!-- Begin Page Content -->
                <div class="container-fluid">
                	 <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">공지사항 작성</h1>
				<form action="noticeEnroll" method="post" id="frmWrite" enctype="multipart/form-data">
				<br><br>
  				<div class="container">
    			    <div class="writeForm">
    			    	<div class="catetitle">
    			            <div class="title">
      			            	<input type=text placeholder="제목을 입력하세요" name="title" id="title" >
    			            </div>
      			      	</div><br>
    		 			   	<div class="contents" style="margin-left:80px;">
	 							<textarea id="summernote" rows="5" name="contents" style="width:100%; height:250px;"></textarea>
 								<input type=hidden>
 							</div>
   			     		</div><br>
   			     		<div class="ft_btn">
            				<input type=submit id="write_btn" class="btn btn-success" value="작성">
        					<input type=button id="list_btn" class="btn btn-success" value="취소">
  			      		</div>
  			  		</div>    
  			 	</form>
  			 	</div>
    		</div>
    		
    		<!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->
    	</div>
    </div>
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
    		  placeholder: '최대 2048자까지 쓸 수 있습니다' 	//placeholder 설정    		 
    	});    	
    });
    </script>
	
    <script>
    $("#list_btn").on("click", function(){
	    	history.back();
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
    	
    	if($("#summernote").val()==""){
    		
    		alert("내용을 입력해주세요");
    		return false;
    	}   	

    	
		if (confirm("이대로 작성하시겠습니까?")) {
				$("#frmWrite").submit();
			}
		});   
    </script>
</body>
</html>