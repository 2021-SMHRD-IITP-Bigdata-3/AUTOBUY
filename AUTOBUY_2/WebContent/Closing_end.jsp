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
	System.out.println("주문번호 : " + dto.getOrder_num_s());
	

%>
<div class = "center">
<br>
	<div name="title" style="font-size:30px;"><b>주문 완료</b></div>
			<div class="order_num" >주문번호  :  </div><div class="order_num1"> <%=dto.getOrder_num_s()%></div><br><br>
			<div style="font-szie:22px; float:left;"><b>배송정보</b></div><br>
				
				<table id="recipt">
					<tr>
						<th>받는 분</th>
						<td><%=info.getCeo() %></td>
					</tr>
					<tr>
						<th>상호명</th>
						<td><%=info.getStore_name() %></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><%=info.getAddress() %></td>
					</tr>
					<tr>
						<th>결제금액</th>
						<td><%=dto.getOrder_amount() %>원</td>
					</tr>
					<tr>
					</tr>
				</table>
				<div style="font-szie:22px; float:left;"><b>결제수단</b></div><br>
				<table id="recipt">
					<tr>
						<th>무통장 입금(기업은행)</th>
						<td><%=dto.getOrder_amount() %>원</td>
					</tr>
				</table>
				<button type="button" class = "submitbutton" onclick="location.href='Main.jsp'" style="margin-top: 20px; margin:auto;">확인</button>

</div>
</body>
</html>