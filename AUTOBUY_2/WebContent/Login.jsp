<%@page import="auto.model.StockDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="auto.model.StockManageDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="assest/css/Login.css">
<style>
@font-face{
	src: url("../assest/fonts/Cocogoose Pro Light-trial.ttf");
    font-family: "Cocogoose"; 
 }
 @font-face{
	src: url("../assest/fonts/Cocogoose Pro Semilight-trial.ttf");
    font-family: "Cocogoose2"; 
 }
 </style>
</head>
<body>
	<div class="main-container">
		<div class="main-wrap">
		<header>
			<div class="sel-lang-wrap">
				<select class="lang-select">
					<option>�ѱ���</option>
					<option>English</option>
				</select>
			</div>

			<div class="logo-wrap" style="font-family: Cocogoose; font-size: 58px; color:black; margin-top: 100px">

				<a><b>AUTO</b> BUY </a>
			</div>
		</header>
		
		<div class="login-input-section-wrap">
			<form action="LoginService
			Con" method="post">
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
			<div class="Sign_Up"><a href="Join.jsp"><p>ȸ������</p></a></div>
		</div>
		<footer>
			<div class="copyright-wrap">
			<span><strong>AUTOBUY</strong> ��)���������� ��ǥ : �۱����� | ����� ��� ��ȣ : 000-00-00000���ֱ����� ���� �۾Ϸ�60 ����CGI����</span>
			</div>
		</footer>
		</div>
	</div>
</body>
</html>