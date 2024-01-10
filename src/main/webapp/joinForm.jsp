<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="./css/header_footer_font.css">
<title>ALLib - 회원가입</title>
<style>

.set {
	width: 96%;
	height: 50px;
	padding: 15px 50px;
	box-sizing: border-box;
	border: 1px solid #E3E3E3;
	font-synthesis: 12pt;
	color: rgb(121, 119, 119);
	border-radius: 10px;
}

.btn {
	width: 48%;
	height: 50px;
	border: 1px solid lightgray;
	margin: 20px 0;
	border-radius: 10px;
    background: #B0C4DE;
    color:white;
    font-family: 'notosans';
    font-weight : 700;
}

.sectiondiv{
	height:auto;
	min-height: 100%;
	padding-bottom: 250px;
	background-color: #f3f3f3;
	}

.btn:hover {
	background: #879ebc;
	color: white;
	box-shadow: none;
}

.btn:active{
	color: white;
	background: lightpink;
	border: none;
}

#joinformArea {
	width: 600px;
	max-width: 100%;
	margin: auto;
	border: none;
}

table {
	width: 450px;
	max-width: 100%;
	margin: auto;
	text-align: center;
}

.golog{
	color: black;
	font-family: 'notosans';
}

h3 {
	font-family : 'notoserif'
}
.golog:hover{
	text-decoration : none;
	color: #007BFF;
}

.set:focus {
	border: 2px solid black;
}

font#checkId {
	display : inline-block;
}

@media ( min-width: 280px ) {.container{margin: 0 auto;  padding: 0;} .condiv{min-width: 250px;} .carP1{font-size: 1rem;} .carP2{font-size: 0.8rem;} p.carP1, p.carP2{margin: 0;} form{padding: 0 20px;} }   
@media ( min-width: 400px ) {.container{margin: 0 auto; padding: 0;} .condiv{min-width: 350px;} .carP1{font-size: 1rem;} .carP2{font-size: 0.8rem;} p.carP1, p.carP2{margin: 0;} form{padding: 0 20px;} }   
@media ( min-width: 576px ) {.container{margin: 0 auto; padding: 0;} .condiv{min-width: 400px;} .carP1{font-size: 1.3rem;} .carP2{font-size: 1.1rem;} p.carP1, p.carP2{margin: 0;} form{padding: 0 20px;} }  
@media ( min-width: 768px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 690px;} .carP1{font-size: 1.3rem;} .carP2{font-size: 1.1rem;} p.carP1, p.carP2{margin: 0;} form{padding: 0 20px;} }  
@media ( min-width: 1024px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 930px;} .carP1{font-size: 1.5rem;} .carP2{   ont-size: 1.3rem;} p.carP1, p.carP2{margin: 0;} form{padding: 0 20px;} }  
@media ( min-width: 1199px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 1100px;} .carP1{font-size: 1.5rem;} .carP2{font-size: 1.3rem;} p.carP1, p.carP2{margin: 0;} form{padding: 0 20px;} }  

/* footer*/
	footer {width: 100%; background-color: #e3e3e3; padding: 10px ;	text-align: center;	font-size:12px;	height: 100px;	}
	#wrapper{min-height: calc(100vh - 100px);}


</style>
<script>
$(function() {
	
	$('.uid').focusout(function() {
		let userId = $('uid').val();
		
		$.ajax({
			url : "idCheck.us",
			type : "post",
			data : {
				USER_ID : document.joinform.USER_ID.value
			},
			cache : false,
			success : function(result) {
				if (result == "true") {
					console.log('success');
					$("#checkId").html('사용할 수 없는 아이디입니다.')
					$("#checkId").attr('color', 'red');
				} else {
					$("#checkId").html('사용 가능한 아이디입니다.')
					$("#checkId").attr('color', 'green');
				}
			},

			error : function() {
				alert('error');
			}
		});
	});
});

	function phoneNum(obj){
	    var number = obj.value.replace(/[^0-9]/g, "");
	    var phone = "";
	    if(number.length < 4) {
	        return number;
	    } else if(number.length < 8) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3);
	    }else if(number.length < 11){
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 3);
	        phone += "-";
	        phone += number.substr(6);
	    }else{
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 4);
	        phone += "-";
	        phone += number.substr(7);
	    }
	    obj.value = phone;
	}
	
	function birth_keyup(obj){
	    let birth_len = obj.value.length;
	    if (event.keyCode==8){
	        obj.value = obj.value.slice(0,birth_len)
	        return 0;
	    }else if(birth_len==4 || birth_len==7){
	        obj.value += '-';
	    }
	}
