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
<%=info.getNickName() %> ���� ���ְ� �Ϸ�Ǿ����ϴ�.<br>
�ֹ���ȣ : <%=dto.getOrder_num_s()%><br>
�ֹ��ݾ� : <%=dto.getOrder_amount()%>��<br>
�����ϰ� ����ص帱�Կ� !<br>
<td><a href = "Main.jsp"><img src = "img/confirm.png" width="150" height="80"></a></td>
</div>
</body>
</html>