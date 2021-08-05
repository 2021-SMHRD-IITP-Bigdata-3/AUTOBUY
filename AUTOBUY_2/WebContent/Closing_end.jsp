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
font-family: 돋움체;
}
</style>
</head>
<body>
<%
	MemberDTO info = (MemberDTO)session.getAttribute("info");
	OrderDAO dao = new OrderDAO();
	OrderDTO dto =  dao.showReceipt(info.getCustomer_id());
	System.out.println("주문번호 : " + dto.getOrder_num_s());
	

%>
<div class = "center">
<%=info.getNickName() %> 고객님 발주가 완료되었습니다.<br>
주문번호 : <%=dto.getOrder_num_s()%><br>
주문금액 : <%=dto.getOrder_amount()%>원<br>
안전하게 배송해드릴게요 !<br>
<td><a href = "Main.jsp"><img src = "img/confirm.png" width="150" height="80"></a></td>
</div>
</body>
</html>