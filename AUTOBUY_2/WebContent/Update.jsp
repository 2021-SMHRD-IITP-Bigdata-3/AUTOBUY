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
<div class="container">
	<div class="mypage_title">���� ������</div>
	<form>
	<p>��ǥ�ڸ�</p><div class="CEO"><input type="text" name="ceo"></div>
	<p>�г���</p><div class="nickname"><input type="text" name="nickname"></div>
	<p>�̸���</p><div class="email"><input type="text" name="email"></div>
	<p>����� ��Ϲ�ȣ</p><div class="sup_num"><input type="text" name="sup_num"></div>
	<p>��ȭ��ȣ</p><div class="tel"><input type="text" name="tel"></div>
	<p>���� ���</p>		
	 		<select name="money" class="money" >
			    <option value="choice">����</option>
			    <option value="bank_book">������ �Ա�</option>
			    <option value="card">ī�� ����</option>
			    <option value="phone">�޴��� ����</option>
	 		</select>
	 		<br><br>
	 	<input type="submit" value="���� �Ϸ�">
	</form>
	
</div>
</body>
</html>