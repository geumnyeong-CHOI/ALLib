<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="vo.BookInfoVO" %>    
<%@ page import="dao.BookDAO" %>
<%@ page import="java.util.*" %>
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
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ALLib - (관리자) 도서 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.js"></script>
  <link rel="stylesheet" type="text/css" href="./css/admin_header_footer_font.css">

<style>
	.btn {background-color:white;}
	/*목록 tr라인 높이*/
	table.book-list-table > tbody > tr {
		height: 35px;
	}
	
	/*타이틀 tr라인(th) 배경색*/
	table.book-list-table > tbody > tr > th {
		background-color: rgb(228, 231, 250);
	}
	
	/*홀수 번째 tr 목록라인 배경색*/
	table.book-list-table > tbody > tr:nth-child(odd) {
		background-color: rgb(239, 241, 245);
	}
	
	/*목록 tr라인 hover 배경색*/
	table.book-list-table > tbody > tr:hover {
		background-color: rgb(229, 239, 255);
	}
	
	table.book-list-table > tbody > tr > td > button.book-modify-btn {
	/* 	background-color: rgb(98, 160, 60); */
		border: 1px solid rgb(0, 192, 205);;
		color: rgb(0, 192, 205);;
		border-radius: 3px;
	}
	table.book-list-table > tbody > tr > td > button.book-delete-btn {
	/* 	background-color: rgb(230, 187, 32); */
		border: 1px solid rgb(255, 113, 97);
		color: rgb(255, 113, 97);
		border-radius: 3px;
	}
	
	section.book-page-section > button {
		border: 1px solid rgb(75, 116, 255);
		padding: 0;
		width: 35px;
		background-color: #fff;
		color: rgb(75, 116, 255);
		font-weight: bold;
		border-radius: 3px;
	}
	
	section.book-page-section > button.view-number-btn {
		border: 1px solid rgb(75, 116, 255);
		background-color: rgb(75, 116, 255);
		color: #fff;
		border-radius: 3px;
	}
	

	#wrap{
		padding: 50px;
	}
	
	table.book-list-table {
		max-width:90%; 
     	width: 1000px; 
		margin: 20px auto;
		text-align: center;
	}
	
	div#wrap > section.book-title-section, section.book-page-section {
		width: 400px;
		margin: auto;
		text-align: center;
		height: 100%;
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
	        <a class="dropdown-item" href="./qnaBoard.jsp">Q&A 목록</a>
	      </div>
	    </li>        
	  </ul>
	  <button type="button" class="btn" style="float: right;" onclick="location.href='./userLogout.us'">
  		로그아웃
  		</button>
	</nav>
</header>
<div id="wrap">
	<section id="bookListArea" class="book-list-section">
		<table class="book-list-table">
		<tbody>
		<tr>
			<th>코드</th><th>제목</th><th>대여</th><th>수정<br>삭제</th>
		</tr>
		
		<c:choose>
			<c:when test="${bookList ne null }">
				<c:forEach var = "bookList" items = "${bookList}">
					<tr>
						<td>${bookList.BOOK_CODE}</td>
						<td>${bookList.BOOK_NAME}</td>
						<c:if test="${bookList.BOOK_YN eq 'n' }">
						<td>대여가능</td>
		            </c:if>
		            <c:if test="${bookList.BOOK_YN eq 'y' }">
						<td>대여중</td>
		            </c:if>
						<td><a href="BookInfoViewAction.book?book_code=${bookList.BOOK_CODE}">상세보기</a></td>
				</c:forEach>			
			</c:when>
			<c:otherwise>
				<tr><td colspan="2">도서 목록이 없습니다.</td></tr>
			</c:otherwise>
		</c:choose>
		
	</table>
	</section>

	<section id="pageList" class="book-page-section">
		<%if(nowPage<=1){ %> 
			<button class="page-prev-btn" type="button">&lt;</button>&nbsp;&nbsp;
		<%}else{ %>
			<button class="page-prev-btn" type="button" onclick="location.href='./BookMListAction.book?page=<%=nowPage - 1%>';">&lt;</button>&nbsp;&nbsp;
		<%} %>

		<%for(int a=startPage;a<=endPage;a++){
				if(a==nowPage){%>  
					<button class="page-number-btn view-number-btn" type="button"><%=a%></button>
				<%}else{ %>
					<button class="page-number-btn" type="button" onclick="location.href='./BookMListAction.book?page=<%=a%>';"><%=a%></button>
				<%} %>
		<%} %>

		<%if(nowPage>=maxPage){ %>
			&nbsp;<button class="page-next-btn" type="button">&gt;</button>
		<%}else{ %>
			&nbsp;<button class="page-next-btn" onclick="location.href='./BookMListAction.book?page=<%=nowPage + 1%>';" type="button">&gt;</button>
		<%} %>
	</section>
</div></div>
<footer>
        <nav>
            <span>Project ALLib</span><br>
            <span>copyright ⓒ2023 Himedia Academy, All Rights Reserved.</span><br>
            <span>삶은 계란<span class="slash">&nbsp;|&nbsp;</span>정하늘 홍기락 최영호 유미애 김주형 임금준 류동현 박경진 최금녕</span>
        </nav>
</footer>

</body>
</html>