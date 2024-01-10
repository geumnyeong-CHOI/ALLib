<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<title>ALLib - QNA 글쓰기</title>
<style>

  img.mapicon { width: 30px; height: 30px;}
   .mapicon { position:fixed; background-color: white; padding: 5px; z-index:9999; border: 3px solid #c9c7c7;}
   .mapicon:hover { border-color: #6A5ACD;}
   #homeicon { border-radius: 5px 0 0 5px; right: 45px; bottom: 20px; }
   #topicon { border-radius: 0 5px 5px 0; right: 20px; bottom: 20px;} 


	table {
	    margin-left:auto; 
	    margin-right:auto;
	    width : 100%;
	}
	
	td > input {
		width : 100%;
	}
	
	table, 
	.write{
		text-align: center;
	}
	
	form>table{
		font-family: 'nunito';
	}
	
	.container {
		margin: auto;
		justify-content: center;
	}
	
	#icon {
		border: 1px solid #e3e3e3;
		padding: 10px;
		border-radius: 15px;
	}
	
	table{border-collapse: collapse;}
	
	textarea {
		resize: none;
		border: none;
		width: 100%;
	}
	input:hover {
		outline: none;
	}
	input:focus{
		outline: none;
	}
    
     * 캐러셀 반응형 */
	@media ( min-width: 280px ) {.container{margin: 0 auto;   padding: 0;} .condiv{min-width: 250px;} .carP1{font-size: 1rem;} .carP2{font-size: 0.8rem;} p.carP1, p.carP2{margin: 0;} div.qna-form-div, .btn { width : 90%; }}   
	@media ( min-width: 400px ) {.container{margin: 0 auto; padding: 0;} .condiv{min-width: 350px;} .carP1{font-size: 1rem;} .carP2{font-size: 0.8rem;} p.carP1, p.carP2{margin: 0;} div.qna-form-div, .btn { width : 90%; }}   
	@media ( min-width: 576px ) {.container{margin: 0 auto; padding: 0;} .condiv{min-width: 400px;} .carP1{font-size: 1.3rem;} .carP2{font-size: 1.1rem;} p.carP1, p.carP2{margin: 0;} div.qna-form-div, .btn { width : 70%; }}   
	@media ( min-width: 768px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 690px;} .carP1{font-size: 1.3rem;} .carP2{font-size: 1.1rem;} p.carP1, p.carP2{margin: 0;} div.qna-form-div { width : 60%; }}   
	@media ( min-width: 1024px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 930px;} .carP1{font-size: 1.5rem;} .carP2{font-size: 1.3rem;} p.carP1, p.carP2{margin: 0;} div.qna-form-div { width : 50%; }}
	@media ( min-width: 1199px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 1100px;} .carP1{font-size: 1.5rem;} .carP2{font-size: 1.3rem;} p.carP1, p.carP2{margin: 0;} div.qna-form-div { width : 40%; } }
	
	/* footer*/
	footer {width: 100%; background-color: #e3e3e3; padding: 10px ;	text-align: center;	font-size:12px;	height: 100px;	}
	#wrapper{
	min-height: calc(100vh - 100px);
	}

	section.qna-form-section {
		padding: 20px 0 40px 0;
	}
	section.qna-form-section>h3 {
		margin: auto;
		margin-bottom: 20px;
		text-align: center;
	}
	table.qna-view-table>tbody>tr>td {
		box-sizing: border-box;
		border: 1px solid lightgray;
		outline: none;
		color: rgb(121, 119, 119);
		font-synthesis: 12pt;
	}
	table.qna-view-table>tbody>tr:first-child>td {
		border:none;
	}
	table.qna-view-table>tbody>tr:first-child>td + td {
		border-left: 1px solid lightgray;
	}
	table.qna-view-table>tbody>tr:last-child> td {
		border:none;
	}
	table.qna-view-table>tbody>tr:last-child> td + td {
		border-left: 1px solid lightgray;
	}
	table.qna-view-table>tbody>tr > td {
		border-left: none;
	}
	table.qna-view-table>tbody>tr > td + td {
		border-right: none;
	}
	form.qna-form {
		text-align: center;
	}
	div.qna-form-div {
		border: 1px solid lightgray;
		border-radius: 5px;
		display:inline-block;
	}
	table.qna-view-table>tbody>tr>td>input {
		height: 50px; 
		padding: 0 5px; 
		font-synthesis: 12pt; color: rgb(121, 119, 119);
		border: none;
		outline: none;
		border-radius: 6px;
	}
	table.qna-view-table>tbody>tr>td>input:focus, table.qna-view-table>tbody>tr>td>textarea:focus {
		outline: 2px solid #B0C4DE;
		border-radius: 6px;
		font-synthesis: 12pt; color: rgb(121, 119, 119);
	}
	table.qna-view-table>tbody>tr>td>input[name=USER_ID] {
		outline: none;
	}
	
	div.qna-form-btn-div {
		display:inline-block;
	}
	div.qna-form-btn-div>button {
	 	width: 150px;
		height: 50px;
		border:1px solid gray;
		color: white;
		border: 1px solid lightgray;
		margin: 20px 8px;
		border-radius: 10px;
	    background: #B0C4DE;
		font-weight : 700;
		font-family: 'notosans';	
	}
	div.qna-form-btn-div>button:hover {
		background: #879ebc;
		color: white;
		box-shadow: none;
	}
	div.qna-form-btn-div>button:active{
		color: white;
		background: lightpink;
		border: none;
	}
	
	.writertitle {
		background-color : #EEEBEB;
		min-width : 61px !important;
	}
