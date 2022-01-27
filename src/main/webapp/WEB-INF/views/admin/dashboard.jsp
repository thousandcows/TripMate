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
<title>관리자 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

 <!-- Custom fonts for this template-->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

<!-- Custom styles for this template-->
    <link href="/css/sb-admin-2.min.css" rel="stylesheet">
    
<!-- chart.js cdn -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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

                <!-- Begin Page Content -->
                <div class="container-fluid pb-2	">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4 mt-4">
                        <h1 class="h1 mb-0 text-gray-900 font-weight-bold">Dashboard</h1>
                        <a id="refresh" href="#" class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm"><i class="fas fa-sync-alt fa-sm text-white-100"></i>&nbspRefresh</a>
                    </div>

                    <!-- 방문자수 카운트 -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-4 col-md-4 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                MEMBER (DAILY)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${cntMember}&nbsp<span style="color:red">(
                                            	<c:if test="${withdrawal > 0 }">
                                            		+ ${withdrawal }
                                            	</c:if>
                                            	<c:if test="${withdrawal < 0 }">
                                            		- ${withdrawal }
                                            	</c:if>
                                            	<c:if test="${withdrawal == 0 }">
                                            		 ${withdrawal }
                                            	</c:if>
                                            )</span></div>
                                        </div>
                                        <div class="col-auto">
                                        	<i class="fas fa-user-alt fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-4 col-md-4 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Posts
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${totalPost}&nbsp<span style="color:red">(
                                            			<c:if test="${plmaPost > 0 }">
                                            				+ ${plmaPost }
                                            			</c:if>
                                            			<c:if test="${plmaPost < 0 }">
                                            				- ${plmaPost }
                                            			</c:if>
                                            			<c:if test="${plmaPost == 0 }">
                                            		 		${plmaPost }
                                            			</c:if>
                                            			)</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-4 col-md-4 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                VISITORS</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${visitCnt}</div>
                                        </div>
                                        <div class="col-auto">
                                        	<i class="far fa-eye fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">

                        <!-- Area Chart -->
                        <div class="col-xl-6">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Number of Visitors(Daily)</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="line-chart5"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Area Chart -->
                        <div class="col-xl-6">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">New Member(Daily)</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="line-chart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                        
                   	
                    <!-- 여행, 동행, 계획 글 수 -->
                    <div class="row">
						<div class="col-xl-6">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Tour board Post Count(Daily)</h6>
                                </div>
                                <!-- Card Body -->
                                <div>
  									<canvas id="line-chart2"></canvas>
								</div>
                            </div>
                        </div>
                        
                        <div class="col-xl-6">
                            <div class="card  shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Accompany board Post Count(Daily)</h6>
                                </div>
                                <!-- Card Body -->
                                <div>
  									<canvas id="line-chart3"></canvas>
								</div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
						<div class="col-xl-6">
                            <div class="card   shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Plan Post Count(Daily)</h6>
                                </div>
                                <!-- Card Body -->
                                <div>
  									<canvas id="line-chart4"></canvas>
								</div>
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
                        <span>Copyright &copy; TripMate</span>
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

    
    
    <!--  refresh 버튼 누를 때 dashboard db셋팅 -->
    <script>
    	$("#refresh").on("click", function(){
    		location.href="/dashboard/insertTable";
    	})
    </script>
    
    <script>
     	$(document).ready(function() {
			getCnt();
		});
    	
    	function getCnt() {
    		$.ajax({
					url : '/dashboard/ajax1',
					type : 'POST',
					success : function(data){
						
						console.log("포스트수 : " + data.totalPost );
					}
				}); 
    		}
    </script>
    
    
<!--   
    <script>
      	$(document).ready(function() {
    		location.href="/dashboard/insertTable";
		});  
    </script> -->
    
    <script>
