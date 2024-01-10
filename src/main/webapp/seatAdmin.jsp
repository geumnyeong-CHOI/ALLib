<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@page import="vo.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>(관리자) 좌석예약현황</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" type="text/css" href="./css/admin_header_footer_font.css">
<style>
.btn {background-color:white;}

 h4{ text-align:center;} 
table.seat-table {
       max-width:90%; 
       width: 1000px; 
       margin: auto;
       text-align: center;
   }
 /*목록 tr라인 높이*/
   table.seat-table>tbody>tr {
       height: 35px;
   }

   /*타이틀 tr라인(th) 배경색*/
   table.seat-table>tbody>tr>th {
       background-color: rgb(228, 231, 250);
   }

   /*홀수 번째 tr 목록라인 배경색*/
   table.seat-table>tbody>tr:nth-child(odd) {
       background-color: rgb(239, 241, 245);
   }

   /*목록 tr라인 hover 배경색*/
   table.seat-table>tbody>tr:hover {
       background-color: rgb(229, 239, 255);
   }
   td,th {
       padding: 7px;
   }
   #btn2{  width: 170px; height:50px;
       max-width: 170px;
       background-color: rgb(151, 161, 255);
       color: #fff;
       border: none;
       border-radius: 5px;
        margin:auto;
       display:block;}
       
.seatXbtn { border: 1px solid rgb(255, 113, 97); color: rgb(255, 113, 97); border-radius: 3px; }
 
</style>
<script>
function deleteConf(snum) {
    if (confirm("좌석 예약을 취소하시겠습니까?")) {
        alert("취소되었습니다.");
        console.log(snum);
        
        $.ajax({
            type: "POST",
            url: "SeatCancelAction.me",
            data: { seatNum : snum }, 
            success: function (res) {	               
                location.reload();
            }
        });
    } 
}
$(function() { 
	$(".my-td").each(function() {
	    var seatSelc = $(this).text().trim();
	    if (seatSelc === '취소') {
	      $(this).css({"color": "red"}); 
	    }
	  });
	});
</script>
</head>
<body>
<div id="wrapper">
<header>
<nav class="navbar navbar-expand-sm " id="navbar">
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
      <a class="nav-link dropdown-toggle" id="navbardrop" data-toggle="dropdown">Q&A관리</a>
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

<section>
<div class="mySeat">
        <div id="seat-fluid" class="container-fluid">
           <br>
                <strong><h4>좌석 예약 내역</h4></strong></div>
                
                
                <div class="col-sm-12 seat-colB" style="margin:auto; "><br>
                    <table id="seat-table" class="seat-table">
                    <tbody>
                        <tr class="my-tr">
                            <th class="my-th">예약번호</th>
                            <th class="my-th">예약자</th>
                            <th class="my-th">좌석번호</th>
                            <th class="my-th">좌석이용날짜</th>
                            <th class="my-th">예약상태</th>
                            <th class="my-th">선택</th>
                        </tr>	
	<c:choose>
		<c:when test="${adminAllSchkList ne null }">  
			<c:forEach var="sv" items="${adminAllSchkList }">
                        <tr class="my-tr">
                            <td class="my-td">${sv.SEAT_NUM}</td>
                            <td class="my-td">${sv.USER_NAME}</td>
                            <td class="my-td">${sv.SEAT_NO}</td>
                            <td class="my-td">${sv.SEAT_DAY}</td>
                            <td class="my-td"><c:choose>
                            <c:when test="${sv.SEAT_SELC eq 'n'}">취소</c:when>
                            <c:otherwise>${sv.SEAT_SELC}</c:otherwise>
                            </c:choose></td>
                            <c:if test="${sv.SEAT_SELC ne 'n'}">
                            <td class="my-td"><button class="seatXbtn" type="button" onclick="deleteConf(${sv.SEAT_NUM});">취소</button></td>
                            </c:if>
                        </tr>		
				</c:forEach>	
		</c:when>
		<c:otherwise>
			<tr><td colspan="3">좌석 예약 내역이 없습니다.</td></tr>
		</c:otherwise>
	</c:choose>				
                    </tbody>
                    </table>
                </div>
        
<br><br>
<button type="button" id ="btn2" onclick = "location.href = './userTypeCheckAction.us' ">메인메뉴로 돌아가기</button>  
<br><br>
    </div>
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