</script>
</head>
<body>
<div id="wrapper">
<header>

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

<div class="sectionNavDiv">
	<nav class="navbar sectionnav">
		<a class="navbar-brand navbar-middle nava" href="./main.jsp"><img src="./img/projectLogo.png" id="logo" alt="Logo"><span class="secNavTitle">올리브 도서관</span></a>
	</nav>
</div>
</header>

<section>
<div class="sectiondiv">
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
				<img src="./img/library3.jpg" alt="library3" >
				<div class="carousel-caption">
					<p class="carP1">시민 가까이에 다가가는 작은 도서관</p>
						<p class="carP2">원하는 모든 책이 ALLib에 있습니다.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="./img/library8.jpg" alt="library8" >
				<div class="carousel-caption">
					 <p class="carP1">안락한 열람실</p>
	                <p class="carP2">집중력을 높일 수 있는 최적의 환경 조성</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="./img/library13.jpg" alt="library13" >
				<div class="carousel-caption">
					<p class="carP1">운영시간</p>
	                <p class="carP2 carP2mar">도서대여 : 오전 09:00 ~ 오후 18:00</p>
	                <p class="carP2">열람실 : 연중무휴 24시 운영(공휴일 단축운영)</p>
				</div>
			</div>
		</div>
	</div>
<br>
<form name="joinform" action="./userJoinAction.us" method="get">
<table class="joinTable">
	<tr>
		<td colspan="2">
			<h3>회원가입</h3>
			<br>
		</td>
	</tr>
	<tr>
		<td>
		<input type="text" name="USER_ID" id="USER_ID" class="set uid" placeholder="아이디" autocomplete="off" required>
		<font id="checkId" size="2"></font>
		</td>
	</tr>
	<tr>
		<td>
		<input type="password" name="USER_PASSWD" id="USER_PASSWD" class="set" placeholder="비밀번호" required>
		</td>
	</tr>
	<tr>
		<td>
		<input type="text" name="USER_NAME" id="USER_NAME" class="set" placeholder="이름" required>
		</td>
	</tr>
	<tr>
		<td>
		<input type="text" name="USER_BIRTH" id="USER_BIRTH" class="set" onkeyup="birth_keyup(this);" placeholder="생년월일" required>
		</td>
	</tr>
	<tr>
		<td>
		<input type="tel" name="USER_PHONE" onkeyup="phoneNum(this);" id="USER_PHONE" class="set uphone" placeholder="휴대전화번호" required>
		</td>
	</tr>
	<tr>
		<td>
		<input type="email" name="USER_EMAIL" id="USER_EMAIL" class="set" placeholder="이메일">
		</td>
	</tr>
	<tr>
		<td class="btnbox" colspan="2"><br> 
            <input type="submit" class="btn subBtn" value="회원가입"> 
            <input type="reset" class="btn"value="다시작성">
        </td>
	</tr>	
</table>
</form>
</div>
</section>
	</div>
<footer>
   <nav>
       Project ALLib<br>
       copyright ⓒ2023 Himedia Academy, All Rights Reserved.<br>
       삶은 계란 &nbsp;|&nbsp; 정하늘 홍기락 최영호 유미애 김주형 임금준 류동현 박경진 최금녕
   </nav>
</footer>
</body>
</html>