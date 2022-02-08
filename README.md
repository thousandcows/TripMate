# 🏖️나만의 여행플래너 [Trip Mate]🏕️
<a href="http://3.38.78.110" target="_blank"><img src="https://user-images.githubusercontent.com/87923533/152968977-f1923592-f695-48f3-88b8-253c06651702.jpg"  width="73%" height="73%"></a> :point_left:Click

# Contents 
  [1. 개요](#개요)<br>
  [2. 설계의 주안점](#설계의-주안점)<br>
  [3. 사용기술 및 개발환경](#사용기술-및-개발환경)<br>
  [4. 프로젝트 기능 및 팀원소개](#프로젝트-기능-및-팀원소개)<br>
  [5. Document](#문서)
***
## 개요
<img src="https://user-images.githubusercontent.com/87923533/152974236-c656c161-1414-4564-862c-d2e2236534dc.png"  width="90%" height="90%">
<img src="https://user-images.githubusercontent.com/87923533/152974303-7bcd39f1-0ad5-4bed-b17c-7a6f6f998b0b.png"  width="90%" height="90%">

***
## 설계의 주안점
* Spring Legacy Project(MVC 구조)
* 자유롭게 여행을 계획하고 저장하고 기록한다.
* 사용자가 ‘재미있게’, ‘능동적으로’ 여행을 계획하고 
경험을 공유할 수 있도록 한다.
***
## 사용기술 및 개발환경

Language | Java 11, Servlet/JSP, HTML5, CSS3, JavaScript, XML 
------------ | ------------- 
Framework | Spring Framework, MyBatis, Bootstrap
Database|Oracle 11g Express Edition
WAS & Server | Apache Tomcat 8.5, AWS
Open Api|TourAPI3.0, SB Admin2, Kakao 로그인, Kakao 지도
설계분석도구|ERDCloud, oven
IDE|Eclipse / sqldeveloper
Version Control System|Git / github

***
## 프로젝트 기능 및 팀원소개

#### <img src="https://user-images.githubusercontent.com/87923533/152647244-7f8664d1-0df7-4c25-95db-666091ef5428.jpg"  width="100" height="100"> 임도혁 <a href="https://github.com/LimdoH" target="_blank"><img src="https://img.shields.io/badge/GitHub-black?style=flat&logo=GitHub&logoColor=#181717"/></a>
  *  여행지
      * 한국관광공사 API 활용 여행지 정보 출력
      * 회원별 찜 기능
      * 사진,별점 첨부 댓글 기능
      * 카카오 지도 API 활용 장소 출력
      * 댓글 별점 참조 평점 출력
  * 여행계획관리
     * 일정 생성/수정
     * 계획 일정 drag&drop 순서 정렬
     * 상세 일정 조정
  * 기타 기능
     * 프로필 조회
  * 개발 외
     * 개발 일정 관리  
#### <img src="https://user-images.githubusercontent.com/87923533/152647260-908ae1e6-c229-4338-9f91-d33f5a26f24b.jpg"  width="100" height="100"> 서승희 <a href="https://github.com/hevly" target="_blank"><img src="https://img.shields.io/badge/GitHub-black?style=flat&logo=GitHub&logoColor=#181717"/></a>
  *  대기능
      * 소기능
  * 대기능
     * 소기능
     * 소기능
  * 대기능
    * 소기능
    * 소기능
#### <img src="https://user-images.githubusercontent.com/87923533/152647274-3268cc34-e609-4947-aa32-89a1f2ebd5e3.jpg"  width="100" height="100"> 이진호 <a href="https://github.com/Hogrii" target="_blank"><img src="https://img.shields.io/badge/GitHub-black?style=flat&logo=GitHub&logoColor=#181717"/></a>
  * 여행지 게시판
     * 검색
     * 페이징
     * 좋아요
     * 댓글
     * 대댓글
  * 관리자 게시판
     * 멤버 관리
     * 게시판(게시글) 관리
     * 공지사항 관리
  * 개발 외
     * ppt
     * 회의록 관리
#### <img src="https://user-images.githubusercontent.com/87923533/152647281-ad39fc5f-3f63-438d-a28e-a12eef4f75c3.jpg"  width="100" height="100"> 정혜주 <a href="https://github.com/hyejoojung719" target="_blank"><img src="https://img.shields.io/badge/GitHub-black?style=flat&logo=GitHub&logoColor=#181717"/></a>
  *  동행 게시판
      * 폼 및 글 작성(썸머노트)
      * 리스트 출력
      * 검색
      * 페이징
      * 좋아요
      * 댓글
      * 대댓글
      * 매칭
  * 관리자 대시보드
     * 일별 신규회원, 게시글, 방문자 수 출력
     * 신규 회원, 게시글 수 line chart
     * 회원 성별, 여행 게시판 카테고리 비율 doughnut chart
     * SB Admin2, chart.js 사용
  *  서비스 소개 페이지
      * 풀 페이지
  * 개발 외
    * ppt
#### <img src="https://user-images.githubusercontent.com/87923533/152647288-4a51e539-5bd1-49c2-9164-c125ed12e1d1.jpg"  width="100" height="100"> 천현우 <a href="https://github.com/thousandcows" target="_blank"><img src="https://img.shields.io/badge/GitHub-black?style=flat&logo=GitHub&logoColor=#181717"/></a>
  * 프로젝트 컨셉 기획
  * 회의록 작성 
#### <img src="https://user-images.githubusercontent.com/87923533/152647296-eda1be7b-a985-453e-9033-343c1804c534.jpg"  width="100" height="100"> 홍진규 <a href="https://github.com/Carroth23" target="_blank"><img src="https://img.shields.io/badge/GitHub-black?style=flat&logo=GitHub&logoColor=#181717"/></a>
  *  로그인&회원가입
      * AJAX 비동기 & 동기식 체크
      * OAuth2.0 표준 RESTAPI 카카오 로그인
      * javax.mail 이메일 인증 PW찾기
  * 마이페이지
     * 정보수정 & 프로필사진, PW변경
     * 찜한 여행지 출력
     * 모든게시판 내가 쓴 글 출력 및 선택삭제
  * 실시간 알림
    * 댓글, 좋아요, 동행요청시 하단 실시간 알림
    * 과거 알림내역 확인 및 삭제
  * 개발 외
     * GIT 관리
     * AWS 서버담당
***

## 문서

- ERD
<img src="https://user-images.githubusercontent.com/87923533/152971107-e4408134-c049-40a4-9435-9f06723ed281.png">

- 보고서 및 발표PPT<br>
  - [기획보고서.pdf](https://github.com/Carroth23/KHFinalProject/files/8023187/_.pdf)<br>
  - [파이널 발표자료.pdf](https://github.com/Carroth23/KHFinalProject/files/8024171/4._.pdf)
