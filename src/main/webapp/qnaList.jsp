<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<%
String uid = (String) session.getAttribute("USER_ID");
ArrayList<QnaVO> qnaList =(ArrayList<QnaVO>)request.getAttribute("qnaList");
PageInfoVO pageInfo = (PageInfoVO)request.getAttribute("pageInfo");
int listCount=pageInfo.getListCount();
int nowPage=pageInfo.getPage();
int maxPage=pageInfo.getMaxPage();
int startPage=pageInfo.getStartPage();
int endPage=pageInfo.getEndPage();
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.css">
<title>QNA 글목록 리스트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="./css/header_footer_font.css">

<style>

  img.mapicon { width: 30px; height: 30px;}
   .mapicon { position:fixed; background-color: white; padding: 5px; z-index:9999; border: 3px solid #c9c7c7;}
   .mapicon:hover { border-color: #6A5ACD;}
   #homeicon { border-radius: 5px 0 0 5px; right: 45px; bottom: 20px; }
   #topicon { border-radius: 0 5px 5px 0; right: 20px; bottom: 20px;} 

.carConSize {
    margin: 0 auto;
    width: 1100px;
}

.writebtn {
	float: right;
	text-decoration : underline;
	border : none;
	background-color : transparent;
}

.writebtn:hover {
	color : gray;
}

#logoutBtn:hover {
	font-color: #6a5acd;
}

p#totalcount {
	text-align: right;
}

table#header {
	/* border: 1px solid black; 
	width: 100%;
	*/
	padding: 5px;
	margin-bottom: 10px;
}

.titleBtn {
	border : none;
	float:left; 
}

.titleBtn:hover {
cursor : pointer;
}
.titleBtn:active {
	outline : none;
	border : none;
	box-shadow : none;
}
 .page {
        border: 1px solid rgb(75, 116, 255);
        padding: 0;
        width: 35px;
        color: rgb(75, 116, 255);
        font-weight: bold;
        border-radius: 3px;
        }
table{text-align: center;}
}

   table.seat-table tr:nth-child(odd) {
    background-color: rgb(239, 241, 245);
  } 
  
  table.seat-table tr:nth-child(even) {
    background-color: rgb(239, 241, 245);
  } 

tr{height:35px;}
 

 /*목록 tr라인 hover 배경색*/
   table.seat-table>tbody>tr:hover {
       background-color: rgb(229, 239, 255);
   }
.view-number-btn {
    border: 1px solid rgb(75, 116, 255);
     background-color: rgb(75, 116, 255); 
    color: #fff;
    border-radius: 3px;
    }
    
    .td1{text-align:left;}
    
     * 캐러셀 반응형 */
