<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="./css/header_footer_font.css">
<title>ALLib 도서관</title>

<style>

body{word-break: keep-all;}
.menubtndiv{text-align: center;}
.sectiondiv{ height:auto; min-height: 100%; padding-bottom: 250px; background-color: #f3f3f3; }

/* 메뉴 */
div #menuback{ background-color: white; margin: 0 auto; min-width: 200px; padding: 15px 0; }
div h4.menuname{ font-weight: bold; width: 170px; margin: 0 80% 20px 10% ; }
.menudivbox{ display: inline-block; border: 1px solid #E3E3E3; width: 25%; min-width: 150px; max-width: 250px; height: 150px;  }
.menudiv{  margin-top: 25px; display: inline-block; width: 150px; height: 100px;  }
img.menuicon{ width: 70px; height: 70px; }
a span{color: black;} 
a img{margin-bottom: 10px;}

/* 검색 */
input:-webkit-autofill { -webkit-box-shadow: 0 0 0 30px #fff inset ; -webkit-text-fill-color: #000; }
input:-webkit-autofill, input:-webkit-autofill:hover, input:-webkit-autofill:focus, input:-webkit-autofill:active { transition: background-color 5000s ease-in-out 0s; }
#searchbox{	margin: 10px 0;	min-width: 200px;	background-color: #6A5ACD;}
button, #searchbox{ width: 100%; height: 100%;}
.stext{	width: 80%; border-right: none;	flex-grow: 2;	border-radius: 0;	border: 2px solid #6A5ACD;}
.sbtn{ width: 20%;	flex-grow: 0;	background-color: #6A5ACD;	color: white;	border-radius: 0;}
.stext:focus, .sbtn:focus{	box-shadow: none !important;	border-color: #6A5ACD;}

/* 메뉴 반응형 */
@media ( min-width: 280px ) {
	/* 메뉴 */
	
	div #menuback{
		background-color: white;
		margin: 0 auto;
		min-width: 300px;
		padding: 5px 50px 25px 50px;
	}
	
	div h4.menuname{
		font-weight: bold;
		width: 170px;
		margin: 10px auto ;
	}
	
	.menudivbox{
		display: inline-block;
		border: 1px solid #E3E3E3;
		width: 25%;
		min-width: 150px;
		max-width: 250px;
		height: 150px;
	}
	
	.menudiv{ 
		margin-top: 25px;
		display: inline-block;
		width: 150px;
		height: 100px;
		
	}
	
	img.menuicon{
		width: 70px; 
		height: 70px;
	}
	
	a span{
		color: black;
	} 
	a img{
		margin-bottom: 10px;
	}
	
	.webdiv{
		border-bottom: none;
	}
	
}	

@media ( min-width: 400px ) {
	/* 메뉴 */
	
	div #menuback{
		background-color: white;
		margin: 0 auto;
		min-width: 200px;
		padding: 5px 50px 25px 50px;
	}
	
	div h4.menuname{
		font-weight: bold;
		width: 170px;
		margin: 10px auto ;
		
	}
	
	.menudivbox{
		display: inline-block;
		border: 1px solid #E3E3E3;
		width: 25%;
		min-width: 150px;
		max-width: 250px;
		height: 150px;
	}
	
	.menudiv{ 
		margin-top: 25px;
		display: inline-block;
		width: 150px;
		height: 100px;
		
	}
	
	img.menuicon{
		width: 70px; 
		height: 70px;
	}
	
	a span{
		color: black;
	} 
	a img{
		margin-bottom: 10px;
	}
	
	.tabdivt{
		border-bottom: none;
	}
	
	.tabdivl{
		border-right: none;
	}
	
}	
@media ( min-width: 576px ) {
	/* 메뉴 */
	
	div #menuback{
		background-color: white;
		margin: 0 auto;
		min-width: 200px;
		padding: 5px 50px 25px 50px;
	}
	
	div h4.menuname{
		font-weight: bold;
		width: 170px;
		margin: 10px auto ;
		
	}
	
	.menudivbox{
		display: inline-block;
		border: 1px solid #E3E3E3;
		width: 25%;
		min-width: 150px;
		max-width: 250px;
		height: 150px;
	}
	
	.menudiv{ 
		margin-top: 25px;
		display: inline-block;
		width: 150px;
		height: 100px;
		
	}
	
	img.menuicon{
		width: 70px; 
		height: 70px;
	}
	
	a span{
		color: black;
	} 
	a img{
		margin-bottom: 10px;
	}
	
	.tabdivt{
		border-bottom: none;
	}
	
	.tabdivl{
		border-right: none;
	}
	
}	
@media ( min-width: 768px ) {
	/* 메뉴 */
	
	div #menuback{
		background-color: white;
		margin: 0 auto;
		min-width: 200px;
		padding: 25px 20px;
	}
	
	div h4.menuname{
		font-weight: bold;
		width: 170px;
		margin: 0 80% 20px 5% ;
		
	}
	
	.menudivbox{
		display: inline-block;
		border: 1px solid #E3E3E3;
		width: 20%;
		min-width: 150px;
		max-width: 250px;
		height: 150px;
		
	}
	
	.menudiv{ 
		margin-top: 25px;
		display: inline-block;
		width: 150px;
		height: 100px;
		margin: ; 
	}
	
	img.menuicon{
		width: 70px; 
		height: 70px;
	}
	
	a span{
		color: black;
	} 
	a img{
		margin-bottom: 10px;
	}
	
	.webdiv{
		border-right: none;
	}
}	

@media (min-width: 1024px){
	/* 메뉴 */
	
	div #menuback{
		background-color: white;
		margin: 0 auto;
		min-width: 200px;
		padding: 25px 20px;
	}
	
	div h4.menuname{
		font-weight: bold;
		width: 170px;
		margin: 0 80% 20px 10% ;
	}
	
	.menudivbox{
		display: inline-block;
		border: 1px solid #E3E3E3;
		width: 20%;
		min-width: 150px;
		max-width: 250px;
		height: 150px;
		
	}
	
	.menudiv{ 
		margin-top: 25px;
		display: inline-block;
		width: 150px;
		height: 100px;
		margin: ; 
	}
	
	img.menuicon{
		width: 70px; 
		height: 70px;
	}
	
	a span{
		color: black;
	} 
	a img{
		margin-bottom: 10px;
	}
	
	.webdiv{
		border-right: none;
	}
}

@media ( min-width: 1199px ) {
	/* 메뉴 */
	
	div #menuback{
		background-color: white;
		margin: 0 auto;
		min-width: 200px;
		padding: 25px 20px;
	}
	
	div h4.menuname{
		font-weight: bold;
		width: 200px;
		margin: 0 80% 20px 5% ;
		
	}
	
	.menudivbox{
		display: inline-block;
		border: 1px solid #E3E3E3;
		width: 25%;
		min-width: 150px;
		max-width: 250px;
		height: 150px;
		
	}
	
	.menudiv{ 
		margin-top: 25px;
		display: inline-block;
		width: 150px;
		height: 100px;
		margin: ; 
	}
	
	img.menuicon{
		width: 70px; 
		height: 70px;
	}
	
	a span{
		color: black;
	} 
	a img{
		margin-bottom: 10px;
	}
	
	.webdiv{
		border-right: none;
	}
}

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

