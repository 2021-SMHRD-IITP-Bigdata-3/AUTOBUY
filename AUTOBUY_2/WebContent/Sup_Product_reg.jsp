<%@page import="auto.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<head>
	<link rel="stylesheet" href="assest/css/Main_Sup.css">
</head>
<body> 
	<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
	%>
	<div class="container" >
		<div class="header">
			<div class="title"><p>AUTOBUY</p></div>
			<%if(info != null){%>
				<div class="store_name">
					<h4><%= info.getCustomer_id() %>��<h4>
				</div>
			<%} %>
			<div class="logout"><a href="LogoutServiceCon">�α׾ƿ�</a></div>
			<div class="mypage"><a href="Update.jsp"><img src="img/mypage.png" height="40px" width="40px"></a></div>		
		</div>
		<div class="list">
			<div class=""><p><a href="Main_Sup.jsp">���</a></p></div>
			<div class=""><p><a href="Cus_management.jsp">������</a></p></div>
			<div class=""><p><a href="SupProductShow.jsp">��ǰ ���</a></p></div>
		</div>
		<div class="content">
			<div class="small_title"><p>��ǰ ���</p></div>
			<form action="SupplierRegistOneProductServiceCon" method="post" enctype = "multipart/form-data">
			<div class="board">
				<table class="list_board">
				
					<tr>
						<td>��ǰ��</td>
						<td><input type="text" id="size" name="product_name"></td>
					</tr>
					<tr>
						<td>��ǰ ����</td>
						<td><input type="text" id="size" name="product_price"></td>
					</tr>
					
					<tr>
						<td>���� ���</td>
						<td><input type="text" id="size" name="product_qntty"></td>					
					</tr>
				
					<tr>
						<td>����</td>
						<td><input type="file" name="product_pic" style="float:center;">
						<input type="hidden" name="supplier_name" value ="<%= info.getStore_name() %>" >
			 </table>
			 <input type="submit" value="�Է� �Ϸ�" style="float:center">
			 <a href="Sup_Product_reg.jsp"></a><button style="float:center">���</button>
			</div>
			
			</form>
		</div>
		<div class ="footer">
			<div class="banner">AUTOBUY</div>
			<div class="company">��)����������<br>
								��ǥ : �۱����� / ����� ��� ��ȣ : 000-00-00000<br>
								���ֱ����� ���� �۾Ϸ�60 ����CGI����</div>
		</div>
	</div>

</body>
</html>