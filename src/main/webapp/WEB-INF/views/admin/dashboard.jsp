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
            <hr class="sidebar-divider">
            
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

			</li>
            <!-- Divider -->
            <hr class="sidebar-divider">
            
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
                    </div>

                    <!-- 방문자수 카운트 -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-4 col-md-4 mb-4">
                            <div class="card border-left-danger shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">
                                                MEMBER (DAILY)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            	<span id="cntMember"></span>
                                            	
                                            	<span style="color:red">
                                            	<c:if test="${withdrawal > 0 }">
                                            		+ ${withdrawal }
                                            	</c:if>
                                            	<c:if test="${withdrawal < 0 }">
                                            		- ${withdrawal }
                                            	</c:if>
                                            	<c:if test="${withdrawal == 0 }">
                                            		 ${withdrawal }
                                            	</c:if>
                                            	</span>
                                            </div>
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
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Posts (Daily)
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">
                                                    	<span id="totalPost"></span>
                                                   		<span style="color:red">
                                            			<c:if test="${plmaPost > 0 }">
                                            				+ ${plmaPost }
                                            			</c:if>
                                            			<c:if test="${plmaPost < 0 }">
                                            				- ${plmaPost }
                                            			</c:if>
                                            			<c:if test="${plmaPost == 0 }">
                                            		 		${plmaPost }
                                            			</c:if>
                                            			</span> 
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
                                                VISITORS (Daily)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            	<span id="visitCnt"></span>
                                            </div>
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
                        <div class="col-xl-6">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">New Member(Daily)</h6>
                                </div>
                                <!-- Card Body -->
                                <div>
                                        <canvas id="bar-chart" width="500" height="200"></canvas>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-xl-6">
                            <div class="card   shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Gender</h6>
                                </div>
                                <!-- Card Body -->
                                <div>
  									<canvas id="pie-chart"  width="500" height="200"></canvas>
								</div>
                            </div>
                        </div>
                        
                    </div>
                    
                    <div class="row">
						<div class="col-xl-6">
                            <div class="card   shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Post Count(Daily)</h6>
                                </div>
                                <!-- Card Body -->
                                <div>
  									<canvas id="line-chart"  width="500" height="200"></canvas>
								</div>
                            </div>
                        </div>
                        
                        <div class="col-xl-6">
                            <div class="card   shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Tour Category</h6>
                                </div>
                                <!-- Card Body -->
                                <div>
  									<canvas id="doughnut-chart"  width="500" height="200"></canvas>
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

    
    <!-- 숫자 표시 -->
    <script>
  
  
     $(document).ready(function() {
			getCnt();
			getGraph1();
			getGraph2();
		});
    	
    function getCnt() {
    		$.ajax({
					url : '/dashboard/ajax1',
					type : 'POST',
					success : function(data){
						$("#cntMember").html(data.cntMember);
						$("#totalPost").html(data.totalPost);
						$("#visitCnt").html(data.visitCnt);
					}
				}); 
    		}

	function getGraph1() {
		let timeList = [];
		let comList = [];
		let planList = [];
		let tourList = [];
		let memList = [];
		
		
		$.ajax({
			url : '/dashboard/chart1',
			type : 'POST',
			dataType : 'json',
			success : function(data) {
				
			// 그래프로 나타낼 자료 리스트에 담기
			for (let i = 0; i < data.length; i++) {
				timeList.push(data[i].stan_date);
				planList.push(data[i].plan);
				tourList.push(data[i].tour_board);
				comList.push(data[i].com_board);
				memList.push(data[i].user_n);
			}

			// 막대 그래프
			new Chart(
					document.getElementById("bar-chart"),
			{
					type : 'bar',
					data : {
							labels : timeList, // X축 
							datasets : [ 
									{
									data : memList, // 값
									label : "신규 가입자",
									borderColor : "rgb(255, 154, 205)",
									backgroundColor: "rgba(255, 211, 233, 0.383)",
									borderWidth: 2, 
									fill : true
									} ]
							},
					options : {
							title : {
									display : false
								},
								
								scales: {
									yAxes: [{
										ticks: {
											min: 0,
											stepSize: 5,
											max: 25
											}
										}]
									}
							}
					}); //그래프
					
			// 라인 그래프
			new Chart(
					document.getElementById("line-chart"),
			{
					type : 'line',
					data : {
							labels : timeList, // X축 
							datasets : [ 
									{
										data : planList, // 값
										label : "여행 계획",
										borderColor : "rgb(21, 178, 211)",
										backgroundColor: "rgba(21, 179, 211, 0.616)",
										fill : false
									},
									{
										data : tourList, // 값
										label : "여행 계시판",
										borderColor : "rgb(255, 215, 0)",
										backgroundColor: "rgba(255, 217, 0, 0.507)",
										fill : false
									},
									{
										data : comList, // 값
										label : "동행 게시판",
										borderColor : "rgb(243, 135, 47)",
										backgroundColor: "rgba(243, 135, 47, 0.459)",
										fill : false
									}
								]
							},
					options : {
							title : {
									display : false
								},
								
							scales: {
								yAxes: [{
									ticks: {
										min: 0,
										stepSize: 5,
										max: 30
										}
									}]
								}
							}
					}); //그래프

			},
			error : function() {
					alert("실패");
			}

		})
	}
	
	function getGraph2() {
		let cateList = [];
		let genderList = [];
		
		
		$.ajax({
			url : '/dashboard/chart2',
			type : 'POST',
			dataType : 'json',
			success : function(data) {
				
			// 그래프로 나타낼 자료 리스트에 담기
			for (let i = 0; i < 4; i++) {
				cateList.push(data[i]);
			}
			
			for (let i = 4; i < data.length; i++) {
				genderList.push(data[i]);
			}

			// 도넛 그래프
			new Chart(
					document.getElementById("pie-chart"),
			{
					type : 'pie',
					data : {
							labels : ["남자", "여자"], // X축 
							datasets : [ 
									{
									data : genderList, // 값
									borderColor :  ["rgb(5, 120, 125)", "rgb(239, 200, 9)"],
									backgroundColor: ["rgb(5, 120, 125)", "rgb(239, 200, 9)" ],
									borderWidth: 2, 
									fill : true
									} ]
							},
					options : {
							title : {
									display : false
								}
							}
					}); //그래프
					
			// 도넛 그래프
			new Chart(
					document.getElementById("doughnut-chart"),
			{
					type : 'doughnut',
					data : {
							labels : ["생태", "문화", "명소", "체험"], // X축 
							datasets : [ 
									{
									data : cateList, // 값
									borderColor :  ["rgb(235, 92, 21)", "rgb(245, 233, 100)" , "rgb(102, 222, 152)" ,"rgb(100, 129, 245)"],
									backgroundColor: ["rgb(235, 92, 21)", "rgb(245, 233, 100)" , "rgb(102, 222, 152)" ,"rgb(100, 129, 245)"],
									borderWidth: 2, 
									fill : true
									} ]
							},
					options : {
							title : {
									display : false
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