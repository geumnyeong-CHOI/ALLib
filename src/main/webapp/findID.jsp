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
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="./css/header_footer_font.css">
<title>ALLib 아이디 찾기</title>
<style>


body{text-align:center;}

table{margin: auto;}

button {
width: 74%;
min-width: 30%;
margin: 4px;
border-radius : 10px;
padding : 5px;
padding-left: 10px;
padding-right: 10px;
border: 3px solid #B0C4DE;
background-color: #B0C4DE;
color: white;
}

#findID-btn2, #findID-btn1{
float: right;
}


#findID-btn2{
width: 73%
}

#findID-btn3{
width: 78%;
text-align: center;
}

#backlogin{
width: 500px;
text-align: center;
}

form{
width: 100%;}

#writertab1, #writertab2, #writertab3, #writertab4 {
width: 95%;
min-width: 80%;
margin: 4px;
padding: 3px;
padding-left: 10px;
padding-right: 10px;
border-radius: 5px;
 border: 3px solid   #E3E3E3; 
}

button:hover {
	background: #879ebc;
	color: white;
	box-shadow: none;
}

button:active{
	color: white;
	background: lightpink;
}

input::-webkit-input-placeholder { text-align: right; }

tr {
text-align: right;
}

#writertab1:focus, #writertab2:focus, #writertab3:focus, #writertab4:focus {
outline: 2px solid #B0C4DE;
}

.input{ 
 width: 300px;
 } 

div{
text-align:center;
}

p.title{
	font-size: 1.4rem;
	font-weight: bold;
	}

/* 캐러셀 반응형 */
@media ( min-width: 280px ) {.container{margin: 0 auto;	padding: 0;} .condiv{min-width: 250px;} .carP1{font-size: 1rem;} .carP2{font-size: 0.8rem;} p.carP1, p.carP2{margin: 0;}}	
@media ( min-width: 400px ) {.container{margin: 0 auto; padding: 0;} .condiv{min-width: 350px;} .carP1{font-size: 1rem;} .carP2{font-size: 0.8rem;} p.carP1, p.carP2{margin: 0;}}	
@media ( min-width: 576px ) {.container{margin: 0 auto; padding: 0;} .condiv{min-width: 400px;} .carP1{font-size: 1.3rem;} .carP2{font-size: 1.1rem;} p.carP1, p.carP2{margin: 0;} #findID-btn3 {width: 92%; text-align: center;}}	
@media ( min-width: 768px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 690px;} .carP1{font-size: 1.3rem;} .carP2{font-size: 1.1rem;} p.carP1, p.carP2{margin: 0;}}	
@media ( min-width: 1024px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 930px;} .carP1{font-size: 1.5rem;} .carP2{	ont-size: 1.3rem;} p.carP1, p.carP2{margin: 0;}}
@media ( min-width: 1199px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 1100px;} .carP1{font-size: 1.5rem;} .carP2{font-size: 1.3rem;} p.carP1, p.carP2{margin: 0;}}

/* footer*/
	footer {width: 100%; background-color: #e3e3e3; padding: 10px ;	text-align: center;	font-size:12px;	height: 100px;	}
	#wrapper{min-height: calc(100vh - 100px);}


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
	            <img src="./img/library13.jpg" alt="library13">
	            <div class="carousel-caption">
	                <p class="carP1">운영시간</p>
	                <p class="carP2 carP2mar">도서대여 : 오전 09:00 ~ 오후 18:00</p>
	                <p class="carP2">열람실 : 연중무휴 24시 운영(공휴일 단축운영)</p>
	            </div>
	        </div>        
	    </div> 
	</div>
<br><br>
<script>
	function findIDbtn1(){
	var uname = document.getElementById("writertab1").value;
	var uphone = document.getElementById("writertab2").value;
	
	if(uname != "" && uphone != ""){
	document.fm1.action="<%=request.getContextPath()%>/findIDPhone.us";
	document.fm1.method="post";
	document.fm1.submit();
	}
}

function findIDbtn2(){
	var uname = document.getElementById("writertab3").value;
	var uemail = document.getElementById("writertab4").value;
	
	if(uname != "" && uemail != ""){
	document.fm2.action="<%=request.getContextPath()%>/findID.us";
	document.fm2.method = "post";
	document.fm2.submit();
	}
}

function phoneNum(obj){
    var number = obj.value.replace(/[^0-9]/g, "");
    var phone = "";
    if(number.length < 4) {
        return number;
    } else if(number.length < 8) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3);
    }else if(number.length < 11){
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 3);
        phone += "-";
        phone += number.substr(6);
    }else{
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 4);
        phone += "-";
        phone += number.substr(7);
    }
    obj.value = phone;
}

</script>
<form name="fm1">
<p class="title">이름, 전화번호로 찾기</p>
<table class="tb1">
    <tr>
      <td>이름 :</td>
      <td class="input"><input type="text" name="USER_NAME" id="writertab1" required></td>
    </tr>
    <tr>
      <td>핸드폰번호 :</td>
      <td class="input"><input type="text" name="USER_PHONE" onkeyup="phoneNum(this);" id="writertab2" required></td>
    </tr>
    <tr>
      <td colspan="2">
        <button type="submit" id="findID-btn1" onclick="findIDbtn1()"><span>아이디 찾기</span></button>
      </td>
    </tr>
</table>
</form>
<br><br><br>
<form name="fm2">
<p class="title">이름, 이메일로 찾기</p>
<table>
    <tr>
      <td>이름 :</td>
      <td class="input"><input type="text" id="writertab3" name="USER_NAME" required></td>
    </tr>
    <tr>
      <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이메일 :</td>
      <td class="input"><input type="text" id="writertab4" name="USER_EMAIL" required></td>
    </tr>
    <tr>
      <td colspan="2">
        <button type="submit" id="findID-btn2" onclick="findIDbtn2()"><span>아이디 찾기</span></button>
      </td>
    </tr>
</table>
<br><br>
<table>
 <tr id="backlogin">
      <td id="backlogin">
    	<button type="button" id="findID-btn3" onclick = "location.href = './loginForm.jsp' ">로그인 화면으로 돌아가기</button>
      </td>
    </tr>
</table>
<br><br>
</form>
</div></div></section></div>
<footer>
        <nav>
            <span>Project ALLib</span><br>
            <span>copyright ⓒ2023 Himedia Academy, All Rights Reserved.</span><br>
            <span>삶은 계란<span class="slash">&nbsp;|&nbsp;</span>정하늘 홍기락 최영호 유미애 김주형 임금준 류동현 박경진 최금녕</span>
        </nav>
    </footer> 
</body>
</html>
