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
 <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" type="text/css" href="./css/admin_header_footer_font.css"> 

<title>(관리자) 도서 등록</title>
    <style>
    .btn {background-color:white; }
    .btn:hover { background-color: lightgray;}
    form { max-width: 500px; margin: 0 auto;     }  
    #joinformArea {width: 500px;
	margin: 120px auto;
	border: 1px solid gray;
	max-width:90%;  }
    table {
	width: 380px;
	margin: 30px auto;
	margin-bottom: 50px;
	text-align: center;}
	.t1{ text-align: right;}
	 tr{height: 50px; width: 200px;}
	 td{width: 80%;}
    
    .insert{width: 250px;}

 	.description{width: 100%; height: 80px;display : inline; } 
	.insertbtn{width: 30%;height: 50px; box-sizing: border-box; border: 2px solid lightgray; font-synthesis: 15pt; background-color: rgb(151, 161, 255);
        color: #fff; outline: none; display : inline; font-size:15px;}

	input:hover{cursor: pointer;}
	textarea{resize: none;}
	.tdclass{text-align: right; padding-top: 20px;} 
      

    
  
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
	  <button type="button" class="btn" style="float: right;" onclick="location.href='./userLogout.us'">
  		로그아웃
  		</button>
	</nav>
</header>
<section id="joinformArea">
<form name="fm" action="./BookInsertAction.book">
<table>
			<tr>
			<td class="t1">제목 :&nbsp&nbsp</td>
			<td><input type="text" name="BOOK_NAME" class="insert title"  required></td>
			</tr>
			<tr>
			<td class="t1">작가 :&nbsp&nbsp</td>
			<td><input type="text" name="BOOK_WRITER" class="insert writer"  required></td>
			</tr>
			<tr>
			<td class="t1">출판사 :&nbsp&nbsp</td>
			<td><input type="text" name="BOOK_COMPANY" class="insert company" required></td>
			</tr>
			<tr>
			<td class="t1">설명 :&nbsp&nbsp</td>
			<td><textarea cols="50" rows="10" class="description" name="BOOK_DESCRIPTION" ></textarea></td>
			</tr>
			<tr>
			<td class="t1">코드번호 :&nbsp&nbsp</td>
			<td><input type="text" name="BOOK_CODE" class="insert code"  required></td>
			</tr>
			<tr>
	 <td class="tdclass" colspan="2"><input type="submit" name="registration" class="btn registration insertbtn" value="등록">
	 <input type="reset" class="btn subm1 insertbtn" value="초기화">
	 <button class="btn subm1 insertbtn" > <a href="./BookMListAction.book" style="font-synthesis: 15pt; background-color: rgb(151, 161, 255);
        color: #fff; display : inline;">도서목록</a></button></td>
		</tr></table>	
		</form>		
	</section><br><br><br><br>
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