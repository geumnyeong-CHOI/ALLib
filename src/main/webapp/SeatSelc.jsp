<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="vo.SeatVO"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<% String uid=(String)session.getAttribute("USER_ID"); %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="./css/header_footer_font.css">
<title>ALLib - 열람실 좌석 예약</title>
<style>

#wrap {	width: 100%; min-height : 100%; text-align:center;}
#roomDiv { width: 500px; height: 500px; padding: 8px; margin: 0 auto; max-width: 100%; border: 1px solid #ddd; }
.descDiv { display : flex; justify-content: space-around; align-items: center; border-radius: 5px 5px 0px 0px;
           background-color: #eee; width: 100%; max-width: 100%; height: 40px; }
.descDiv1 { display : flex; justify-content: space-around; align-items: center; border-radius: 0px 0px 5px 5px;
           background-color: #eee; width: 100%; max-width: 100%; height: 40px; margin-bottom : 10px; }
.sitDiv { display: inline-block; position : relative; }
.SEAT_NO { display: inline-block; padding-top: 3px; margin: 0px !important; width: 30px; height: 30px; }
.sitLabel { display: inline-block; position : absolute; top: 0px; left: 0px; padding-top: 3px; margin: 0px !important;
           width: 30px; height: 30px; border-radius : 8px; border : 1px solid #aaa; box-sizing: border-box;
           background-color: #fff; text-align: center; vertical-align: top; }
input[type=submit] {display:block;  
           width: 100%; height: 50px; 
           border: none; 
           margin: 20px 0; 
           border-radius: 10px; 
           background-color: #B0C4DE; 
           color: white; font-size: 13pt; 
           font-family: 'notosans';}
input[type=reset] {display:block;  
           width: 100%; height: 50px; 
           border: none; 
           margin: 20px 0; 
           border-radius: 10px; 
           background-color: #B0C4DE; 
           color: white; font-size: 13pt; 
           font-family: 'notosans';}
input[type=submit]:hover{ background: pink;}
input[type=submit]:active{
    border: 2px solid palevioletred;
    outline: palevioletred;
       }
input[type=reset]:hover{ background: pink;}
input[type=reset]:active{
    border: 2px solid palevioletred;
    outline: palevioletred;
       }
hr { margin:0px; }
button{display:block; 
       width: 100%; height: 50px; 
       border: none; 
       margin: 20px 0; 
       border-radius: 10px; 
       background-color: #B0C4DE; 
       color: white; font-size: 13pt;
       font-family: 'notosans';}
button:hover{ background: pink;}
button:active{
    border: 2px solid palevioletred;
    outline: palevioletred;
       }           
.nav-link1:hover{color:red;}
.div1{
	height:auto;
	min-height: 100%;}
/* 캐러셀 반응형 */
@media ( min-width: 280px ) {.container{margin: 0 auto;	padding: 0;} .condiv{min-width: 250px;} .carP1{font-size: 1rem;} .carP2{font-size: 0.8rem;} p.carP1, p.carP2{margin: 0;}}	
@media ( min-width: 400px ) {.container{margin: 0 auto; padding: 0;} .condiv{min-width: 350px;} .carP1{font-size: 1rem;} .carP2{font-size: 0.8rem;} p.carP1, p.carP2{margin: 0;}}	
@media ( min-width: 576px ) {.container{margin: 0 auto; padding: 0;} .condiv{min-width: 400px;} .carP1{font-size: 1.3rem;} .carP2{font-size: 1.1rem;} p.carP1, p.carP2{margin: 0;}}	
@media ( min-width: 768px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 690px;} .carP1{font-size: 1.3rem;} .carP2{font-size: 1.1rem;} p.carP1, p.carP2{margin: 0;}}	
@media ( min-width: 1024px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 930px;} .carP1{font-size: 1.5rem;} .carP2{	ont-size: 1.3rem;} p.carP1, p.carP2{margin: 0;}}
@media ( min-width: 1199px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 1100px;} .carP1{font-size: 1.5rem;} .carP2{font-size: 1.3rem;} p.carP1, p.carP2{margin: 0;}}

