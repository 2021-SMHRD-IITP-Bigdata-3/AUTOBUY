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
					�������� ����
				</div>
			</header>
		<div class="login-input-section-wrap">
	<form action="UpdateServiceCon" method="post">
		<table style="line-height:50px;">
		
			<tr>
				<td><p style="border-right:1px solid lightgray; width:200px">��ǥ��</p></td>
				
				<td><input type="text" class="login-input-wrap1" name="ceo"></td>
			</tr>
			<tr>
				<td><p style="border-right:1px solid lightgray; width:200px">�г���</p></td>
				
				<td><input type="text" class="login-input-wrap1" name="nickname"></td>
			</tr>
			<tr>
				<td><p style="border-right:1px solid lightgray; width:200px">��й�ȣ</p></td>
				 
				<td><input type="text" class="login-input-wrap1" name="pw"></td>
			</tr>
			<tr>	
				<td><p style="border-right:1px solid lightgray; width:200px">�̸���</p></td>
				
				<td><input type="text" class="login-input-wrap1" name="email"></td>
			</tr>
			<tr>
				<td><p style="border-right:1px solid lightgray; width:200px">��ȣ��</p></td>
				
				<td><input type="text" class="login-input-wrap1" name="store_name"></td>
			</tr>
			<tr>
				<td><p style="border-right:1px solid lightgray; width:200px">����� ��Ϲ�ȣ</p></td>
				
				<td><input type="text" class="login-input-wrap1" name="sup_num"></td>
			</tr>
			<tr>
				<td><p style="border-right:1px solid lightgray; width:200px">�ּ�</p></td>
				
				<td><input type="text" class="login-input-wrap1" name="address"></td>
			</tr>
			<tr>
				<td><p style="border-right:1px solid lightgray; width:200px">��ȭ��ȣ</p></td>
				
				<td><input type="text" class="login-input-wrap1" name="tel"></td>
			</tr>
			<tr>
				<td><p style="border-right:1px solid lightgray; width:200px">�������</p></td>	
				 		<td>
				 		<select name="payment" class="payment" >
						    <option value="choice">����</option>
						    <option value="bank_book">������ �Ա�</option>
						    <option value="card">ī�� ����</option>
						    <option value="phone">�޴��� ����</option>
				 		</select>
				 		</td>
				 	</tr>
			 </table>
		 		<br><br>
			 	<div class="login-button-wrap1" style="margin-right:160px;">
			 	<button><input type="submit" value="���� �Ϸ�" style="background:#5F04B4; color:white; "></button>
			 	</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>