<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${dto.title }</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5fa8abac646238f15601b89cae524ec&libraries=services"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"  rel="stylesheet">

<jsp:include page="../base/header.jsp"></jsp:include>
<style>
	@media(max-width:992px){
		.map{
			height:400px;
		}
	}
</style>
</head>
<body>
	<div class="container mt-4">
		<div class="row">
			<div class="col-12 text-center">
				<h2>${dto.title }</h2>
			</div>
			<div class="col-4">
				여행 컨셉 : ${dto.theme }
			</div>
			<div class="col-8 text-end">
				여행 시작일 ${dto.startDate } ~ 여행 종료일 ${dto.endDate }
			</div>
			
			<div class="col">
				<c:forEach var="i" items="${list }">
					<c:set var="k" value="${k+1 }"/>
					<div class="row border mt-2">
						<div class="col-12">
							<span>${k }일차</span>				
						</div>
						<div class="col-12 col-lg-6">
							<div class="row mt-2 border">
						
							<c:forEach var="j" items="${i }">
									<c:set var="l" value="${l+1 }"/>
									<div class="col-3 mt-1" style=" border-radius:3px; border:1px solid black;">
										<img src="${j.photo }" class="w-100" style="height:80px;"><br>
										<span>${j.name }</span><br>
										<input type="hidden" value="${j.location }" id="${l}" txt="${j.name }">
										<!-- <span>${j.location }</span>-->
										
									</div>
									<div class="col-1 mt-1 align-self-center">
									<span class="material-icons align-middle">
										arrow_forward
									</span>
									</div>
							</c:forEach>						
							</div>
						</div>
						<div class="col-12 col-lg-6 border map" id="map${k }">
							
						</div>
					</div>	
				</c:forEach>

			</div>
		</div>
		<div class=col-12>
		<span>사용자 메모</span>
		<span>${dto.memo }</span>
		</div>
		<div class="col-12 d-flex justify-content-center">
			<c:if test="${loginSeq eq dto.mem_seq }">
				<a href="/plan/modify?seq=${dto.seq }"><button type=button class="btn btn-success m-2" id="modifyBtn">수정</button></a>	
				<button type=button class="btn btn-success m-2" id="deleteBtn">삭제</button>	
			</c:if>
		</div>
		
	</div>
	    	  <jsp:include page="../base/footer.jsp"></jsp:include>
	
<script>
	$("#deleteBtn").on("click",function(){
		if(confirm("삭제하시겠습니까?")){
			location.href= "/plan/delete?seq=${dto.seq}";
		}
	})
	
	
	
	let loca=1;
	let list= new Array();
	<c:forEach items="${list}" var="item">
		list.push("${item}");
	</c:forEach>
	var map = [];
	
	
	for(let i = 1; i<="${list.size()}";i++){
		let size = list[i-1].length;
		if(size>2){
			let tmp = 1;
		    //지도
	        var mapContainer = document.getElementById('map'+i), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 5
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다    
			map[i] = new kakao.maps.Map(mapContainer, mapOption);
			
			// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
			var mapTypeControl = new kakao.maps.MapTypeControl();

			// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
			// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
			map[i].addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new kakao.maps.ZoomControl();
			map[i].addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();	
			for(let j = 0; j<=(list[i-1].match(/,/g) || []).length;j++){
				if($("#"+loca).val() !=null){
					let title = $("#"+loca).attr("txt");

					geocoder.addressSearch($("#"+loca).val(), function(result, status) {

						// 정상적으로 검색이 완료됐으면 
						   if (status === kakao.maps.services.Status.OK) {
					        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					        // 결과값으로 받은 위치를 마커로 표시합니다
					        var marker = new kakao.maps.Marker({
					            map: map[i],
					            position: coords
					        });	        
					        var infowindow = new kakao.maps.InfoWindow({
					            content: title
					        });
					        infowindow.open(map[i], marker);
					      
					    } 
					});    
					if($("#"+loca) && tmp<2){
						geocoder.addressSearch($("#"+loca).val(), function(result, status) {

						    // 정상적으로 검색이 완료됐으면 
						     if (status === kakao.maps.services.Status.OK) {
						        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						        map[i].setCenter(coords);
						    } 
						});    
							tmp++;
					}
				loca++;

				}			
			}
		}
	}
	

</script>
</body>
</html>