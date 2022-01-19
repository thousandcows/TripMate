<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>Mypage</title>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
      <link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      
      <style>
        /* 간단세팅 나중에 css파일 따로 뺄거*/
        * {
          box-sizing: border-box;
          padding: 0;
          margin: 0;
          list-style: none;
        }

        a {
          text-decoration: none;
        }

        /* 전체영역 크기 조절 */
        .myPageContainer {
          width: 1200px;
          display: flex;
          margin: auto;
        }

        /* 사이드바 시작 */
        .sideBar {
          width: 200px;
          height: 1200px;
          background-color: rgb(240, 240, 240);
        }

        /* 초상화 공간 */
        .sideMyPortrait {
          width: 150px;
          height: 150px;
          margin-left: 25px;
          position: relative;
        }
 
        .sideMyNick {
          width: 100%;
          height: 40px;
          line-height: 40px;
          text-align: center;
          /* background-color: aqua; */
        }

        /* 사이드바 메뉴 */
        .sideBarMenuBox {
          margin-top: 50px;
        }

        .sideBarMenuBox li {
          margin-top: 20px;
        }

        .sideBarMenuBox li a {
          width: 140px;
          height: 40px;
          border-radius: 20px;
          line-height: 40px;
          text-align: center;
          background-color: antiquewhite;
          display: block;
          color: black;
          box-shadow: 1px 1px 2px 1px rgb(224, 224, 224);
        }

        .sideBarMenuBox li a:hover {
          box-shadow: 1px 1px 2px 1px rgb(211, 211, 211);
        }

        .sideBarMenuBox li:first-child a {
          background-color: rgb(255, 228, 193);
        }

        /* 사이드바 끝 */

        /* 정보수정 시작 */
        .contentsBox {
          display: flex;
          flex-direction: column;
        }

        .contentsTop {
          width: 1000px;
          background-color: bisque;
          height: 50px;
          line-height: 50px;
          text-align: center;
          font-size: 26px;
        }

    	.star{
    		float:right;
    	}
    	
    	.star>li{
    		float:left;
    	}

        /* 정보수정 끝 */
        footer {
          width: 100%;
          height: 300px;
          background-color: aliceblue;
        }
      </style>
    </head>

    <body>
      <div class="myPageContainer">
        <div class="sideBar">
          <div class="sideMyPortrait">
            <img src="/resources/images/default_profile.png" class="portraitPhoto">
          </div>
<!--           <div class="sideMyNick">${loginInfo.nick}</div> -->
          <ul class="sideBarMenuBox">
            <li><a href="/member/mypageGo">개인정보 수정</a></li>
            <li><a href="/member/tourList">여행 기록</a></li>
            <li><a href="/member/saveList">찜 여행 목록</a></li>
            <li><a href="/member/writenList">게시글 관리</a></li>
          </ul>
        </div>
        <div class="contentsBox">
          <div class="contentsTop">
            찜 목록
          </div>
          <div class="container">
            <div class="row justify-content-center mt-4">
		<c:forEach var='cnt' begin='1' end='10'>
         	<div class="col-9 align-self-center mt-4">
						<div class="row">
							<div class="col-4">
								<img  style="heigth:100px;"  class="w-100"
									src="https://w.namu.la/s/45507892b4f48b2b3d4a6386f6dae20c28376a8ef5dfb68c7cc95249ec358e3e68df77594766021173b2e6acf374b79ce02e9eeef61fcdf316659e30289e123fbddf6e5ec3492eddbc582ee5a59a2ff5d6ee84f57ad19277d179b613614364ad">
							</div>
							<div class="col-8">
								<div class="row">
									<div class="col-10">여행지 제목</div>
									<div class="col-2 text-end">
									<span class="material-icons md-36 red" id=save>
									favorite_border</span>
									</div>
								</div>
								<div class="row">
									<div class="col">주소</div>
								</div>
								<div class="row">
									<div class="col">연락처</div>
								</div>

								<div class="row align-items-end mb-0  h-50">
									<div class="col">
										<ul class="list-group-horizontal star p-0">
											<li>평점</li>
										<c:forEach var='asd' begin='1' end='5'>
											<li>
											<svg xmlns="http://www.w3.org/2000/svg"
													style="width: 20px; height: 20px;" class="float-start p-0"
													viewBox="0 0 20 20" fill="currentColor">
							    <defs>
							        <linearGradient id="half_grad1">
							        		<stop offset="100%" stop-color="orange" />
							        </linearGradient>
							    </defs>
						  <path	d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"
														fill="url(#half_grad1)" stroke-width="1" stroke="orange" />
								</svg>
								</li>
										</c:forEach>
										</ul>			
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
            </div>
            
         <div class="row mt-4 mb-4" id="seeMoreTag">
			<div class="col text-center">
				<button type="button" class="btn btn-success" id="seeMore">더보기</button>
			</div>
		</div>
            
          </div>
        </div>
      </div>
      <footer>
        푸우터
      </footer>


<script>
//let printNum = ${printNum};
//let replyCount = ${replyCount};
//let staticNo = ${staticNo};
let printNum = 10;
let replyCount = 50;
let staticNo = 10;
  $("#seeMore").on("click",function(){
        $.ajax({
    		url:"/member/moreSaving?printNum="+printNum+"&replyCount="+replyCount,
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
						
						'<div class="col-9 align-self-center mt-4">'+
						'<div class="row">'+
							'<div class="col-4">'+
								'<img  style="heigth:100px;"  class="w-100"'+
									'src="https://w.namu.la/s/45507892b4f48b2b3d4a6386f6dae20c28376a8ef5dfb68c7cc95249ec358e3e68df77594766021173b2e6acf374b79ce02e9eeef61fcdf316659e30289e123fbddf6e5ec3492eddbc582ee5a59a2ff5d6ee84f57ad19277d179b613614364ad">'+
							'</div>'+
							'<div class="col-8">'+
								'<div class="row">'+
									'<div class="col-10">여행지 제목</div>'+
									'<div class="col-2 text-end">'+
									'<span class="material-icons md-36 red" id=save>'+
									'favorite_border</span>'+
									'</div>'+
								'</div>'+
								'<div class="row">'+
									'<div class="col">주소</div>'+
								'</div>'+
								'<div class="row">'+
									'<div class="col">연락처</div>'+
								'</div>'+
								
								'<div class="row align-items-end mb-0  h-50">'+
									'<div class="col">'+
										'<ul class="list-group-horizontal star p-0">'+
											'<li>평점</li>'+
											'<li>'+
											'<svg xmlns="http://www.w3.org/2000/svg"'+
													'style="width: 20px; height: 20px;" class="float-start p-0"
													'viewBox="0 0 20 20" fill="currentColor">'+
							    '<defs>'+
							        '<linearGradient id="half_grad1">'+
							        		'<stop offset="100%" stop-color="orange" />'+
							        '</linearGradient>'+
							    '</defs>'+
						  '<path	d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"
														'fill="url(#half_grad1)" stroke-width="1" stroke="orange" />'+
								'</svg>'+
								'</li>'+
										'</ul>'+			
									'</div>'+
								'</div>'+
							'</div>'+
						'</div>'+
				)
    		}
    	  })
   })

</script>
  
    </body>

    </html>