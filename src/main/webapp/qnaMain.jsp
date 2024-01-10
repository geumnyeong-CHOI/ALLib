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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="./css/header_footer_font.css">
<title>ALLib-자주 묻는 질문</title>
<style>

/* 캐러셀 반응형 */
@media ( min-width: 280px ) {.container{margin: 0 auto;	padding: 0;} .condiv{min-width: 250px;} .carP1{font-size: 1rem;} .carP2{font-size: 0.8rem;} p.carP1, p.carP2{margin: 0;}}	
@media ( min-width: 400px ) {.container{margin: 0 auto; padding: 0;} .condiv{min-width: 350px;} .carP1{font-size: 1rem;} .carP2{font-size: 0.8rem;} p.carP1, p.carP2{margin: 0;}}	
@media ( min-width: 576px ) {.container{margin: 0 auto; padding: 0;} .condiv{min-width: 400px;} .carP1{font-size: 1.3rem;} .carP2{font-size: 1.1rem;} p.carP1, p.carP2{margin: 0;}}	
@media ( min-width: 768px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 690px;} .carP1{font-size: 1.3rem;} .carP2{font-size: 1.1rem;} p.carP1, p.carP2{margin: 0;}}	
@media ( min-width: 1024px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 930px;} .carP1{font-size: 1.5rem;} .carP2{	ont-size: 1.3rem;} p.carP1, p.carP2{margin: 0;}}
@media ( min-width: 1199px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 1100px;} .carP1{font-size: 1.5rem;} .carP2{font-size: 1.3rem;} p.carP1, p.carP2{margin: 0;}}

/* footer*/
   footer {width: 100%; background-color: #e3e3e3; padding: 10px ;   text-align: center;   font-size:12px;   height: 100px;   }
   #wrapper{min-height: calc(100vh - 100px);}

.sectiondiv{
	height:auto;
	min-height: 100%;
	padding-bottom: 100px;
	background-color: #f3f3f3;
	}

#loginBtn:hover {
	font-color: #6a5acd;
}

.layout {
	max-width: 600px;
	margin: 0 auto;
	padding: 15px;
}

.qna {
	list-style: none;
	margin: 0;
	padding: 0;
}

.qna>li {
	padding: 10px 0;
	box-sizing: border-box;
}

.qna>li:nth-child(n+2) { /* 아이템 구분 점선 */
	border-top: 1px dashed #aaa;
}

.qna input {
	display: none;
}

.qna label { /* 제목 - 클릭 영역 */
	font-weight: bold;
	color: #000;
	margin: 20px 0 0;
	cursor: pointer;
}

.qna label::before { /* 제목 앞 화살표 */
	display: block;
	content: "";
	width: 0;
	height: 0;
	border: 8px solid transparent;
	border-left: 8px solid lightgray;
	margin: 2px 0 0 8px;
	float: left;
}

.qna input:checked+label::before { /* 내용 펼침 상태 제목 앞 화살표 */
	border: 8px solid transparent;
	border-top: 8px solid lightgray;
	border-bottom: 0;
	margin: 8px 4px 0;
}

.qna div { /* 내용 영역 - 기본 감춤 상태 */
	display: none;
	color: #666;
	font-size: 0.9375em;
	overflow: hidden;
	padding: 10px 0 10px 30px;
	box-sizing: border-box;
	transition: max-height 0.4s;
}

.qna input:checked+label+div { /* 내용 영역 펼침 */
	display: block;
}

.aBtn {
	text-decoration : none;
	border : 1px solid #E3E3E3;
	color : white;
	background-color : #B0C4DE;
	padding : 5px 13px;
	float: right;
}

.aBtn:hover {
    background: #879ebc;
	color: white;
	box-shadow: none;
	text-decoration : none;
}

.aBtn:active{
	color: white;
	background: lightpink;
	border: none;
}
 /* 홈,위로가기 버튼 */
