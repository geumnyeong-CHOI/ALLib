<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String uid = (String) session.getAttribute("USER_ID");
%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>ALLib - 회원정보수정</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="./css/header_footer_font.css">
<style>
	#logoutBtn{ position: absolute;  top: 0;  right: 0;  padding: 2px; }
	#logoutBtn:hover{color:#b4b4b4;}
	* { box-sizing: border-box; }
	
	/* 사이드바 선, 간격 */
	.nav-itemB{border-right: 2px solid #140909;}
	@media (max-width: 576px) {
  .nav-itemB {
    border-right: none;
    border-bottom: 1px solid lightgrey;
  }
}
	.row { margin: 20px 0; }
	
	.mpMain { text-align:center; margin: 0 auto;}
	#wrap { width: 90%; margin: 0 auto;}
	h1.user-update-title, div.user-update-btn {
/* 		width : 450px; */
		max-width: 100%;
		margin : auto;
		text-align: center;	
	}
	div.user-update-btn > input[type=submit], div.user-update-btn > button[type=button] {
		margin-top : 10px;
		width : 48%;
		max-width: 48%;
		padding:10px 10px;
		background-color: #B0C4DE;
		color: #fff;
		border: none;
		border-radius: 8px;
	}
	div.user-update-btn > input[type=submit]:hover {
		background-color: #77A9EB;
		font-weight: bold;
		cursor: pointer;
	}
	
	div.user-update-div {
 		width : 100%;
		max-width: 100%;
		margin : auto;
		border : 1px solid #E3E3E3;	
		border-radius: 10px;
	}
	table.user-update-table {
		border-collapse: collapse;
/* 		width : 450px; */
		max-width: 100%;
		margin : auto;
		color: #333;
	}
	
	table.user-update-table > tbody > tr {
		border-bottom : 1px solid #E3E3E3;
	}
	table.user-update-table > tbody > tr:last-child {
		border-bottom : none;	
	}
	
	table.user-update-table > tbody > tr > td {
		padding: 9px;
		padding-left: 30px;
	}
	table.user-update-table > tbody > tr > td + td {
		padding: 9px 10px;
		
	}	
	table.user-update-table > tbody > tr > td > input[type=text],
	table.user-update-table > tbody > tr > td > input[type=tel],
	table.user-update-table > tbody > tr > td > input[type=email] {
		border : none;
		color: rgb(121, 119, 119);
		padding : 0px 8px;		
	    width: 100%;
	    height: 40px;
	    border-radius: 8px;
	}
 	table.user-update-table > tbody > tr > td > input[type=text]:focus { 
		outline : 2px solid #B0C4DE; 
 	}  
	
	.change{
		outline : 2px solid #B0C4DE;
	}
	
	table.footer-table {
/* 		width: 70%; */
/* 		max-width: 70%; */
		margin:0 auto;
	}
	.tdtext{
	width: 130px;
	}
	
	.inputtext{
	width: 400px;
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
	
#uid, #uname {
   background-color : #E3E3E3;
   border : 1px solid #E3E3E3;
}

#uid:focus, #uname:focus {
   outline : none;
}

/* 홈,위로가기 버튼 */
	img.mapicon { width: 30px; height: 30px;}
	.mapicon { position:fixed; background-color: white; padding: 5px; z-index:9999; border: 3px solid #c9c7c7;}
	.mapicon:hover { border-color: #6A5ACD;}
	#homeicon { border-radius: 5px 0 0 5px; right: 45px; bottom: 20px; }
	#topicon { border-radius: 0 5px 5px 0; right: 20px; bottom: 20px;} 
	
</style>
<script>
function delconf() {
	if (confirm("정말 탈퇴하시겠습니까?")) {
		location.href = "./userDeleteAction.us";
	} 
}
</script>
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
    </ul>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="./img/library3.jpg" alt="library3" width="1100" height="150">
            <div class="carousel-caption">
                <p class="carP1">국내 최대 규모의 도서관</p>
                <p class="carP2">원하는 모든 책이 ALLib에 있습니다.</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="./img/library11.jpg" alt="library11" width="1100" height="150">
            <div class="carousel-caption">
                <p class="carP1">안락한 열람실</p>
                <p class="carP2">집중력을 높일 수 있는 최적의 환경 조성</p>
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
	<div class="mpMain"><section>
<div id="wrap">

	<form action="updateUserProAction.us" method="post">
	<br>
	<h3 class="user-update-title">회원 정보 수정</h3>
	<br>
<div class="user-update-div">
	<table class="user-update-table">
		<tbody>
		<c:choose>
			<c:when test="${users ne null }">
			<tr>
				<td class="tdtext">아이디 </td>
				<td class="inputtext"><input type="text" name="USER_ID" id="uid" value="${users.USER_ID }" readonly></td>
			</tr>
			<tr>
				<td class="tdtext">비밀번호 </td>
				<td class="inputtext"><input type="text" class="change" name="USER_PASSWD" value="${users.USER_PASSWD}"></td>
			</tr>
			<tr>
				<td class="tdtext">이름 </td>
				<td class="inputtext"><input type="text" name="USER_NAME" id="uname" value="${users.USER_NAME}" readonly></td>
			</tr>
			<tr>
				<td class="tdtext">생년월일 </td>
				<td class="inputtext"><input type="text" class="change" name="USER_BIRTH" value="${users.USER_BIRTH}"></td>
			</tr>
			<tr>
				<td class="tdtext">핸드폰번호 </td>
				<td class="inputtext"><input type="tel" class="change" name="USER_PHONE" value="${users.USER_PHONE}"></td>
			</tr>
			<tr>
				<td class="tdtext">이메일 주소 </td>
				<td class="inputtext"><input type="email" class="change" name="USER_EMAIL" value="${users.USER_EMAIL}"></td>
			</tr>
			</c:when>
		<c:otherwise>
			<tr><td colspan="2">일치하는 회원 정보가 없습니다.</td></tr>
		</c:otherwise>
	</c:choose>
	</tbody>
	</table>
</div>
	
	<br>
	<div class="user-update-btn">
		<input type="submit" value="정보 수정 하기">&nbsp;&nbsp;<button type="button" onclick="delconf();">탈퇴하기</button><br><br><br>
	</div>
	</form>
</div>
</section></div>
</div>
</div>
</section></div>
<div class="goTop">
<a href="./main.jsp"><img src="./img/home_icon.png" class="mapicon" id="homeicon" alt="gohome"></a> 
<a href="#"><img src="./img/gotop_icon.png" class="mapicon" id="topicon" alt="gotop"></a>
</div>
<footer>
        <nav>
            Project ALLib<br>
            copyright ⓒ2023 Himedia Academy, All Rights Reserved.<br>
            삶은 계란&nbsp;|&nbsp; 정하늘 홍기락 최영호 유미애 김주형 임금준 류동현 박경진 최금녕
        </nav>
</footer>
</body>
</html>
