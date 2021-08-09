<%@page import="auto.model.CartDTO"%>
<%@page import="auto.model.OrderDAO"%>
<%@page import="auto.model.StockDAO"%>
<%@page import="auto.model.StockDTO"%>
<%@page import="auto.model.ProductDTO"%>
<%@page import="auto.model.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="auto.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html>
<style>
body{
	background-color: #f5f6f7;
}
</style>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link rel="stylesheet" href="assest/css/StockAdd.css">
</head>
<body>
	<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		String customer_id = info.getCustomer_id();
	
		ProductDAO product_dao = new ProductDAO();

		ArrayList<ProductDTO> product_list = new ArrayList<ProductDTO>();
		product_list = product_dao.showProduct();
		
		
		
		OrderDAO order_dao = new OrderDAO();		
		ArrayList<CartDTO> cart_list = order_dao.showCart(customer_id);		
		
		for(int i=0; i<product_list.size(); i++){
			for(int j=0; j<cart_list.size(); j++){
				if(product_list.get(i).getProduct_num()==cart_list.get(j).getProduct_num()){
					product_list.remove(i);
					i=0;
				}
			}
		}
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
					<td id="hello" onclick="location.href='Update.jsp'"><h3><%=info.getStore_name() %>ī�� �����<br>ȯ���մϴ�!!</h3></td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='Main.jsp'" > &emsp;&emsp;&nbsp;�����</td>
				</tr>
				<tr >
					<td class="select" onclick="location.href='Incoming.jsp'">&emsp;&emsp;&nbsp;�԰�</td>
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
					<td class="select" onclick="location.href='Product_reg.jsp'" style="background-color: #5F0080; color: white;">&emsp;&emsp;&nbsp;����</td>
				</tr>
			</table>
		</div>
		<div class="content">
			<div class="small_title"><p>��ǰ�ֹ�</p>
			<div id="search">
				<input id="searchInput" type="text" placeholder="�˻����Է�">
				<button>�˻�</button>
			</div>
			</div>
			
				<div class="board1" style="float: left;">
				<div style=" overflow:auto; height:600px;">
           			<table id="show" style="margin-top:0px; ">
						<tr style="text-align: center; font-size:18px;">
							<td style="width:72px;"><b>����</b></td>
							<td style="width:240px"><b>��ǰ��</b></td>
							<td style = "width:90px;"><b>����</b></td>
							<td style = "width:180px"><b>�ŷ�ó</b></td>
							<td style = "width: 48px;"><b></b></td>
						</tr>
						<%for(int i = 0; i<product_list.size();i++){ %>
						<tr  id = "data" class="event"style=" cursor: pointer; font-size: 17px; onMouseOver="this.style.backgroundColor='#EFF8FB';" onMouseOut="this.style.backgroundColor=''"
						onclick="location.href='CartServiceCon?product_num=<%=product_list.get(i).getProduct_num()%>'">
							<td style="width:72px; ">����</td>		
							<td style = "width:240px;"><%=product_list.get(i).getProduct_name() %></td>
							<td style = "width:90px; text-align: center;"><%=product_list.get(i).getProduct_price() %>��</td>
							<td style = "width:180px; text-align: center;"><%=product_list.get(i).getSupplier_name() %></td>
							<td style = "width: 48px; color: #5F0080; text-align: center;" > <b>></b></td>
						</tr>
						<%} %>
	
						</table>                                                                                                                    			
				</div>
				</div>
			<form action="ManualOrderServiceCon" method="post">
			<div class="board1"  style="float:left; ">
			<div style=" overflow:auto; height:600px;">
	            <table id="show" style="margin-left: 20px; margin-top:0px;">
	               <tr style="text-align: center; width: 400px; font-size:18px;">
	               	  <td style="width: 72px"><b>����</b></td>
	                  <td style="width: 240px"><b>��ǰ��</b></td>
	                  <td style="width:180px"><b>�ŷ�ó</b></td>
	                  <td style="width:90px"><b>����</b></td>
	                  <td style="width: 48px"><b></b></td>
	               </tr>
	 			   
	               <%for(int i=0; i<cart_list.size(); i++){ %>
						<tr id = "data" class="event" style="font-size:17px;  height: 40px; width: 600px; onMouseOver="this.style.backgroundColor='#EFF8FB';" onMouseOut="this.style.backgroundColor=''">
						    <td style="width: 72px;">����</td>
							<td style="width: 240px;"><%=cart_list.get(i).getProduct_name() %></td>
							<td style = "width:180px;'"><%=cart_list.get(i).getSupplier_name() %></td>
							<td style = "width:90px; text-align: center;"><input type="number"  name = "order_qntty" min="0" value=0 size="10px" style="width:50px;"></td>
							<td class="event" style="width: 48px; color: #5F0080; text-align: center; cursor: pointer;" onMouseOver="this.style.backgroundColor='#EFF8FB';" onMouseOut="this.style.backgroundColor=''"
						onclick="location.href='CartDeleteServiceCon?product_num=<%=cart_list.get(i).getProduct_num()%>'"><b>x</b></td>
						</tr>
					<%} %>
					
					
	            </table>
            	</div>
            	</div>
        	<button  class="submitbutton" style="margin-right: 50%; margin-top: 20px;">����</button>
        	</form>
        	</div>	
        	
		</div>
		<div class ="footer">
			<div class="banner">AUTOBUY</div>
			<div class="company">��)����������<br>
								��ǥ : �۱����� | ����� ��� ��ȣ : 000-00-00000<br>
								���ֱ����� ���� �۾Ϸ�60 ����CGI����</div>
		</div>


</body>
</html>