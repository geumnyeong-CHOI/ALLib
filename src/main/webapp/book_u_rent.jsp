<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="vo.BookInfoVO"%>
<%@ page import="vo.BookRentalYNVO"%>
<%@ page import="dao.BookDAO"%>
<%
ArrayList<BookRentalYNVO> bookRentalList = (ArrayList<BookRentalYNVO>) request.getAttribute("bookRentalList");
%>
<%
String uid = (String) session.getAttribute("USER_ID");
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="./css/header_footer_font.css">
<title>ALLib - 회원 도서 대여 목록</title>
<style>
/* 캐러셀 반응형 */
@media ( min-width : 280px ) {
	.container {
		margin: 0 auto;
		padding: 0;
	}
	.condiv {
		min-width: 250px;
	}
	.carP1 {
		font-size: 1rem;
	}
	.carP2 {
		font-size: 0.8rem;
	}
	p.carP1, p.carP2 {
		margin: 0;
	}
	.s1 { max-width: 260px; }
}

@media ( min-width : 400px ) {
	.container {
		margin: 0 auto;
		padding: 0;
	}
	.condiv {
		min-width: 350px;
	}
	.carP1 {
		font-size: 1rem;
	}
	.carP2 {
		font-size: 0.8rem;
	}
	p.carP1, p.carP2 {
		margin: 0;
	}
	.s1 { max-width: 350px; }
}

@media ( min-width : 576px ) {
	.container {
		margin: 0 auto;
		padding: 0;
	}
	.condiv {
		min-width: 400px;
	}
	.carP1 {
		font-size: 1.3rem;
	}
	.carP2 {
		font-size: 1.1rem;
	}
	p.carP1, p.carP2 {
		margin: 0;
	}
	.s1 { max-width: 540px; }
}

@media ( min-width : 768px ) {
	.container {
		margin: 0 auto;
		padding: 0;
	}
	.carConSize {
		margin: 0 auto;
		width: 690px;
	}
	.carP1 {
		font-size: 1.3rem;
	}
	.carP2 {
		font-size: 1.1rem;
	}
	p.carP1, p.carP2 {
		margin: 0;
	}
}

@media ( min-width : 1024px ) {
	.container {
		margin: 0 auto;
		padding: 0;
	}
	.carConSize {
		margin: 0 auto;
		width: 930px;
	}
	.carP1 {
		font-size: 1.5rem;
	}
	.carP2 {
		font-size: 1.3rem;
	}
	p.carP1, p.carP2 {
		margin: 0;
	}
}

@media ( min-width : 1199px ) {
	.container {
		margin: 0 auto;
		padding: 0;
	}
	.carConSize {
		margin: 0 auto;
		width: 1100px;
	}
	.carP1 {
		font-size: 1.5rem;
	}
	.carP2 {
		font-size: 1.3rem;
	}
	p.carP1, p.carP2 {
		margin: 0;
	}
}
/* 전체 */
.btn {
	background-color: #B0C4DE;
}

.nonData {
	padding: 200px 50px;
}

h3 {
	text-align: center;
}

	.nav-itemB {
	border-right: 2px solid #140909;
}

@media (max-width: 576px) {
  .nav-itemB {
    border-right: none;
    border-bottom: 1px solid lightgrey;
  }
}

/* 대여정보 */
#userRentList {
	width: 100%;
	
}

.rentlistbox {
	padding: 20px 40px;
	border: 1px solid #c3c3c3;
	border-radius: 10px;
	text-align: left;
}

/* 하단 페이지 이동 버튼 */
button {
	width: 100%;
	height: 100%;
}

.btbtn {
	width: 49%;
	color: white;
}

.btn-div {
	min-width: 100px;
	text-align: center;
}

.row {
	margin: 20px 0;
}

.mpMain {
	text-align: center;
	margin: 0 auto;
}

#wrap { max-width: 100%; width: 100vw; }

/* footer*/
footer {
	width: 100%;
	background-color: #e3e3e3;
	padding: 10px;
	text-align: center;
	font-size: 12px;
	height: 100px;
}

#wrapper {
	min-height: calc(100vh - 100px);
}

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

			<%
			if (uid != null) {
			%>
			<div>
				<nav class="navbar headernav">
					<a class="nav navbar-left nava" href="./main.jsp"><b>ALLib</b></a>
					<ul class="nav navbar-right">
						<li class="nav-item"><a class="nav-link nava" id="mypageBtn"
							href="<%=request.getContextPath()%>/MyPage.jsp">마이페이지</a></li>
						<li class="nav-item"><a class="nav-link nava" id="loginBtn"
							href="./userLogout.us">로그아웃</a></li>
					</ul>
				</nav>
			</div>
			<%
			} else if (uid == null) {
			%>
			<div>
				<nav class="navbar headernav">
					<a class="nav navbar-left nava" href="./main.jsp"><b>ALLib</b></a>
					<ul class="nav navbar-right">
						<li class="nav-item"><a class="nav-link nava" id="loginBtn"
							href="./loginForm.jsp">로그인</a></li>
					</ul>
				</nav>
			</div>
			<%
			}
			;
			%>
			<div class="sectionNavDiv">
				<nav class="navbar sectionnav">
					<a class="navbar-brand navbar-middle nava" href="./main.jsp"><img
						src="./img/projectLogo.png" id="logo" alt="Logo"><span
						class="secNavTitle">올리브 도서관</span></a>
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
					<div class="mpMain">
						<section class="s1">
							<div id="wrap"><br>
								<h3>대여 목록</h3>
								<div id="userRentList">
									<c:choose>
										<c:when test="${bookRentalList.size() ne 0 }">
											<c:forEach var="book" items="${bookRentalList }">
												<div class="container rentlistbox">
													<div>
														<h4>${book.BOOK_NAME}</h4>
													</div>
													<div>도서코드 : ${book.BOOK_CODE}</div>
													<div>대여일 : ${book.RDATE}</div>
													<div>
														<b>반납기한 : ${book.OVERDUE}</b>
													</div>
												</div>
												<br>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<div class="nonData">
												<h3>대여한 도서가 없습니다.</h3>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="btn-div">
									<button type="button" class="btn btbtn btbtnl"
										onclick="location.href='<%=request.getContextPath()%>/MyPage.jsp'">마이페이지</button>
									<button type="button" class="btn btbtn"
										onclick="location.href='main.jsp'">메인화면</button>
								</div>
							</div>
						</section>
					</div>
				</div>
			</div>
		</section>
	</div>
<div class="goTop">
<a href="./main.jsp"><img src="./img/home_icon.png" class="mapicon" id="homeicon" alt="gohome"></a> 
<a href="#"><img src="./img/gotop_icon.png" class="mapicon" id="topicon" alt="gotop"></a></div>	
	<footer>
		<nav>
			Project ALLib<br> copyright ⓒ2023 Himedia Academy, All Rights
			Reserved.<br> 삶은 계란 &nbsp;|&nbsp; 정하늘 홍기락 최영호 유미애 김주형 임금준 류동현
			박경진 최금녕
		</nav>
	</footer>
</body>
</html>