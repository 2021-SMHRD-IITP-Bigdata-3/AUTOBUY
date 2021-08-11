<%@page import="auto.model.OrderDetailDAO"%>
<%@page import="auto.model.OrderDetailDTO"%>
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
<head>
	<link rel="stylesheet" href="assest/css/StockAdd.css">
</head>
<body> 
	<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		OrderDAO dao = new OrderDAO();
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		list = dao.showOrderSup(info.getStore_name());
		
		ArrayList<OrderDetailDTO> dto = null;
		OrderDetailDAO orderdetail_dao = new OrderDetailDAO();
	%>
	<div class="container" >
	<div class="container_line"></div>
		<div class="header">
			<div class="title"><p><a href="Main_Sup.jsp" id="auto"><b><b>AUTO</b></b></a><a href="Main_Sup.jsp" id="buy">BUY</a></p></div>
			
			<%if(info != null){%>

				<div style="margin-left: 1130px; margin-top: 20px">

				 <table id="topmenu">
					<tr>
						<td ><a href="Update.jsp">����������</a></td>		
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
					<td id="hello" onclick="location.href='Update.jsp'"><h3><%=info.getStore_name() %> �����<br>ȯ���մϴ�.</h3></td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='Main_Sup.jsp'" style="background-color: #5F0080; color: white;"> &emsp;&emsp;&nbsp;���</td>
				</tr>
				<tr >
					<td class="select" onclick="location.href='Cus_management.jsp'">&emsp;&emsp;&nbsp;�� ����</td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='SupProductShow.jsp'">&emsp;&emsp;&nbsp;��ǰ ���</td>
				</tr>
				</table>
		</div>
		<div class="content">
			<div class="small_title"><p>���</p></div>
				<div id="search" style="margin-left:100px; margin-top:10px;">
				<input id="searchInput" type="text" placeholder="�˻����Է�">
				<button>�˻�</button>
			</div>
			
		 	
			<div class="board">
				<table id="show" style="margin:auto; width : 1400px; margin-top:40px;">

					<tr  style ="text-align: center; width: 400px; font-size: 18px;">
						<td><b>�ֹ���ȣ</b></td>
						<td><b>ī���ȣ</b></td>
						<td><b>������</b></td>
						<td><b>�����Ȳ</b><br><div style="font-size:13px;">(��ǰ ����/Ȯ��/�Ϸ�)</div></td>
						<td><b>�ֹ���</b></td>
					</tr>
					<%for(int i = 0; i<list.size();i++){ %>
					<tr style="height: 40px; text-align: center; width: 400px; font-size: 17px;" onMouseOver="this.style.backgroundColor='#EFF8FB';" onMouseOut="this.style.backgroundColor=''">
						<td style = "width: 15%"><%=list.get(i).getOrder_num()%></td>
						<td style = "width: 25%"><%=list.get(i).getCustomer_store_name()%></td>
						<td style = "width: 20%"><%=list.get(i).getOrder_date()%></td>
						<td style = "width: 20%">
						<% dto = orderdetail_dao.showOrderDetail(list.get(i).getOrder_num_s());
							dto = orderdetail_dao.showOrderDetail_s(list.get(i).getOrder_num_s(), info.getStore_name());
								int Reccnt = 0;
								int Forcnt = 0;
								for(int j=0; j<dto.size(); j++){
									if(dto.get(j).getReceipt_date()==null){
										Reccnt++;
									}
									if(dto.get(j).getForwarding_date()==null){
										Forcnt++;
									}
								}
								Reccnt = dto.size() - Reccnt; 
								Forcnt = dto.size() - Forcnt; 
								
								if(Forcnt == 0){%>
								<div class="Delivery_status">��ǰ����</div> 							
								<%}else if(Reccnt == dto.size()){%>
									<div class="Delivery_status">��ǰ�Ϸ�</div> 							
								<%}else {%>
								<div class="Delivery_status">��ǰ����</div> 							
								<%}%>
						</td>
						<td><a href="OrderDetailServiceCon?order_num=<%=list.get(i).getOrder_num_s()%>"><input type="button" value ="�ֹ���"></a></td>	
					</tr>
					<%} %>					
			 </table>
			</div>
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