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
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="dashboard">
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

                    <!-- 그래프 : 방문자수-일자별(그래프), 방문자수-주간별(그래프) -->
                    <div class="row">   
						<div class="col-xl-6">
                            <div class="card border-bottom-primary shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-dark">Number of Visitors(Daily)</h6>
                                </div>
                                <!-- Card Body -->
                                <div>
  									<%-- <canvas id="visitors_daily"></canvas> --%>
								</div>
                            </div>
                        </div>
                        
                        <div class="col-xl-6">
                            <div class="card border-bottom-primary shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-dark">Number of Visitors(Monthly)</h6>
                                </div>
                                <!-- Card Body -->
                                <div>
  									<%-- <canvas id="visitors_monthly"></canvas> --%>
								</div>
                            </div>
                        </div>
                    </div>
                    
                    <!--  신규회원(일간)  신규회원(월간) 회원 성별-->
                    <div class="row">
						<div class="col-xl-4">
                            <div class="card border-bottom-info shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-dark">New Member(Daily)</h6>
                                </div>
                                <!-- Card Body -->
                                <div>
  									<canvas id="line-chart"></canvas>
								</div>
                            </div>
                        </div>
                        
                        <div class="col-xl-4">
                            <div class="card border-bottom-info shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-dark">New Member(Monthly)</h6>
                                </div>
                                <!-- Card Body -->
                                <div>
  									<%-- <canvas id="newmem_monthly" style="display: block; height: 350px;" ></canvas> --%>
								</div>
                            </div>
                        </div>
                        	
                        <div class="col-xl-4">
                            <div class="card  border-bottom-info  shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-dark">Member Gender</h6>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    
                    <!-- 여행, 동행, 계획 글 수 -->
                    <div class="row">
						<div class="col-xl-4">
                            <div class="card border-bottom-warning shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-dark">Tour board Post Count(Daily)</h6>
                                </div>
                                <!-- Card Body -->
                                <div>
  									<canvas id="line-chart2"></canvas>
								</div>
                            </div>
                        </div>
                        
                        <div class="col-xl-4">
                            <div class="card border-bottom-warning shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-dark">Accompany board Post Count(Daily)</h6>
                                </div>
                                <!-- Card Body -->
                                <div>
  									<canvas id="line-chart3"></canvas>
								</div>
                            </div>
                        </div>
                        	
                        <div class="col-xl-4">
                            <div class="card  border-bottom-warning  shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-dark">Plan Post Count(Daily)</h6>
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

    <!-- Page level plugins -->
    <script src="/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/js/demo/chart-area-demo.js"></script>
    <script src="/js/demo/chart-pie-demo.js"></script>
    
    
    <!--  refresh 버튼 누를 때 dashboard db셋팅 -->
    <!--  또다른 방법은 그냥 페이지 새로고침 할때마다 하도록 해도됨! -->
    <script>
    	$("#refresh").on("click", function(){
    		location.href="/dashboard/insertTable";
    	})
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
				console.log(timeList);
				console.log(posList);  	
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
										borderColor : "green",
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
				console.log(timeList);
				console.log(posList);  	
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
										borderColor : "green",
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
				console.log(timeList);
				console.log(posList);  	
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
										borderColor : "green",
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
				console.log(timeList);
				console.log(posList);  	
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
										borderColor : "green",
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
    
   
		
</body>
</html>