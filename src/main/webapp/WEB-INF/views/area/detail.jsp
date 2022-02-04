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
<link rel="stylesheet" href="/css/area_detail.css">
<%@ include file="../base/header.jsp"%>

</head>
<body>

	<div class="container">
		<div class="row mt-2">
			<div class="col text-center">
			<c:if test="${dto.photo ne 'null' }">
				<img class="img-fluid" id="mainImg" src="${dto.photo}"><br>
			</c:if>
			<c:if test="${dto.photo eq 'null' }">
				<img class="img fluid" id="mainImg" src="/images/noPhoto.png"><br>
			</c:if>
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
				<div class="row mt-2">
					<div class="col col-md-9">
					<c:if test="${!empty score }">
						<ul class="list-group-horizontal p-0">
						<c:forEach var='cnt' begin='1' end='5'>
							<li><svg xmlns="http://www.w3.org/2000/svg" id="heart" class="float-start p-0"
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
				<div class="row mt-2">
					<div class="co">
						<p>분류 : ${dto.category }</p>
						<c:if test="${dto.lo_detail ne '' }">
							<p>주소 : ${dto.lo_detail }</p>
						</c:if>
						<c:if test="${dto.phone ne 'null' }">
							<p>연락처 : ${dto.phone }</p>
						</c:if>
						<c:if test="${dto.homepage ne 'null' }">
							<p>홈페이지 : ${dto.homepage }</p>
						</c:if>
						<div>
							<button type="button" class="btn btn-primary mt-2 text-center"
								data-bs-toggle="modal" data-bs-target="#exampleModal"
								id="showMore">상세정보</button>
							<!-- Modal -->
							<div class="modal fade" id="exampleModal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">상세 정보</h5>
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
				<img src="${i.photo }" class="w-100 rcmdPhoto">
				</div>
				<div>
				${i.title }
				</div>
				
			</div>
			</c:forEach>
		</div>

		<form action="/area/replySubmit" method="post" enctype="multipart/form-data">
			<div class="row border mt-4">
				<div class="col-12 text-center mb-2 border mt-2">
					<h4>후기 남기기</h4>
				</div>
				<div class="col-2 align-middle">
				<label class="w-100 align-middle" style="height:100px;">
				<div id="ph" class="text-center align-middle">
					<img src="/images/comment.png" class="w-100">
				</div>
					<input accept="image/*" id="img" type="file" class="opacity-0" name="picture" style="display:none;"/>
				</div>
				</label>
				<div class="col-10">
					<div class="row">
						<div class="form-floating col-12 p-0 mr-2">
						  <textarea class="form-control p-2" maxlength="1000" minlength=5 placeholder="댓글작성" id="replyText" name="text" required></textarea>
						</div>
					</div>
					<div class="row mt-2 mb-4">
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
			<div class="col-3 text-center align-self-center">
			<input type="hidden" name=seq value=${i.seq }>
			<input type="hidden" name=area_seq value=${i.area_seq }>
				<label>
				<div class="img" id="replyPhoto${i.seq }">
				<c:if test="${i.photo ne null }">
					<img src="/images/${i.photo }" class="w-100 replyImg">
				</c:if>
				<c:if test="${i.photo eq null }">
					<img src="/images/noPhoto.png" class="w-100 h-100 replyImg">
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

					
					<div class="col text-end starRate${i.score }" id="rating${i.seq }">
					</div>
				</div>
				<div class="row">
					<div class="col">
						<textarea class="form-control" placeholder="댓글작성" name="text" readonly id="replyTxt${i.seq }" maxlength="1000" minlength="5" required>${i.text }</textarea>
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
				</c:if>
				</form>
				<c:if test="${i.mem_seq eq loginSeq }">
					<div class="col-3 col-xxl-1 text-end">
						<button type="button" class="btn btn-success delete" id="replyDel${i.seq }">삭제</button>
						<button type="button" class="btn btn-success cancel" id="replyCancel${i.seq }"  style="display:none">취소</button>
						<input type="hidden" name="area_seq" value=${area_seq } >
						<input type="hidden" name="seq" value=${i.seq }>
					</div>
					
				</div>
				</c:if>
				<c:if test="${i.mem_seq ne loginSeq}">
				<div class="row">
					<div class="col text-end">
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
			      	<img id="profileImg">
			        <span id="profileNick"></span><br>
			        <span id="profilePreference"></span><br>
			        <span id="profileGender"></span><br>
			        <span id="profilePhone"></span><br>
			        <span id="profileAge"></span><br>
			        <span id="profileTxt"></span>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" id="modalCloseBtn" data-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>
			</div>
    	  <jsp:include page="../base/footer.jsp"></jsp:include>

	<script>
	
	$(document).on("click",".reply_id",function(){
		let mem_seq = $(this).attr("value");
		$.ajax({
			url:"/member/showMember?mem_seq="+mem_seq,
    		dataType:"json",
    		success:function(result){
       			$('#myModal').modal("toggle");
    			if(result.photo!=undefined){
        			$("#profileImg").attr("src",result.photo);    				
    			}else{
    				$("#profileImg").attr("src","/images/noPhoto.png");
    			}
    			$("#profileNick").text("사용자 명 : "+result.nick);
    			if(result.preference==0){
        			$("#profilePreference").text("여행 선호 방식 : "+"입력되지 않은 사용자입니다.");    				
    			}else{
        			$("#profilePreference").text("여행 선호 방식 : "+result.preference);
    			}
    			if(result.gender==undefined){
        			$("#profileGender").text("성별 : "+"입력되지 않은 사용자입니다.");    				
    			}else{
        			$("#profileGender").text("성별 : "+result.gender);
    			}
    			if(result.phne==undefined){
    				$("#profilePhone").text("연락처 : " + "입력되지 않은 사용자입니다.");    								
    			}else{
    				$("#profilePhone").text("연락처 : " + result.phone);    				
    			}
    			if(result.age==0){
        			$("#profileAge").text("연령 : "+"입력되지 않은 사용자입니다.");					
    			}else{
        			$("#profileAge").text("연령 : "+result.age);
    			}
    			if(result.text==undefined){
        			$("#profileTxt").text("자기소개 : "+"입력되지 않은 사용자입니다.");					
    			}else{
        			$("#profileTxt").text("자기소개 : "+result.text);
    			}
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
		let seq = "#replyTxt"+this.id;
		$(seq).removeAttr("readonly");
		$(this).hide();
		$("#replyDel"+this.id).hide();
		$("#replySubmit"+this.id).show();
		$("#replyCancel"+this.id).show();
		$("#rating"+this.id).data('raty').readOnly(false);
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
		$("#rating"+(this.id).substr(11)).data('raty').readOnly(true);
	})
	
	//댓글 삭제
		$(document).on("click",".delete",function(){
			if(confirm("삭제하시겠습니까?")){
				location.href="/area/replyDelete?seq="+(this.id).substring(8)+"&area_seq="+"${area_seq}";
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
							'<div class="col-3 text-center align-self-center">'+
							'<input type="hidden" name=seq value='+result[i].seq+'>'+
							'<input type="hidden" name="area_seq" value='+result[i].area_seq+'>'+
							'<label>'+
							'<div class="img" id="replyPhoto'+result[i].seq+'">'+
							
							(result[i].photo != null ? '<img src="/images/'+result[i].photo+'" class="w-100 replyImg">' : '<img src="/images/noPhoto.png" class="w-100 h-100 replyImg">')+
						'</div>'+
						'<input accept="image/*" id="img'+result[i].seq+'" type="file" class="opacity-0 replyimg" name="picture" style="display:none;" disabled/>'+
						'</label>'+
						'</div>'+
						'<div class="col-9">'+
							'<div class="row">'+
								'<div class="col">'+
									'<span class="reply_id" value="'+result[i].mem_seq+'">'+result[i].mem_nick+'</span>'+
								'</div>'+
								'<div class="col text-end starRate'+result[i].score+'" id="rating'+result[i].seq+'">'+
								'</div>'+
							'</div>'+
							'<div class="row">'+
								'<textarea class="form-control" placeholder="댓글작성" name="text" readonly id="replyTxt'+result[i].seq+'"  minlength=5 required>'+
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
								'</div></form>'+
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
									'</div>'+
								'</div>'
							)+
						'</div>'+
					'</div>'+
				'</form>'

					)
	    		}
	    	  }).done(function(param){
				let i;
	    		  for(i = 1; i<6;i++){
						$(".starRate"+i).html("");
			  			$(".starRate"+i).raty({  score: i	 });
				}
	    	  });
	   })
	
		//댓글 이미지
		$("#img").on("change",function(){
			let file = this.files[0];
			if (file) {
			    $("#ph").html("<img class='w-100 replyImg' src="+URL.createObjectURL(file)+">");
			  }
			})

		$(document).on("change",".replyimg",function(){
			let id = this.id.substr(3);
			console.log(id);
			let file = this.files[0];
			if (file) {
			    $("#replyPhoto"+id).html("<img class='w-100 replyImg' src = "+URL.createObjectURL(file)+">");
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
		    			  alert("찜 목록에 저장되었습니다.")
		    		  }else if(resp=="removed"){
		    			  $("#save").text("favorite_border");
		    			  alert("찜 목록에서 제거했습니다.")
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
		if("${dto.lo_detail}" != "온라인개최"){
			geocoder.addressSearch('${dto.lo_detail }',function(result, status) {

				// 정상적으로 검색이 완료됐으면 
				if (status === kakao.maps.services.Status.OK) {
					var coords = new kakao.maps.LatLng(result[0].y,result[0].x);
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
		}

	</script>
</body>
</html>