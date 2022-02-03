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
<title>SB Admin - Board</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
        /* 링크 속성 지우기 */
        a { text-decoration:none  } 
        a:hover { text-decoration:none;}
        a:link {text-decoration: none;}
        a:visited {text-decoration: none;}
        a:active {text-decoration: none;}
</style>
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-success sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
                <div class="sidebar-brand-icon rotate-n-15">
                	<i class="fas fa-map-marked-alt"></i>
                </div>
                <div class="sidebar-brand-text mx-3">TripMate</div>
            </a>

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
                    <h1 class="h3 mb-2 text-gray-800">게시판 글 관리</h1>
                    <p class="mb-4">게시판에 등록되는 부적절한 글 또는 관련없는 글을 삭제시킬 수 있는 게시판입니다.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">게시판 글 목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th >BoardNum</th>
                                            <th>Header</th>
                                            <th>Title</th>
                                            <th>Nick</th>
                                            <th>Wrtien Date</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                 	   <c:forEach var="tb" items="${tb_list }">
                                 	    	<tr>
                                   		 		<th>
                                   		 			<c:choose>
														<c:when test="${tb.board_num == 1}">
                                   		 					여행지게시판
                                   		 				</c:when>
                                   		 			</c:choose>
                                   		 		</th>
                                   		       	<th>${tb.category }</th>
                                       		   	<th><a href="/tourboard/detail?seq=${tb.seq}">${tb.title }</a></th>
	                                            <th>${tb.nick }</th>
                                          		<th>${tb.writen_date }</th>
                                    	    	<th>                                    	    		
                                    	    		<a href="/admin/delete?seq=${tb.seq}&boardNum=${tb.board_num}" class="btn btn-danger btn-icon-split">
                                 				       <span class="icon text-white-50">
                                  				          <i class="far fa-trash-alt text-gray-100"></i>
                                 				       </span>
                                				    </a>
                                    	    	</th>
                                        	</tr>
                                        </c:forEach>
                                        <c:forEach var="cb" items="${cb_list }">
                                 	    	<tr>	
                                   		 		<th>
                                   		 			<c:choose>
														<c:when test="${cb.board_num == 2}">
                                   		 					동행게시판
                                   		 				</c:when>
                                   		 			</c:choose>
                                   		 		</th>
                                   		       	<th>${cb.tour }</th>
                                       		   	<th><a href="/companyboard/detail?seq=${cb.seq}">${cb.title }</a></th>
	                                            <th>${cb.nick }</th>
                                          		<th>${cb.writen_date }</th>
                                    	    	<th>
                                    	    		<a href="/admin/delete?seq=${cb.seq}&boardNum=${cb.board_num}" class="btn btn-danger btn-icon-split">
                                 				       <span class="icon text-white-50">
                                  				          <i class="far fa-trash-alt text-gray-100"></i>
                                 				       </span>
                                				    </a>
                                    	    	</th>
                                        	</tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

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
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Bootstrap core JavaScript-->
    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/js/demo/datatables-demo.js"></script>

</body>
</html>