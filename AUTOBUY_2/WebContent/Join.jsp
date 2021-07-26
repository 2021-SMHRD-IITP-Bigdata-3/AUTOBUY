<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.container{
width:1400px;
text-align:center;
}
.Sign_Up_title{
font-size:40px;
margin:100px;
text-align:center;
}
.container p{
margin-left:612px;
margin-right:612px;
text-align:left;
} 
</style>
</head>
<body>
	<div class="container">
		<div class="Sign_Up_title">회원가입</div>
		<form action="JoinServiceCon.jsp" method="post">
			<p>아이디</p><div class="Sing_UP_ID"><input type="text"  name="id"></div>
			<p>비밀번호</p><div class="Sing_UP_PW"><input type="text"  name="pw"></div>	
			<p>닉네임</p><div class="Sing_NickName"><input type="text" name="nickname"></div>
			<br>
			<input type="submit" value="회원가입">
		</form>
	</div>
</body>
</html>