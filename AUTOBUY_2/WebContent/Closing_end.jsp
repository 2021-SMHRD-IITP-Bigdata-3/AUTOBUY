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
   System.out.println("�ֹ���ȣ : " + dto.getOrder_num_s());
   

%>
<div class = "center">
<br>
   <div name="title" style="font-size:30px; height:85px;"><b>�ֹ� �Ϸ�</b></div>
         <div class="order_num" >�ֹ���ȣ  :  </div><div class="order_num1"> <%=dto.getOrder_num_s()%></div><br>
         
         <div style="font-szie:22px; float:left; margin-right:100px;"" ><b>�������</b></div><br>
            
            <table id="recipt" style="float:left">
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
            
            <div><button type="button" class = "submitbutton" onclick="location.href='Main.jsp'" style="margin-top: 40px;">Ȯ��</button></div>

</div>
</body>
</html>