/* footer*/
   footer {width: 100%; background-color: #e3e3e3; padding: 10px ;   text-align: center;   font-size:12px;   height: 100px;   }
   #wrapper{min-height: calc(100vh - 100px);}

 /* 홈,위로가기 버튼 */
	img.mapicon { width: 30px; height: 30px;}
	.mapicon { position:fixed; background-color: white; padding: 5px; z-index:9999; border: 3px solid #c9c7c7;}
	.mapicon:hover { border-color: #6A5ACD;}
	#homeicon { border-radius: 5px 0 0 5px; right: 45px; bottom: 20px; }
	#topicon { border-radius: 0 5px 5px 0; right: 20px; bottom: 20px;}    
   
 </style>
 <script>
	$(function(){
    	$(".sitLabel").click(function(){
             $(".sitLabel").css({"background-color":"white", "color": "black"});
                $(this).css({"background-color":"blue", "color": "#fff"});
            });
    	$("input[type='reset']").click(function(){
    		$(".sitLabel").css({"background-color":"white", "color": "black"});
    	});
    });
	
	function FormChk(val){
		if ( val.SEAT_NO.value == ''){
		 	alert('좌석번호를 클릭해주세요');
		return false;
		}
	}    
	<%
	Date nowDate = new Date();
	SimpleDateFormat toDay = new SimpleDateFormat("yyyy-MM-dd");
	String dateStr = toDay.format(nowDate);
	%>
</script>
</head>
<body><header>
<div class="div1"> <!-- div 닫는태그 닫아주기 스타일걸려있어서 삭제ㄴㄴ -->
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
	</div><br>
	
<div id="wrap">
<h3 class="main">열람실 좌석 예약</h3>
<form name="ibseat" action="./SeatSelcAction.me" method="post">
    <div class=main1>
    	<label for="date">예약 날짜를 선택하세요:
			<input type="date" id="date" max="2030-09-20" min="<%=dateStr %>" value="<%=dateStr %>" name="SEAT_DAY">
		</label>
	</div>
    <div id="roomDiv">
		<div class="descDiv">
        	<c:forEach var="i" begin="1" end="10"  step="1">
	    	    <div class="sitDiv" >
	            	<label for="sit${i}" class="sitLabel">
	                	<c:choose>
	                		<c:when test="${i>9 }">${i }</c:when>
	                   		<c:otherwise>0${i }</c:otherwise>
	                	</c:choose>
	                </label>
                	<input type="radio" class="SEAT_NO" id="sit${i}" name="SEAT_NO" value="${i}" >	
<%-- 	                <c:choose> --%>
<%-- 	                	<c:when test="${seatVo.SEAT_SELC eq '예약'}">            		 --%>
<%-- 	                		<input type="radio" class="SEAT_NO" id="sit${i}" name="SEAT_NO" value="${i}" disabled > --%>
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
<%-- 							<input type="radio" class="SEAT_NO" id="sit${i}" name="SEAT_NO" value="${i}" > --%>
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
	            </div>
           	</c:forEach>
        </div><hr>
     	<div class="descDiv1">
     	  	<c:forEach var="i" begin="11" end="20"  step="1">
            	<div class="sitDiv" >
	            	<label for="sit${i }" class="sitLabel">${i }</label>
	                <input type="radio" class="SEAT_NO" id="sit${i }" name="SEAT_NO" value="${i}" >
	             </div>
           	</c:forEach>
        </div>
        <div class="descDiv">
			<c:forEach var="i" begin="21" end="30"  step="1">
	        	<div class="sitDiv" >
	            	<label for="sit${i }" class="sitLabel">${i }</label>
	                <input type="radio" class="SEAT_NO" id="sit${i }" name="SEAT_NO" value="${i }">
	            </div>
            </c:forEach>
        </div><hr>
        <div class="descDiv1">
            <c:forEach var="i" begin="31" end="40"  step="1">
	           	<div class="sitDiv" >
	            	<label for="sit${i }" class="sitLabel">${i }</label>
	                <input type="radio" class="SEAT_NO" id="sit${i }" name="SEAT_NO" value="${i }" >
	            </div>
            </c:forEach>
        </div>
		<div class="descDiv">
	    	<c:forEach var="i" begin="41" end="50"  step="1">
	        	<div class="sitDiv" >
	            	<label for="sit${i }" class="sitLabel">${i }</label>
	                <input type="radio" class="SEAT_NO" id="sit${i }" name="SEAT_NO" value="${i }" >
	            </div>
        	</c:forEach>
        </div><hr>
		<div class="descDiv1">
        	<c:forEach var="i" begin="51" end="60"  step="1">
	        	<div class="sitDiv" >
	            	<label for="sit${i }" class="sitLabel">${i }</label>
	                <input type="radio" class="SEAT_NO" id="sit${i }" name="SEAT_NO" value="${i }" >
	    		</div>
            </c:forEach>
        </div>
        
        <input type="submit" value="좌석선택"><input type="reset" value="초기화"><br>
	</div></form>
</div></div></div>
</section>

<div class="goTop">
	<a href="./main.jsp"><img src="./img/home_icon.png" class="mapicon" id="homeicon" alt="gohome"></a> 
	<a href="#"><img src="./img/gotop_icon.png" class="mapicon" id="topicon" alt="gotop"></a></div>
</div>
    
<footer>
        <nav>
           Project ALLib<br>
            copyright ⓒ2023 Himedia Academy, All Rights Reserved.<br>
           삶은 계란&nbsp;|&nbsp;정하늘 홍기락 최영호 유미애 김주형 임금준 류동현 박경진 최금녕
        </nav>
    </footer>
</body>
</html>