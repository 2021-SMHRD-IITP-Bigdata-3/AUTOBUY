<%@page import="auto.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link rel="stylesheet" href="assest/css/Update.css">
</head>
<body>
<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
%>
<div class="container">
	<div class="mypage_title">���� ������ </div>
	<form action="UpdateServiceCon" method="post">
	<p>��ǥ�ڸ�</p><div class="CEO">
			<%if(info != null){%>
					<h4><%= info.getCeo() %><h4>
			<%} %></div>
	<p>�г���</p><div class="nickname">
			<%if(info != null){%>
					<h4><%= info.getCustomer_id() %><h4>

			<%} %>
			</div>
	<p>��й�ȣ</p><div class="pw">
			<%if(info != null){%>
					<h4><%= info.getCustomer_pw() %><h4>
			<%} %>	
			</div>
			
	<p>�̸���</p><div class="email">
			<%if(info != null){%>
					<h4><%= info.getEmail() %><h4>
			<%} %>
			</div>
	<p>��ȣ��</p><div class="store_name">
			<%if(info != null){%>
					<h4><%= info.getStore_name() %><h4>
			<%} %>
			</div>
	<p>����� ��Ϲ�ȣ</p><div class="sup_num">
			<%if(info != null){%>
					<h4><%= info.getCustomer_regist_number() %><h4>
			<%} %>
			</div>
	<p>�ּ�</p><div class="address">
			<%if(info != null){%>
					<h4><%= info.getAddress() %><h4>
			<%} %>
			</div>
	<p>��ȭ��ȣ</p><div class="tel"
			><%if(info != null){%>
					<h4><%= info.getTel() %><h4>
			<%} %>
			</div>
	<p>���� ���</p>		
	 		<%if(info != null){%>
					<h4><%= info.getPayment() %><h4>
			<%} %>
	 		<br><br>
	 	<button><a href="Update_change.jsp">����</a></button>
	 	<button><a href="Main.jsp">���� �Ϸ�</a></button>
	</form>
	
</div>
</body>
</html>