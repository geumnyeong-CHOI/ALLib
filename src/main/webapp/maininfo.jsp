<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="vo.SeatVO"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
String uid = (String) session.getAttribute("USER_ID");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ALLib - 도서관 소개</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.css">
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="./css/header_footer_font.css">
<style>

span.mapSpan {	text-align: center;}

div#daumRoughmapContainer1695275783553 { max-width: 100%;}

h4.htitle{text-align: center;}

p.text {font-size: 16px; word-break: keep-all;}

div.row{ margin : 20px 0;}

div.picCon {margin-bottom: 15px;} 


/* 캐러셀 반응형 */
@media ( min-width: 280px ) {.container{margin: 0 auto;	padding: 0;} .condiv{min-width: 250px;} .carP1{font-size: 1rem;} .carP2{font-size: 0.8rem;} p.carP1, p.carP2{margin: 0;}}	
@media ( min-width: 400px ) {.container{margin: 0 auto; padding: 0;} .condiv{min-width: 350px;} .carP1{font-size: 1rem;} .carP2{font-size: 0.8rem;} p.carP1, p.carP2{margin: 0;}}	
@media ( min-width: 576px ) {.container{margin: 0 auto; padding: 0;} .condiv{min-width: 400px;} .carP1{font-size: 1.3rem;} .carP2{font-size: 1.1rem;} p.carP1, p.carP2{margin: 0;}}	
@media ( min-width: 768px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 690px;} .carP1{font-size: 1.3rem;} .carP2{font-size: 1.1rem;} p.carP1, p.carP2{margin: 0;}}	
@media ( min-width: 1024px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 930px;} .carP1{font-size: 1.5rem;} .carP2{	ont-size: 1.3rem;} p.carP1, p.carP2{margin: 0;}}
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
<div class="sectiondiv">
<div class="carConSize">
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
						<p class="carP1">시민 가까이에 다가가는 작은 도서관</p>
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

		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-5 picCon">
				<img src="./img/library4.jpg"
					style="max-width: 100%; height: auto; border-radius: 5%;"
					class="mx-auto d-block" />
			</div>

			<div class="col-sm-5">
				<h3 class="main">고맙습니다 ALLib도서관</h3>
				<br>
				<p class="text">
					allib도서관은 지역주민과 지역사회, 지자체가 함께 만든 정감 넘치는 마을공동체 작은도서관입니다.
					안양시와 지역주민들의 노력으로 2011년 '고맙습니다 작은도서관'에 선정 되어 문화체육관광부, MBC,
					(사)작은도서관만드는사람들, 국민은행의 후원을 받아 안양시청에서 조성한 시립작은도서관으로 안양역 부근에
					자리하고 있습니다. 걸음마하는 아이를 데리고 와서 책을 읽어주는 엄마가 있고 학교
					갔다가 가방을 맨 채 도서관으로 달려와서 책을 읽는 아이들이 있고 장바구니를 들고 잠깐 들러 원하는
					책을 대출해가는 주부들이 있고 어른아이부터 어르신들까지 누구나 편안하게 찾아오는 도서관입니다.
					allib도서관은 마을 안에서 책과 함께 문화를 만나고 사람을 만나는 곳입니다.
				</p>
			</div>
			<div class="col-sm-1"></div>
		</div>

	<br>
	<hr>
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-5 picCon">
				<span class="mapSpan" style="width: 640px; max-width: 100%; margin: 0 auto;">
					<h4 class="htitle">약도</h4>
					<div id="daumRoughmapContainer1695275783553" class="root_daum_roughmap root_daum_roughmap_landing"></div> 
					<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
					<script charset="UTF-8">
						new daum.roughmap.Lander({
							"timestamp" : "1695275783553",
							"key" : "2g9vr",
							"mapWidth" : "640",
							"mapHeight" : "360"
						}).render();
					</script>
				</span>
			</div>

			<div class="col-sm-5">

				<h4 class="htitle">교통편</h4>
				<p class="text">
				<br> <strong>■ 주소</strong>
				<br> - 경기 안양시 만안구 안양로314번길 10 광창빌딩 3층 <br> <br> <strong>■ 버스</strong>
				<br> - 일반 :15, 15-2, 88, 5530, 5531, 5623, 8-2<br> - 마을버스 : 02 <br> <br>
				<strong>■ 지하철</strong><br> - 안양역 지하상가 13번출구 바로 앞 광창빌딩 3층 <br>
				<br> <strong>■ 문의</strong><br> - 전화번호 : 031-447-1414
				</p>
			</div>
			<div class="col-sm-1"></div>
		</div>
</div></div>
	</section>
</div>

<div class="goTop">
<a href="./main.jsp"><img src="./img/home_icon.png" class="mapicon" id="homeicon" alt="gohome"></a> 
<a href="#"><img src="./img/gotop_icon.png" class="mapicon" id="topicon" alt="gotop"></a>
</div>
<footer>
	<nav>
		Project ALLib<br> copyright ⓒ2023 Himedia Academy, All Rights
		Reserved.<br> 삶은 계란&nbsp;|&nbsp;정하늘 홍기락 최영호 유미애 김주형 임금준 류동현 박경진
		최금녕
	</nav>
</footer>
</body>
</html>
