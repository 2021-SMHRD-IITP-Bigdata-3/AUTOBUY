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
		<div class="Sign_Up_title">ȸ������</div>
		<form action="JoinServiceCon" method="post">
			<p>���̵�</p><div class="Sing_UP_ID"><input type="text"  name="id"></div>
			<p>��й�ȣ</p><div class="Sing_UP_PW"><input type="text"  name="pw"></div>	
			<p>�г���</p><div class="Sing_NickName"><input type="text" name="nickname"></div>
			<br>
			<input type="radio" value="�ŷ�ó" id="Choice1" name="Choice">
			 	<label for="Choice1">�ŷ�ó</label>
			<input type="radio" value="��������"  id="Choice2" name="Choice">
			 	<label for="Choice2">��������</label>
			<br><br>
			<input type="submit" value="ȸ������">
		</form>
	</div>
</body>
</html>