<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title here</title>

<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" 	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"	crossorigin="anonymous"><!-- include libraries(jQuery, bootstrap) -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<jsp:include page="../base/header.jsp"></jsp:include>

<style>

* {
	box-sizing: border-box;
}

body {
	margin: 0; /* 임시로 body margin 0px */
}

/* div{border:1px solid black} */
.banner {
	background-color: rgb(56, 181, 174);
	height: 200px;
}

.banner_title {
	width: 100%;
	height: 70%;
	color: white;
	font-size: 35px;
	font-weight: 600;
	padding: 60px 0px 10px 100px;
}

.banner_content {
	width: 100%;
	height: 30%;
	color: white;
	font-size: 15px;
	font-weight: 500;
	padding-left: 100px;
}

.container {
	border: 1px solid red;
}

.container>.root {
	padding-left: 80px;
	overflow: auto;
}

.root>div {
	border: 1px solid red;
	float: left;
	margin: 40px 0px 40px 0px;
	padding-right: 10px;
}

.writeForm {
	border: 1px solid red;
}

.catetitle {
	overflow: auto;
	padding: 0px 80px 0px 80px;
}

.category {
	width: 10%;
	float: left;
}

.title {
	border: 1px solid red;
	width: 90%;
	float: left;
}

.title>input {
	width: 100%;
}

.writeForm>div {
	border: 1px solid red;
}

.contents {
	padding-right: 80px;
}

.ft_btn {
	border: 1px solid red;
	width: 100%;
	text-align: right;
	padding: 0px 80px 0px 80px;
}



.reply {
	border: 1px solid red;
	padding: 0px 80px 0px 80px;
}

.reply>div {
	border: 1px solid red;
}

.reply_list {
	border: 1px solid red;
	padding: 0px 80px 0px 80px;
}

.reply_title {
	border: 1px solid red;
	overflow: auto;
}

.reply_title>div {
	float: left;
	border: 1px solid red;
}

.reply_title>.rp_id {
	border: 1px solid red;
	width: 85%;
	padding-left: 10px;
}

.reply_title>.rp_time {
	width: 15%;
	text-align: center;
}

.reply_contents {
	overflow: auto;
	border: 1px solid red;
	width: 100%;
}

.reply_contents>div {
	float: left;
	border: 1px solid red;
}

.reply_contents>.rp_content {
	border: 1px solid red;
	width: 85%;
}

.rp_content>input {
	width: 100%;
}

.rp_btns {
	width: 15%;
	text-align: center;
}

.rp_contents:hover {
	cursor:pointer ;
}

.re_reply{
    border: 1px solid red;
    width: 100%;
    float: left;
    padding: 0px 80px 0px 80px;
}

.re_reply>.re_rp_title{
    overflow: auto;
    border: 1px solid red;
}

.re_rp_title>div{
    float: left;
    border: 1px solid red;
}

.re_rp_title>.re_rp_id{
    width: 85%;
}

.re_rp_title>.re_rp_time{
    width: 15%;
}

.re_reply>.re_rp_contents{
    overflow: auto;
}

.re_rp_contents>div{
    float: left;
    border: 1px solid red;
}

.re_rp_contents>.re_rp_content{
    width: 85%;
}

.re_rp_contents>.re_rp_btns{
    width: 15%;
}

/* 링크 속성 지우기 */
a {
	text-decoration: none
}

a:hover {
	text-decoration: none;
	color: black;
}

a:link {
	text-decoration: none;
	color: black;
}

a:visited {
	text-decoration: none;
	color: black;
}

a:active {
	text-decoration: none;
	color: black;
}

.fa-home {
	color: rgb(56, 181, 174);
}


/* 좋아요, 댓글란  */
        .like_n_rep{
        	border: 1px solid red;
        	width: 100%;
        	height: 30px;
        	text-align: right;
        	
        	padding-left: 80px;
        }
        
        .like_n_rep>div{
        	border: 1px solid red;
        	height:30px;
        	width: 55px;
        	text-align:center;
        	float: left;
        	line-height:30px;
        }
        
        #heart, #cant_heart{
        	cursor: pointer;
        }