img.mapicon { width: 30px; height: 30px;}
.mapicon { position:fixed; background-color: white; padding: 5px; z-index:9999; border: 3px solid #c9c7c7;}
.mapicon:hover { border-color: #6A5ACD;}
#homeicon { border-radius: 5px 0 0 5px; right: 45px; bottom: 20px; }
#topicon { border-radius: 0 5px 5px 0; right: 20px; bottom: 20px;} 
</style>
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
		<a class="navbar-brand navbar-middle nava" href="./main.jsp"><img src="./img/projectLogo.png" id="logo" alt="Logo"><span class="secNavTitle">올리브 도서관</span></a>
	</nav>
</div>
</header>

<section>
<div class="sectiondiv">

<div class="carConSize">
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
	            <img src="./img/library3.jpg" alt="library3">
	            <div class="carousel-caption">
	                <p class="carP1">국내 최대 규모의 도서관</p>
	                <p class="carP2">원하는 모든 책이 ALLib에 있습니다.</p>
	            </div>
	        </div>
	        <div class="carousel-item">
	            <img src="./img/library11.jpg" alt="library11">
	            <div class="carousel-caption">
	                <p class="carP1">안락한 열람실</p>
	                <p class="carP2">집중력을 높일 수 있는 최적의 환경 조성</p>
	            </div>
	        </div>
	        <div class="carousel-item">
	            <img src="./img/library13.jpg" alt="library13">
	            <div class="carousel-caption">
	                <p class="carP1">운영시간</p>
	                <p class="carP2 carP2mar">도서대여 : 오전 09:00 ~ 오후 18:00</p>
	                <p class="carP2">열람실 : 연중무휴 24시 운영(공휴일 단축운영)</p>
	            </div>
	        </div>        
	    </div> 
	</div>

<div class="layout">
	<ul class="qna">
	<li>
		<input type="checkbox" id="qna-1"> 
		<label for="qna-1">도서대출은 몇권까지 되고, 대출중인 도서는 예약 할수 있나요?</label>
			<div>
				<p>▣ 도서 대출</p>
				<p>&nbsp; ○ 대상자 : ALLIB도서관 대출증 발급 회원</p>
				<p>&nbsp; ○ 권수 및 기간 : 도서는 7권 15일(대출일 포함. 14박 15일, 1회 7일 연장
					가능), 전자책은 20권 15일(대출일 포함. 1회 7일 연장 가능), DVD는 3점 15일(대출일 포함. 영화,
					애니메이션 등만 대출가능하며, 연장불가함</p>
				<p>&nbsp;&nbsp; ※ 일반자료실 참고자료, ALLIB도서관 소장자료, 세계자료실 대사관기증자료, 참고
					도서, 정기간행물, 시청각자료 등 일부자료는 대출 불가</p>
				<p>&nbsp;&nbsp; ※ 반납한 도서는 당일 재대출 가능(예약도서 아닐시)</p>

				<p>▣ 도서 예약</p>
				<p>&nbsp;○ 대출을 희망하는 도서가 대출중인 경우, 해당 도서를 예약하여 도서가 반납되는 즉시 우선적으로
					대출받을 수 있는 서비스</p>
				<p>&nbsp;&nbsp; ※ 현재 대출중인 책만 예약이 가능, 도서상태가 대출가능인 책은 도서관 방문 후
					직접 대출</p>
				<p>&nbsp; ○ 예약가능 권수 : 1인당 3권(1권당 예약가능 인원 : 최대 3명 선착순 예약)</p>
				<p>&nbsp;&nbsp; ※ 예약한 도서는 본인만 대출가능하며, 이메일과 문자 또는 알림톡을 통해 안내됨.</p>



				<p>▣ 희망도서 신청</p>
				<p>&nbsp; ○ 도서관이 소장하지 않은 도서의 구입 신청을 할 수 있는 서비스</p>
				<p>&nbsp; ○ 신청가능 권수 : 1인 월 3권 이내(1년 15권)</p>
				<p>&nbsp; ○ 문의 : 02-2133-0243</p>
			</div>
	</li>
	<li>
		<input type="checkbox" id="qna-2"> 
		<label for="qna-2">대출가능한 자료는?</label>
			<div>
				<p>▣ ALLIB도서관의 자료중에 대출이 가능한 자료는</p>

				<p>1,2층의 일반열람실1,2의 자료와 세계자료실의 외국어자료(대사관 기증자료 등 일부 제외),</p>

				<p>2층디지털자료실의 DVD (영화 및 애니메이션 등)만 대출이 가능합니다</p>
			</div>
	</li>
	<li>
		<input type="checkbox" id="qna-3"> 
		<label for="qna-3">휴관일에 반납은 어떻게 하나요?</label>
			<div>
				<p>ALLIB도서관이 휴관하는 월요일과 야간시간에 반납하실 경우는 도서관 후문옆에 있는 도서반납기를 이용하시기
					바랍니다.</p>

				<p>반납가능자료 : 딸림자료가 없는 도서자료만 반납 가능합니다.</p>

				<p>&nbsp; ※ 딸림자료(부록)가 있는 도서나 DVD 는 ALLIB도서관으로 직접 반납하셔야 하니 이용에
					착오없으시기 바랍니다.</p>

				<p>반납하신후 반납 확인증을 꼭 받아가시기 바랍니다.</p>
			</div>
	</li>
	<li>
		<input type="checkbox" id="qna-4"> 
		<label for="qna-4">노트북 전용석이 있나요?</label>
			<div>
				<p>공간이 협소하여 별도의 노트북 전용 좌석은 마련되어 있지 않습니다.</p>
				<p>각 자료실에 있는 열람석에 멀티탭이 설치되어 있으니 이용에 참고해 주시기 바랍니다.</p>
			</div>
	</li>
	<li>
		<input type="checkbox" id="qna-5"> 
		<label for="qna-5">아이가 어린데 엄마, 아빠가 대신 대출할 수 있나요?</label>
			<div>
				<p>ALLIB도서관에서 회원증을 발급 받은 가족 구성원 중 만 14세 미만 어린이(또는 청소년)이 있는 경우,
					부모님 신분증과 ​주민등록등본(또는 가족관계증명서)를 지참하여 2층 디지털자료실에 방문해 주시면 가족 그룹으로 등록해
					드립니다.</p>
				<p>가족 그룹으로 등록한 후 대리 대출을 할 수 있으며, 유의사항은 다음과 같으니 참고해 주시기 바랍니다.</p>

				<p>1. 자료 대출 시 부모님과 ​아이 실물 회원증 지참 권장</p>
				<p>​2. ALLIB도서관 운영 규정에 따라 부부, 만 14세 이상(성인 자녀 포함)은 회원증 대리 발급,
					대리 대출 불가</p>
				<p>​3. 부모 중 한 명과 아이를 가족 그룹으로 묶어서 사용하고 있는데 남은 부모 한 명을 추가하고 싶은
					경우, 신청자 본인이 직접 방문하여 등록해야 함</p>
				<p>​4. 만 14세 미만 이용자가 회원정보 재동의를 하지 않아서 탈퇴되거나 만 14세 생일이 지나면 가족
					그룹이 자동으로 삭제되므로 대리 대출 불가</p>
			</div>
	</li>

	<li>
		<input type="checkbox" id="qna-6"> 
		<label for="qna-6">연체되는 경우 어떻게 되나요?</label>
			<div>
				<p>▣ ALLIB도서관이 도서 및 DVD가 연체된 경우는</p>
				<p>&nbsp; 연체료는 없는 대신 "대출권수 x 연체일수" 만큼 대출이 중지되며, 해당 기간 만큼 전자책,
					오디오북, 전자잡지, 스마트도서관을 이용할 수 없습니다.</p>
				<p>&nbsp; &nbsp; 예1> 2권을 3일간 연체한 경우는 2권 x 3일 = 6일간 대출</p>
				<p>&nbsp; &nbsp; 예2> DVD 1점을 2일간, 도서 2권을 3일간 연체한 경우 (1점 x
					2일)+(2권 x 3일) = 8일간 대출 중지</p>

				<p>연체료가 없는 이유는 공공도서관 특성상 지식정보에 대한 평등한 접근성을 보장하고, 사회적 이용을 장려하기
					위함임을 알려 드립니다.</p>
			</div>
	</li>

	<li>
		<input type="checkbox" id="qna-7"> 
		<label for="qna-7">도서관 회원증을 분실했을 경우 재발급이 가능한가요?</label>
			<div>
				<p>회원증을 잃어버렸을 경우에는 즉시 도서관으로 연락주시고, 오실 때 신분증을 가지고 오시면 다시 재발급을
					해드립니다.</p>

				<p>신분증이 없는 만 14세 미만은 본인인증이 가능한 주민등록본이나 의료보험증을 지참하시면 됩니다.</p>
			</div>
	</li>

	<li>
		<input type="checkbox" id="qna-8"> 
		<label for="qna-8">대출한 책을 분실했어요. 어떻게 해야하나요?</label>
			<div>
				<p>대출한 책을 분실했을 경우에는 동일 도서로 사오셔야 합니다. 만약 동일도서과 품절등의 이유로 시중에 없을
					경우에는</p>
				<p>저희 도서관에 연락하셔서 담당자와 협의 후 대출하신 책과 주제와 가격이 비슷한 유사도서로 사오셔야 합니다.</p>

				<p>2층디지털자료실의 DVD (영화 및 애니메이션 등)만 대출이 가능합니다</p>
			</div>
	</li>

	<li>
		<input type="checkbox" id="qna-9"> 
		<label for="qna-9">로그인이 안돼요. </label>
			<div>
				<p>도서 연체 관리 중 개인정보 오류로 인해 비회원 처리 되었을 수 있습니다.</p>

				<p>비회원 처리 되는 기준은 다음과 같습니다.
				<p>&nbsp;-연체 관리를 위해 전화 중 연락처가 잘못 입력되어 있거나 본인의 연락처가 아닌 경우</p>
				<p>&nbsp;-주소의 오기입으로 연체 안내 독촉장이 반송 되었을 경우</p>

				<p>비회원으로 변경된 경우, 도서관 자료실로 전화주시면 처리해드리겠습니다.</p>
			</div>
	</li>

	<li>
		<input type="checkbox" id="qna-10"> 
		<label for="qna-10">도서 기증은 어떻게 하나요?</label>
			<div>
				<p>[ 기증도서 범위]</p>
				<p>&nbsp; - 최근 3년 이내 출판된 도서</p>
				<p>&nbsp;- 그외 도서관에서 소장할 가치가 있는 우수도서</p>

				<p>[기증 방법]</p>
				<p>&nbsp; 1. 직접 방문 : 가까운 도서관에 방문하여 기증</p>
				<p>&nbsp; 2. 우편 또는 택배 발송 : '상동도서관/수주도서관 자료정리실'로 발송</p>
				<p>기증된 도서는 활용여부를 판단하여 해당 도서관에 등록되거나 타 기관에 재기증됩니다. 활용하기 어려운
					도서(내용 및 삽화가 유해한 도서, 상태가 불량한 도서 등)일 경우 폐기처분 될 수 있음을 유의해주시기 바랍니다.</p>
				<p>기타 궁금한 사항은 ALLIB도서관 기증담당자에게 문의주시기 바랍니다. 감사합니다.</p>
			</div>
	</li>
	<br>
		<a href="./qnaList.qna" class="aBtn">질문목록보기</a>
	<% if(uid == null){ %>
		<a href="./loginForm.jsp" class="aBtn">작성하기</a>
	<% } else {	%>
		<a href="./qnaBoard.jsp" class="aBtn">작성하기</a>
	<% } %>
	</ul>
</div>
</div></div>	
	
</section>
</div>
<div class="goTop">
<a href="./main.jsp"><img src="./img/home_icon.png" class="mapicon" id="homeicon" alt="gohome"></a> 
<a href="#"><img src="./img/gotop_icon.png" class="mapicon" id="topicon" alt="gotop"></a></div>
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