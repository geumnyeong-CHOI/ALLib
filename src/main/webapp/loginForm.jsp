<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="./css/header_footer_font.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.js"></script>
    <title>ALLib - 로그인</title>
    <style>

        button[type=button] {
            background-color: transparent;
            font-family: 'notosans';
        }
	
		#uid {
			margin-bottom : 2px;
		}
        .p1 {
            font-size: 1.5rem;
            text-align: center;
            padding: 20px;
            width: 55%;
            margin: 0 auto;
            border-radius: 5px;
            font-family: 'notoserif';
        }

        div#loginBox {
            border: 1px solid #E3E3E3;
            border-radius: 5px;
            text-align: center;
            margin: 0 auto;
            padding: 30px;
            margin-bottom: 0px;
        }

        div#writertab {
            border: 2px solid E3E3E3;
            display: inline-block;
            border-radius: 5px;
        }

        input[type="text"], input[type="password"] {
            height: 50px; 
            padding: 1px 20px; 
            box-sizing: border-box; 
            border: 1px solid #E3E3E3; 
            font-synthesis: 12pt; color: rgb(121, 119, 119); 
            border-radius: 10px;
        }
        #uid:focus, #upw:focus {
            outline : 2px solid #B0C4DE;
        }

        button#loginbtn{
			min-width: 150px;
            height: 50px; 
            border: none; 
            margin: 20px 0; 
            border-radius: 10px; 
            background-color: #B0C4DE; 
            color: white; font-size: 13pt;
        }
        button#loginbtn:hover{
            background: #879ebc;
            color: white;
            box-shadow: none;
        }

        button#loginbtn:active{
            color: white;
            background: lightpink;
            outline: none;
        }

        .row {
            text-align: center;
			margin: 20px 0 ;
        }

        .btnbot{
            border: none;
        }
        button.btnbot:hover{
        	color:  darkgray;
        
        }
        #loginbtn {
            color : white!important;
			font-weight : 700;
        } 
		#id,#password,#signup{outline:none;}
        #id:hover{color:#ff6681;}
       	#password:hover{color:#ff6681;}
       	#signup:hover{color:#ff6681;} 
       
        /* 캐러셀 반응형 */
@media ( min-width: 280px ) {.container{margin: 0 auto;	padding: 0;} .condiv{min-width: 250px;} .carP1{font-size: 1rem;} .carP2{font-size: 0.8rem;} p.carP1, p.carP2{margin: 0;} #loginbtn{width: 70% } input{width: 75%;}}	
@media ( min-width: 400px ) {.container{margin: 0 auto; padding: 0;} .condiv{min-width: 350px;} .carP1{font-size: 1rem;} .carP2{font-size: 0.8rem;} p.carP1, p.carP2{margin: 0;} #loginbtn{width: 70%;} input{width: 75%;}}	
@media ( min-width: 576px ) {.container{margin: 0 auto; padding: 0;} .condiv{min-width: 400px;} .carP1{font-size: 1.3rem;} .carP2{font-size: 1.1rem;} p.carP1, p.carP2{margin: 0;} #loginbtn{width: 70%;} input{width: 75%;}}	
@media ( min-width: 768px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 690px;} .carP1{font-size: 1.3rem;} .carP2{font-size: 1.1rem;} p.carP1, p.carP2{margin: 0;} #loginbtn{max-width: 450px; width: 65%;} input{max-width: 450px; width: 70%;}}	
@media ( min-width: 1024px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 930px;} .carP1{font-size: 1.5rem;} .carP2{	ont-size: 1.3rem;} p.carP1, p.carP2{margin: 0;} #loginbtn{max-width: 55%; width: 55%;} input{max-width: 55%; width: 55%;}}
@media ( min-width: 1199px ) {.container{margin: 0 auto; padding: 0;} .carConSize{margin: 0 auto; width: 1100px;} .carP1{font-size: 1.5rem;} .carP2{font-size: 1.3rem;} p.carP1, p.carP2{margin: 0;} #loginbtn{width: 50%;} input{width: 50%;}}

/* footer*/
	footer {width: 100%; background-color: #e3e3e3; padding: 10px ;	text-align: center;	font-size:12px;	height: 100px;	}
	#wrapper{min-height: calc(100vh - 100px);}        
    </style>
</head>

<body>
<div id="wrapper">
<header>
<div>
	<nav class="navbar headernav">
		<a class="nav navbar-left nava" href="./main.jsp"><b>ALLib</b></a>
	</nav>
</div>

<div class="sectionNavDiv">
	<nav class="navbar sectionnav">
		<a class="navbar-brand navbar-middle nava" href="./main.jsp"><img src="./img/projectLogo.png" id="logo" alt="Logo"><span class="secNavTitle">올리브 도서관</span></a>
	</nav>
</div>
</header>
   <section>
    <div id="demo" class="carousel slide" data-ride="carousel">
        <ul class="carousel-indicators">
            <li data-target="#demo" data-slide-to="0" class="active"></li>
            <li data-target="#demo" data-slide-to="1"></li>
        </ul>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="./img/library1.jpg" alt="library1" width="1100" height="150">
                <div class="carousel-caption">
                    <h3>당신의 교양이 자라는 지식의 보고</h3>
                    <p>ALLib 도서관에 어서오세요.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="./img/library3.jpg" alt="library3" width="1100" height="150">
                <div class="carousel-caption">
                    <h3>국내 최대 규모의 도서관</h3>
                    <p>원하는 모든 책이 ALLib에 있습니다.</p>
                </div>
            </div>
        </div>
    </div>

        <div id="wrap">
            <form name="loginform" action="./userLoginAction.us" method="post">
                <div class="container-sm">
                    <p class="p1"><span><b>ALLib</b> 방문을 환영합니다.</span></p>
                </div>
                <div id="loginBox" class="container-sm">
                    <div id="writertab" class="container-sm">
                        <input type="text" name="USER_ID" id="uid" placeholder="ID" required>
                        <input type="password" name="USER_PASSWD" id="upw" placeholder="PASSWD" required>
                    </div>
                    <button type="submit" id="loginbtn">로그인</button>
                </div>
            </form>
            <div class="row">
                <div class="col-sm">
                    <button type="button" class="btnbot" id="id" onclick="location.href='./findID.jsp' "><span class="kr">아이디 찾기</span></button>
                    <span>|</span>
                    <button type="button" class="btnbot" id="password" onclick="location.href='./findPwd.jsp' "><span class="kr">비밀번호 찾기</span></button>
                    <span>|</span>
                    <button type="button" class="btnbot" id="signup" onclick="location.href='./joinForm.jsp' "><span class="kr">회원가입</span></button>
                </div>
            </div>
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