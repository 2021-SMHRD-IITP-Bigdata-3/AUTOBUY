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
<style>
@import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css);
a { text-decoration:none } 
body{
font-family: 'Spoqa Han Sans Neo', 'sans-serif'
}
</style>
<body>
<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
%>
<div class="main-container">
		<div class="main-wrap">
			<header>		
				<div class="logo-wrap">
					개인정보 수정
				</div>
			</header>
		<div class="login-input-section-wrap">
	<form action="UpdateServiceCon" method="post">
		<table style="line-height:45px; font-size: 20px; margin:auto;">
		
			<tr>
				<td><p style="border-right:1px solid lightgray; width:200px">대표자</p></td>
				
				<td><input type="text" class="login-input-wrap1" name="ceo"></td>
			</tr>
			<tr>
				<td><p style="border-right:1px solid lightgray; width:200px">닉네임</p></td>
				
				<td><input type="text" class="login-input-wrap1" name="nickname"></td>
			</tr>
			<tr>
				<td><p style="border-right:1px solid lightgray; width:200px">비밀번호</p></td>
				 
				<td><input type="text" class="login-input-wrap1" name="pw"></td>
			</tr>
			<tr>	
				<td><p style="border-right:1px solid lightgray; width:200px">이메일</p></td>
				
				<td><input type="text" class="login-input-wrap1" name="email"></td>
			</tr>
			<tr>
				<td><p style="border-right:1px solid lightgray; width:200px">상호명</p></td>
				
				<td><input type="text" class="login-input-wrap1" name="store_name"></td>
			</tr>
			<tr>
				<td><p style="border-right:1px solid lightgray; width:200px">사업자 등록번호</p></td>
				
				<td><input type="text" class="login-input-wrap1" name="sup_num"></td>
			</tr>
			<tr>
				<td><p style="border-right:1px solid lightgray; width:200px">주소</p></td>
				
				<td><input type="text" class="login-input-wrap1" name="address"></td>
			</tr>
			<tr>
				<td><p style="border-right:1px solid lightgray; width:200px">전화번호</p></td>
				
				<td><input type="text" class="login-input-wrap1" name="tel"></td>
			</tr>
			<tr>
				<td><p style="border-right:1px solid lightgray; width:200px">결제방식</p></td>	
				 		<td >
				 		<select name="payment" class="payment" style="margin-left:10px; width:222px; height:33px;" >
						    <option value="choice">선택</option>
						    <option value="bank_book">무통장 입금</option>
						    <option value="card">카드 결제</option>
						    <option value="phone">휴대폰 결제</option>
				 		</select>
				 		</td>
				 	</tr>
			 </table>
		 		<br><br>
			 	<div class="login-button-wrap1" style="margin-right:160px;">
			 	<button  class="submitbutton" >등록완료</button>
			 	</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>