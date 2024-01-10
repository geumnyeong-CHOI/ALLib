<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@page import="vo.*"%>

<!DOCTYPE html>
<html>
<head>
  <title>Admin Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.js"></script>
  <link rel="stylesheet" type="text/css" href="./css/admin_header_footer_font.css">
<style>
@charset "UTF-8";
	/* 폰트 */
	@font-face { font-family: 'nunito'; src : url('../font/Nunito-VariableFont_wght.ttf'); unicode-range: U+0041-005A, U+0061-007A;}
	@font-face { font-family: 'notosans'; src: url('../font/NotoSansKR-VariableFont_wght.ttf'); }
	@font-face { font-family: 'notoserif'; src : url('../font/NotoSerifKR-Medium.otf'); } 

	/* 전체 */
	html, body {
    	height: 100%;
    	width: 100%;
	}
	
	body{	
		font-family: 'nunito', 'notosans', 'notoserif';
	}
		
	* {
		box-sizing: border-box;
	}
	
	/* navbar */
	nav.navbar {
		background-color: #6A5ACD; 
		font-color:white;
	}
	
	nav li a, a.navbar-brand{
		color: white;
		margin: 0 10px;
	}
	
	.dropdown-item{
		width: 90%;
	}

	nav li a:hover, a.navbar-brand:hover{
		font-weight: bold;
		color: white;
		cursor: pointer;
	}
	
	.navbtn {
 		background-color:white;
	}
	
	button a{
		color: black;
	}
	
	nav > button.btn:hover, nav > button.btn a:hover {
		color: black !important;
		text-decoration: none;
		font-weight: bold;
		background-color: #g3g3g3;
	}
	
	/* footer */
	footer {
			width: 100%;
			background-color: #e3e3e3;
			padding: 10px ;
			text-align: center;
			font-size:12px;
			height: 100px;
	}
	
	#wrapper{
		min-height: calc(100vh - 100px); 
	}

	
	div.book-seat-div, div.user-qna-div {
		-webkit-justify-content: center;
		justify-content: flex-center;
	}
	div.user-qna-div {
		margin-top: 30px;
	}
	
	div.book-div, div.seat-div {
		border: 1px solid rgb(17, 103, 238);
		border-radius: 5px;
		padding-top: 8px; padding-bottom: 8px;
	}
	
	div.user-div, div.qna-div {
		border: 1px solid rgb(231, 93, 205);
		border-radius: 5px;
		padding-top: 8px; padding-bottom: 8px;
	}
	
	div.book-div > table {
		width: 100%;
	}
	div.book-div > table > tbody > tr {
		height: 33px;
	}
	div.book-div > table > tbody > tr > td {
		padding-left: 4px;
	}
	div.book-div > table > tbody > tr:first-child {
		height: 50px;
		vertical-align: top;
	}
	div.book-div > table > tbody > tr:nth-child(2) {
		background-color: rgb(219, 232, 255);
	}
	div.book-div > table > tbody > tr:not(first-child):hover {
		background-color: rgb(231, 240, 252);
	}
	div.book-div > table > tbody > tr > th + th {
		text-align: right;
	}
	div.book-div > table > tbody > tr > th + th > a {
		color: rgb(17, 103, 238);
	}
	
	div.seat-div > table {
		width: 100%;
	}
	div.seat-div > table > tbody > tr {
		height: 33px;
	}
	div.seat-div > table > tbody > tr > td {
		padding-left: 4px;
	}
	div.seat-div > table > tbody > tr:first-child {
		height: 50px;
		vertical-align: top;		
	}
	div.seat-div > table > tbody > tr:nth-child(2) {
		background-color: rgb(219, 232, 255);
	}
	div.seat-div > table > tbody > tr:not(first-child):hover {
		background-color: rgb(231, 240, 252);
	}
	div.seat-div > table > tbody > tr > th + th {
		text-align: right;
	}
	div.book-div > table > tbody > tr > th + th > a {
		color: rgb(17, 103, 238);
	}
	
	div.user-div > table {
		width: 100%;
	}
	div.user-div > table > tbody > tr {
		height: 33px;
	}
	div.user-div > table > tbody > tr > td {
		padding-left: 4px;
	}
	div.user-div > table > tbody > tr:first-child {
		height: 50px;
		vertical-align: top;		
	}
	div.user-div > table > tbody > tr:nth-child(2) {
		background-color: rgb(231, 228, 249);
	}
	div.user-div > table > tbody > tr:not(first-child):hover {
		background-color: rgb(240, 238, 251);
	}
	div.user-div > table > tbody > tr > th + th {
		text-align: right;
	}
	div.user-div > table > tbody > tr > th + th > a {
		color: rgb(231, 93, 205);	
	}
	
	div.qna-div > table {
		width: 100%;
	}
	div.qna-div > table > tbody > tr {
		height: 33px;
	}
	div.qna-div > table > tbody > tr > td {
		padding-left: 4px;
	}
	div.qna-div > table > tbody > tr:first-child {
		height: 50px;
		vertical-align: top;		
	}
	div.qna-div > table > tbody > tr:nth-child(2) {
		background-color: rgb(231, 228, 249);
	}
	div.qna-div > table > tbody > tr:not(first-child):hover {
		background-color: rgb(240, 238, 251);
	}
	div.qna-div > table > tbody > tr > th + th {
		text-align: right;
		color: rgb(231, 93, 205);	
	}
	div.qna-div > table > tbody > tr > th + th > a {
		color: rgb(231, 93, 205);	
	}
