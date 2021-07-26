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
.Login_title{
margin-top:200px;
font-size:50px;

}
.small_title{
font-size:25px;
text-align:center;
}
.ID{
font-size:20px;
}
.PW{
font-size:20px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="Login_title"><p>AUTO BUY</p></div>
		<div class="small_title"><p>어서오세요. 자동발주 시스템 AUTO BUY입니다.</div>
			<form action="LoginServiceCon.jsp">
				<div class="ID">ID: <input type="text" placeholder="ID 입력하세요" name="ID"></div>
				<br><br>
				<div class="PW">PW: <input type="text" placeholder="PW 입력하세요" name="PW"></div>
				<input type="submit" value="Login">
			</form>
		<div class="Sign_Up"><p>회원가입</p></div>
	</div>
</body>
</html>