</style>
</head>
<body>
<div class="wrapper">
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
		<a class="navbar-brand navbar-middle nava" href="./main.jsp"><img src="./img/projectLogo.png" id="logo" alt="Logo"><span class="secNavTitle" style="border:none;">올리브 도서관</span></a>
	</nav>
</div>
</header>

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
				<img src="./img/library3.jpg" alt="library3" >
				<div class="carousel-caption">
					<p class="carP1">시민 가까이에 다가가는 작은 도서관</p>
						<p class="carP2">원하는 모든 책이 ALLib에 있습니다.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="./img/library8.jpg" alt="library8" >
				<div class="carousel-caption">
					 <p class="carP1">안락한 열람실</p>
	                <p class="carP2">집중력을 높일 수 있는 최적의 환경 조성</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="./img/library13.jpg" alt="library13" >
				<div class="carousel-caption">
					<p class="carP1">운영시간</p>
	                <p class="carP2 carP2mar">도서대여 : 오전 09:00 ~ 오후 18:00</p>
	                <p class="carP2">열람실 : 연중무휴 24시 운영(공휴일 단축운영)</p>
				</div>
			</div>
		</div>
	</div>
	<br>

	<section class="qna-form-section">
		<h3>QNA 글쓰기</h3>

		<form action="./QnaInsertAction.qna" class="qna-form">
		<div class="qna-form-div">
			<table id="qna-view-table" class="inputtd qna-view-table">
			<tbody>
				<tr>
					<td class="writertitle" align="center">아이디</td>
					<td><input maxlength="100" value="<%=uid %>" name="USER_ID" readonly></td>
				</tr>
				<tr>
					<td class="writertitle" align="center">비밀번호</td>
					<td><input class="box1" name="QNA_PASSWD" maxlength="50"></td>
				</tr>
				<tr>
					<td class="writertitle" align="center">제목</td>
					<td><input class="box1" name="QNA_TITLE" maxlength="50"></td>
				</tr>
				<tr>
					<td class="writertitle" align="center">내용</td>
					<td><textarea name="QNA_CONTENT" rows="13"></textarea></td>
				</tr>
			</tbody>
			</table>
		</div>
		<br>
		<div class="qna-form-btn-div">
			<button type="submit" class="btn">등록</button>
			<button type="button" class="btn" onclick="history.back (-1)">뒤로가기</button>
		</div>
		</form>
	</section>
	
</div>

<footer>
	<nav>
		<span>Project ALLib</span><br> <span>copyright ⓒ2023
			Himedia Academy, All Rights Reserved.</span><br> <span>삶은 계란<span
			class="slash">&nbsp;|&nbsp;</span>정하늘 홍기락 최영호 유미애 김주형 임금준 류동현 박경진
			최금녕
		</span>
	</nav>
</footer>
</body>
</html>
