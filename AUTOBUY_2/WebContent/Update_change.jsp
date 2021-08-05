<%@page import="auto.model.MemberDTO"%>
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
<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
%>
<div class="main-container">
		<div class="main-wrap">
			<header>		
				<div class="logo-wrap">
					마이페이지 수정
				</div>
			</header>
		<div class="login-input-section-wrap">
	<form action="UpdateServiceCon" method="post">
		<p>대표자명</p><div class="login-input-wrap1"><input type="text" name="ceo"></div>
		<p>닉네임</p><div class="login-input-wrap1"><input type="text" name="nickname"></div>
		<p>비밀번호</p><div class="login-input-wrap1"><input type="text" name="pw"></div>				
		<p>이메일</p><div class="login-input-wrap1"><input type="text" name="email"></div>
		<p>상호명</p><div class="login-input-wrap1"><input type="text" name="store_name"></div>
		<p>사업자 등록번호</p><div class="login-input-wrap1"><input type="text" name="sup_num"></div>
		<p>주소</p><div class="login-input-wrap1"><input type="text" name="address"></div>
		<p>전화번호</p><div class="login-input-wrap1"><input type="text" name="tel"></div>
		<p>결제 방식</p>		
		 		<select name="payment" class="payment" >
				    <option value="choice">선택</option>
				    <option value="bank_book">무통장 입금</option>
				    <option value="card">카드 결제</option>
				    <option value="phone">휴대폰 결제</option>
		 		</select>
		 		<br><br>
		 	<div class="login-button-wrap">
		 	<button><input type="submit" value="수정 완료" ></button>
		 	</div>
		 	
	</form>
	
</div>
</body>
</html>