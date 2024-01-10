<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@page import="vo.JoinVO"%>
<%@page import="vo.PageInfoVO"%>

<%
PageInfoVO pageInfo = (PageInfoVO) request.getAttribute("userpage");
int listCount = pageInfo.getListCount();
int nowPage = pageInfo.getPage();
int maxPage = pageInfo.getMaxPage();
int startPage = pageInfo.getStartPage();
int endPage = pageInfo.getEndPage();
%>
<%
//종료페이지가 0일 때 시작페이지(1)로 기본 설정..
if((startPage == 1) && (startPage > endPage)) {
	endPage = startPage;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(관리자) 회원목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.js"></script>
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

    nav.navbar {
        font-color: white;
    }

    .btn {
        background-color: white;
    }

    .col-sm-4 {
        border: 1px solid #000;
        margin: 5px;
        width: 45%;
    }

    * {
        box-sizing: border-box;
    }


.btn {background-color:white;}

 h4{ text-align:center;} 
table.user-list-table {
		max-width:90%; 
       width: 1000px;
       margin: auto;
       text-align: center;
   }

    div#wrap>section.user-title-section,
    section.user-page-section {
		max-width:90%;
       width: 1000px;
       margin: auto;
       text-align: center;
		height: 100%;
    }

    /*목록 tr라인 높이*/
    table.user-list-table>tbody>tr {
        height: 35px;
    }

    /*타이틀 tr라인(th) 배경색*/
    table.user-list-table>tbody>tr>th {
        background-color: rgb(228, 231, 250);
    }

    /*홀수 번째 tr 목록라인 배경색*/
    table.user-list-table>tbody>tr:nth-child(odd) {
        background-color: rgb(239, 241, 245);
    }

    /*목록 tr라인 hover 배경색*/
    table.user-list-table>tbody>tr:hover {
        background-color: rgb(229, 239, 255);
    }

    div.user-form-div {
        margin-top: 30px;
        border: 1px solid #E3E3E3;
        border-radius: 8px;
        padding: 8px 4px 8px 0;
    }

    div.user-form-div>form>input[type=text] {
        border: none;
        max-width:83%;
        width: 99%;
    }

    div.user-form-div>form>input[type=text]:focus {
        outline: 2px solid #B0C4DE;
        border-radius: 3px;
    }

    /* 검색 버튼 */
    div.user-form-div>form>input[type=submit] {
        width: 60px;
        max-width: 60px;
        background-color: rgb(151, 161, 255);
        color: #fff;
        border: none;
        border-radius: 5px;
    }

    table.user-list-table>tbody>tr>td>button.user-modify-btn {
        border: 1px solid rgb(0, 192, 205);
        ;
        color: rgb(0, 192, 205);
        ;
        border-radius: 3px;
    }

    table.user-list-table>tbody>tr>td>button.user-delete-btn {
        border: 1px solid rgb(255, 113, 97);
        color: rgb(255, 113, 97);
        border-radius: 3px;
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
</style>

<script>
	var a;
	function deleteConf(a) {
		if (confirm("정말 탈퇴하시겠습니까?")) {
			alert("탈퇴되었습니다.");
			console.log(a);
			location.href = "userDeleteAction.us?USER_ID=" + a;
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
				data-toggle="dropdown"> Q&amp;A관리 </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="./qnaList.qna">Q&amp;A 목록</a>
				</div></li>
		</ul>
		<button type="button" class="btn" style="float: right;" onclick="location.href='./userLogout.us'">
  		로그아웃
  		</button>
	</nav>
</header>

	<br><br>


	<div id="wrap">
		<section class="user-title-section">
			<h3>회원 목록</h3>

			<div class="user-form-div">
				<form action="./userSearchAction.us" method="post">
					<input type="text" name="USER_SEARCH" placeholder="이름, 아이디로 검색">
					<input type="submit" value="검색">
				</form>
			</div>
		</section>
		<br>

		<section id="userListArea" class="user-list-section">
			<table id="user-list-table" class="user-list-table">
				<tbody>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>수정</th>
						<th>탈퇴</th>
					</tr>
					<c:choose>
						<c:when test="${userList ne null }">
							<c:forEach var="users" items="${userList}">

								<tr>
									<td>${users.USER_ID}</td>
									<td>${users.USER_NAME}</td>
									<td><button class="user-modify-btn" type="button"
											onclick="location.href='updateUserAction.us?USER_ID=${users.USER_ID}';">수정</button>
									</td>
									<td><button class="user-delete-btn" type="button"
											onclick="deleteConf('${users.USER_ID}');">탈퇴</button></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4">회원 목록이 없습니다.</td>
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
				onclick="location.href='./userListAction.us?page=<%=nowPage - 1%>';">&lt;</button>
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
				onclick="location.href='./userListAction.us?page=<%=a%>';"><%=a%></button>
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
				onclick="location.href='./userListAction.us?page=<%=nowPage + 1%>';"
				type="button">&gt;</button>
			<%
			}
			%>
		</section>
	</div>
</div>

	<br><br><br>

	<footer>
		<nav>
			<span>Project ALLib</span><br> <span>copyright ⓒ2023
				Himedia Academy, All Rights Reserved.</span><br> <span>삶은 계란<span
				class="slash">&nbsp;|&nbsp;</span>정하늘 홍기락 최영호 유미애 김주형 임금준 류동현 박경진
				최금녕
			</span>
		</nav>
	</footer>

</body>
</html>
