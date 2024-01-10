<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String uid = (String) session.getAttribute("USER_ID");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="vo.SeatVO"%>
<%@ page import="dao.Seat_DAO"%>
<%
ArrayList<SeatVO> selcMySeat = (ArrayList<SeatVO>) request.getAttribute("seatChk");
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
/* 캐러셀 반응형 */
@media ( min-width: 280px ) {.container{margin: 0 auto;	padding: 0;} .condiv{min-width: 250px;} .carP1{font-size: 1rem;} .carP2{font-size: 0.8rem;} p.carP1, p.carP2{margin: 0;}}	
@media ( min-width: 400px ) {.container{margin: 0 auto; padding: 0;} .condiv{min-width: 350px;} .carP1{font-size: 1rem;} .carP2{font-size: 0.8rem;} p.carP1, p.carP2{margin: 0;}}	
@media ( min-width: 576px ) {.container{margin: 0 auto; padding: 0;} .condiv{min-width: 400px;} .carP1{font-size: 1.3rem;} .carP2{font-size: 1.1rem;} p.carP1, p.carP2{margin: 0;}}	
@media ( min-width: 768px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 690px;} .carP1{font-size: 1.3rem;} .carP2{font-size: 1.1rem;} p.carP1, p.carP2{margin: 0;}}	
@media ( min-width: 1024px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 930px;} .carP1{font-size: 1.5rem;} .carP2{	ont-size: 1.3rem;} p.carP1, p.carP2{margin: 0;}}
@media ( min-width: 1199px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 1100px;} .carP1{font-size: 1.5rem;} .carP2{font-size: 1.3rem;} p.carP1, p.carP2{margin: 0;}}

.mpMain { text-align:center; margin: 0 auto; }
#main { width: 100%; } 
* { box-sizing: border-box;}
button { border: none; border-radius: 5px; margin: auto; display: block; }
.btbtn{ width: 49%; color: white; background-color: #B0C4DE;  vertical-align: middle; }
		
.seatXbtn { border: 1px solid rgb(255, 113, 97); color: rgb(255, 113, 97); border-radius: 3px; } 

.block1-2 {
	height: 88px;
	background-color: rgb(255, 255, 255);
	height: 500px;
}

#wrap {
	width: 100%;
}

.nav-itemB { border-right: 2px solid #140909; }
@media (max-width: 576px) { .nav-itemB { border-right: none; border-bottom: 1px solid lightgrey; }}
.row { margin: 20px 0; }

#logoutBtn:hover {
	font-color: #6a5acd;
}

span {
	border: none;
	padding: 10px;
	border-radius: 15px;
}

#seat-row>.seat-colA {
	padding-left: 0 10px 20px 0;
	margin: 20px auto;
}

#seat-row>.seat-colB {
	padding: 0;
}

#seat-row>.seat-colB>#seat-table {
	width: 100%;
	border-collapse: collapse;
}

#seat-row>.seat-colB>#seat-table>tbody>tr>th, td {
	padding: 5px;
}

#seat-row>.seat-colB>#seat-table>tbody>tr>th {
	background-color: #B0C4DE;
	border: 1px solid #fff;
	text-align: center;
}

#seat-table {
	width: 100%;
	max-width: 100%; /* 필요에 따라 최대 너비 조절 */
}

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
<script>
	function deleteConf(snum) {
	    if (confirm("좌석 예약을 취소하시겠습니까?")) {
	        alert("취소되었습니다.");
	        console.log(snum);
	        
	        $.ajax({
	            type: "POST",
	            url: "SeatCancelAction.me",
	            data: { seatNum : snum }, 
	            success: function (res) {	               
	                location.reload();
	            }
	        });
	    } 
	}
	$(function() { 
		$(".my-td").each(function() {
		    var seatSelc = $(this).text().trim();
		    if (seatSelc === '취소') {
		      $(this).css({"color": "red"}); 
		    }
		  });
		});

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
                <p>원하는 모든 책이 ALLib에 있습니다.</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="./img/library11.jpg" alt="library11" width="1100" height="150">
            <div class="carousel-caption">
                <p class="carP1">안락한 열람실</p>
                <p>집중력을 높일 수 있는 최적의 환경 조성</p>
            </div>
        </div>
    </div>    