/*     	$(window).on("load", function(){
    		location.href="/dashboard/insertTable";
    	}); */
    </script>
    

     <!-- chart : 일간 가입자수 -->
     <script>

		$(document).ready(function() {
			getGraph();
		});

		function getGraph() {
			let timeList = [];
			let posList = [];
			
			$.ajax({
				url : '/dashboard/newMemDaily',
				type : 'POST',
				dataType : 'json',
				success : function(data) {
				// console.log(data[0].pos_count);
				// 그래프로 나타낼 자료 리스트에 담기
				for (let i = 0; i < data.length; i++) {
						timeList.push(data[i].stan_date);
						posList.push(data[i].user_n);
				}

				// 그래프
				new Chart(
						document.getElementById("line-chart"),
				{
						type : 'line',
						data : {
								labels : timeList, // X축 
								datasets : [ {
										data : posList, // 값
										label : "new member",
										borderColor : "rgb(27, 245, 118)",
										fill : false
										} ]
								},
						options : {
								title : {
										display : true,
										text : '일별 신규 가입자'
									}
								}
						}); //그래프
				},
				error : function() {
						alert("실패");
				}

			})
		}
	</script>
	
	<!-- chart : 여행 게시판 글 수 -->
     <script>

		$(document).ready(function() {
			getGraph2();
		});

		function getGraph2() {
			let timeList = [];
			let posList = [];
			
			$.ajax({
				url : '/dashboard/tourDaily',
				type : 'POST',
				dataType : 'json',
				success : function(data) {
				// console.log(data[0].pos_count);
				// 그래프로 나타낼 자료 리스트에 담기
				for (let i = 0; i < data.length; i++) {
						timeList.push(data[i].stan_date);
						posList.push(data[i].tour_board);
				}
 	
				// 그래프
				new Chart(
						document.getElementById("line-chart2"),
				{
						type : 'line',
						data : {
								labels : timeList, // X축 
								datasets : [ {
										data : posList, // 값
										label : "new tour board post",
										borderColor : "rgb(27, 245, 118)",
										fill : false
										} ]
								},
						options : {
								title : {
										display : true,
										text : '여행게시판 글 수'
									}
								}
						}); //그래프
				},
				error : function() {
						alert("실패");
				}

			})
		}
	</script>
	
	<!-- chart : 여행 게시판 글 수 -->
     <script>

		$(document).ready(function() {
			getGraph3();
		});

		function getGraph3() {
			let timeList = [];
			let posList = [];
			
			$.ajax({
				url : '/dashboard/comDaily',
				type : 'POST',
				dataType : 'json',
				success : function(data) {
				// console.log(data[0].pos_count);
				// 그래프로 나타낼 자료 리스트에 담기
				for (let i = 0; i < data.length; i++) {
						timeList.push(data[i].stan_date);
						posList.push(data[i].com_board);
				}
	
				// 그래프
				new Chart(
						document.getElementById("line-chart3"),
				{
						type : 'line',
						data : {
								labels : timeList, // X축 
								datasets : [ {
										data : posList, // 값
										label : "new accompany board post",
										borderColor : "rgb(27, 245, 118)",
										fill : false
										} ]
								},
						options : {
								title : {
										display : true,
										text : '동행게시판 글 수'
									}
								}
						}); //그래프
				},
				error : function() {
						alert("실패");
				}

			})
		}
	</script>
	
	<!-- chart : 여행 게시판 글 수 -->
     <script>

		$(document).ready(function() {
			getGraph4();
		});

		function getGraph4() {
			let timeList = [];
			let posList = [];
			
			$.ajax({
				url : '/dashboard/planDaily',
				type : 'POST',
				dataType : 'json',
				success : function(data) {
				// console.log(data[0].pos_count);
				// 그래프로 나타낼 자료 리스트에 담기
				for (let i = 0; i < data.length; i++) {
						timeList.push(data[i].stan_date);
						posList.push(data[i].plan);
				}
 	
				// 그래프
				new Chart(
						document.getElementById("line-chart4"),
				{
						type : 'line',
						data : {
								labels : timeList, // X축 
								datasets : [ {
										data : posList, // 값
										label : "new plan post",
										borderColor : "rgb(27, 245, 118)",
										fill : false
										} ]
								},
						options : {
								title : {
										display : true,
										text : '여행계획 글 수'
									}
								}
						}); //그래프
				},
				error : function() {
						alert("실패");
				}

			})
		}
	</script>
	
	<!-- chart : 방문자 수 -->
     <script>

		$(document).ready(function() {
			getGraph5();
		});

		function getGraph5() {
			let timeList = [];
			let posList = [];
			
			$.ajax({
				url : '/dashboard/visitDaily',
				type : 'POST',
				dataType : 'json',
				success : function(data) {
				// console.log(data[0].pos_count);
				// 그래프로 나타낼 자료 리스트에 담기
				for (let i = 0; i < data.length; i++) {
						timeList.push(data[i].stan_date);
						posList.push(data[i].visitor);
				}
 	
				// 그래프
				new Chart(
						document.getElementById("line-chart5"),
				{
						type : 'line',
						data : {
								labels : timeList, // X축 
								datasets : [ {
										data : posList, // 값
										label : "daily visitors",
										borderColor : "rgb(27, 245, 118)",
										fill : false
										} ]
								},
						options : {
								title : {
										display : true,
										text : '방문자수'
									}
								}
						}); //그래프
				},
				error : function() {
						alert("실패");
				}

			})
		}
	</script>
    
   
		
</body>
</html>