<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="vo.*" %>
<% String uid = (String) session.getAttribute("USER_ID"); 
	QnaVO qvo = (QnaVO)request.getAttribute("qvo");
	String qid = qvo.getUSER_ID();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="./css/header_footer_font.css">
<title>QNA 게시글</title>
<style>

 * 캐러셀 반응형 */
@media ( min-width: 280px ) {.container{margin: 0 auto;   padding: 0;} .condiv{min-width: 250px;} .carP1{font-size: 1rem;} .carP2{font-size: 0.8rem;} p.carP1, p.carP2{margin: 0;} table{width: 90%;}}   
@media ( min-width: 400px ) {.container{margin: 0 auto; padding: 0;} .condiv{min-width: 350px;} .carP1{font-size: 1rem;} .carP2{font-size: 0.8rem;} p.carP1, p.carP2{margin: 0;} table{width: 80%;}}   
@media ( min-width: 576px ) {.container{margin: 0 auto; padding: 0;} .condiv{min-width: 400px;} .carP1{font-size: 1.3rem;} .carP2{font-size: 1.1rem;} p.carP1, p.carP2{margin: 0;} table{width: 80%;}}   
@media ( min-width: 768px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 690px;} .carP1{font-size: 1.3rem;} .carP2{font-size: 1.1rem;} p.carP1, p.carP2{margin: 0;} table{width: 50%;}}   
@media ( min-width: 1024px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 930px;} .carP1{font-size: 1.5rem;} .carP2{font-size: 1.3rem;} p.carP1, p.carP2{margin: 0;} table{width: 50%;}}
@media ( min-width: 1199px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 1100px;} .carP1{font-size: 1.5rem;} .carP2{font-size: 1.3rem;} p.carP1, p.carP2{margin: 0;} table{width: 50%;}}

/* footer*/
	footer {width: 100%; background-color: #e3e3e3; padding: 10px ;	text-align: center;	font-size:12px;	height: 100px;	}
	#wrapper{min-height: calc(100vh - 100px);}

table {
	margin : 0 auto;
}

.container {
	margin: auto;
	justify-content: center;
}

.btn {
	color: white;
	width: 48%;
	height: 50px;
	border: 1px solid lightgray;
	margin: 20px 0;
	border-radius: 10px;
    background: #B0C4DE;
	font-weight : 700;
	font-family: 'notosans';
}

.btn:hover {
    background: #879ebc;
	color: white;
	box-shadow: none;
}

.btn:active{
	color: white;
	background: lightpink;
	border: none;
}

.box1{
	height: 50px; 
	padding: 0 5px; 
	font-synthesis: 12pt; color: rgb(121, 119, 119);
	border: none;
	
}

.table-section {
	width:100%;
}

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

.writetitle {
	background-color : #EEEBEB;
	min-width:50px;
	}

.write {
	border : 1px solid lightgray;
}

tr { 
	border-collapse : collapse;
}

.div-table{
	padding : 0;
}

td > input, td > textarea {
	width : 100%;
}
</style>
<script>
var qno;

function deleteConf(qno){
	console.log(qno);
	if (confirm("확인버튼을 누르시면 삭제됩니다.")) {
	location.href="QnaDel.qna?QNA_NO=" + qno;
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
<section class="table-section">
<div class="container-fluid div-table">
	<form action="javascript:history.back();">
		<table class="inputtd">
			<tr class="one">
				<td class="write writetitle" align="center">글번호</td>
				<td class="write"><input class="box1" name="QNA_NO" maxlength="50" value="${qvo.QNA_NO }" readonly></td>
			</tr>
			<tr class="two">
				<td class="write writetitle" align="center">제목</td>
				<td class="write"><input class="box1" name="QNA_TITLE" maxlength="50" value="${qvo.QNA_TITLE }" readonly></td>
			</tr>
			<tr class="three">
				<td class="write writetitle" align="center">아이디</td>
				<td class="write"><input class="title box1" maxlength="100" value="${qvo.USER_ID }" name="USER_ID" readonly></td>
			</tr>
			<tr class="four">
				<td class="write writetitle" align="center">내용</td>
				<td class="write"><textarea name="QNA_CONTENT" rows="13" readonly>${qvo.QNA_CONTENT }</textarea></td>
			</tr>
			<tr class="five">
				<td class="write writetitle" align="center">답변</td>
				<td class="write"><textarea name="QNA_COMMENT" rows="5" readonly>${qvo.QNA_COMMENT }</textarea></td>
			</tr>
			<% if( uid == null || !uid.equals(qid) ) {%>
				<tr align="center">
				<td colspan="2"><input type="submit" class="btn" value="목록"></td>
				</tr>
			<%} else if(uid.equals(qid)) { %>
			<tr align="center">
				<td colspan="2"><input type="submit" class="btn" value="목록">&nbsp;<button type="button" id="deleteBtn" class="btn" onclick="deleteConf('${qvo.QNA_NO}');">삭제</button></td>
			</tr>
			<% };%>
		</table>
	</form>
</div>
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