</style>
</head>
<body>
<div id="wrapper">

<header>
	<nav class="navbar navbar-expand-sm ">
	  <a class="navbar-brand" href="./userTypeCheckAction.us">Home</a>
	  <ul class="navbar-nav">
	    <li class="nav-item dropdown" id="bookAdmin">
	      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
	        도서관리
	      </a>
	      <div class="dropdown-menu">
	        <a class="dropdown-item" href="./BookMListAction.book">전체목록</a>
	        <a class="dropdown-item" href="./book_m_insert.jsp">도서등록</a>
	      </div>
	    </li>
		<li class="nav-item dropdown" id="seatAdmin">
	      <a class="nav-link dropdown-toggle" id="navbardrop" data-toggle="dropdown">
	        좌석관리
	      </a>
	      <div class="dropdown-menu">
	        <a class="dropdown-item" href="./SeatAdminChkAction.me">좌석현황</a>      </div>
	    </li>
	    <li class="nav-item dropdown" id="userAdmin">
	      <a class="nav-link dropdown-toggle" id="navbardrop" data-toggle="dropdown">
	        회원관리
	      </a>
	      <div class="dropdown-menu">
	        <a class="dropdown-item" href="./userListAction.us">회원 목록</a>
	      </div>
	    </li>
	    <li class="nav-item dropdown" id="qnaAdmin">
	      <a class="nav-link dropdown-toggle" id="navbardrop" data-toggle="dropdown">
	        Q&A관리
	      </a>
	      <div class="dropdown-menu">
	        <a class="dropdown-item" href="./qnaList.qna">Q&A 목록</a>
	      </div>
	    </li>        
	  </ul>
	  <button type="button" class="btn navbtn" id="navbtn" style="float: right;" onclick="location.href='./userLogout.us'">
	  로그아웃
	  </button> 
	</nav>
</header>

<br><br>

<div class="container-fluid fluid-main-div">
	<div class="row book-seat-div"> 
		<div class="col-sm-4 book-div" id="adbook">
			<table>
			<tbody>
			<tr>
				<th colspan="2"><b>도서현황</b></th>
				<th><a href="./BookMListAction.book">more ..</a></th>
			</tr>
			<tr>
				<td>도서이름</td>
				<td>대여일자</td>
				<td>반납일자</td>
			</tr>
		<c:choose>
			<c:when test="${adminBookList ne null }">
				<c:forEach var="bry" items="${adminBookList}">
			<tr>
				<td>${bry.BOOK_NAME}</td>
				<td>${bry.RDATE}</td>
				<td>${bry.OVERDUE}</td>
			</tr>
				</c:forEach>
			</c:when>
		</c:choose>
			</tbody>		
			</table>
		</div>
		
		<div class="col-sm-4 seat-div" id="adseat">
			<table>
			<tbody>			
			<tr>
				<th colspan="2"><b>좌석현황</b></th>
				<th><a href="./SeatAdminChkAction.me">more ..</a></th>
			</tr>
			<tr>
				<td>예약자명</td>
				<td>좌석번호</td>
				<td>예약일자</td>
			</tr>
		<c:choose>
			<c:when test="${adminSeatList ne null }">
				<c:forEach var="sv" items="${adminSeatList}">
			<tr>
				<td>${sv.USER_NAME}</td>
				<td>${sv.SEAT_NO}</td>
				<td>${sv.SEAT_DAY}</td>
			</tr>
				</c:forEach>
			</c:when>
		</c:choose>
			</tbody>		
			</table>
		</div>
	</div>
</div>

<div class="container-fluid">
	<div class="row user-qna-div"> 
		<div class="col-sm-4 user-div" id="aduser">
			<table>
			<tbody>			
			<tr>
				<th colspan="2"><b>회원현황</b></th>
				<th><a href="./userListAction.us">more ..</a></th>
			</tr>
			<tr>
				<td>회원번호</td>
				<td>회원이름</td>
				<td>아이디</td>
			</tr>
		<c:choose>
			<c:when test="${adminUserList ne null }">
				<c:forEach var="uv" items="${adminUserList}">
			<tr>
				<td>${uv.USER_NO}</td>
				<td>${uv.USER_NAME}</td>
				<td>${uv.USER_ID}</td>
			</tr>
				</c:forEach>
			</c:when>
		</c:choose>
			</tbody>		
			</table>
		</div>
		
		<div class="col-sm-4 qna-div" id="adqna">
			<table>
			<tbody>			
			<tr>
				<th colspan="2"><b>Q&A현황</b></th>
				<th><a href="./qnaList.qna">more ..</a></th>
			</tr>
			<tr>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
			</tr>
		<c:choose>
			<c:when test="${adminQnaList ne null }">
				<c:forEach var="qv" items="${adminQnaList}">
				<fmt:parseDate value="${qv.QNA_DATE}" var="parseDate" pattern="yyyy-MM-dd HH:mm:ss" />
				<fmt:formatDate value="${parseDate}" var="parseDate1"  pattern="yyyy-MM-dd"/>
			<tr>
				<td>${qv.QNA_TITLE}</td>
				<td>${qv.USER_ID}</td>
				<td>${parseDate1}</td>
			</tr>
				</c:forEach>
			</c:when>
		</c:choose>
			</tbody>		
			</table>
		</div>
	</div>
</div>


<br><br><br>
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
