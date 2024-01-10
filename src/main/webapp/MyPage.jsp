<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@page import="vo.*"%>
<%
String uid = (String) session.getAttribute("USER_ID");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="./css/header_footer_font.css">
<title>ALLib - My Page</title>
<style>
@media screen and (min-width: 1024px) and (orientation: landscape) { html , body{margin:0px; padding:0px;} .column.side, .column.middle{width:100%;} }
.nav-itemB{border-right: 2px solid #140909;}
@media (max-width: 576px) { .nav-itemB { border-right: none; border-bottom: 1px solid lightgrey; }}
.row{ margin: 20px 0; }
.mpMain { text-align:center; margin: 0 auto;}
/* 캐러셀 반응형 */
@media ( min-width: 280px ) {.container{margin: 0 auto;	padding: 0;} .condiv{min-width: 250px;} .carP1{font-size: 1rem;} .carP2{font-size: 0.8rem;} p.carP1, p.carP2{margin: 0;}}	
@media ( min-width: 400px ) {.container{margin: 0 auto; padding: 0;} .condiv{min-width: 350px;} .carP1{font-size: 1rem;} .carP2{font-size: 0.8rem;} p.carP1, p.carP2{margin: 0;}}	
@media ( min-width: 576px ) {.container{margin: 0 auto; padding: 0;} .condiv{min-width: 400px;} .carP1{font-size: 1.3rem;} .carP2{font-size: 1.1rem;} p.carP1, p.carP2{margin: 0;}}	
@media ( min-width: 768px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 690px;} .carP1{font-size: 1.3rem;} .carP2{font-size: 1.1rem;} p.carP1, p.carP2{margin: 0;}}	
@media ( min-width: 1024px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 930px;} .carP1{font-size: 1.5rem;} .carP2{font-size: 1.3rem;} p.carP1, p.carP2{margin: 0;}}
@media ( min-width: 1199px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 1100px;} .carP1{font-size: 1.5rem;} .carP2{font-size: 1.3rem;} p.carP1, p.carP2{margin: 0;}}

/* footer*/
	footer {width: 100%; background-color: #e3e3e3; padding: 10px ;	text-align: center;	font-size:12px;	height: 100px;	}
	#wrapper{min-height: calc(100vh - 100px);}

/* 홈,위로가기 버튼 */
	img.mapicon { width: 30px; height: 30px;}
	.mapicon { position:fixed; background-color: white; padding: 5px; z-index:9999; border: 3px solid #c9c7c7;}
	.mapicon:hover { border-color: #6A5ACD;}
	#homeicon { border-radius: 5px 0 0 5px; right: 45px; bottom: 20px; }
	#topicon { border-radius: 0 5px 5px 0; right: 20px; bottom: 20px;} 
</style>
</head>
<body>
<div id="wrapper">
<header>

<%if(uid != null) {%>
<div>
	<nav class="navbar headernav">
		<a class="nav navbar-left nava" href="./main.jsp"><b>ALLib</b></a>
		<ul class="nav navbar-right">
		    <li class="nav-item">
            	<a class="nav-link nava" id="mypageBtn" href="<%=request.getContextPath() %>/MyPage.jsp">마이페이지</a>           
       		</li>
		    <li class="nav-item">
		      <a class="nav-link nava" id="loginBtn" href="./userLogout.us">로그아웃</a>
		    </li>
		</ul>
	</nav>
</div>
 <%} else if(uid == null) { %>
 <div>
	<nav class="navbar headernav">
		<a class="nav navbar-left nava" href="./main.jsp"><b>ALLib</b></a>
		<ul class="nav navbar-right">
		    <li class="nav-item">
		      <a class="nav-link nava" id="loginBtn" href="./loginForm.jsp">로그인</a>
		    </li>
		</ul>
	</nav>
</div>
 <%}; %>

<div class="sectionNavDiv">
	<nav class="navbar sectionnav">
		<a class="navbar-brand navbar-middle nava" href="./main.jsp"><img src="./img/projectLogo.png" id="logo" alt="Logo"><span class="secNavTitle">올리브 도서관</span></a>
	</nav>
</div>
</header>

<section>
<div id="demo" class="carousel slide" data-ride="carousel">
	    <ul class="carousel-indicators"> 
	        <li data-target="#demo" data-slide-to="0" class="active"></li>
	        <li data-target="#demo" data-slide-to="1"></li>
	        <li data-target="#demo" data-slide-to="2"></li>
	        <li data-target="#demo" data-slide-to="3"></li>
	    </ul>
	    <div class="carousel-inner">
	        <div class="carousel-item active">
	            <img src="./img/library1.jpg" alt="library1">
	            <div class="carousel-caption">
	                <p class="carP1">당신의 교양이 자라는 지식의 보고</p>
	                <p class="carP2">ALLib 도서관에 어서오세요.</p>
	            </div>
	        </div>
	        <div class="carousel-item">
	            <img src="./img/library3.jpg" alt="library3">
	            <div class="carousel-caption">
	                <p class="carP1">국내 최대 규모의 도서관</p>
	                <p class="carP2">원하는 모든 책이 ALLib에 있습니다.</p>
	            </div>
	        </div>
	        <div class="carousel-item">
	            <img src="./img/library11.jpg" alt="library11">
	            <div class="carousel-caption">
	                <p class="carP1">안락한 열람실</p>
	                <p class="carP2">집중력을 높일 수 있는 최적의 환경 조성</p>
	            </div>
	        </div>
	        <div class="carousel-item">
	            <img src="./img/library13.jpg" alt="library13">
	            <div class="carousel-caption">
	                <p class="carP1">운영시간</p>
	                <p class="carP2 carP2mar">도서대여 : 오전 09:00 ~ 오후 18:00</p>
	                <p class="carP2">열람실 : 연중무휴 24시 운영(공휴일 단축운영)</p>
	            </div>
	        </div>        
	    </div>	    
	</div>
<div class="container-fluid">
<div class="row">
	<nav class="col-12 col-sm-3" id="sideMenu">
	<ul class="nav nav-pills flex-column">

            <li class="nav-itemB ">
            <a class="nav-link active" style="color: black; background-color: rgb(255,255,255,0.5);" href="./updateUserAction.us">나의 정보</a>
             </li>
             
             <li class="nav-itemB ">
            <a class="nav-link active" style="color: black; background-color: rgb(255,255,255,0.5);" href="./BookRentalAction.book">대여 도서 확인</a>
             </li>
             
             <li class="nav-itemB ">
            <a class="nav-link active" style="color: black; background-color: rgb(255,255,255,0.5);" href="./SeatMyChkAction.me">좌석 예약</a>
             </li>
             
             <li class="nav-itemB ">
            <a class="nav-link active" style="color: black; background-color: rgb(255,255,255,0.5);" href="./myQnaList.qna">나의 질문</a>
             </li>
	</ul>	
	</nav>	
	
	<div class="mpMain"><br><br><b><%=uid %></b>님, 반갑습니다. </div>
</div>
</div>
</section></div>
<div class="goTop">
	<a href="./main.jsp"><img src="./img/home_icon.png" class="mapicon" id="homeicon" alt="gohome"></a> 
	<a href="#"><img src="./img/gotop_icon.png" class="mapicon" id="topicon" alt="gotop"></a>
</div>
	<footer>
        <nav><br>
            Project ALLib<br>
            copyright ⓒ2023 Himedia Academy, All Rights Reserved.<br>
            삶은 계란&nbsp;|&nbsp;정하늘 홍기락 최영호 유미애 김주형 임금준 류동현 박경진 최금녕
        </nav>
    </footer>
</body>
</html>