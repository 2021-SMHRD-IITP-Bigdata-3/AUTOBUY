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
					���������� ����
				</div>
			</header>
		<div class="login-input-section-wrap">
	<form action="UpdateServiceCon" method="post">
		<p>��ǥ�ڸ�</p><div class="login-input-wrap1"><input type="text" name="ceo"></div>
		<p>�г���</p><div class="login-input-wrap1"><input type="text" name="nickname"></div>
		<p>��й�ȣ</p><div class="login-input-wrap1"><input type="text" name="pw"></div>				
		<p>�̸���</p><div class="login-input-wrap1"><input type="text" name="email"></div>
		<p>��ȣ��</p><div class="login-input-wrap1"><input type="text" name="store_name"></div>
		<p>����� ��Ϲ�ȣ</p><div class="login-input-wrap1"><input type="text" name="sup_num"></div>
		<p>�ּ�</p><div class="login-input-wrap1"><input type="text" name="address"></div>
		<p>��ȭ��ȣ</p><div class="login-input-wrap1"><input type="text" name="tel"></div>
		<p>���� ���</p>		
		 		<select name="payment" class="payment" >
				    <option value="choice">����</option>
				    <option value="bank_book">������ �Ա�</option>
				    <option value="card">ī�� ����</option>
				    <option value="phone">�޴��� ����</option>
		 		</select>
		 		<br><br>
		 	<div class="login-button-wrap">
		 	<button><input type="submit" value="���� �Ϸ�" ></button>
		 	</div>
		 	
	</form>
	
</div>
</body>
</html>