<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="./css/admin_header_footer_font.css">
<title>(관리자) QNA 리스트</title>
<style>


#logoutBtn:hover {
	font-color: #6a5acd;
}

p#totalcount {
	text-align: right;
}
	    section.user-page-section>button {
        border: 1px solid rgb(75, 116, 255);
        padding: 0;
        width: 35px;
        background-color: #fff;
        color: rgb(75, 116, 255);
        font-weight: bold;
        border-radius: 3px;
    }

    section.user-page-section>button.view-number-btn {
        border: 1px solid rgb(75, 116, 255);
        background-color: rgb(75, 116, 255);
        color: #fff;
        border-radius: 3px;
    }

.titleBtn {
	background-color : transparent;
	border : none;
}

.titleBtn:active {
	outline : none;
	border : none;
	box-shadow : none;
}

	table.qna-list-table {
		max-width:90%; 
       width: 1000px;
       margin: auto;
       text-align: center;
   }

    table.qna-list-table>tbody>tr {
        height: 35px;
    }

    table.qna-list-table>tbody>tr>th {
        background-color: rgb(228, 231, 250);
    }

    table.qna-list-table>tbody>tr:nth-child(odd) {
        background-color: rgb(239, 241, 245);
    }

    table.qna-list-table>tbody>tr:hover {
        background-color: rgb(229, 239, 255);
    }
    div#wrap>section.qna-list-section{
   		 max-width:90%;
       width: 1000px;
       margin: auto;
       text-align: center;
		height: 100%;
		}
		
		table.qna-list-table>tbody>tr>td>button {
        border: 1px solid rgb(0, 192, 205);
        ;
        color: rgb(0, 192, 205);
        ;
        border-radius: 3px;
    }
</style>
<script>
	var qnaNo;
	
	function qnaView(qnaNo){
		location.href="./QnaView.qna?QNA_NO=" +qnaNo;
	};
</script>
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
	        Q&amp;A관리
	      </a>
	      <div class="dropdown-menu">
	        <a class="dropdown-item" href="./qnaList.qna">Q&amp;A 목록</a>
	      </div>
	    </li>        
	  </ul>
	  <button type="button" class="btn navbtn" id="navbtn" style="float: right;" onclick="location.href='./userLogout.us'">로그아웃
     </button>  
	</nav>
</header>
<br><br>
	<div id="wrap">
<section class="qna-list-section">
		<h3>QNA 목록</h3>
		<div align="center" class="container-sm">
			<p id="totalcount">(전체 글:${pageInfo.listCount })</p>
			<section>
			<table class="qna-list-table">
			<tbody>
				<tr>
					<th>NO</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>처리상황</th>
					<th> </th>
				</tr>
<c:choose>
	<c:when test="${qnaList ne null }">
		<c:forEach var="qna" items="${qnaList }">
			<tr>
				<td>${qna.QNA_NO}</td>
				<td>${qna.QNA_TITLE}</td>
				<td>${qna.USER_ID}</td>
				<td>${qna.QNA_DATE}</td>
				<c:if test="${qna.QNA_COMMENT eq null }">
				<td>답변중</td>
				</c:if>
				<c:if test="${qna.QNA_COMMENT ne null}">
				<td>답변완료</td>
				</c:if>
				<td><button type="submit" class="titleBtn" onclick="qnaView('${qna.QNA_NO}');">댓글달기</button></td>
			</tr>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<tr>
			<td colspan="5">Q&amp;A 목록이 없습니다.</td>
		</tr>
	</c:otherwise>
</c:choose>
			</tbody>
		</table>
		</section>
		<br>
		
		
	<section id="pageList" class="user-page-section">
			<%
			if (nowPage <= 1) {
			%>
			<button class="page-prev-btn" type="button">&lt;</button>
			&nbsp;&nbsp;
			<%
			} else {
			%>
			<button class="page-prev-btn" type="button"
				onclick="location.href='./qnaList.qna?page=<%=nowPage - 1%>';">&lt;</button>
			&nbsp;&nbsp;
			<%
			}
			%>

			<%
			for (int a = startPage; a <= endPage; a++) {
				if (a == nowPage) {
			%>
			<button class="page-number-btn view-number-btn" type="button"><%=a%></button>
			<%
			} else {
			%>
			<button class="page-number-btn" type="button"
				onclick="location.href='./qnaList.qna?page=<%=a%>';"><%=a%></button>
			<%
			}
			}
			%>

			<%
			if (nowPage >= maxPage) {
			%>
			&nbsp;
			<button class="page-next-btn" type="button">&gt;</button>
			<%
			} else {
			%>
			&nbsp;
			<button class="page-next-btn"
				onclick="location.href='./qnaList.qna?page=<%=nowPage + 1%>';"
				type="button">&gt;</button>
			<%
			}
			%>
			</section>
			</div>
</section>
</div>
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