<div class="container condiv">

	<div class="menubtndiv" >
	<div id="searchbox">
		<form action="./bookUSearchAction.book" method="post" class="form-inline">
			<input type="text" class="form-control stext searchI" name="book_search" placeholder="책 제목, 작가명으로 검색">
			<input type="submit" class="btn sbtn searchI" value="검색">
		</form>
	</div>
	
	<div id="menuback" class="container">
		<h4 class="menuname">주요서비스</h4>
		<div id="menubox">
			<div class="menudivbox webdiv tabdivt tabdivl "><div class="menudiv"><a class="bookMenu " href="bookUListAction.book"><img src="./img/book_icon.png" class="menuicon" id="bookicon" alt="bookmenu"><br><span>도서</span></a></div></div><div class="menudivbox webdiv tabdivt"><div class="menudiv"><a class="seatMenu " href="<%=request.getContextPath() %>/SeatSelc.jsp"><img src="./img/seat_icon.png" class="menuicon" id="seaticon" alt="seatmenu"><br><span>좌석</span></a></div></div><div class="menudivbox webdiv tabdivl"><div class="menudiv"><a class="qnaMenu " href="<%=request.getContextPath() %>/qnaMain.jsp"><img src="./img/qna_icon2.png" class="menuicon" id="qnaicon" alt="qnamenu"><br><span>자주 묻는 질문</span></a></div></div><div class="menudivbox"><div class="menudiv"><a class="libMenu " href="./maininfo.jsp"><img src="./img/library_icon.png" class="menuicon" id="libinfoicon" alt="libraryInfo"><br><span>도서관 소개</span></a></div></div>
		</div>
	</div>
</div></div></div>

</div>

</section>
<div class="goTop">
<a href="./main.jsp"><img src="./img/home_icon.png" class="mapicon" id="homeicon" alt="gohome"></a> 
<a href="#"><img src="./img/gotop_icon.png" class="mapicon" id="topicon" alt="gotop"></a></div>
</div>
	<footer>
        <nav>
            <span>Project ALLib</span><br>
            <span>copyright ⓒ2023 Himedia Academy, All Rights Reserved.</span><br>
            <span>삶은 계란<span class="slash">&nbsp;|&nbsp;</span>정하늘 홍기락 최영호 유미애 김주형 임금준 류동현 박경진 최금녕</span>
        </nav>
    </footer>
</body>
</html>