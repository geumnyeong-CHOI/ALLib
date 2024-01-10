<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>(관리자) 도서 수정 삭제</title>

<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="./css/admin_header_footer_font.css">
<style>

 

   button.btn { 
         background-color: white;
     } 

 
	#main{width: 100%;}
	form{width: 500px; margin: 0 auto;}
	
 button[type=submit] {
         border: 1px solid rgb(0, 192, 205);
        color: rgb(0, 192, 205);
        border-radius: 3px;
    }

button.btn2 {
        border: 1px solid rgb(255, 113, 97);
        color: rgb(255, 113, 97);
        border-radius: 3px;
    }
    
button.btn3 {
        border: 1px solid #31b071;
        color: #31b071;
        border-radius: 3px;
    }
button.btnsizet{
	width: 47%;
	height: 50px;
}
button.btnsizeb{
	margin-top: 10px;
	width: 95%;
	height: 50px;
}

button.btnsizet, button.btnsizeb{
	background-color: white;
}
 
 .dv1{text-align:center;}

	.insert{width: 100%; height: 50px; padding: 15px 50px; box-sizing: border-box; border: 1px solid lightgray; font-synthesis: 12pt; color: rgb(121, 119, 119); outline: none;}
	.description{width: 100%; height: 150px; padding: 15px 50px; box-sizing: border-box; border: 1px solid lightgray; font-synthesis: 12pt; color: rgb(121, 119, 119); outline: none;}

	textarea{resize: none;}
	
	#code{display:none;}
input[type=radio]{margin:10px; }

.tle {
	font-size : 1.2rem;
	font : 'notoserif';
}

form > div {
	margin-top : 10px;
}
	 
</style>  

<script>
var dId;
function deleteConf(dId) {
	if(confirm("정말 삭제하시겠습니까?")) {
		alert("삭제되었습니다!");
		location.href="BookInfoDeleteAction.book?book_code=" + dId;
	}else{
		alert("취소되었습니다.")
	}
}
</script>   
</head>
<body>
<div id="wrapper">
<header>

<nav class="navbar navbar-expand-sm ">
		<a class="navbar-brand" href="./userTypeCheckAction.us">Home</a>
		<ul class="navbar-nav">
			<li class="nav-item dropdown" id="bookAdmin"><a
				class="nav-link dropdown-toggle" href="#" id="navbardrop"
				data-toggle="dropdown"> 도서관리 </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="./BookMListAction.book">전체목록</a> <a
						class="dropdown-item" href="./book_m_insert.jsp">도서등록</a>
				</div></li>
			<li class="nav-item dropdown" id="seatAdmin"><a
				class="nav-link dropdown-toggle" id="navbardrop"
				data-toggle="dropdown"> 좌석관리 </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="./SeatAdminChkAction.me">좌석현황</a>
				</div></li>
			<li class="nav-item dropdown" id="userAdmin"><a
				class="nav-link dropdown-toggle" id="navbardrop"
				data-toggle="dropdown"> 회원관리 </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="./userListAction.us">회원 목록</a>
				</div></li>
			<li class="nav-item dropdown" id="qnaAdmin"><a
				class="nav-link dropdown-toggle" id="navbardrop"
				data-toggle="dropdown"> Q&A관리 </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="./qnaList.qna">Q&A 목록</a>
				</div></li>
		</ul>
         <button type="button" class="btn" style="float: right;" onclick="location.href='./userLogout.us'">
  		로그아웃
  		</button>  
	</nav>
	<br>
	<br>
	</header>
<c:choose>
	<c:when test="${bookView ne null }">
	<div id="main">
		<form name="fm" action="./BookInfoUpdateAction.book">
			<div class="titleBox">
				<span class="tle">제목</span><input type="text" name="BOOK_NAME" class="insert title" value="${bookView.BOOK_NAME }" required>
			</div>
			<div class="writerBox">
				<span class="tle">작가</span><input type="text" name="BOOK_WRITER" class="insert writer" value="${bookView.BOOK_WRITER}" required>
			</div>
			<div class="writerBox">
				<span class="tle">출판사</span><input type="text" name="BOOK_COMPANY" class="insert company" value="${bookView.BOOK_COMPANY}" required>
			</div>
			<div class="descriptBox">
				<span class="tle">설명</span><textarea cols="50" rows="10" name="BOOK_DESCRIPTION" class="description" >${bookView.BOOK_DESCRIPTION } </textarea>
			</div>
			<div class="dv1">
			<div class="codeBox">
				<span class="tle">도서코드</span><input type="radio" name="BOOK_CODE" id="code" value="${bookView.BOOK_CODE}" checked >${bookView.BOOK_CODE}
		&nbsp;&nbsp;
				<c:if test="${bookView.BOOK_YN eq 'n' }">
			<div>
				<label for="rentYN1"><input type="radio" name="BOOK_YN" id="rentYN1" value="y">Y/대여중</label>
				<label for="rentYN2"><input type="radio" name="BOOK_YN" id="rentYN2" value="n" checked>N/대여가능</label>
			</div>
			</c:if>
			<c:if test="${bookView.BOOK_YN eq 'y' }">
			<div>
				<label for="rentYN1"><input type="radio" name="BOOK_YN" id="rentYN1" value="y" checked>Y/대여중</label>
				<label for="rentYN2"><input type="radio" name="BOOK_YN" id="rentYN2" value="n">N/대여가능</label>
			</div>
			</c:if>
			</div>
			<div class="registrationBox">
				<button type="submit" class="btnsizet">수정</button>
				<button type="button" class="btn2 btnsizet" onclick="deleteConf('${bookView.BOOK_CODE}')">삭제</button>
				<br>
				<button type="button" class="btn3 btnsizeb" onclick="location.href='BookMListAction.book'">목록보기</button>
			</div></div><br>
			<div class="writerBox"></div>
		</form>
	</div>
	</c:when>
	<c:otherwise>
		<tr><td colspan="2">도서 정보가 없습니다.</td></tr>
	</c:otherwise>
</c:choose>
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