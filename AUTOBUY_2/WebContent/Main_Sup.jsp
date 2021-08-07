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
		list = dao.showOrder();		
	%>
	<div class="container" >
		<div class="header">

			<div class="title"><p><a href="Main_Sup.jsp" id="auto"><b><b>AUTO</b></b></a><a href="Main_Sup.jsp" id="buy">BUY</a></p></div>
			
			<%if(info != null){%>
				<div style="margin-left: 1270px; margin-top: 20px">
				
				 <table id="topmenu">
					<tr>
						<td ><a href="Update.jsp">����������</a></td>		
						<td ><a href="Incoming.jsp">�ֹ����</a></td>		
						<td ><a href="Product_reg.jsp">��ٱ���</a></td>
						<td ><a href="Update.jsp">������</a></td>
						<td ><a href="LogoutServiceCon">�α׾ƿ�</a></td>				
					</tr>
				</table>
				
				</div>
			
			<%} %>			

		</div>
		<div class="list">
			<table id="menu">
				<tr>
					<td id="hello" onclick="location.href='Update.jsp'"><h3><%=info.getStore_name() %> �����<br>ȯ���մϴ�!!</h3></td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='Main_sup.jsp'" style="background-color: #5F04B4; color: white;"> &emsp;&emsp;&nbsp;���</td>
				</tr>
				<tr >
					<td class="select" onclick="location.href='Cus_management.jsp'">&emsp;&emsp;&nbsp;������</td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='SupProductShow.jsp'">&emsp;&emsp;&nbsp;���</td>
				</tr>
				
			</table>
		</div>
		<div class="content">
			<div class="small_title"><p>���</p></div>
				<div id="search" style="margin-left:100px; margin-top:10px;">
				<input id="searchInput" type="text" placeholder="�˻����Է�">
				<button>�˻�</button>
			</div>
			<div class="sup" style="margin-left:330px; margin-top:33px; font-size:18px; float:left;"><b>�ŷ�ó</b>
					<select name="sub_search" class="sub_search" style="width:150px; height:25px; margin-left:20px;" >
						<option value="����">����</option>
				    	<option value="��������">��������</option>
				   		<option value="�ϴϾ�������">�ϴϾ�������</option>
		 			</select>
		 	</div>
		 	<div class="term"  style="margin-left:100px;  margin-top:35px; font-size:18px; float:left;"><b>�Ⱓ��</b>  </div>                   
		 		<div style="float:left; margin-left:50px; margin-top:36px;">������ : <input type="date" value="start" min="yyy" max="zzz"></div>
		 		
		 		<div style="float:left; margin-left:50px; margin-top:36px;">������ : <input type="date" value="end" min="yyy" max="zzz"></div>
		 	
			<div class="board">
				<table id="show" style="margin:auto; width : 1400px; margin-top:50px;">

					<tr style ="text-align: center; width: 400px; font-size: 18px;">
						<td><b>�ֹ���ȣ</b></td>
						<td><b>ī���ȣ</b></td>
						<td><b>������</b></td>
						<td><b>�����Ȳ</b><br><p class="small">(��ǰ ����/Ȯ��/�Ϸ�)</p></td>
						<td><b>�ֹ���</b></td>
					</tr>
					<%for(int i = 0; i<list.size();i++){ %>
					<tr style="height: 40px; text-align: center; width: 400px; font-size: 17px;" onMouseOver="this.style.backgroundColor='#EFF8FB';" onMouseOut="this.style.backgroundColor=''">
						<td style = "width: 15%"><%=list.get(i).getOrder_num()%></td>
						<td style = "width: 25%"><%=list.get(i).getCustomer_store_name()%></td>
						<td style = "width: 20%"><%=list.get(i).getOrder_date()%></td>
						<td style = "width: 20%">��ǰ ����</td>
						<td><a href="OrderDetailServiceCon?order_num=<%=list.get(i).getOrder_num()%>"><input type="button" value ="�ֹ���"></a></td>	
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