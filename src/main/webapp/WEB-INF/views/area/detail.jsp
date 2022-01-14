<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5fa8abac646238f15601b89cae524ec&libraries=services"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col text-center">
			<img class="img-fluid" src="${dto.photo}"><br>
		</div>
		</div>

		<div class="row mt-5">
			<div class="col">
				<div class="row">
					<div class="col fs-2 fw-bolder">
						${dto.name }
					</div>
					<div class="col">
						찜버튼
					</div>
				</div>
				<div class="row">
					<div class="col">
						평점 별
					</div>
					<div class="col">
						평점 숫자
					</div>
				</div>
				<div class="row">
					<div class="col">
						분류 : ${dto.category }<br>
						주소 : ${dto.lo_detail }<br>
						연락처 : ${dto.phone }<br>
						홈페이지 : ${dto.homepage }<br>
						<div>
							상세 정보 : ${dto.detail }											
						</div>
					</div>
				</div>
			</div>
			<div class="col mt-12">
				<div id="map" style="width:500px;height:400px;"></div>
			</div>
		</div>
		
		<div class="row">
			<div class="col">
				추천여행지 들어갈 부분 X4. 사진+ 타이틀
			</div>
		</div>

		<div class="row border">
			<div class="col-2">
			<label class="w-100 h-100">
			<div id="ph">
				<svg xmlns="http://www.w3.org/2000/svg" class="img-fluid w-100 h-100" viewBox="0 0 20 20" fill="currentColor">
				   <path fill-rule="evenodd" d="M4 3a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V5a2 2 0 00-2-2H4zm12 12H4l4-8 3 6 2-4 3 6z" clip-rule="evenodd" />
				 </svg>
			</div>
				<input accept="image/*" id="img" type="file" class="opacity-0" name="photo" style="display:none;"/>
			</div>
			</label>
		<div class="col-10">
				<div class="row">
					<div class="form-floating col-12">
					  <textarea class="form-control" placeholder="댓글작성" id="replyText" style="height: 100px"></textarea>
					  <label for="replyText">댓글 작성</label>
					</div>
				</div>
				<div class="row">
					<div class="col-2 form-check">
						<input class="form-check-input" type="radio" name="star" id="star1" value=1>
						<label class="form-check-label" for="star1"> 별 1개 </label>
					</div>
					<div class="col-2 form-check">
						<input class="form-check-input" type="radio" name="star" id="star2" value=2>
						<label class="form-check-label" for="star2"> 별 2개 </label>
					</div>
					<div class="col-2 form-check">
						<input class="form-check-input" type="radio" name="star" id="star3" value=3>
						<label class="form-check-label" for="star3"> 별 3개 </label>
					</div>
					<div class="col-2 form-check">
						<input class="form-check-input" type="radio" name="star" id="star4" value=4>
						<label class="form-check-label" for="star4"> 별 4개 </label>
					</div>
					<div class="col-2 form-check">
						<input class="form-check-input" type="radio" name="star" id="star5" value=5>
						<label class="form-check-label" for="star5"> 별 5개 </label>
					</div>
					  <div class="col-2">
					    <button type="submit" class="btn btn-success">작성</button>
					  </div>
				</div>
			</div>
		</div>		
		
		<div class="row">
			<div class="col">
				댓글출력
			</div>
		</div>		
		
		<div class="row">
			<div class="col">
				댓글 페이징
			</div>
		</div>		
	</div>


	<script>
	
		//댓글 이미지
		$("#img").on("change",function(){
			let file = this.files[0];
			if (file) {
			    $("#ph").html("<img class='w-100 h-100' src = "+URL.createObjectURL(file)+">");
			  }
			})
			
			
			
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder
				.addressSearch(
						'${dto.lo_detail }',
						function(result, status) {

							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {

								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});


								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});
	</script>
</body>
</html>