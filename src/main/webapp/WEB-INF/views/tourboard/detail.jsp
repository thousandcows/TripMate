<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행지 게시판</title>
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
	height: auto;
}

/* input style */
input:focus {
	outline: none;
}

input {autocomplete ="off";
	
}

/* div{border:1px solid black} */
.banner {
	background-image:url("/images/community_banner.png");
    height:200px;
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

/* 컨테이너 */
.container_c {
	/* border: 1px solid red; */
	padding-bottom: 30px;
	overflow: auto;
}

.container_c>.root {
	padding-left: 80px;
	overflow: auto;
}

.root>div {
	float: left;
	margin: 40px 0px 40px 0px;
	padding-right: 10px;
}

/* 제목, 글 */
.board {
	/* border: 1px solid red; */
	width: 100%;
	padding: 20px 80px 0px 80px;
}

.category {
	width: 10%;
}

.title {
	width: 100%;
	padding: 5px;
}

.contents {
	padding-right: 80px;
}

.write_con>textarea {
	width: 100%;
	height: 500px;
	resize: none;
}

/* 버튼 */
.button {
	/* border: 1px solid red; */
	text-align: right;
	padding: 20px 5px 0px 0px;
}

.button>button {
	margin: 2px;
}

/* 작성자/조회수칸 */
.writer_info {
	float: left;
	width: 100%;
	height: 50px;
	margin-top: 20px;
	margin-bottom: 20px;
}

.writer_photo {
	float: left;
	width: 70px;
	height: 50px;
	text-align: center;
	line-height: 50px;
	padding-left: 20px;
}

.writer_photo>img {
	width: 50px;
	height: 50px;
}

.writer_con {
	float: left;
	width: 70%;
	height: 100%;
	padding-left: 20px;
}

.writer_con>div {
	float: left;
	width: 100%;
	height: 50%;
	line-height: 25px;
	color: gray;
}

/* 댓글쓰기창 */
.rep_con {
	width: 100%;
	height: 70px;
	padding: 10px;
}

.rep_con>textarea {
	width: 100%;
	height: 50px;
	resize: none;
}

.button2 {
	text-align: right;
	padding: 5px 5px 0px 0px;
	height: 50px;
}

/* 댓글 리스트 */
.rep_list { /* border: 1px solid red; */
	padding: 10px;
	margin-top: 10px;
}

.each_rep { /*  border: 1px solid red; */
	width: 100%;
	border-bottom: solid 1px rgb(190, 190, 190);
	padding-bottom: 10px;
	float: left;
}

.reply_title { /* border: 1px solid red; */
	width: 100%;
	padding-top: 10px;
}

.reply_title>.rp_id {
	font-weight: bolder; /* border: 1px solid red; */
	width: 50%;
	display: inline-block;
	padding-left: 20px;
}

.reply_title>.rp_time { /* border: 1px solid red; */
	color: gray;
	width: 49%;
	display: inline-block;
	text-align: right;
	padding-right: 20px;
}

.reply_contents { /* border: 1px solid red; */
	width: 100%;
}

.rep_btn { /*  border: 1px solid red; */
	width: 100%;
	text-align: right;
	padding-right: 20px;
}

.rep_btn>button {
	margin: 2px;
}

.rp_contents {
	width: 100%;
	padding: 5px 20px 5px 20px;
	border: none;
}

/* 
.re_reply{
    width: 100%;
    float: left;
    padding: 0px 5px 0px 80px;
}

.re_reply>.re_rp_title{
    overflow: auto;
}

.re_rp_title>div{
    float: left;
}

.re_rp_title>.re_rp_id{
    width: 85%;
}

.re_rp_title>.re_rp_time{
    width: 15%;
}

.re_rp_contents>.re_rp_content{
    width: 100%;
}
 */
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
.like_n_rep {
	width: 100%;
	height: 30px;
	text-align: right;
}

.like_n_rep>div {
	height: 30px;
	width: 55px;
	text-align: center;
	float: left;
	line-height: 30px;
}

#heart, #cant_heart {
	cursor: pointer;
}
</style>

</head>

