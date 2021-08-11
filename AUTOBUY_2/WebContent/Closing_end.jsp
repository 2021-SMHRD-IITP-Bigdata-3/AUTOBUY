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
<link rel="stylesheet" href="assest/css/Closing_end.css">

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
   <div name="title" style="font-size:30px; height:85px;"><b>주문 완료</b></div>
         <div class="order_num" >주문번호  :  </div><div class="order_num1"> <%=dto.getOrder_num_s()%></div><br>
         
         <div style="font-szie:22px; float:left; margin-right:100px;"" ><b>배송정보</b></div><br>
            
            <table id="recipt" style="float:left">
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
            
            <div><button type="button" class = "submitbutton" onclick="location.href='Main.jsp'" style="margin-top: 40px;">확인</button></div>

</div>
</body>
</html>