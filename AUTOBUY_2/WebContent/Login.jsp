<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="assest/css/Login.css">
</head>
<body>
	<div class="main-container">
		<div class="main-wrap">
		<header>
			<div class="sel-lang-wrap">
				<select class="lang-select">
					<option>한국어</option>
					<option>English</option>
				</select>
			</div>
			<div class="logo-wrap">
				AUTO BUY
			</div>
		</header>
		
		<div class="login-input-section-wrap">
			<form action="LoginServiceCon" method="post">
			<div class="login-input-wrap">	
				<input placeholder="ID" type="text" name="id">
			</div>
			<div class="login-input-wrap password-wrap">	
				<input placeholder="Password" type="password"  name="pw">
			</div>
			<div class="login-button-wrap">
				<button type="submit" value="Login">
				<span>Login</span>
				</button>
			</div>
			</form>
			<div class="Sign_Up"><a href="Join.jsp"><p>회원가입</p></a></div>
		</div>
		<footer>
			<div class="copyright-wrap">
			<span><strong>AUTOBUY</strong> 주)오도바이절 대표 : 송김정정 | 사업자 등록 번호 : 000-00-00000광주광역시 남구 송암로60 광주CGI센터</span>
			</div>
		</footer>
		</div>
	</div>
</body>
</html>