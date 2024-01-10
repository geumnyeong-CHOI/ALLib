<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(관리자) 회원정보수정</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" type="text/css" href="./css/admin_header_footer_font.css">
<style>
nav.navbar {
        font-color: white;
    }

    .btn {
        background-color: white;
    }
    
    
#userInfoArea {

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

input[type=submit], #btn2 {
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
    
#uid {
   background-color : #E3E3E3;
   border : 1px solid #E3E3E3;
}

#uid:focus {
   outline : none;
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
      <a class="nav-link dropdown-toggle" id="navbardrop" data-toggle="dropdown">좌석관리</a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="./SeatAdminChkAction.me">좌석현황</a>
      </div>
    </li>
    <li class="nav-item dropdown" id="userAdmin">
      <a class="nav-link dropdown-toggle" id="navbardrop" data-toggle="dropdown">회원관리</a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="./userListAction.us">회원 목록</a>
      </div>
    </li>
    <li class="nav-item dropdown" id="qnaAdmin">
      <a class="nav-link dropdown-toggle" id="navbardrop" data-toggle="dropdown">Q&amp;A관리</a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="./qnaList.qna">Q&amp;A 목록</a>
      </div>
    </li>        
  </ul>
  <button type="button" class="btn" style="float: right;" onclick="location.href='./userLogout.us'">
  	로그아웃
  </button> 
</nav></header>
<br>

<section id="userInfoArea">
<form action="updateUserProAction.us" method="post">
	<table>
		<c:choose>
			<c:when test="${users ne null }">
				<tr>
               <td class="t1">아이디 :</td>
               <td><input type="text" name="USER_ID" id="uid" value="${users.USER_ID }" readonly></td>
            	</tr>
				<tr>
					<td class="t1">비밀번호 :</td>
					<td><input type="text" name="USER_PASSWD" value="${users.USER_PASSWD}"></td>
				</tr>
				<tr>
					<td class="t1">이름 :</td>
					<td><input type="text" name="USER_NAME" value="${users.USER_NAME}"></td>
				</tr>
				<tr>
					<td class="t1">생년월일 :</td>
					<td><input type="text" name="USER_BIRTH" value="${users.USER_BIRTH}"></td>
				</tr>
				<tr>
					<td class="t1">핸드폰번호 :</td>
					<td><input type="text" name="USER_PHONE" value="${users.USER_PHONE}"></td>
				</tr>
				<tr>
					<td class="t1">이메일 주소 :</td>
					<td><input type="text" name="USER_EMAIL" value="${users.USER_EMAIL}"></td>
				</tr>
				<tr>
					<td colspan=2><input type="submit" value="수정완료">
					<button type="button" id ="btn2" onclick = "location.href = 'userListAction.us' ">리스트로 돌아가기</button> 
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="2">일치하는 회원 정보가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
</form>
</section></div>
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