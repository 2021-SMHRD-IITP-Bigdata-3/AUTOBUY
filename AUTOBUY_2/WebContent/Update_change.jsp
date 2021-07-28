<%@page import="auto.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.container{
width:1400px;
text-align:center;
}
.mypage_title{
text-align:center;
font-size:40px;
margin-top:100px;
height:100px;
}
.container p{
margin-left:612px;
margin-right:612px;
text-align:left;
line-height:0px;
font-size:17px
}
.money{
margin-left:612px;
margin-right:612px;
float:left;
}
</style>
</head>
<body>
<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
%>
<div class="container">
	<div class="mypage_title">마이 페이지 수정</div>
	<form action="UpdateServiceCon" method="post">
		<p>대표자명</p><div class="CEO"><input type="text" name="ceo"></div>
		<p>닉네임</p><div class="nickname"><input type="text" name="nickname"></div>
		<p>비밀번호</p><div class="pw"><input type="text" name="pw"></div>				
		<p>이메일</p><div class="email"><input type="text" name="email"></div>
		<p>상호명</p><div class="store_name"><input type="text" name="store_name"></div>
		<p>사업자 등록번호</p><div class="sup_num"><input type="text" name="sup_num"></div>
		<p>주소</p><div class="address"><input type="text" name="address"></div>
		<p>전화번호</p><div class="tel"><input type="text" name="tel"></div>
		<p>결제 방식</p>		
		 		<select name="payment" class="payment" >
				    <option value="choice">선택</option>
				    <option value="bank_book">무통장 입금</option>
				    <option value="card">카드 결제</option>
				    <option value="phone">휴대폰 결제</option>
		 		</select>
		 		<br><br>
		 	<input type="submit" value="수정 완료">
	</form>
	
</div>
</body>
</html>