<%@page import="auto.model.OrderDetailDAO"%>
<%@page import="auto.model.OrderDetailDTO"%>
<%@page import="auto.model.MemberDAO"%>
<%@page import="auto.model.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="auto.model.OrderDAO"%>
<%@page import="auto.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link rel="stylesheet" href="assest/css/StockAdd.css">
</head>
<body>
	<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
								
		OrderDAO order_dao = new OrderDAO();
		ArrayList<OrderDTO> order_list = new ArrayList<OrderDTO>();
		order_list = order_dao.showOrderCus(info.getCustomer_id());		

		ArrayList<OrderDetailDTO> dto = null;
		OrderDetailDAO dao = new OrderDetailDAO();
	%>


	<div class="container" >
	<div class="container_line"></div>
		<div class="header">
			<div class="title"><p><a href="Main.jsp" id="auto"><b><b>AUTO</b></b></a><a href="Main.jsp" id="buy">BUY</a></p></div>
			
			<%if(info != null){%>
				<div style="margin-left: 49%; margin-top: 20px">
				 <table id="topmenu">
					<tr>
						<td ><a href="Update.jsp">����������</a></td>		
						<td ><a href="Incoming.jsp">�ֹ����</a></td>		
						<td ><a href="Product_reg.jsp">��ٱ���</a></td>
						<td ><a href="#">������</a></td>
						<td ><a href="LogoutServiceCon">�α׾ƿ�</a></td>				
					</tr>
				</table>
				</div>
			
			<%} %>										
		</div>
		<div class="list">
			<table id="menu">
				<tr>
					<td id="hello" onclick="location.href='Update.jsp'"><h3><%=info.getStore_name() %>ī�� �����<br>ȯ���մϴ�</h3></td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='Main.jsp'" > &emsp;&emsp;&nbsp;�����</td>
				</tr>
				<tr >
					<td class="select" onclick="location.href='Incoming.jsp'" style="background-color: #5F0080; color: white;">&emsp;&emsp;&nbsp;�԰�</td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='Outgoing.jsp'">&emsp;&emsp;&nbsp;���</td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='Shelf_life.jsp'">&emsp;&emsp;&nbsp;�������</td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='Sup_con.jsp'">&emsp;&emsp;&nbsp;�ŷ�ó</td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='Data.jsp'">&emsp;&emsp;&nbsp;��ú���</td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='Limit.jsp'">&emsp;&emsp;&nbsp;����</td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='Product_reg.jsp'">&emsp;&emsp;&nbsp;����</td>
				</tr>
			</table>
		</div>
	</div>
		<div class="content">
			<div class="small_title"><p>�԰�</p></div>
			<div class="board">
				<table id="show" style="margin:auto; width : 1300px; margin-top:40px;">
					<tr  style ="text-align: center; width: 400px; font-size: 18px;">
						<td><b>�ֹ���ȣ</b></td>
						<td><b>�ֹ�����</b></td>
						<td><b>�԰���</b></td>
						<td><b>�ֹ���</td>
					</tr>				
					<%for(int i = 0; i<order_list.size();i++){ %>
					<tr style="height: 40px; text-align: center; width: 400px; font-size: 17px;" onMouseOver="this.style.backgroundColor='#EFF8FB';" onMouseOut="this.style.backgroundColor=''">
						<td style = "width: 30%"><%=order_list.get(i).getOrder_num_s()%></td>
						<td style = "width: 30%"><%=order_list.get(i).getOrder_date()%></td>
						<td  style = "width: 20%"><% 
							   dto = dao.showOrderDetail(order_list.get(i).getOrder_num_s());
							   double a = dto.size();
							   double b = 0;
							   double result = 0;
							   
								   for(int j =0; j<dto.size(); j++){
									   if(dto.get(j).getReceipt_date()==null){
										   b++;
									   }
								   }
								   result = (a-b)/a*100;
							   %>							
						<%=Math.round(result)%>%</td>
						<td  style = "width: 20%"><a href="OrderDetailServiceCon_Cus?order_num=<%=order_list.get(i).getOrder_num_s()%>"><input type="button" value ="�ֹ���"></a></td>	
					</tr>
					<%} %>			
			 </table>
			</div>
		</div>
		<div class ="footer">
			<div class="banner">AUTOBUY</div>
			<div class="company">��)����������<br>
								��ǥ : �۱����� | ����� ��� ��ȣ : 000-00-00000<br>
								���ֱ����� ���� �۾Ϸ�60 ����CGI����</div>
		</div>
	</div>

</body>
</html>