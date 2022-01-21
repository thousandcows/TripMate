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
<script src="/js/jquery.raty.js"></script>
<link rel="/css/stylesheet" href="jquery.raty.css">

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

.material-icons.md-18 { font-size: 18px; }
.material-icons.md-24 { font-size: 24px; }
.material-icons.md-36 { font-size: 36px; }
.material-icons.md-48 { font-size: 48px; }
.material-icons.red { color: #B22222; }
ul {
  list-style-type: none;
}
ul>li{
  float:left;
}

#mainImg{
	max-height:500px;
}
</style>
	<%@ include file="../base/header.jsp"%>

</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col text-center">
			<img class="img-fluid" id="mainImg" src="${dto.photo}"><br>
		</div>
		</div>

		<div class="row mt-5 r">
			<div class="col-12 col-md-8 ">
				<div class="row">
					<div class="col col-md-10 fs-2 fw-bolder">
						${dto.name }
					</div>
					<div class="col-2 text-end" id="recommand">
						<span class="material-icons md-36 red" id=save>
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
					<div class="col col-md-9">
					<c:if test="${!empty score }">
						<ul class="list-group-horizontal p-0">
						<c:forEach var='cnt' begin='1' end='5'>
							<li><svg xmlns="http://www.w3.org/2000/svg" style="width:20px;height:20px;" class="float-start p-0"
									viewBox="0 0 20 20" fill="currentColor">
							    <defs>
							        <linearGradient id="half_grad${cnt }">
							        	<c:choose>
								        	<c:when test="${cnt<=score }">
								        		<stop offset="100%" stop-color="orange" />
								        	</c:when>
								        	<c:when test="${cnt>score and cnt-1<score }">
								        		<stop offset="${100-(cnt-score)*100 }%"
												stop-color="orange" />
								        		<stop offset="${(cnt-score)*100 }%" stop-color="white" />
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
					<div class="col-12 col-md-3 text-end">
						<c:if test="${!empty score}">
						평점 : ${score }
						</c:if>
					</div>
				</div>
				<div class="row">
					<div class="co">
						분류 : ${dto.category }<br>
						주소 : ${dto.lo_detail }<br>
						연락처 : ${dto.phone }<br>
						홈페이지 : ${dto.homepage }<br>
						<div>
							<button type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#exampleModal"
								id="showMore">상세정보</button>
							<!-- Modal -->
							<div class="modal fade" id="exampleModal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Modal
												title</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">${dto.detail }</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					</div>
				</div>

					<div class="col col-md-4">
						<div id="map" class="w-100" style="height: 300px;"></div>
					</div>
				</div>

				<div class="row mt-4">
			<c:forEach var="i" items="${rcmd }">
			<div class="col-3 rcmd text-center " id="${i.seq }">
				<div>
				<img src="${i.photo }" class="w-100" style="height:200px;">
				</div>
				<div>
				${i.title }
				</div>
				
			</div>
			</c:forEach>
		</div>

		<form action="/area/replySubmit" method="post" enctype="multipart/form-data">
			<div class="row border mt-4">
				<div class="col-2">
				<label class="w-100" style="height:100px;">
				<div id="ph">
					<svg xmlns="http://www.w3.org/2000/svg" class="w-100" style="height:100px;" viewBox="0 0 20 20" fill="currentColor">
					   <path fill-rule="evenodd" d="M4 3a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V5a2 2 0 00-2-2H4zm12 12H4l4-8 3 6 2-4 3 6z" clip-rule="evenodd" />
					 </svg>
				</div>
					<input accept="image/*" id="img" type="file" class="opacity-0" name="picture" style="display:none;"/>
				</div>
				</label>
				<div class="col-10">
					<div class="row">
						<div class="form-floating col-12 p-0">
						  <textarea class="form-control p-0" minlength=5 placeholder="댓글작성" id="replyText" name="text" style="height: 100px;resize:none;" required></textarea>
						</div>
					</div>
					<div class="row mt-1 mb-2">
						<div class="col-6 mt-2" id="starRate">
						</div>

						<input type="hidden" value="${area_seq }" name="area_seq">
						  <div class="col-6 text-end">
						    <button type="submit" class="btn btn-success" id="replyBtn">작성</button>
						  </div>
					</div>
				</div>
			</div>		
		</form>
		
		<div class="row mt-4">
			<div class="col border text-center">
				이용자들의 후기
			</div>
		</div>
		
		<c:forEach var="i" items="${reply }" >
		<form action="/area/replyUpdate" method="post" enctype="multipart/form-data">
		<div class="row replyContainer mt-4">
			<input type="hidden" name=seq value=${i.seq }>
			<input type="hidden" name=area_seq value=${i.area_seq }>
			<div class="col-3 text-center align-self-center">
				<label>
				<div class="img" id="replyPhoto${i.seq }">
				<c:if test="${i.photo ne null }">
					<img src="/images/${i.photo }" class="w-100" style="height:200px;">
				</c:if>
				<c:if test="${i.photo eq null }">
					<img src="/images/noPhoto.png" class="w-100 h-100" style="height:200px;">
				</c:if>
				</div>
				<input accept="image/*" id="img${i.seq }" type="file" class="opacity-0 replyimg" name="picture" style="display:none;" disabled/>
				</label>
			</div>
			<div class="col-9">
				<div class="row">
					<div class="col">
						<span class="reply_id" value="${i.mem_seq }">${i.mem_nick }</span>
					</div>

					
					<div class="col text-end starRate${i.score }">
					</div>
				</div>
				<div class="row">
					<div class="col">
						<textarea class="form-control" placeholder="댓글작성" name="text" style="height: 150px;resize:none;" readonly id="replyTxt${i.seq }" minlength=5 required>${i.text }</textarea>
						<input type="hidden" value="${i.text }" id="replyHidden${i.seq }">
					</div>
				</div>
				<c:if test="${i.mem_seq eq loginSeq}">
				<div class="row mt-2">
					<div class="col-6 col-xxl-8"></div>
				
					<div class="col-3 col-xxl-3 text-end">
						<button type="button" class="btn btn-success update" id="${i.seq }">수정</button>
						<button type="submit" class="btn btn-success updateSubmit" id="replySubmit${i.seq }"  style="display:none">등록</button>						
					</div>
				</form>
					<div class="col-3 col-xxl-1 text-end">
						<form action="replyDelete">
						<button type="submit" class="btn btn-success delete" id="replyDel${i.seq }">삭제</button>
						<button type="button" class="btn btn-success cancel" id="replyCancel${i.seq }"  style="display:none">취소</button>
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
		<div class="row mt-4 mb-4" id="seeMoreTag">
			<div class="col text-center">
				<button type="button" class="btn btn-success" id="seeMore">더보기</button>
			</div>
		</div>
		</c:if>		
	</div>



			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			        <div class="modal-header">
			          <h4 class="modal-title text-center">프로필 조회</h4>
			        </div>
			      <div class="modal-body">
			      	<img id="profileImg" style="width:100px;height:100px;">
			        <span id="profileNick"></span><br>
			        <span id="profilePreference"></span><br>
			        <span id="profileGender"></span><br>
			        <span id="profilePhone"></span><br>
			        <span id="profileAge"></span><br>
			        <span id="profileViolation"></span><br>
			        <span id="profileTxt"></span>
			      </div>
			      <div class="modal-footer">
			        <button type="button" id="profileMsg" class="btn btn-primary">쪽지보내기</button>
			        <button type="button" class="btn btn-secondary" id="modalCloseBtn" data-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>
			</div>

	<script>
	
	$(document).on("click",".reply_id",function(){
		let mem_seq = $(this).attr("value");
		$.ajax({
			url:"/tmp/showMember?mem_seq="+mem_seq,
    		dataType:"json",
    		success:function(result){
    			$('#myModal').modal('toggle');
    			if(result.photo!=undefined){
        			$("#profileImg").attr("src","/images/"+result.photo);    				
    			}else{
    				$("#profileImg").attr("src","/images/noPhoto.png");
    			}
    			$("#profileNick").text("사용자 명 : "+result.nick);
    			$("#profilePreference").text("여행 선호 방식 : "+result.preference);
    			$("#profileGender").text("성별 : "+result.gender);
    			if(result.ph_Open=='on'){
    				$("#profilePhone").text("연락처 : " + result.phone);    				
    			}else{
     				$("#profilePhone").text("연락처 : 비공개 연락처입니다.");    				 				
    			}
    			$("#profileAge").text("연령 : "+result.age);
    			$("#profileViolation").text("신고 횟수 : " + result.violation);
    			$("#profileTxt").text("자기소개 : "+result.text);
    			$("#profileMsg").attr("onclick","location.href='/member/msg?mem_seq="+mem_seq+"'");
    		}
			
		})
	})
	$('#modalCloseBtn').on("click",function(){
		$("#myModal").modal("toggle");
	})
	
	let loginSeq = 0;
	<c:if test="${!empty loginSeq}">
		loginSeq = ${loginSeq};
	</c:if>
	$('#starRate').raty({ score: 5	 });
	$('.starRate1').raty({ readOnly:true, score: 1	 });
	$('.starRate2').raty({ readOnly:true, score: 2	 });
	$('.starRate3').raty({ readOnly:true, score: 3	 });
	$('.starRate4').raty({ readOnly:true, score: 4	 });
	$('.starRate5').raty({ readOnly:true, score: 5	 });	

	
	$(".rcmd").on("click",function(){
		location.href="/area/detail?num="+this.id;
	})
	
	$("#replyBtn").on("click",function(){
		if(loginSeq==0){
			alert("로그인 후 이용해주세요.");
			return false;
		}
	})
	
	//댓글 수정
	$(document).on("click",".update",function(){
		console.log("hi");
		let seq = "#replyTxt"+this.id;
		$(seq).removeAttr("readonly");
		$(this).hide();
		
		$("#replyDel"+this.id).hide();
		$("#replySubmit"+this.id).show();
		$("#replyCancel"+this.id).show();
		$("#img"+this.id).prop("disabled",false);
	})
	
	$(document).on("click",".cancel",function(){
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
		    		if(replyCount <= printNum){
		    			$("#seeMoreTag").empty();		
		    		}
	    			console.log(result);	
	    			for(var i in result)
					$("#seeMoreTag").before(
							
							'<form action="/area/replyUpdate" method="post" enctype="multipart/form-data">'+
							'<div class="row mt-4">'+
							'<input type="hidden" name=seq value='+result[i].seq+'>'+
							'<input type="hidden" name="area_seq" value='+result[i].area_seq+'>'+
							'<div class="col-3 text-center align-self-center">'+
							'<label>'+
							'<div class="img" id="replyPhoto'+result[i].seq+'">'+
							
							(result[i].photo != null ? '<img src="/images/'+result[i].photo+'" class="w-100" style="height:200px;">' : '<img src="/images/noPhoto.png" class="w-100 h-100" style="height:200px;">')+
						'</div>'+
						'<input accept="image/*" id="img'+result[i].seq+'" type="file" class="opacity-0 replyimg" name="picture" style="display:none;" disabled/>'+
						'</label>'+
						'</div>'+
						'<div class="col-9">'+
							'<div class="row">'+
								'<div class="col">'+
									'<span class="reply_id" value="'+result[i].mem_seq+'">'+result[i].mem_nick+'</span>'+
								'</div>'+
								'<div class="col text-end starRate'+result[i].score+'">'+
								'</div>'+
							'</div>'+
							'<div class="row">'+
								'<textarea class="form-control" placeholder="댓글작성" name="text" style="height: 150px;resize:none;" readonly id="replyTxt'+result[i].seq+'"  minlength=5 required>'+
									result[i].text+
								'</textarea>'+
								'<input type="hidden" value="'+result[i].text+'" id="replyHidden'+result[i].seq+'">'+

							'</div>'+
							(result[i].mem_seq == loginSeq ?
								'<div class="row mt-2">'+
								'<div class="col-6 col-xxl-8">'+
								'</div>'+
								'<div class="col-3 col-xxl-3 text-end">'+
									'<button type="button" class="btn btn-success update" id='+result[i].seq+'>수정</button>'+
									'<button type="submit" class="btn btn-success updateSubmit" id="replySubmit'+result[i].seq+'" style="display:none">등록</button>'+
								'</div>'+
								'<div class="col-3 col-xxl-1 text-end">'+
									'<button type="button" class="btn btn-success delete" id="replyDel'+result[i].seq+'">삭제</button>'+
									'<button type="button" class="btn btn-success cancel" id="replyCancel'+result[i].seq+'" style="display:none">취소</button>'+
									'<input type="hidden" name="area_seq" value='+result[i].area_seq+'>'+
									'<input type="hidden" name="seq" value='+result[i].seq+'>'+
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
				let i;
	    		  for(i = 1; i<6;i++){
						$(".starRate"+i).html("");
			  			$(".starRate"+i).raty({ readOnly:true, score: i	 });
				}
	    	  });
	   })
	
		//댓글 이미지
		$("#img").on("change",function(){
			let file = this.files[0];
			if (file) {
			    $("#ph").html("<img class='w-100' style='height:150px;'  src = "+URL.createObjectURL(file)+">");
			  }
			})

		$(document).on("change",".replyimg",function(){
			let id = this.id.substr(3);
			console.log(id);
			let file = this.files[0];
			if (file) {
			    $("#replyPhoto"+id).html("<img class='w-100'  style='height:200px;' src = "+URL.createObjectURL(file)+">");
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
			level : 5
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		
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
								
								var iwContent = '<div style="padding:5px;">${dto.name}</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
							    iwPosition = coords, //인포윈도우 표시 위치입니다
							    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

								// 인포윈도우를 생성하고 지도에 표시합니다
								var infowindow = new kakao.maps.InfoWindow({
								    map: map, // 인포윈도우가 표시될 지도
								    position : iwPosition, 
								    content : iwContent,
								    removable : iwRemoveable
								});
							}
						});

	</script>
</body>
</html>