@media ( min-width: 280px ) {.container{margin: 0 auto;  padding: 0;} .condiv{min-width: 250px;} .carP1{font-size: 1rem;} .carP2{font-size: 0.8rem;} p.carP1, p.carP2{margin: 0;} .seat-table{font-size: 0.5rem !important;} table#header{max-width:180px;} .div-table1{margin: 0 auto;} .td1{max-width: 70px;} }   
@media ( min-width: 400px ) {.container{margin: 0 auto; padding: 0;} .condiv{min-width: 350px;} .carP1{font-size: 1rem;} .carP2{font-size: 0.8rem;} p.carP1, p.carP2{margin: 0;}.seat-table{font-size: 0.7rem;} .div-table1{margin: 0 auto;} .td1{max-width: 100px;}}   
@media ( min-width: 576px ) {.container{margin: 0 auto; padding: 0;} .condiv{min-width: 400px;} .carP1{font-size: 1.3rem;} .carP2{font-size: 1.1rem;} p.carP1, p.carP2{margin: 0;} table#header{min-width: 500px;} .div-table1{margin: 0 auto;}}   
@media ( min-width: 768px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 690px;} .carP1{font-size: 1.3rem;} .carP2{font-size: 1.1rem;} p.carP1, p.carP2{margin: 0;} table#header{min-width: 650px;} .div-table1{margin: 0 auto;}}   
@media ( min-width: 1024px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 930px;} .carP1{font-size: 1.5rem;} .carP2{font-size: 1.3rem;} p.carP1, p.carP2{margin: 0;} table#header{min-width: 800px;} .div-table1{margin: 0 auto;}}
@media ( min-width: 1199px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 1100px;} .carP1{font-size: 1.5rem;} .carP2{font-size: 1.3rem;} p.carP1, p.carP2{margin: 0;} table#header{min-width: 1000px;} .div-table1{margin: 0 auto;}}

@media ( max-width: 900px) {.titleBtn{width:90px; display:inline-block; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;}}
/* @media ( min-width: 900px) {.titleBtn{}} */
@media ( max-width: 576px) { #pageList {float:left;} .titleBtn{display:inline-block; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;}}
/* footer*/
	footer {width: 100%; background-color: #e3e3e3; padding: 10px ;	text-align: center;	font-size:12px;	height: 100px;	}
	#wrapper{min-height: calc(100vh - 100px);}

div.tablediv{
width: 100%; margin: 0;}

</style>
<script>
	var qnaPwd;
	var qnaNo;
	
	function pwChk(qnaPwd,qnaNo) {
		console.log(qnaPwd);
		
		if(qnaPwd == ""){
			console.log("if1 "+qnaPwd);
			location.href = "./QnaView.qna?QNA_NO=" +qnaNo;
			console.log(qnaNo);
		} else {
			console.log("else1 "+qnaPwd);
			var inputPwd = prompt('게시글 비밀번호를 입력해주세요.');
			console.log(inputPwd);
		
			if(qnaPwd == inputPwd) {
				console.log("if2 "+qnaPwd);
				location.href = "./QnaView.qna?QNA_NO=" +qnaNo;
			} else {
				alert("비밀번호가 틀렸습니다.");
			}
		}
	};
	
// 	function formatDate(inputDate) {
// 		  var parts = inputDate.split('/');
// 		  var year = parts[0];
// 		  var month = parts[1];
// 		  var day = parts[2];

// 		  return year + '/' + month + '/' + day;
// 		}

// 	var formattedDate = formatDate('${qna.QNA_DATE}');
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
<section>
	<div id="wrap">

		<div align="center" class="container-md div-table1">
			<b style="font-size:25px">글목록</b> <br>
			<p id="totalcount">(전체 글:${pageInfo.listCount })</p>
			<table id="header" class="seat-table" >
				<tbody>
				<tr style="background-color: rgb(228, 231, 250)">
					<th width="10%;">NO</th>
					<th width="55%" class="td1">제목</th>
					<th width="15%">작성자</th>
					<th width="20%">작성일</th>
				</tr>
	<c:choose>
	<c:when test="${qnaList ne null }">
		<c:forEach var="qna" items="${qnaList }">	
		 
		<fmt:parseDate value="${qna.QNA_DATE}" var="parseDate" pattern="yyyy-MM-dd HH:mm:ss" />
        <fmt:formatDate value="${parseDate}" var="parseDate1"  pattern="yyyy-MM-dd"/>
		<c:if test="${qna.QNA_PASSWD ne null }">
		
			<tr>
				<td width="10%">${qna.QNA_NO}</td>
				<td width="55%" class="td1"><img src="./img/lock_icon.png" style="width : 13px;"><span class="titleBtn" onclick="pwChk('${qna.QNA_PASSWD}','${qna.QNA_NO}');">${qna.QNA_TITLE}</span> </td>
				<td width="15%">${qna.USER_ID}</td>
				<td width="20%">${parseDate1}</td>
			</tr>
		</c:if>
		<c:if test="${qna.QNA_PASSWD eq null }">
			<tr  >
				<td width="10%">${qna.QNA_NO}</td>
				<td width="55%" class="td1"><span class="titleBtn" onclick="pwChk('${qna.QNA_PASSWD}','${qna.QNA_NO}');">${qna.QNA_TITLE}</span></td>
				<td width="15%">${qna.USER_ID}</td>
				<td width="20%">${parseDate1}</td>
				</tr>
		</c:if>
		
		</c:forEach>
	</c:when>
</c:choose></tbody></table>
		<br>
	
	<% if(uid != null) {%>
			<button type="button" class="writebtn" onclick="location.href='./qnaBoard.jsp'" >글등록</button>
	<%} else { %>
			<button type="button" class="writebtn" onclick="location.href='./userLogin.us'" >글등록</button>
	<%} %>
		
	<div id="pageList">
		
		<%
		if (nowPage <= 1) {
		%>
		<button class="page btn prev" type="button">&lt;</button>
		&nbsp;&nbsp;
		<%
		} else {
		%>
		<button class="page btn prev" type="button"
			onclick="location.href='./qnaList.qna?page=<%=nowPage - 1%>';">&lt;</button>
		&nbsp;&nbsp;
		<%
		}
		%>
		

		<%for(int a=startPage;a<=endPage;a++){
				if(a==nowPage){%>  
					<button class="page btn number view-number-btn" type="button"><%=a %></button>
				<%}else{ %>
					<button class="page btn number" type="button"
				onclick="location.href='./qnaList.qna?page=<%=a%>';"><%=a%></button>
				<%} %>
		<%} %>
		
		<%
		if (nowPage >= maxPage) {
		%>
		&nbsp;
		<button class="page btn next" type="button">&gt;</button>
		<%
		} else {
		%>
		&nbsp;
		<button class="page btn next"
			onclick="location.href='./qnaList.qna?page=<%=nowPage + 1%>';"
			type="button">&gt;</button>
		<%
		}
		%>
			
	</div>
	</div>
	</div>
	<br><br><br><br>
</section>
</div>
    <div class="goTop">
<a href="./main.jsp"><img src="./img/home_icon.png" class="mapicon" id="homeicon" alt="gohome"></a> 
<a href="#"><img src="./img/gotop_icon.png" class="mapicon" id="topicon" alt="gotop"></a>
</div>
<footer>
        <nav><br>
            Project ALLib<br>
            copyright ⓒ2023 Himedia Academy, All Rights Reserved.<br>
            삶은 계란&nbsp;|&nbsp;정하늘 홍기락 최영호 유미애 김주형 임금준 류동현 박경진 최금녕
        </nav>
    </footer> 

</body>
</html>