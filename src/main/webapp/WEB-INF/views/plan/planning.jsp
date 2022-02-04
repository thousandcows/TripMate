<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 생성</title>
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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5fa8abac646238f15601b89cae524ec&libraries=services"></script>
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/ui/1.13.1/jquery-ui.js" ></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"  rel="stylesheet">
<link rel="stylesheet" href="/css/planning.css">
<jsp:include page="../base/header.jsp"></jsp:include>

<script>
	$(document).ready(function(){
		$("#thirdForm").fadeOut(200)
	})
</script>
<style>
.banner {
	height: 200px;
	overflow: hidden;
	margin: 0 auto;
}

.banner>img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
</style>
</head>
<body>
	<div class = "banner">
		<img src="/images/banner.png">
	</div>
	<div class="container con">
		<div class="row mb-5 mt-5">
			<div class="col-12 text-center">
				<h2>순서에 따라, 일정을 수립하세요.</h2>
			</div>
			<div class="col-12 d-flex justify-content-around mt-4">
				<button type="button" class="btn btn-success mr-2 ml-2" id="firstBtn">일정 생성</button>
				<button type="button" class="btn btn-success mr-2 ml-2" id="secondBtn">여행지 선택</button>
				<button type="button" class="btn btn-success mr-2 ml-2" id="thirdBtn">일정 순서 지정</button>
				<button type="button" class="btn btn-success mr-2 ml-2" id="fourthBtn">메모</button>
				<c:if test="${empty seq }">
				<button type="button" class="btn btn-success mr-2 ml-2" id="goMain">리스트로</button>
				</c:if>
				<c:if test="${!empty seq }">
					<button type="button" class="btn btn-success mr-2 ml-2" id="back">목록으로</button>
				</c:if>
			</div>
		</div>

		<!-- 날짜/제목 생성 -->
		<div class="row justify-content-center" id="firstForm" <c:if test="${!empty seq}">style="display:none;"</c:if>>
			<div class="col-8 ">
			<c:if test="${!empty seq }">
				<form action="/plan/changeTheme" id="changeThemeForm" method="post">
				<input type="hidden" name="seq" value=${seq }>
			</c:if>
			<c:if test="${empty seq }">
				<form action="/plan/chooseTheme" id="chooseThemeForm" method="post">
			</c:if>
				<div class="row border d-flex justify-content-center">
					<div class="col-12 text-center mt-4">
						<h3 class="title text-center">여행 계획 입력</h3>
					</div>
					<div class="col-10 text-center mt-4">
						<div class="form-group">
							<input type="text" name="title" class="form-control" id="planTitle" placeholder="제목을 입력하세요." value="${dto.title }" maxlength="33" required>
						</div>
					</div>
					<div class="col-10 mt-2">
						<div class="form-group">
							<label for="planConcept">여행 테마 선택</label> 
							<select class="form-control" id="planConcept" name="theme">
								<option value="힐링 여행" <c:if test="${dto.theme eq '힐링 여행'}">selected</c:if>>힐링 여행</option>
								<option value="먹거리 투어"<c:if test="${dto.theme eq '먹거리 투어'}">selected</c:if>>먹거리 투어</option>
								<option value="관광지 투어"<c:if test="${dto.theme eq '관광지 투어'}">selected</c:if>>관광지 투어</option>
								<option value="액티비티" <c:if test="${dto.theme eq '액티비티'}">selected</c:if>>액티비티</option>
								<option value="기분따라" <c:if test="${dto.theme eq '기분따라'}">selected</c:if>>기분따라</option>
							</select>
						</div>
					</div>
						<div class="form-group col-5 mt-2">						
						<label for="planDate">여행 시작 날짜</label>
								<div class="form-group">
									<div class="input-group date" id="datetimepicker1"
										data-target-input="nearest">
										<input type="text" class="form-control datetimepicker-input" name="startDate"
											data-target="#datetimepicker1" value="${dto.startDate }" required>
										<div class="input-group-append" data-target="#datetimepicker1"
											data-toggle="datetimepicker">
											<div class="input-group-text h-100">
												<i class="fa fa-calendar"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group col-5 mt-2">
								<label for="planDate">여행 종료 날짜</label>
								<div class="input-group date" id="datetimepicker2"
									data-target-input="nearest">
									<input type="text" class="form-control datetimepicker-input" name="endDate"
										data-target="#datetimepicker2" value="${dto.endDate }" required>
									<div class="input-group-append" data-target="#datetimepicker2"
										data-toggle="datetimepicker">
										<div class="input-group-text h-100">
											<i class="fa fa-calendar"></i>
										</div>
									</div>
								</div>
							</div>

							<div class="col-10 text-end mt-2 mb-2">
							<c:if test="${empty seq }">
								<input id="chooseThemeBtn" type="submit" class="btn btn-primary" value="저장" onclick="checkCategory(chooseThemeForm)"></input>
							</c:if>
							<c:if test="${!empty seq }">
								<input id="changeThemeBtn" type="submit" class="btn btn-primary" value="수정" onclick="editCategory(changeThemeForm)"></input>
							</c:if>

							</div>
						</div>
					</div>
					</form>
			</div>
		
		
		<!-- 여행지 생성 -->
		<div class="row justify-content-center" id="secondForm" <c:if test="${empty seq }">style="display:none;"</c:if>>
			<div class="col-8 border">
				<div class="row mt-2">
					<div class="col-12 text-center mt-4">
						<h3>여행 장소를 검색하거나, 찜목록을 불러와 일정에 추가하세요.</h3>
					</div>
					<div class="col d-flex justify-content-center mt-2">
						<button type="button" id="searchCallBtn" class="btn btn-primary m-2">검색해서 찾기</button>
						<button type="button" id="savedCallBtn" class="btn btn-primary m-2">찜 목록</button>
					</div>
				</div>
				
				<div class="row mt-4" id="search">
					<div class="col">
						<div class="row">
							<div class="col d-flex justify-content-center">
								<form id="searchForm" name="searchForm" method="post">
									<input type="text" name="target" placeholder="검색어를 입력하세요." id="searchTarget" required> 
									<input type="hidden" value=1 name="page" id="searchPageNo"> 
									<input type="submit" class="btn btn-primary" value="검색" onclick="searching(); return false">
								</form>												
							</div>
						</div>
						
						<form action="/plan/saveList" method="post">
						<div class="row mt-4 mb-4">

							<div class="row d-flex justify-content-center" id="searchResult">
								검색 결과가 없습니다.
							</div>
							<div class="col-12 text-end">
								<input type="submit" class="btn btn-primary saveBtn" value="저장하기">
							</div>
						</div>
						<div class="row">
							<div class="col">
								<input type="hidden" name="seq" value="${seq }">
							</div>
						</div>
						</form>
					</div>
				</div>
				
				<form action="/plan/saveList" method="post">
				<div class="row justify-content-center" id="saved" style="display:none;">
					<div class="col-10">
						<div class="row justify-content-center mt-4">
				              <c:forEach var='cnt' items="${saveList}" varStatus="status">
				                <div class="col-12 align-self-center mt-4 delParent border">
				                  <div class="row">
				                    <div class="col-4">
				                      <a href="/area/detail?num=${mySaveListSeq[status.index]}">
				                      <c:if test="${cnt.photo ne 'null' }">
				                        <img  class="w-100 saveImg" src="${cnt.photo}">
				                      </c:if>
				                      <c:if test="${cnt.photo eq 'null' }">
				                        <img class="w-100 saveImg" src="/images/noPhoto.png">
				                      </c:if>
				                      </a>
				                    </div>
				                    <div class="col-8">
				                      <div class="row">
				                        <div class="col-10"><label for="${mySaveListSeq[status.index]}&${cnt.name }&${cnt.lo_detail}&${cnt.photo }">${cnt.name}</label>
				                   <input type="checkbox" name="check" class="check saveCheck" id="${mySaveListSeq[status.index]}&${cnt.name }&${cnt.lo_detail}&${cnt.photo }" value="${mySaveListSeq[status.index]}&${cnt.name }&${cnt.lo_detail}&${cnt.photo }">
				                        
				                        </div>
				                      </div>
				                      <div class="row">
				                        <div class="col">${cnt.lo_detail}</div>
				                      </div>
				
				                      <div class="row align-items-end mb-0 ">
				                        <div class="col-12">
				                            평점:${savedListRate[status.index]}
				                             <c:if test="${empty savedListRate[status.index]}">
				                                -
				                              </c:if>
				                        </div>
				                      </div>
				                    </div>
				                  </div>
				                </div>
				              </c:forEach>
				              <div id="seeMoreTag"></div>
            </div>

            <c:if test="${fn:length(isMySaveListMore) == 1}">
            <div class="row mt-4 mb-4" id="seeMoreDel">
              <div class="col text-center">
                <button type="button" class="btn btn-success" id="seeMore">더보기</button>
              </div>
            </div>
            </c:if>
					</div>
				<div class="col-12 text-end	mb-4 mt-2">
					<input type="submit"  class="btn btn-success saveBtn" value="저장하기">
					<input type="hidden" name="seq" value="${seq }">
				</div>
				</div>
			</form>
			
			
			</div>			
		</div>
		
		
		<!-- 일정 순서 -->
		<div class="row justify-content-center" id="thirdForm">
			<div class="col-12 text-center fs-2 mt-1 mb-4" id="dateShow">${date[0] }</div>
			<div class="col-10 ">
				<div class="row">
					<div class="col-4 col-md-2" id="planDate">
						<c:if test="${!empty seq }">
						<c:forEach var="i" items="${date }">
							<c:set var="j" value="${j+1 }"/>
							<fmt:parseDate value="${i }" var="dateFor" pattern="yyyy.MM.dd"/>
							<fmt:formatDate value="${dateFor}" var="date" pattern="yyyy.MM.dd" />
							<ul class="row border ui-widget-content ui-state-default" id="day">
								<li class="col datePick" id="${i }">
									${j }일차<br>
									${i }
								</li>
							</ul>
						</c:forEach>
							<div class="w-100 d-flex justify-content-center" id="deletePlan">
								<span class="material-icons">
									delete
								</span>
							</div>
						
						</c:if>
					</div>
					
						<!-- 리스트 -->
					<div class="col-8 col-md-4 border" id="planShow">
					<ul class="drag-sort-enable ui-helper-reset ui-helper-clearfix" id="planList" ondragover="onDragOver(event)">
					</ul>
					</div>
					<div class="col-12 col-md-6" id=map style="height:600px;">
					</div>
					<div class="col-12 text-end">
						<h5>※드래그해 일정 순서를 조정하고, 일자를 변경하세요.</h5>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row" id="fourthForm" style="display:none;">
			<div class="col d-flex justify-content-center">
				<form action="/plan/insertMemo" method="post">
					<div class="row border">
						<div class="col-12 text-center mt-4">
							<h3>여행에 필요한 메모를 남기세요.</h3>
						</div>
						<div class="col-12 text-center mt-4">
							<textarea name="memo" class="w-100" rows=10 placeholder="메모를 남겨주세요." maxlength=1300 required>${dto.memo }</textarea>
							<input type="hidden" name="seq" value="${seq }">
						</div>
						<div class="col-12 mt-2 text-end mt-3 mb-4 mr-4">
							<input type="submit" class="btn btn-primary" value="저장">
						</div>
					</div>	
				</form>
			</div>
		</div>
	</div>	
	</div>
	
	<jsp:include page="../base/footer.jsp"></jsp:include>
					

	<script type="text/javascript">
		$(function() {
			let today = new Date;
			today.setHours(0,0,0,0);
			$('#datetimepicker1').datetimepicker({
				format : 'YYYY/MM/DD',
				minDate:today,
				defaultDate:today
			});
			$('#datetimepicker2').datetimepicker({
				format : 'YYYY/MM/DD',
				minDate: today,
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
		    //지도
	        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 5
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);
			
			// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
			var mapTypeControl = new kakao.maps.MapTypeControl();

			// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
			// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			let markers = [];
			let infowindows = [];
				
				
		$("#goMain").on("click",function(){
			if(confirm("리스트로 이동하시겠습니까? 기록중인 내용은 사라집니다.")){
				location.href="/plan/main?page=1";
			}
		})
		
		$("#back").on("click",function(){
			if(confirm("내 일정으로 돌아가시겠습니까? 기록중인 내용은 사라집니다.")){
				location.href="/plan/detail?seq=${seq }";

			}
		})
			
	//화면 숨기기/view 처리
		$("#firstBtn").on("click",function(){
			if($("#firstForm").css("display")==='none'){					
				$("#firstForm").fadeIn(200);
				$("#secondForm").fadeOut(200);
				$("#thirdForm").fadeOut(200);
				$("#fourthForm").fadeOut(200);
			}
		})
		
		$("#secondBtn").on("click",function(){
			if(${!empty seq}){
				if($("#secondForm").css("display")==='none'){					
					$("#secondForm").fadeIn(200);
					$("#firstForm").fadeOut(200);
					$("#thirdForm").fadeOut(200);
					$("#fourthForm").fadeOut(200);

				}			
			}else{
				alert("일정을 먼저 생성해주세요.")
			}
		})
		$("#thirdBtn").on("click",function(){
			if(${!empty seq}){
				if($("#thirdForm").css("display")==='none'){					
					$("#thirdForm").fadeIn(200);
					$("#firstForm").fadeOut(200);
					$("#secondForm").fadeOut(200);
					$("#fourthForm").fadeOut(200);
					
				}
			}else{
				alert("일정을 먼저 생성해주세요.")				
			}
		})
		$("#fourthBtn").on("click",function(){
			if(${!empty seq}){
				if($("#fourthForm").css("display")==='none'){					
					$("#fourthForm").fadeIn(200);
					$("#firstForm").fadeOut(200);
					$("#secondForm").fadeOut(200);
					$("#thirdForm").fadeOut(200);
				}
			}else{
				alert("일정을 먼저 생성해주세요.")				
			}		
		})
		
		$("#searchCallBtn").on("click",function(){
			if($("#search").css("display")==='none'){					
				$("#search").fadeIn(200);
				$("#saved").fadeOut(200);
			}
			
		})

		$("#savedCallBtn").on("click",function(){
			if($("#saved").css("display")==='none'){					
				$("#saved").fadeIn(200);
				$("#search").fadeOut(200);
			}
		})		
				
		
	function searching() {
        var formData = $('#searchForm').serialize() // serialize 사용
        $.ajax({
            url: "/plan/search",
            type: "POST",
            dataType:"json",
            cache: false,
            data: formData, // data에 바로 serialze한 데이터를 넣는다.
            success: function(data){
            	//리스트 출력
            	let value = "";
            	if(data.response.body.items.item.length>0){
            		
                for(let i = 0; i<data.response.body.items.item.length;i++){
			    	let sData = data.response.body.items.item[i];
			    	value += '<div class="col-6 mt-3 ml-1 mr-1"><div class="text-center"> <input type="checkbox" name="check" class="check saveCheck" value="'+sData.contentid+'&'+sData.title+'&'+sData.addr1+'&'+sData.firstimage+'" id='+sData.contentid+'><label for='+sData.contentid+'>'+sData.title+'<label></div><div class="text-center">'+sData.addr1+'</div><div class="text-center"> <img src="';
					if(sData.firstimage!=undefined){
				    	value += sData.firstimage;							
					}else{
						value +='/images/noPhoto.png';
					}
			    	value +='"class="searchImg w-auto"></div> </div></div>';
	            }
                value +='   <div class="btn-toolbar justify-content-center mt-4" role="toolbar" aria-label="Pagination"> <div class="btn-group me-2 mb-2" role="group" aria-label="First group">';
            	}

                let totalPage = data.response.body.totalCount/data.response.body.numOfRows;
				let pageNo = data.response.body.pageNo;
				//페이징
				if(pageNo>1){
					value +='<button type="button" class="btn btn-outline-secondary m-2 page" id='+(pageNo-1)+'>이전 페이지</button>';
				}
				if(pageNo<totalPage){
					value +='<button type="button" class="btn btn-outline-secondary m-2 page" id='+(pageNo+1)+'>다음 페이지</button>';					
				}
	            $("#searchResult").html(value);
            
            
                
            }
        }) 
    }
	
	$(document).on("click",".page",function(){
		$("#searchPageNo").val(this.id);
		searching();
		return false;
	})
		
	$("#thirdBtn").on("click",function(){
		$.ajax({
			url:"/plan/detailPlanList?seq=${seq}&date=${dto.startDate}",
			dataType:"json",
			success:function(data){
	
				let result = "";
				let positions = [];
					for(let i = 0; i<data.length;i++){
						result += '<li class="row border mb-2 ui-widget-content ui-corner-tr" id='+data[i].seq+' dragable="true"><div class="col-4"><img src="';
						if(data[i].photo !='undefined'){
							result += data[i].photo;							
						}else{
							result += '/images/noPhoto.png';
						}
						
						result +='"class="w-100" style="height:50px;">'+'</div><div class="col">'+data[i].name+'<br>'+data[i].location+'</div>'+'</li>';
						
						//지도 관련
						// 주소로 좌표를 검색합니다
						geocoder.addressSearch(data[i].location, function(result, status) {

						    // 정상적으로 검색이 완료됐으면 
						     if (status === kakao.maps.services.Status.OK) {

						        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

						        // 결과값으로 받은 위치를 마커로 표시합니다
						        var marker = new kakao.maps.Marker({
						            map: map,
						            position: coords
						        });
								markers.push(marker);
						        // 인포윈도우로 장소에 대한 설명을 표시합니다
						        var infowindow = new kakao.maps.InfoWindow({
						            content: data[i].name
						        });
						        infowindow.open(map, marker);
						        infowindows.push(infowindow);
						      
						    } 
						});    
					}
					$("#planList").html(result);
					
					
				//지도관련
					// 주소로 좌표를 검색합니다
					geocoder.addressSearch(data[0].location, function(result, status) {

					    // 정상적으로 검색이 완료됐으면 
					     if (status === kakao.maps.services.Status.OK) {
					        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					        map.setCenter(coords);
					    } 
					});    
			}
		})
	})
	
	function checkCategory(form) {
	  if (form.checkValidity()) {
		 alert("여행계획 입력이 완료되었습니다.");
		return true;
	  }else{
		  return false;
	  }
	}
	
	function editCategory(form) {
		  if (form.checkValidity()) {
			 if(confirm("날짜 변경시, 기록한 일정이 사라질 수 있습니다. 계속하시겠습니까?")){
				("여행계획 입력이 완료되었습니다."); 
			 }
				return true;
		  }else{
			  return false;
		  }
		}
	
	
	$(".datePick").on("click",function(){
		let id = this.id;
		$.ajax({
			url:"/plan/detailPlanList?seq=${seq}&date="+id,
			dataType:"json",
			success:function(data){
				for(let a = 0; a<markers.length;a++){
					markers[a].setMap(null);
					infowindows[a].close();
				}
				
				let result = "";
				let positions = [];
				for(let i = 0; i<data.length;i++){
					result += '<li class="row border mb-2 ui-widget-content ui-corner-tr" id='+data[i].seq+' dragable="true"><div class="col-4"><img src="';
					if(data[i].photo!='undefined'){
						result +=data[i].photo						
					}else{
						result +='/images/noPhoto.png'
					}
					
					result +='"class="w-100" style="height:50px;">'+'</div><div class="col">'+data[i].name+'<br>'+data[i].location+'</div>'+'</li>'						
					
					//지도 관련
					// 주소로 좌표를 검색합니다
					geocoder.addressSearch(data[i].location, function(result, status) {

					    // 정상적으로 검색이 완료됐으면 
					     if (status === kakao.maps.services.Status.OK) {

					        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

					        // 결과값으로 받은 위치를 마커로 표시합니다
					        var marker = new kakao.maps.Marker({
					            map: map,
					            position: coords
					        });
							markers.push(marker);

					        // 인포윈도우로 장소에 대한 설명을 표시합니다
					        var infowindow = new kakao.maps.InfoWindow({
					            content: data[i].name
					        });
					        infowindow.open(map, marker);
					        infowindows.push(infowindow);
					      
					    } 
					});   
				}
				$("#dateShow").text(id);
				$("#planList").html(result);
				//지도관련
				// 주소로 좌표를 검색합니다
				if(data[0]!=null){
					
				
				geocoder.addressSearch(data[0].location, function(result, status) {

				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});
				}
			}
		})
	})
	
	//찜목록 더보기
        let btn = 1;
        let isMore;
        $("#seeMore").on("click", function () {
          btn += 7;
          $.ajax({
            url: "/member/moreSaving",
            data: { btn: btn }
          }).done(function (res) {
            let result = JSON.parse(res);
            for (let i = 0; i < result.length; i++) {
              $("#seeMoreTag").before(
                `<div class="col-9 align-self-center mt-4 delParent border">
                  <div class="row">
                    <div class="col-4">
                        <img class="w-100 saveImg" src="\${result[i].photo}">
                    </div>
                    <div class="col-8">
                      <div class="row">
                        <div class="col-10">\${result[i].name}
                            <input type="checkbox" name="check" class="check" value="\${result[i].seq}&\${result[i].name }&\${result[i].lo_datail}&\${result[i].photo }">
                            </div>
                      </div>
                      <div class="row">
                        <div class="col">\${result[i].lo_detail}</div>
                      </div>
                      <div class="row align-items-end mb-0  h-50">
                        <div class="col-12">
                            <a>평점 :
                              \${result[i].savedListRate}
                            </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>`
              )
              isMore = result[i].isMore;
            }
            if (isMore == 0) {
              $("#seeMoreDel").empty();
            }
          })
        });
        
       
        //드래그앤 드랍 순서변경
        $(function() {            
   		let id = 0; 
        $(document).on("mouseup",".ui-widget-content",function(){
   			 id = this.id;
   		 })
        
   	 		$("#planList").sortable({
   	 			stop: function(event, ui) { 
   	 			let target = [];
   	 			let result = '';
   	             	for(let i = 1; i<=$("#planList").children().length;i++){
   	             		target.push(($("#planList li:nth-child("+i+")").attr("id"))*1)
   	             	}
   	             		$.ajax({
   	             			url:"/plan/planSort",
   	              			async:false,
   	             			data:{"target":target,"seq":id},
   	             			datatype:"json",
   	             			success:function(data){   				
   	 	            			target.sort(function(a,b){
   	 	            				return a-b;
   	 	            			});	
   	             				for(let i = 0; i<target.length;i++){
   	   		             			$("#planList li:nth-child("+(i+1)+")").attr("id",target[i])
	   	             			}
   	             			}
   	             		})   	         		
   	   			}
            });
        })
        
    //일정 수정
    $( function() {
	    var $planList = $( "#planList" ),
	      $day = $( "#day" );
	    $("#day>li").droppable({
	      accept: "#planList > li",
	      drop: function( event, ui ) {
	        changeDate( ui.draggable,this.id );
	      }
	    });

	    $("#deletePlan").droppable({
		      accept: "#planList>li",
		      drop: function( event, ui ) {
		        deleteDate( ui.draggable );
		      }
		});
	    function changeDate( $item, $id ) {
	      $item.fadeOut(function() {
	    	  $.ajax({
	    			url:"/plan/planDateSort",
	    			async:false,
	    			data:{"day":$id,"seq":$item.attr("id")},
	    			success:function(data){
	    		    	  $item.remove();    				
	    			}   
	      		});
	   	 	});
  		}
	    
	    function deleteDate( $item ) {
		      $item.fadeOut(function() {
		    	  $.ajax({
		    			url:"/plan/planDateDelete",
		    			async:false,
		    			data:{"seq":$item.attr("id")},
		    			success:function(data){
		    		    	  $item.remove();    				
		    			}   
		      		});
		   	 	});
	  		}
	        
	});
        
        $(document).on("click",".saveBtn",function(){
            let checkBoxLength = document.querySelectorAll("input[name='check']").length;
            let delList = new Array();
            for (let i = 0; i < checkBoxLength; i++) {
              if (document.querySelectorAll("input[name='check']")[i].checked == true) {
                let beforeSplit = document.querySelectorAll("input[name='check']")[i].value;
                let afterSplit = beforeSplit.split(",");
                let list = new Object();
                list.board_num = afterSplit[0];
                list.seq = afterSplit[1];
                delList.push(list);
              }
            }
            if (delList.length == 0) {
              alert("저장할 여행지를 선택해주세요.");
              return false;
            }
            alert("성공적으로 저장되었습니다.");
          });

</script>
</body>
</html>