</div>
		<div class="container-fluid">
			<div class="row">
				<nav class="col-12 col-sm-3" id="sideMenu">
					<ul class="nav nav-pills flex-column">

						<li class="nav-itemB "><a class="nav-link active"
							style="color: black; background-color: rgb(255, 255, 255, 0.5);"
							href="./updateUserAction.us">나의 정보</a></li>

						<li class="nav-itemB "><a class="nav-link active"
							style="color: black; background-color: rgb(255, 255, 255, 0.5);"
							href="./BookRentalAction.book">대여 도서 확인</a></li>

						<li class="nav-itemB "><a class="nav-link active"
							style="color: black; background-color: rgb(255, 255, 255, 0.5);"
							href="./SeatMyChkAction.me">좌석 예약</a></li>

						<li class="nav-itemB "><a class="nav-link active"
							style="color: black; background-color: rgb(255, 255, 255, 0.5);"
							href="./myQnaList.qna">나의 질문</a></li>
					</ul>
				</nav>
				<div class="mpMain"><section>
					<div class="mySeat">
						<div id="seat-fluid" class="container-fluid">
							<div id="seat-row" class="row seat-row">
								<div class="col-sm-6 seat-colA">
									<strong>좌석 예약 내역</strong>
								</div>
<div class="col-sm-12 seat-colB" style="margin: auto;">
					<table id="seat-table" class="seat-table">
						<tbody>
							<tr class="my-tr">
								<th class="my-th">번호</th>
								<th class="my-th">날짜</th>
								<th class="my-th">좌석</th>
								<th class="my-th">상태</th>
								<th class="my-th">선택</th>
							</tr>
					<c:choose>
						<c:when test="${seatChk ne null }">
							<c:forEach var="seat" items="${seatChk }">
							<tr class="my-tr">
								<td class="my-td">${seat.SEAT_NUM}</td>
								<td class="my-td">${seat.SEAT_DAY}</td>
								<td class="my-td">${seat.SEAT_NO}</td>
								<td class="my-td"><c:choose>
								<c:when test="${seat.SEAT_SELC eq 'n'}">취소</c:when>
								<c:otherwise>${seat.SEAT_SELC}</c:otherwise>
								</c:choose></td>
								<c:if test="${seat.SEAT_SELC ne 'n'}">
							    <td class="my-td"><button class="seatXbtn" type="button" onclick="deleteConf(${seat.SEAT_NUM});">취소</button></td>
								</c:if>
                         	<c:if test="${seat.SEAT_SELC eq 'n' }">
                         	</c:if>
							</tr>
							</c:forEach>
						</c:when>
					<c:otherwise>
							<tr>
								<td colspan="3">좌석 예약 내역이 없습니다.</td>
							</tr>
					</c:otherwise>
					</c:choose>
					</tbody>
					</table>
				</div>

							</div>
						</div>
					</div>
				</section></div>
			</div>
			</div>
	<br>
	<br>
	</section>	
	<br>
	<br>
	</div>
	<div class="goTop">
		<a href="./main.jsp"><img src="./img/home_icon.png" class="mapicon" id="homeicon" alt="gohome"></a> 
		<a href="#"><img src="./img/gotop_icon.png" class="mapicon" id="topicon" alt="gotop"></a>
	</div>

	<footer>
		<nav>
			Project ALLib<br> copyright ⓒ2023
				Himedia Academy, All Rights Reserved.<br> 삶은 계란
				&nbsp;|&nbsp;정하늘 홍기락 최영호 유미애 김주형 임금준 류동현 박경진
				최금녕
			
		</nav>
	</footer>
</body>
</html>