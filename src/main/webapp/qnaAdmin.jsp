<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String uid = (String) session.getAttribute("USER_ID"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="./css/admin_header_footer_font.css">
<title>QNA 게시글</title>
<style>
	@media screen and (min-width: 1024px) and (orientation: landscape) {
		html, body {
			margin: 0px;
			padding: 0px;
		}
	}
	
	* {
		box-sizing: border-box;
	}
	
	nav {
		height: 60px;
	}
	
	.navbar-dark .navbar-nav .nav-link {
		color: darkolivegreen;
	}
	
	footer {
		bottom: 0px;
		left: 0;
		height: 120px;
		width: 100%;
		background-color: #e3e3e3;
		padding: 10px;
		text-align: center;
		padding-top: 25px;
		font-size: 15px;
		transform: translateY(-100%);
	}
	
	.div1 {
		height: auto;
		min-height: 100%;
		padding-bottom: 100px;
	}
	
	input:hover {
		outline: none;
	}
	input:focus{
		outline: none;
	}
	
	
	#qnaInfoArea {
		width: 500px;
		margin: 120px auto;
		border: 1px solid gray;
		max-width:90%; 
	}
	table {
		width: 380px;
		margin: 30px auto;
		text-align: center;
	}
	tr{height: 50px;}
	.t1{ text-align: right;}
	
	input[name=USER_ID] {
/* 	   background-color : #E3E3E3; */
/* 	   border : 1px solid #E3E3E3; */
		border:none;
	}
	input[name=USER_ID]:focus {
	   outline : none;
	}
	
	input[name=QNA_NO], input[name=QNA_TITLE] {
		border: none;
		outline: none;
	}
	td.content-title, td.reply-title {
		vertical-align: top;
	}
	td.content-value {
		padding:0 20px;
		text-align: left;
		word-break: break-all;
	}
	td.reply-title, td.reply-value {
		padding-top: 15px;
	}
	
	textarea {
		width: 84%;
	}
	
	table.qna-form-table>tbody>tr>td:first-child {
		width: 60px;
	}
	table.qna-form-table>tbody>tr>td>input {
		width: 84%;
	}
	
	table.qna-btn-table {
		width: 380px;
		margin: 30px auto;
		text-align: center;
	}
	table.qna-btn-table>tbody>tr>td {
		padding-left:0;
	}
	table.qna-btn-table>tbody>tr>td>input[type=submit] {
	        width: 350px;
	        height:40px;
	        max-width: 350px;
	        background-color: rgb(151, 161, 255);
	        color: #fff;
	        border: none;
	        border-radius: 5px;
	        margin:10px;
	        padding:5px;
	}
</style>
</head>


<body>
<div class="div1 wrapper">
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


<section id="qnaInfoArea">
	<form action="./qnaComment.qna">
		<table class="qna-form-table">
		<tbody>
			<c:choose>
				<c:when test="${qvo ne null }">
					<tr>
	               <td class="t1">글번호 :</td>
	               <td><input type="text" name="QNA_NO" id="uid" value="${qvo.QNA_NO }" readonly></td>
	            	</tr>
					<tr>
						<td class="t1">제목 :</td>
						<td><input type="text" name="QNA_TITLE" value="${qvo.QNA_TITLE }" readonly></td>
					</tr>
					<tr>
						<td class="t1">아이디 :</td>
						<td><input type="text" value="${qvo.USER_ID }" name="USER_ID" readonly></td>
					</tr>
					<tr>
						<td class="t1 content-title">내용 :</td>
						<td class="content-value">
							${qvo.QNA_CONTENT }
							<input type="hidden" name="QNA_CONTENT" value="${qvo.QNA_CONTENT }">
						</td>
					</tr>
					<tr>
						<td class="t1 reply-title">답변 :</td>
						<td class="reply-value"><textarea name="QNA_COMMENT" rows="6" ></textarea></td>
					</tr>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
		</tbody>
		</table>
		<table class="qna-btn-table">
		<tbody>
			<tr>
				<td><input type="submit" value="답변하기"></td>
			</tr>
		</tbody>
		</table>
	</form>
</section>

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

