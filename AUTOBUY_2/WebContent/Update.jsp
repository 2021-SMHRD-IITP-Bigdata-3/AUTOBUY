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
					����������
				</div>
			</header>
		<div class="login-input-section-wrap">

			<table style="line-height:50px;">
			
				<tr>
					<td><p style="border-right:1px solid lightgray; width:200px">��ǥ��</p></td>
					<td>
							<%if(info != null){%>
									<%= info.getCeo() %>
							<%} %></td>
				</tr>
				<tr>
					<td><p style="border-right:1px solid lightgray; width:200px">�г���</p></td>
					<td>
							<%if(info != null){%>
									<%= info.getNickName() %>
				
							<%} %>
					</td>
				</tr>
				<tr>
					<td><p style="border-right:1px solid lightgray; width:200px">��й�ȣ</p></td>
					<td>
							<%if(info != null){%>
									<%= info.getCustomer_pw() %>
							<%} %>	
					</td>
				</tr>
				<tr>		
					<td><p style="border-right:1px solid lightgray; width:200px">�̸���</p></td>
					<td>
							<%if(info != null){%>
									<%= info.getEmail() %>
							<%} %>
					</td>
				</tr>
				<tr>
					<td><p style="border-right:1px solid lightgray; width:200px">��ȣ��</p></td>
					<td>
							<%if(info != null){%>
									<%= info.getStore_name() %>
							<%} %>
					</td>
				</tr>
				<tr>
					<td><p style="border-right:1px solid lightgray; width:200px">����� ��Ϲ�ȣ</p></td>
					<td>
							<%if(info != null){%>
									<%= info.getCustomer_regist_number() %>
							<%} %>
					</td>
				</tr>
				<tr>
					<td><p style="border-right:1px solid lightgray; width:200px">�ּ�</p></td>
					<td>
							<%if(info != null){%>
									<%= info.getAddress() %>
							<%} %>
					</td>
				</tr>
				<tr>
					<td><p style="border-right:1px solid lightgray; width:200px">��ȭ��ȣ</p></td>
					<td>
							<%if(info != null){%>
									<%= info.getTel() %>
							<%} %>
					</td>
				</tr>
				<tr>
					<td><p style="border-right:1px solid lightgray; width:200px">�������</p></td>
					<td>
					 		<%if(info != null){%>
									<%= info.getPayment() %>
							<%} %>
					</td>
				</tr>
				</table>
		 		<br><br>
		 		<div class="login-button-wrap1">
				<button><a href="Update_change.jsp" style="color:white">����</a></button>
		 		</div>
			</div>
		</div>
	</div>

</body>
</html>