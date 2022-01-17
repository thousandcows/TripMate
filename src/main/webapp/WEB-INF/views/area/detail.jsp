<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${dto.name }</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5fa8abac646238f15601b89cae524ec&libraries=services"></script>
<script src="https://kit.fontawesome.com/cbcad42a26.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
@font-face {
  font-family: 'Material Icons';
  font-style: normal;
  font-weight: 400;
  src: url(https://example.com/MaterialIcons-Regular.eot); /* For IE6-8 */
  src: local('Material Icons'),
    local('MaterialIcons-Regular'),
    url(https://example.com/MaterialIcons-Regular.woff2) format('woff2'),
    url(https://example.com/MaterialIcons-Regular.woff) format('woff'),
    url(https://example.com/MaterialIcons-Regular.ttf) format('truetype');
}

.material-icons {
  font-family: 'Material Icons';
  font-weight: normal;
  font-style: normal;
  font-size: 24px;  /* Preferred icon size */
  display: inline-block;
  line-height: 1;
  text-transform: none;
  letter-spacing: normal;
  word-wrap: normal;
  white-space: nowrap;
  direction: ltr;
  /* Support for all WebKit browsers. */
  -webkit-font-smoothing: antialiased;
  /* Support for Safari and Chrome. */
  text-rendering: optimizeLegibility;
  /* Support for Firefox. */
  -moz-osx-font-smoothing: grayscale;
  /* Support for IE. */
  font-feature-settings: 'liga';
}
</style>
<script>
	$(document).ready(function(){
		$(".updateSubmit").hide();
		$(".cancel").hide();
	})
</script>
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
					<div class="col-11 fs-2 fw-bolder">
						${dto.name }
					</div>
					<div class="col-1" id="recommand">
						<span class="material-icons" id=save>
							<c:if test = "${rcmdCheck eq 0}">
									favorite_border
							</c:if>
							<c:if test="${rcmdCheck eq 1 }">
									favorite
							  </c:if>									
						</span>
					</div>
				</div>
				<div class="row">
					<div class="col">
					<c:if test="${!empty rate }">
						<ul class="list-group-horizontal">
						<c:forEach var='cnt' begin='1' end='5'>
							<li><svg xmlns="http://www.w3.org/2000/svg" style="width:20px;height:20px;"
									viewBox="0 0 20 20" fill="currentColor">
							    <defs>
							        <linearGradient id="half_grad${cnt }">
							        	<c:choose>
								        	<c:when test="${cnt<=rate }">
								        		<stop offset="100%" stop-color="orange" />
								        	</c:when>
								        	<c:when test="${cnt>rate and cnt-1<rate }">
								        		<stop offset="${100-(cnt-rate)*100 }%"
												stop-color="orange" />
								        		<stop offset="${(cnt-rate)*100 }%" stop-color="white" />
								        	</c:when>
											<c:otherwise>
									            <stop offset="100%" stop-color="white"
												stop-opacity="1" />							        	
											</c:otherwise>										
							        	</c:choose> 	
							        </linearGradient>
							    </defs>
						  <path
										d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"
										fill="url(#half_grad${cnt })" stroke-width="1" stroke="orange" />
								</svg></li>
						</c:forEach>
						</ul>
					</c:if>
					</div>
					<div class="col">
						${rate }
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
		
		<div class="row border">
			<c:forEach var="i" items="${rcmd }">
			<div class="col-3 rcmd" id="${i.seq }">
				<div>
				<img src="${i.photo }" style="width:100px;height:100px;">
				</div>
				<div>
				${i.title }
				</div>
				
			</div>
			</c:forEach>
		</div>

		<form action="/area/replySubmit" method="post" enctype="multipart/form-data">
			<div class="row border">
				<div class="col-2">
				<label class="w-100 h-100">
				<div id="ph">
					<svg xmlns="http://www.w3.org/2000/svg" class="img-fluid w-100 h-100" viewBox="0 0 20 20" fill="currentColor">
					   <path fill-rule="evenodd" d="M4 3a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V5a2 2 0 00-2-2H4zm12 12H4l4-8 3 6 2-4 3 6z" clip-rule="evenodd" />
					 </svg>
				</div>
					<input accept="image/*" id="img" type="file" class="opacity-0" name="picture" style="display:none;"/>
				</div>
				</label>
				<div class="col-10">
					<div class="row">
						<div class="form-floating col-12">
						  <textarea class="form-control" placeholder="댓글작성" id="replyText" name="text" style="height: 100px;resize:none;"></textarea>
						  <label for="replyText">댓글 작성</label>
						</div>
					</div>
					<div class="row">
						<div class="col-2 form-check">
							<input class="form-check-input" type="radio" name="rate" id="star1" value=1>
							<label class="form-check-label" for="star1"> 별 1개 </label>
						</div>
						<div class="col-2 form-check">
							<input class="form-check-input" type="radio" name="rate" id="star2" value=2>
							<label class="form-check-label" for="star2"> 별 2개 </label>
						</div>
						<div class="col-2 form-check">
							<input class="form-check-input" type="radio" name="rate" id="star3" value=3>
							<label class="form-check-label" for="star3"> 별 3개 </label>
						</div>
						<div class="col-2 form-check">
							<input class="form-check-input" type="radio" name="rate" id="star4" value=4>
							<label class="form-check-label" for="star4"> 별 4개 </label>
						</div>
						<div class="col-2 form-check">
							<input class="form-check-input" type="radio" name="rate" id="star5" value=5 checked>
							<label class="form-check-label" for="star5"> 별 5개 </label>
						</div>
						<input type="hidden" value="${area_seq }" name="area_seq">
						  <div class="col-2 text-end">
						    <button type="submit" class="btn btn-success">작성</button>
						  </div>
					</div>
				</div>
			</div>		
		</form>
		
		<c:forEach var="i" items="${reply }" >
		<div class="row border">
			<form action="/area/replyUpdate" method="post" enctype="multipart/form-data">
			<input type="hidden" name=seq value=${i.seq }>
			<input type="hidden" name=area_seq value=${i.area_seq }>
			<div class="col-3">
				<label class="w-100 h-100">
				<div id="ph">
				<c:if test="${i.photo ne null }">
					<img src="/resources/${i.photo }" class="w-100 h-100">
				</c:if>
				<c:if test="${i.photo eq null }">
				
				</c:if>
				<input accept="image/*" id="img${i.seq }" type="file" class="opacity-0" class="replyimg" name="picture" style="display:none;" disabled/>
				
				</div>
				</label>
			</div>
			<div class="col-9">
				<div class="row">
					<div class="col">
						${i.mem_nick }
					</div>
					<div class="col text-end">
						${i.rate }
					</div>
				</div>
				<div class="row">
					<div class="col">
						<textarea class="form-control" placeholder="댓글작성" name="text" style="height: 100px;resize:none;" readonly id="replyTxt${i.seq }">${i.text }</textarea>
						<input type="hidden" value="${i.text }" id="replyHidden${i.seq }">
					</div>
				</div>
				<c:if test="${i.mem_seq eq loginSeq}">
				<div class="row">
					<div class="col-8"></div>
				
					<div class="col-2 text-end">
						<button type="button" class="btn btn-success update" id="${i.seq }">수정</button>
						<button type="submit" class="btn btn-success updateSubmit" id="replySubmit${i.seq }">등록</button>						
					</div>
				</form>
					<div class="col-2 text-end">
						<form action="replyDelete">
						<button type="submit" class="btn btn-success delete" id="replyDel${i.seq }">삭제</button>
						<button type="button" class="btn btn-success cancel" id="replyCancel${i.seq }">취소</button>
						<input type="hidden" name="area_seq" value=${area_seq } >
						<input type="hidden" name="seq" value=${i.seq }>
						</form>
					</div>
					
				</div>
				</c:if>
				<c:if test="${i.mem_seq ne loginSeq}">
				<div class="row">
					<div class="col text-end">
						<button type="button" class="btn btn-success">신고</button>
					</div>
				</div>
				</c:if>
			</div>
		</div>
		</c:forEach>		
		
		<c:if test="${printNum < replyCount }">
		<div class="row" id="seeMoreTag">
			<div class="col">
				<button type="button" class="btn btn-success" id="seeMore">더보기</button>
			</div>
		</div>
		</c:if>		
	</div>


	<script>
	let loginSeq = 0;
	<c:if test="${!empty loginSeq}">
		loginSeq = ${loginSeq};
	</c:if>
	
	$(".rcmd").on("click",function(){
		location.href="/area/detail?num="+this.id;
	})
	
	//댓글 수정
	$(".update").on("click",function(){
		let seq = "#replyTxt"+this.id;
		$(seq).removeAttr("readonly");
		$(this).hide();
		
		$("#replyDel"+this.id).hide();
		$("#replySubmit"+this.id).show();
		$("#replyCancel"+this.id).show();
		$("#img"+this.id).prop("disabled",false);
	})
	
	$(".cancel").on("click",function(){
		$(this).hide();
		let id = this.id.substr(11);
		let seq = "#replyTxt"+id;
		$(seq).attr("readonly","readonly");
		$(seq).val($("#replyHidden"+id).val());
		$("#replyDel"+id).show();
		$("#"+id).show();
		$("#replySubmit"+id).hide();
		$("#img"+id).prop("disabled",true);

	})
	
	//댓글 삭제
		$(".delete").on("click",function(){
			if(!confirm("삭제하시겠습니까?")){
				return false;
			}
		})
	
	//댓글 더보기
	let printNum = ${printNum};
	let replyCount = ${replyCount};
	let staticNo = ${staticNo};
	  $("#seeMore").on("click",function(){
	        $.ajax({
	    		url:"/area/moreReply?area_seq="+${area_seq}+"&printNum="+printNum+"&replyCount="+replyCount,
	    		data:"params",
	    		dataType:"json",
	    		success:function(result){
		    		printNum = printNum+staticNo;
		    		console.log(printNum);
		    		console.log(replyCount);
		    		if(replyCount <= printNum){
		    			$("#seeMoreTag").empty();		
		    		}
	    			console.log(result);
	    			for(var i in result)
					$("#seeMoreTag").before(
							'<div class="row border">'+
							'<div class="col-3">'+
							(result[i].photo != null ? '<img src="/resource/"+i.photo+"\"" class="w-100 h-100">' : "")+
						'</div>'+
						'<div class="col-9">'+
							'<div class="row">'+
								'<div class="col">'+
									result[i].mem_nick+
								'</div>'+
								'<div class="col text-end">'+
									result[i].rate+
								'</div>'+
							'</div>'+
							'<div class="row">'+
								'<div class="col">'+
									result[i].text+
								'</div>'+
							'</div>'+
							(result[i].mem_seq == loginSeq ?
								'<div class="row">'+
								'<div class="col-8">'+
								'</div>'+
								'<div class="col-2 text-end">'+
									'<button type="button" class="btn btn-success">수정</button>'+
								'</div>'+
								'<div class="col-2 text-end">'+
									'<button type="button" class="btn btn-success">삭제</button>'+
								'</div>'+
								'</div>'
								:
									'<div class="row">'+
									'<div class="col text-end">'+
										'<button type="button" class="btn btn-success">신고</button>'+
									'</div>'+
								'</div>'
							)+
						'</div>'+
					'</div>'
					)
	    		}
	    	  }).done(function(param){

	    	  });
	   })
	
		//댓글 이미지
		$("#img").on("change",function(){
			let file = this.files[0];
			if (file) {
			    $("#ph").html("<img class='w-100 h-100' src = "+URL.createObjectURL(file)+">");
			  }
			})
			
		//찜
		  $("#save").on("click",function(){
		      if(${loginSeq != null}){
		    	  $.ajax({
		    		url:"/area/save?area_seq="+${area_seq}
		    	  }).done(function(resp){
		    		  console.log(resp);
		    		  if(resp=="saved"){
		    			  $("#save").text("favorite");
		    		  }else if(resp=="removed"){
		    			  $("#save").text("favorite_border");
		    		  }
		    	  });
		      }else{
		         alert("로그인 후 이용해 주세요");
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