<body>
	
	<!-- .banner에 이미지 추가해야한다.-->
	<div class="banner">
		<div class="banner_title" href=""> 여행지 게시판 </div>
		<div class="banner_content"> 각 지역의 여행 후기를 남겨보세요 </div>
	</div>
	
	<div class="container_c">
		<div class="root">
			<div class="home"><a href="/"><i class="fas fa-home"></i></a></div>
			<div>></div>
			<div class="community" href="/tourboard/list?cpage=1">커뮤니티</div>
			<div>></div>
			<div class="tourboard"><a href="/tourboard/list?cpage=1">여행지 게시판</a></div>
		</div>
		<form action="/tourboard/toModify" method="post" id="frmDetail" enctype="multipart/form-data">
			<div class="board">
				<div class="catetitle">
					<!-- <div class="category"> -->
					<span style="width: 20%;">
						<input type=hidden name=category value="${dto.category }" id="categoryValue">
                        <h3 style="color: rgb(56, 181, 174); font-weight: bold; display: inline; padding: 5px;" id="categoryValue_txt">${dto.category }</h3> 
                        <h3 style="display: inline; color: rgb(153, 153, 153); padding: 5px;">|</h3>
                    </span> 
                    <span style="width: 80%;">
                    	<input type=hidden value="${dto.seq}" name=seq>
                        <input type=text placeholder="제목을 입력하세요" id=title name=title readonly value="${dto.title }" style="display: inline; font-size: 20px; font-weight: bold; border: none; width: 90%;">
                    </span>
				</div>
				<div class = writer_info>
                	<div class = writer_photo>
						<img src="${loginInfo.photo}" class="portraitPhoto">
					</div>
					<div class = writer_con>
						<div class="writer_nick">
               				<input type=hidden value="${dto.nick}" name=nick >
                    		<div> ${dto.nick}</div>
                		</div>
                		<div class="view_con">
                    		<div>조회수 ${dto.view_count}</div>
                		</div>
					</div>
                </div>
				
				<hr style="margin:20px 0px 30px 0px;">
				
				<div class="contents" style="margin-left: 80px;">
					<textarea class="summernote" id="summernote" name="explanation" style="display:none;">${dto.contents }</textarea>
					${dto.contents }
				</div>
				
			<div class="button">
				<a href="/tourboard/list?cpage=1"><button type=button class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">목록</span></button></a>
				<c:if test="${!empty loginNick }">
					<c:if test="${dto.mem_seq == loginSeq}">
						<button type=submit id=mod class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">수정</span></button>
						<button type=button id=del class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">삭제</span></button>
					</c:if>
				</c:if>
			</div>
			
			<div class="like_n_rep">
        	<c:if test="${!empty loginNick}">
                <div id=like_icon>
               		<a class="heart">
           				<img id="heart" src="" style="width:20px; height:20px;"><span id="rec_count" name="rec_count" style="color:black;"> ${likeCount}</span>
       				</a>
          		</div>
          	</c:if>
          	<c:if test="${empty loginNick}">
                <div id=like_icon>
          			<a class="heart_nonmem">
   						<img id="heart" src="/images/dislike.png" style="width:20px; height:20px;"><span id="rec_count" name="rec_count"> ${likeCount}</span>
    				</a>
                </div>
            </c:if>
            <div id=rep_icon>
                <i class="far fa-comment-dots" style="color: black"></i><span id="rep_count" name="rep_count"> ${dto.rep_count}</span>
            </div>
       		</div>
			</div>
		</form>		
		<form action="/tourreply/reply" method="post" id="frmReply"	enctype="multipart/form-data">
				<input type=hidden value="${dto.seq}" name=rseq>
				<c:if test="${!empty loginNick }">
					<div class="rep_con">
                   		<textarea type=text id="rep_con" name="reply" placeholder=" 댓글을 입력해주세요" ></textarea>
               		</div>
               		<div class="button2">
                   		<button type="submit" id="write_btn" class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">댓글 작성</span></button>
               		</div>
				</c:if>
		</form>
		

		<c:forEach var="rp" items="${rp_list }">
			<form method="post" id="frmRpMod" enctype="multipart/form-data">
				<div class="rep_list">
					<div class="each_rep">
						<div class="reply_title">
                        	<input type=hidden value="${rp.seq}" name=seq> <input type=hidden value="${rp.par_seq}" name=par_seq>
                         	<div class="rp_id" value="${rp.mem_seq }">${rp.nick }</div>
                            <div class="rp_time" name="writen_date">${rp.writen_date }</div>
                        </div>
						<div class="reply_contents ">
							<input type=text value="${rp.contents }" class="rp_contents" id="rp_contents${rp.seq }" name="contents" readonly>
						</div>
						
						<c:if test="${!empty loginNick }">
						<div class="rep_btn">
							<button type=button class="rp_reply_btn btn btn-primary btn-sm" id="rp_reply_btn${rp.seq }" class="btn btn-primary btn-sm" style="border: none; background-color: rgb(56, 181, 174);"><span style="font-size: small;">답글 달기</span></button>
							<c:if test="${rp.mem_seq == loginSeq}">
								<button type=button class="rp_del_btn btn btn-primary btn-sm" id="rp_del_btn${rp.seq }" class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">댓글 삭제</span></button>
								<button type=button class="rp_mod_btn btn btn-primary btn-sm" id="rp_mod_btn${rp.seq }" class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">댓글 수정</span></button>
								<button type=submit class="rp_modOk_btn btn btn-primary btn-sm" id="rp_modOk_btn${rp.seq }" onclick ="replyConfirm()" style="display: none; border: none;background-color: rgb(56, 181, 174);" formaction="/tourreply/modify" class="btn btn-primary btn-sm"><span style="font-size: small;">수정 완료</span></button>
								<button type=button class="rp_cancle_btn btn btn-primary btn-sm" id="rp_cancle_btn${rp.seq }" style="display: none; border: none;background-color: rgb(56, 181, 174);" class="btn btn-primary btn-sm"><span style="font-size: small;">수정 취소</span></button>
							</c:if>
						</div>
						</c:if>
						
						<!-- 답글 달기 창  -->
						<div class="re_reply_input" id="re_reply_input${rp.seq }"  style="width: 100%; float: left; margin-top:5px; display:none;">
                            <div style="width: 5%; float: left; text-align: right; padding-right: 10px; color: orange;"><i class="fas fa-reply fa-rotate-180"></i></div>
                            <div class="re_rp_contents2" style="width: 95%; float: left;">
                            	<div class="re_reply_content">
                            		<input type=hidden value="${dto.seq}" name=writeseq>
                            		<input type=hidden value="${rp.seq}" name=rpseq>
                            		<input type=text placeholder="댓글을 입력하세요" name=recontents style="width: 100%; padding: 10px; outline:none;" autocomplete="off">
                            	</div>
                           	 	<div class="re_reply_input_btn" style="text-align: right; margin-top:10px; padding-right:20px;">
                                	<button type=submit formaction="/tourreply/rereply" class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">작성 완료</span></button>
                                	<button type=button class="rp_reply_cancle_btn btn btn-primary btn-sm" id="rp_reply_cancle_btn${rp.seq }" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">작성 취소</span></button>
                            	</div>
                            </div>
                        </div>
					
					<c:forEach var="re" items="${re_list }">
					<c:choose>
						<c:when test="${re.par_seq == rp.seq}">
                    		<div class="re_reply" id="re_reply${rp.seq }" style="width: 100%; float: left; margin-top:5px;"	>
                           		<div style="width: 5%; float: left; text-align: right; padding-right: 10px; color: orange;"><i class="fas fa-reply fa-rotate-180"></i></div>
                            	<div style="width: 95%; float: left;">
                           			<div class="re_rp_title" style="width: 100%;">
                               			<div class="re_rp_id" value="${re.mem_seq }" style="font-weight: bolder;width: 50%; display:inline-block; padding-left: 20px ;"> ${re.nick }</div>
                               			<div class="re_rp_time"  style="color: gray; width:  49%; display:inline-block; text-align: right; padding-right: 20px;">${re.writen_date }</div>
                           			</div>
                           			<div class="re_rp_contents" style="width: 100%;">
		                        		<div class="re_rp_content">
                               				<input type=text id="recontent${re.seq }" style="border:none; width:100%;" name="recontent" value="${re.contents}" readonly>
                               			</div>     
                               			<c:if test="${!empty loginNick }">
                               				<c:if test="${re.mem_seq == loginSeq}">
                               					<div class="re_rp_btns" style="text-align: right; margin-top:10px; padding-right:20px;"">
                               					<button type=button class="re_del_btn btn btn-primary btn-sm" id="re_del_btn${re.seq }" class="btn btn-primary btn-sm" style="border: none; background-color: rgb(56, 181, 174);"><span style="font-size: small;">댓글 삭제</span></button>
                            					<button type=button class="re_mod_btn btn btn-primary btn-sm" id="re_mod_btn${re.seq }" rpseq=${rp.seq } class="btn btn-primary btn-sm" style="border: none; background-color: rgb(56, 181, 174);"><span style="font-size: small;">댓글 수정</span></button>
                                				<button type=button class="re_modOk_btn btn btn-primary btn-sm" id="re_modOk_btn${re.seq }" rpseq=${rp.seq } style="display: none; border: none; background-color: rgb(56, 181, 174);" class="btn btn-primary btn-sm"><span style="font-size: small;">수정 완료</span></button>
                                				<button type=button class="re_cancle_btn btn btn-primary btn-sm" id="re_cancle_btn${re.seq }" style="display: none; border: none; background-color: rgb(56, 181, 174);" class="btn btn-primary btn-sm"><span style="font-size: small;">수정 취소</span></button>
                                				</div>
                                			</c:if>
                                		</c:if>                            		
                           			</div>
                                </div>
                        	</div>
                        </c:when>
                     </c:choose>
                     </c:forEach>
					</div>
					</div>
				</form>
			</c:forEach> 
		</div>

	<footer>
    	    <jsp:include page="../base/footer.jsp"></jsp:include>
    </footer>
	
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
	        <span id="profileTxt"></span>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" id="modalCloseBtn" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script>
  let wsObj = new Object();
	wsObj.seq = "${dto.seq}";
	wsObj.mem_seq = "${dto.mem_seq}";
	wsObj.loginSeq = "${loginSeq}";
	wsObj.title = "${dto.title}";
	wsObj.nick = "${dto.nick}";
	wsObj.board_num = "${dto.board_num}";
	wsObj.reactioner = "${loginNick}";
	$(document).on("click",".rp_id",function(){
		let mem_seq = $(this).attr("value");
		console.log(mem_seq);
		$.ajax({
			url:"/member/showMember?mem_seq="+mem_seq,
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
    			$("#profileTxt").text("자기소개 : "+result.text);
    			$("#profileMsg").attr("onclick","location.href='/member/msg?mem_seq="+mem_seq+"'");
    		}			
		})
		$(document).on("click",".re_rp_id",function(){
			let mem_seq = $(this).attr("value");
			console.log("대댓글 멤버 시퀀스 값 : " + mem_seq);
			$.ajax({
				url:"/member/showMember?mem_seq="+mem_seq,
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
    				$("#profileTxt").text("자기소개 : "+result.text);
    				$("#profileMsg").attr("onclick","location.href='/member/msg?mem_seq="+mem_seq+"'");
    			}			
			})
		})
		$('#modalCloseBtn').on("click",function(){
			$("#myModal").modal("toggle");
		})
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
			
			if(recontent==""){	    		
	    		alert("내용을 입력해주세요");
	    		
	    		return false;
	    	}

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
			
			let recontent = $("#recontent"+id).val();
			$("#recontent"+id).val("");
			$("#recontent"+id).focus();
			$("#recontent"+id).val(recontent);
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
			
			let rp_contents = $("#rp_contents" + id).val();	
			
			console.log(rp_contents);
			$("#rp_contents" + id).val("");
			$("#rp_contents" + id).focus();
			$("#rp_contents" + id).val(rp_contents);
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
	        	  var answer = confirm("댓글을 작성하시겠습니까?");
	        	  if(answer){
						wsObj.reaction = 'comment';
						ws.send(JSON.stringify(wsObj));
						$.ajax({
							url: "/member/reactionInserter",
							data: {reaction: JSON.stringify(wsObj)}
						});
	                $("#frmReply").submit();
	        	  }else{
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
        var sendData = {'boardId' : '${dto.seq}','heart' : that.prop('name')};        
        $.ajax({
            url :'/tourboard/heart',
            type :'POST',
            data : sendData,
            success : function(data){
                that.prop('name',data.heart);                
                var heart = data.heart;                
                if(heart==1) {
					wsObj.reaction = 'like';
					ws.send(JSON.stringify(wsObj));
					$.ajax({
					url: "/member/reactionInserter",
					data: {reaction: JSON.stringify(wsObj)}
					});
                    $('#heart').prop("src","/images/like.png");
                    $("#rec_count").html(" " + data.likeCount);
                }
                else{
                    $('#heart').prop("src","/images/dislike.png");
                    $("#rec_count").html(" " + data.likeCount);
                }
            }
        });
    });
    </script>
    
    <!-- 비회원이 하트 클릭시  -->
    <script>
    	$(".heart_nonmem").on("click",function(){
    		alert("로그인 후 이용하세요");
    	});
    </script>

</body>
</html>