</style>
</head>

<body>

	<!-- .banner에 이미지 추가해야한다.-->
	<div class="banner">
		<div class="banner_title" href="">여행지 게시판</div>
		<div class="banner_content">각 지역의 여행 후기를 남겨보세요</div>
	</div>
	<div class="container">
		<div class="root">
			<div class="home">
				<a href="/"><i class="fas fa-home"></i></a>
			</div>
			<div>></div>
			<div class="community" href="">커뮤니티</div>
			<div>></div>
			<div class="tourboard">
				<a href="/tourboard/list?cpage=1">여행지 게시판</a>
			</div>
		</div>
		<form action="/tourboard/modify" method="post" id="frmDetail"
			enctype="multipart/form-data">
			<div class="writeForm">
				<div class="catetitle">
					<div class="category">
						<input type=text value="[${dto.category }]" id="discategory" style="border: 0px; text-align: center; width: 100%;" readonly>
						<input type=hidden value="${dto.category }" id="categoryValue">
						<select style="display: none" ; id="modcategory" name="category">
							<option value="">말머리</option>
							<option value="명소">명소</option>
							<option value="문화">문화</option>
							<option value="생태">생태</option>
							<option value="체험">체험</option>
						</select>
					</div>
					<div class="title">
						<input type=hidden value="${dto.seq}" name=seq> <input
							type=text placeholder="제목을 입력하세요" id="title" name="title"
							value="${dto.title }" readonly>
					</div>
				</div>
				<br>
				<div class="contents" style="margin-left: 80px;">
					<textarea class="summernote" id="summernote" rows="5" name="explanation" style="height: 300px;">${dto.contents }</textarea>
				</div>
			</div>
			<div class="ft_btn">
				<a href="/tourboard/list?cpage=1"><button type=button>목록으로</button></a>
				<c:if test="${!empty loginNick }">
					<c:if test="${dto.nick == loginNick}">
				<button type=button id=mod>수정하기</button>
				<button type=button id=del>삭제하기</button>
				<button type=button id=modOk style="display: none;">수정완료</button>
				<button type=button id=modCancel style="display: none;">취소</button>
					</c:if>
				</c:if>
			</div>
		</form>
		<br>
		
		<div class="like_n_rep">
        	<div id=like_icon>
          		<a class="heart">          			
          				<c:if test="${!empty loginNick }">
    	     	  			<img id="heart" src="" style="width:20px; height:20px;"><span id="rec_count" name="rec_count">${dto.rec_count}</span>
	       	    		</c:if>	     
	       	    		<c:if test="${empty loginNick }">  	    		
           					<img id="cant_heart" src="/images/dislike.png" style="width:20px; height:20px;"><span id="rec_count" name="rec_count"> ${dto.rec_count}</span>
           				</c:if>           				           			
       			</a>
            </div>
            <div id=rep_icon>
                <i class="far fa-comment-dots" style="color: black"></i><span id="rep_count" name="rep_count"> ${dto.rep_count}</span>
            </div>
       </div>
               
		<br>
		<form action="/tourreply/reply" method="post" id="frmReply"	enctype="multipart/form-data">		
			<div class="reply">
				<input type=hidden value="${dto.seq}" name=rseq>
				<div class="rp_input">
					<c:if test="${!empty loginNick }">
						<input type=text placeholder="댓글을 입력하세요" style="width: 100%; height: 30px;" id="rep_con" name="reply">
					</c:if>
				</div>
				<div class="rp_write" style="text-align: right;">
					<c:if test="${!empty loginNick }">
						<button type=submit id="write_btn">작성하기</button>
					</c:if>
				</div>
			</div>
		</form>

		<div class="reply_list">
            <hr>
			<c:forEach var="rp" items="${rp_list }">
				<form method="post" id="frmRpMod" enctype="multipart/form-data">
					<div class="reply_title">
						<input type=hidden value="${rp.seq}" name=seq> <input type=hidden value="${rp.par_seq}" name=par_seq>
						<div class="rp_id" value="${rp.mem_seq }">${rp.nick }</div>
						<div class="rp_time" name="writen_date">${rp.writen_date }</div>
					</div>
					<br>
					<div class="reply_contents " style="text-align: right;">
						<div class="rp_content">
							<input type=text value="${rp.contents }" class="rp_contents" id="rp_contents${rp.seq }" name="contents" readonly>
						</div>
						<div class="rp_btns">
							<c:if test="${!empty loginNick }">
							<button type=button class="rp_reply_btn" id="rp_reply_btn${rp.seq }">rep</button>
								<c:if test="${rp.nick == loginNick}">
							<button type=button class="rp_mod_btn" id="rp_mod_btn${rp.seq }">mod</button>
							<button type=button class="rp_del_btn" id="rp_del_btn${rp.seq }" style="color: red;"><b>del</b></button>
							<button type=submit class="rp_modOk_btn" id="rp_modOk_btn${rp.seq }" style="display: none;" formaction="/tourreply/modify">ok</button>
							<button type=button class="rp_cancle_btn" id="rp_cancle_btn${rp.seq }" style="color: red; display: none;"><b>can</b></button>
								</c:if>
							</c:if>
						</div>
						
						<c:forEach var="re" items="${re_list }">
						<c:choose>
							<c:when test="${re.par_seq == rp.seq}">
                       			<div class="re_reply" id="re_reply${rp.seq }">
                            		<div class="re_rp_title">
                                		<div class="re_rp_id" style="text-align:left;"> ${re.nick }</div>
                                		<div class="re_rp_time" style="text-align:center;">${re.writen_date }</div>
                            		</div>
                            		<br>
                            		<div class="re_rp_contents">
		                                <div class="re_rp_content">
		                                	<span><input type=text border:0px;" value="@${rp.nick }" readonly></span>
                                			<input type=text id="recontent${re.seq }" name="recontent" value="${re.contents}" readonly>
                                		</div>
                                		<div class="re_rp_btns" style="text-align:center">
                                			<c:if test="${!empty loginNick }">
                                				<c:if test="${re.nick == loginNick}">
                             			   			<button type=button class="re_mod_btn" id="re_mod_btn${re.seq }" rpseq=${rp.seq }>mod</button>
                                					<button type=button class="re_del_btn" id="re_del_btn${re.seq }" style="color: red;"><b>del</b></button>
                                					<button type=button class="re_modOk_btn" id="re_modOk_btn${re.seq }" rpseq=${rp.seq } style="display: none;">ok</button>
                                					<button type=button class="re_cancle_btn" id="re_cancle_btn${re.seq }" style="display: none;">can</button>
                                				</c:if>
                                			</c:if>
                                		</div>
                            		</div>
                        		</div>
                        	</c:when>
                        </c:choose>
                        </c:forEach>
                        
                        <div class="re_reply_input" id="re_reply_input${rp.seq }" style="display: none;">
                            <div class="re_reply_content">
                            	<input type=hidden value="${dto.seq}" name=writeseq>
                            	<input type=hidden value="${rp.seq}" name=rpseq>
                            	<input type=text placeholder="댓글을 입력하세요" name=recontents>
                            </div>
                            <div class="re_reply_input_btn">
                                <button type=submit formaction="/tourreply/rereply">ok</button>
                                <button type=button class="rp_reply_cancle_btn" id="rp_reply_cancle_btn${rp.seq }">can</button>
                            </div>
                        </div>
					</div>
					<br>
				</form>
			</c:forEach>			
		</div>        

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
	$(document).on("click",".rp_id",function(){
		let mem_seq = $(this).attr("value");
		console.log(mem_seq);
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
    			$("#profilePhone").text("연락처 : " + result.phone);    			
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
	</script>	
	<script>
		$(".re_del_btn").on("click", function(){
			
			let id = this.id.substr(10);
			location.href = "/tourreply/redelete?idseq="+id+"&writeseq=${dto.seq}";
		})
	</script>

	<script>
		$(".re_modOk_btn").on("click", function(){
// 			re_modOk_btn${re.seq}${rp.seq }
			let id = this.id.substr(12);
			
			let recontent = $("#recontent${re.seq }"+id).val();
			
			location.href = "/tourreply/remodify?writeseq=${dto.seq}&idseq="+id+"&recontent="+recontent;
		})
	</script>
	
	<script>
		$(".re_cancle_btn").on("click", function(){
					
			location.reload();
		})
	</script>
	
	<script>
		$(".re_mod_btn").on("click", function(){
			let id = this.id.substr(10);
			let mod_id = $(this).attr("rpseq");
			
			console.log("mod_btn 눌렀을 때 id : mod_id = " + id + " : " + mod_id);
			$("#re_mod_btn"+id).css("display","none");
			$("#re_del_btn"+id).css("display","none");
			$("#re_modOk_btn"+id).css("display","inline");
			$("#re_cancle_btn"+id).css("display","inline");	
			$("#recontent"+id).removeAttr("readonly");
		})
		
	</script>
	
	<script>
		$(".rp_reply_cancle_btn").on("click", function(){
			let id = this.id.substr(19)
			$("#re_reply_input"+id).css("display", "none");
		})
	</script>
	
	<script>
		$(".rp_reply_btn").on("click", function(){
			let id = this.id.substr(12);
			$("#re_reply_input"+id).css("display", "inline");
		})
	</script>
	
	<script>
		$(".rp_del_btn").on("click", function() {
			if (confirm("댓글을 삭제하시겠습니까?")) {
				let id = this.id.substr(10);
				location.href = "/tourreply/delete?rpseq=" + id	+ "&bseq=${dto.seq}";
			}
		})
	</script>

	<script>
		$(".rp_mod_btn").on("click", function() {
			//${rp.seq }
			let id = this.id.substr(10);

			$("#rp_mod_btn" + id).css("display", "none");
			$("#rp_del_btn" + id).css("display", "none");
			$("#rp_cancle_btn" + id).css("display", "inline");
			$("#rp_modOk_btn" + id).css("display", "inline");
			$("#rp_reply_btn" + id).css("display", "none");
			$("#rp_contents" + id).removeAttr("readonly");
		})
	</script>

	<script>
		$(".rp_cancle_btn").on("click", function() {

			location.reload();
		})
	</script>

	<script>
		$("#write_btn").on("click", function() {
			
			if($("#rep_con").val() == ""){
	             alert("댓글을 작성해주세요");
	             return false;
	          }else{ 
	             if(confirm("이대로 작성하시겠습니까?")){
	                $("#frmReply").submit();
	             }else{
	                $("#rep_con").val() = "";
	                return false;
	             }
	          }
		});
	</script>

	<script>
		$(".icon_recommand").on("click", function() {
			location.href = "/tourboard/like";
		})
	</script>

	<script>
		$("#del").on("click", function() {
			if (confirm("정말 삭제하시겠습니까?")) {

				location.href = "/tourboard/delete?seq=${dto.seq}";
			}
		});
	</script>

	<script>
		$("#list_btn").on("click", function() {
			history.back();
		})
	</script>

	<script>
		let bkTitle = "";
		let bkContents = "";
		let categoryValue = "";
		$("#mod").on("click", function() {

			bkTitle = $("#title").val();
			bkContents = $("#summernote").val();

			console.log("bkTitle : " + bkTitle + "bkContents : " + bkContents);

			$("#title").removeAttr("readonly");
			$("#contents").removeAttr("readonly");
			$("#mod").css("display", "none");
			$("#del").css("display", "none");
			$("#modOk").css("display", "inline");
			$("#modCancel").css("display", "inline");
			$("#discategory").css("display", "none");
			categoryValue = $("#categoryValue").val();
			$("#modcategory").css("display", "inline");
			$("#modcategory").val(""+categoryValue+"");
			
			$('.summernote').summernote({
				airMode : false
			});
			
			// 서머노트 쓰기 활성화
			$('#summernote').summernote('enable');
		});
	</script>	

	<script>
		$("#modCancel").on("click", function() {
			if (confirm("정말 취소하시겠습니까?")) {

				location.reload();
			}
		})
	</script>

	<script>
		$("#modOk").on("click", function() {
			if ($("#modcategory").val() == "") {

				alert("말머리를 선택해주세요");
				return false;
			}

			if ($("#title").val() == "") {

				alert("제목을 입력해주세요");
				return false;
			}

			if ($("#summernote").val() == "") {

				alert("내용을 입력해주세요");
				return false;
			}

			if (confirm("이대로 작성하시겠습니까?")) {
				$("#frmDetail").submit();
			}
		});
	</script>

	<script>
		$(document).ready(function() {
			//여기 아래 부분
			$('#summernote').summernote({
				height : 300, // 에디터 높이
				minHeight : 300, // 최소 높이
				maxHeight : null, // 최대 높이
				focus : true, // 에디터 로딩후 포커스를 맞출지 여부
				lang : "ko-KR", // 한글 설정
				airMode: false,
				
				toolbar: [
				    // [groupName, [list of button]]
				    ['fontname', ['fontname']],
				    ['fontsize', ['fontsize']],
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    ['color', ['forecolor','color']],
				    ['table', ['table']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['height', ['height']],
				    ['insert',['picture','link','video']],
				    ['view', ['fullscreen', 'help']]
				  ],
				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
				placeholder : '최대 2048자까지 쓸 수 있습니다', //placeholder 설정
				
					callbacks: {	//여기 부분이 이미지를 첨부하는 부분
						onImageUpload : function(files) {
							sendFile(files[0],this);
						}
					}
				
			});
			$('#summernote').summernote('disable');
		});
		
		/**
		* 이미지 파일 업로드
		*/
		function sendFile(file, editor) {
	        var form_data = new FormData();
	        form_data.append('file', file);
	        $.ajax({
	            data : form_data,
	            type : "POST",
	            url : "/tourboard/imageUpload",
	            cache : false,
	            contentType : false,
	            enctype : "multipart/form-data",
	            processData : false,
	            success : function(sysName) {
	                console.log(sysName + "b")
	                console.log("detail에 왔습니다.")

	                $(editor).summernote('insertImage', sysName);
	            }
	        });
	    }
	</script>


   <!-- 좋아요 -->
    <script>
    $(document).ready(function () {

        var heartval = ${heart};

        if(heartval>0) {
        	 //console.log("heartval>0 "+heartval + " : " + ${heart});
            $("#heart").prop("src", "/images/like.png");
            $(".heart").prop('name',heartval)
        }
        else {
        	 //console.log("else "+heartval + " : " + ${heart});
            $("#heart").prop("src", "/images/dislike.png");
            $(".heart").prop('name',heartval)
        }

    });
    
    $(".heart").on("click", function () {

        var that = $(".heart");
        var sendData = {'boardId' : '${dto.seq}','heart' : that.prop('name'), 'rec_count_no' : '${dto.rec_count}'};
        
        //console.log(that.prop('name'));
        
        $.ajax({
            url :'/tourboard/heart',
            type :'POST',
            data : sendData,
            success : function(data){
                that.prop('name',data.heart);   
    		    
                var heart = data.heart;
                var rec_count_no = data.rec_count_no;
                
                if(heart==1) {
                    $('#heart').prop("src","/images/like.png");
                    console.log("heart값이 1일때 dto의 추천수 : " + rec_count_no);
                    $('#rec_count').html(data.rec_count_no);
                }
                else{
                    $('#heart').prop("src","/images/dislike.png");
                    console.log("heart값이 0일때 dto의 추천수 : " + rec_count_no);
                    $('#rec_count').html(data.rec_count_no);
                }
            }
        });
    });
    
    $("#cant_heart").on("click", function(){
    	alert("로그인 후 이용 가능합니다. ");
    	false;
    })
    </script>

</body>
</html>