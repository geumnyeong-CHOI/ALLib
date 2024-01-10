<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="vo.BookInfoVO" %>
<%@ page import="vo.PageInfoVO" %>
<%@ page import="java.util.*" %>
<%
	ArrayList<BookInfoVO> bookList =(ArrayList<BookInfoVO>)request.getAttribute("bookList");
	PageInfoVO pageInfo = (PageInfoVO)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
	String uid = (String) session.getAttribute("USER_ID");
%> 
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.js"></script>
    <link rel="stylesheet" type="text/css" href="./css/header_footer_font.css">
    
    <title>ALLib - 도서 전체 목록</title>
    
	<style>		
		/* 전체 */
		.btn{ background-color: #B0C4DE; }
		.container{ max-width: 100%; }
		
			/* section carousel */
	.carP1{ font-size: 1em; }
	.carP2{ font-size: 0.5em; }
	.carP2mar{ margin-bottom: 0; }
	.sectiondiv{ height:auto; min-height: 100%; padding-bottom: 100px; background-color: white;}
	.menubtndiv{ text-align: center }
			
		/* 검색 */
		/* bootstrap input 자동완성시 파란 background-color 제거 */
		input:-webkit-autofill { -webkit-box-shadow: 0 0 0 30px #fff inset ; -webkit-text-fill-color: #000; }
		input:-webkit-autofill, input:-webkit-autofill:hover, input:-webkit-autofill:focus, input:-webkit-autofill:active { transition: background-color 5000s ease-in-out 0s; }
			
		#searchbox{
			margin: 10px 0;			
		}
		
		button, #searchbox{ 
			width: 100%; 
			height: 100%;
		}
		
		.stext{
			width: 80%;
			border-right: none;
			border-radius: 5px 0 0 5px;
			flex-grow: 2;
		}
		
		.sbtn{ 
			width: 20%;
			border-radius: 0 5px 5px 0 ;
			flex-grow: 0;
		}

		.stext:focus, .sbtn:focus{
			outline:none !important;
			box-shadow:none !important;
		}
		
		
		/* 도서정보 및 대여버튼 */
		
		.dcline{
			border-bottom: 1px solid gray; 
			margin: 10px 0;
		}
		
	 	.booklistbox{
	 	 	padding: 20px; 
	 	 	background-color: #f0f5fa;
			border-radius: 10px;
		}
		
		button:disabled {background-color: lightgray;}
		
		
		/* 하단 페이지 이동버튼 */
		.btbtn{
			width: 50%;
		}
		
		.btn-div{
			min-width: 100px;
			text-align: center;
		}
		
		/* 페이지 */
		#pageList{
			text-align: center;
			margin: 15px 0;
		}	
		#pageList > a {
			color: black;
			text-decoration: none;
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


    div#pageList>button {
        border: 1px solid #B0C4DE;
        padding: 0;
        width: 35px;
        background-color: #fff;
        color: #B0C4DE;
        font-weight: bold;
        border-radius: 3px;
    }
    div#pageList>button:hover {
        background: #879ebc;
        color: white;
        box-shadow: none;    
    }    
    div#pageList>button:active {
        background: lightpink;
        color: white;
        box-shadow: none;    
    }

    div#pageList>button.view-number-btn {
        border: 1px solid #B0C4DE;
        background-color: #B0C4DE;
        color: #fff;
        border-radius: 3px;
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

	<div id="wrap">
	<div class="container" >
		<div id="searchbox">
			<form action="./bookUSearchAction.book" method="post" class="form-inline">
				<input type="text" class="form-control stext searchI" name="book_search" placeholder="책 제목, 작가명으로 검색">
				<input type="submit" class="btn sbtn searchI" value="검색">
			</form>
		</div>
		
		<c:choose>
			<c:when test="${bookUList.size() ne 0 }">
				<c:forEach var="book" items="${bookUList }">
					<div class="booklistbox">
					<div><h4>${book.BOOK_NAME}</h4></div>
		            <div>작가 : ${book.BOOK_WRITER}</div>
		            <div>출판사 : ${book.BOOK_COMPANY}</div>
		            <div>도서코드 : ${book.BOOK_CODE}</div>
		            <div class="dcline"></div>
		            <div>${book.BOOK_DESCRIPTION}</div>
		            <c:if test="${book.BOOK_YN eq 'n' }">
		            	<br><button type="button" class="btn" id="rentbtn" onclick="location.href='BookRentBtnAction.book?book_code=${book.BOOK_CODE }' ">대여가능</button>
		            </c:if>
		            <c:if test="${book.BOOK_YN eq 'y' }">
		            	<br><button type="button" class="btn rentX" id="rentbtn" onclick="location.href='BookRentBtnAction.book?book_code=${book.BOOK_CODE }' " disabled>대여중</button>
		            </c:if>
		            	</div>
		            	<br>
				</c:forEach>
			</c:when>
		</c:choose>				
		
		<div id="pageList">
			<%if(nowPage<=1){ %> 
			<button class="page-prev-btn" type="button">&lt;</button>
			&nbsp;&nbsp;
			<%}else{ %>
				<button class="page-prev-btn" type="button"
					onclick="location.href='./bookUListAction.book?page=<%=nowPage-1 %>';">&lt;</button>
				&nbsp;&nbsp;				
			<%} %>
	
			<%for(int a=startPage;a<=endPage;a++){
					if(a==nowPage){%>  
						<button class="page-number-btn view-number-btn" type="button"><%=a%></button>						
					<%}else{ %>
						<button class="page-number-btn" type="button"
							onclick="location.href='./bookUListAction.book?page=<%=a %>';"><%=a%></button>						
					<%} %>
			<%} %>
	
			<%if(nowPage>=maxPage){ %>
				&nbsp;
				<button class="page-next-btn" type="button">&gt;</button>				
			<%}else{ %>
				&nbsp;
				<button class="page-next-btn"
					onclick="location.href='./bookUListAction.book?page=<%=nowPage+1 %>';"
					type="button">&gt;</button>				
			<%} %>
		</div>
	</div>
</div></div>	
</section>
</div>
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