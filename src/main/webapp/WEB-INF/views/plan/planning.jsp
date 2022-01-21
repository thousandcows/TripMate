<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />
<jsp:include page="../base/header.jsp"></jsp:include>

<script>

</script>
</head>
<body>


	<div class="container">
		<div class="row">
			<div class="col">
				<button type="button" class="btn btn-primary" id="firstBtn">일정 생성</button>
				<button type="button" class="btn btn-primary" id="secondBtn">여행지 선택</button>
				<button type="button" class="btn btn-primary" id="thirdBtn">일정 순서 지정</button>
				<button type="button" class="btn btn-primary" id="fourthBtn">메모</button>
			</div>
		</div>

		<!-- 날짜/제목 생성 -->
		<div class="row" id="firstForm">
			<div class="col">
				<form action="/plan/chooseTheme" method="post">
				<div class="row">
					<div class="col-12">
						<h5 class="title">여행 계획 입력</h5>
						<div class="form-group">
							<label for="planTitle">제목</label> 
							<input type="text" name="title" class="form-control" id="planTitle" placeholder="제목을 입력하세요.">
						</div>
					</div>
					<div class="col-12">
						<div class="form-group">
							<label for="planConcept">여행 테마 선택</label> 
							<select class="form-control" id="planConcept" name="theme">
								<option value="힐링 여행">힐링 여행</option>
								<option value="먹거리 투어">>먹거리 투어</option>
								<option value="관광지 투어">>관광지 투어</option>
								<option value="액티비티">>액티비티</option>
								<option value="기분따라">>기분따라</option>
							</select>
						</div>
					</div>
						<label for="planDate">날짜 선택</label>
						<div class="form-group col-6">						
								<div class="form-group">
									<div class="input-group date" id="datetimepicker1"
										data-target-input="nearest">
										<input type="text" class="form-control datetimepicker-input" name="startDate"
											data-target="#datetimepicker1">
										<div class="input-group-append" data-target="#datetimepicker1"
											data-toggle="datetimepicker">
											<div class="input-group-text">
												<i class="fa fa-calendar"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group col-6">
								<div class="input-group date" id="datetimepicker2"
									data-target-input="nearest">
									<input type="text" class="form-control datetimepicker-input" name="endDate"
										data-target="#datetimepicker2">
									<div class="input-group-append" data-target="#datetimepicker2"
										data-toggle="datetimepicker">
										<div class="input-group-text">
											<i class="fa fa-calendar"></i>
										</div>
									</div>
								</div>
							</div>

						<div class="row">
							<div class="col text-end">
								<input type="submit" class="btn btn-primary" value="저장"></input>
							</div>
						</div>
					</div>
					</form>
			</div>
		</div>
		
		
		<!-- 여행지 생성 -->
		<div class="row" id="secondForm" style="display:none;">
			<div class="col">
				여행지선택
			</div>
		</div>
		
		
		<!-- 일정 순서 -->
		<div class="row" id="thirdForm" style="display:none;">
			<div class="col">
				일정순서 지정
			</div>
		</div>
		
		<div class="row" id="fourthForm" style="display:none;">
			<div class="col">
				메모
			</div>
		</div>
	</div>	
					

	<script type="text/javascript">
		$(function() {
			$('#datetimepicker1').datetimepicker({
				format : 'YYYY/MM/DD'
			});
			$('#datetimepicker2').datetimepicker({
				format : 'YYYY/MM/DD',
				useCurrent : false
			});
			$("#datetimepicker1").on("change.datetimepicker", function(e) {
				$('#datetimepicker2').datetimepicker('minDate', e.date);
			});
			$("#datetimepicker2").on("change.datetimepicker", function(e) {
				$('#datetimepicker1').datetimepicker('maxDate', e.date);
			});
		});
	</script>
	
	<script>
		$("#firstBtn").on("click",function(){
			if($("#firstForm").css("display")==='none'){					
				$("#firstForm").show();
			}else{
				$("#firstForm").hide();
			}
		})
		
		$("#secondBtn").on("click",function(){
			if($("#secondForm").css("display")==='none'){					
				$("#secondForm").show();
				$("#firstForm").hide();
				$("#thirdForm").hide();
				$("#fourthForm").hide();

			}else{
				$("#secondForm").hide();
			}
		})
		$("#thirdBtn").on("click",function(){
			if($("#thirdForm").css("display")==='none'){					
				$("#thirdForm").show();
				$("#firstForm").hide();
				$("#secondForm").hide();
				$("#fourthForm").hide();
			}else{
				$("#thirdForm").hide();
			}
		})
		$("#fourthBtn").on("click",function(){
			if($("#fourthForm").css("display")==='none'){					
				$("#fourthForm").show();
				$("#firstForm").hide();
				$("#secondForm").hide();
				$("#thirdForm").hide();
			}else{
				$("#fourthForm").hide();
			}
		})
	</script>
</body>
</html>