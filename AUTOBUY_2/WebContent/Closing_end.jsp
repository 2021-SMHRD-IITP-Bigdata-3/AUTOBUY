<%@page import="auto.model.OrderDTO"%>
<%@page import="auto.model.MemberDTO"%>
<%@page import="auto.model.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.center{
width: 400px; 
position: absolute; 
left: 50%; 
margin-left: -200px;
text-align:center;
font-weight: bold; 
font-size: 50;
line-height: 4;
font-family: ����ü;
}
.order_num{
style:font-size:15px;
color:gray;
float:left;
font-size:17px;
margin-left:80px;
}
.order_num1{
style:font-size:15px;
color:red;
float:left;
font-size:17px;
margin-left:20px;
}
#recipt{
	border-top: 1px solid lightgray;
	
	
}
th{
	color: gray;
	text-align: left;
	width: 130px;
}
td{
	text-align:left;
	margin-left: 50px;
	font-weight: 550;
	width: 300px;
}
</style>
</head>
<body>
<%
	MemberDTO info = (MemberDTO)session.getAttribute("info");
	OrderDAO dao = new OrderDAO();
	OrderDTO dto =  dao.showReceipt(info.getCustomer_id());
	System.out.println("�ֹ���ȣ : " + dto.getOrder_num_s());
	

%>
<div class = "center">
<br>
	<div name="title" style="font-size:30px;"><b>�ֹ� �Ϸ�</b></div>
			<div class="order_num" >�ֹ���ȣ  :  </div><div class="order_num1"> <%=dto.getOrder_num_s()%></div><br><br>
			<div style="font-szie:22px; float:left;"><b>�������</b></div><br>
				
				<table id="recipt">
					<tr>
						<th>�޴� ��</th>
						<td><%=info.getCeo() %></td>
					</tr>
					<tr>
						<th>��ȣ��</th>
						<td><%=info.getStore_name() %></td>
					</tr>
					<tr>
						<th>�ּ�</th>
						<td><%=info.getAddress() %></td>
					</tr>
					<tr>
						<th>�����ݾ�</th>
						<td><%=dto.getOrder_amount() %>��</td>
					</tr>
					<tr>
					</tr>
				</table>
				<div style="font-szie:22px; float:left;"><b>��������</b></div><br>
				<table id="recipt">
					<tr>
						<th>������ �Ա�(�������)</th>
						<td><%=dto.getOrder_amount() %>��</td>
					</tr>
				</table>
				<button type="button" class = "submitbutton" onclick="location.href='Main.jsp'" style="margin-top: 20px; margin:auto;">Ȯ��</button>

</div>
</body>
</html>