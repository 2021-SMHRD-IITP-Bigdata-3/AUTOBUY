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
	<div name="title" style="font-size:25px;"><b>주문 완료</b></div>
	<br>
		<div style="line-height:15px; font-size:25px;">주문이 완료되었습니다.</div>
			<div class="order_num" >주문번호  :  </div><div class="order_num1"> <%=dto.getOrder_num_s()%></div><br><br>
			<div style="font-szie:22px; float:left;"><b>배송정보</b></div><br>
			
				<div style="line-height:20px; margin-top:20px;">
					<div style="color:gray; font-size:13px; float:left;" >받는 분</div>
					<div style="margin-left:10px; font-size:13px;"><%=info.getCeo()%>/<%=dto.getCustomer_tel() %></div><br>
				
					<div style="color:gray; font-size:13px; float:left;" >배송지</div>
					<div style="margin-left:10px; font-size:13px;"><%=info.getStore_name() %></div>
				</div>
				
				<div style="float:left; margin-top:20px; ">결제정보 수신 이메일 주소</div><br>
				<div style="line-height:20px; margin-top:20px;">
					<div style=" font-size:13px; float:left;  margin-top:10px;" ><%=info.getEmail() %></div>
				</div><br>
				<div style="float:left; color:red;">결제금액</div>
				
				<div style="float:right; color:red;"><%=dto.getOrder_amount()%> 원</div><br>
				
				<div style="float:left; margin-top:20px; ">결제수단</div><br>
				<div style="line-height:20px; margin-top:20px;">
					<div style=" font-size:14px; float:left;  margin-top:10px;" >무통장 입금</div>
				</div><br>

<td><a href = "Main.jsp"><img src = "img/confirm.png" width="150" height="80"></a></td>
</div>
</body>
</html>