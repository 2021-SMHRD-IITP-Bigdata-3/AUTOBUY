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
	<div name="title" style="font-size:25px;"><b>�ֹ� �Ϸ�</b></div>
	<br>
		<div style="line-height:15px; font-size:25px;">�ֹ��� �Ϸ�Ǿ����ϴ�.</div>
			<div class="order_num" >�ֹ���ȣ  :  </div><div class="order_num1"> <%=dto.getOrder_num_s()%></div><br><br>
			<div style="font-szie:22px; float:left;"><b>�������</b></div><br>
			
				<div style="line-height:20px; margin-top:20px;">
					<div style="color:gray; font-size:13px; float:left;" >�޴� ��</div>
					<div style="margin-left:10px; font-size:13px;"><%=info.getCeo()%>/<%=dto.getCustomer_tel() %></div><br>
				
					<div style="color:gray; font-size:13px; float:left;" >�����</div>
					<div style="margin-left:10px; font-size:13px;"><%=info.getStore_name() %></div>
				</div>
				
				<div style="float:left; margin-top:20px; ">�������� ���� �̸��� �ּ�</div><br>
				<div style="line-height:20px; margin-top:20px;">
					<div style=" font-size:13px; float:left;  margin-top:10px;" ><%=info.getEmail() %></div>
				</div><br>
				<div style="float:left; color:red;">�����ݾ�</div>
				
				<div style="float:right; color:red;"><%=dto.getOrder_amount()%> ��</div><br>
				
				<div style="float:left; margin-top:20px; ">��������</div><br>
				<div style="line-height:20px; margin-top:20px;">
					<div style=" font-size:14px; float:left;  margin-top:10px;" >������ �Ա�</div>
				</div><br>

<td><a href = "Main.jsp"><img src = "img/confirm.png" width="150" height="80"></a></td>
</div>
</body>
</html>