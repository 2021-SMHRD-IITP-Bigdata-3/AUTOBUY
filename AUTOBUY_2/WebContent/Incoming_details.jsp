<%@page import="auto.model.OrderDAO"%>
<%@page import="auto.model.ProductDAO"%>
<%@page import="auto.model.ProductDTO"%>
<%@page import="auto.model.OrderDTO"%>
<%@page import="auto.model.OrderDetailDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="auto.model.MemberDAO"%>
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
	
		MemberDAO member_dao = new MemberDAO();
		
		ArrayList<OrderDetailDTO> dto = (ArrayList<OrderDetailDTO>)session.getAttribute("dto");
		
		ProductDAO product_dao = new ProductDAO();
		ArrayList<ProductDTO> product_list = new ArrayList<ProductDTO>();
		product_list = product_dao.showProduct();
		
		OrderDAO dao = new OrderDAO();
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		list = dao.showOrder();	
		
		
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
						<td class="select" onclick="location.href='Main.jsp'"> &emsp;&emsp;&nbsp;�����</td>
					</tr>
					<tr >
						<td class="select" onclick="location.href='Incoming.jsp'" style="background-color: #5F0080; color: white;" >&emsp;&emsp;&nbsp;�԰�</td>
					</tr>
					<tr>
						<td class="select" onclick="location.href='Outgoing.jsp'" >&emsp;&emsp;&nbsp;���</td>
					</tr>
					<tr>
						<td class="select" onclick="location.href='Shelf_life.jsp'" >&emsp;&emsp;&nbsp;�������</td>
					</tr>
					<tr>
						<td class="select" onclick="location.href='Sup_con.jsp'" >&emsp;&emsp;&nbsp;�ŷ�ó</td>
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
		<div class="content">
			<div class="small_title"><p>�԰� > �� ����</p></div>
			<%	int sum = 0;
				for(int i = 0; i < dto.size(); i++){ 
						int price = product_dao.getPrice(dto.get(i).getProduct_num()); 
						int qntty = dto.get(i).getOrder_qntty();
						sum += price * qntty;					
				}
				
				String order_num = ""; 
	 			String order_date = "";
	 			for(int i=0; i<list.size();i++){ 
	 				if(dto.get(0).getOrder_num().equals(list.get(i).getOrder_num_s())){
						order_num = list.get(i).getOrder_num_s();
						order_date = list.get(i).getOrder_date();
					}
 				}%>
									
		
			<form action=UpdateQnttyServiceCon method="post">		
				<table id="show" style="width: 89%; margin:auto; margin-top:60px;">
					<tr style="font-size: 18px; font-weight: bold; text-align: center;">
						<td>��ȣ</td>
						<td>����</td>
						<td>��ǰ��</td>
						<td>����</td>
						<td>�ŷ�ó��</td>
						<td>�����</td>
						<td>����Ȯ��</td>
						<td>�԰���</td>
					</tr >
					<% for(int i = 0; i<dto.size();i++){ %>
						<tr style="font-size: 17px;  text-align: center;">
							<td style = "width: 5%"><%=i+1%></td>
							<td style = "width: 8%"><%=dto.get(i).getProduct_pic()%></td>
							<td style = "width: 22%"><%=dto.get(i).getProduct_name()%></td>
							<td style = "width: 10%" ><%=dto.get(i).getOrder_qntty()%></td>	
							<td style = "width: 12%"><%=dto.get(i).getSupplier_name()%></td>	
																									
							<%if(dto.get(i).getForwarding_date()==null){%>							
								<td style = "width: 17%">-</td>
							<%}	else {%>
								<td style = "width: 17%"><%=dto.get(i).getForwarding_date()%></td>	
							<%} %>
							
							<td style = "width: 7%" ><a onMouseOver="this.style.backgroundColor='lightgray';" onMouseOut="this.style.backgroundColor=''" href="ReceiptServiceCon?product_num=<%=dto.get(i).getProduct_num()%>">���ɿϷ�</a></td>
							
							<%if(dto.get(i).getReceipt_date()==null){%>							
								<td style = "width: 17%">-</td>
							<%}	else {%>
								<td style = "width: 17%" ><%=dto.get(i).getReceipt_date()%></td>	
								
							<input type="hidden" value="<%=dto.get(i).getOrder_qntty()%>" name = "order_qntty">
							<input type="hidden" value="<%=dto.get(i).getProduct_num()%>" name = "product_num">
							<input type="hidden" value="<%=dto.get(i).getReceipt_date()%>" name = "receipt_date">
							<%} %>
						</tr>	
					<%} %>		
			 </table>
			<button onclick="location.href='Incoming.jsp'" class="submitbutton" style="margin-right: 50%; margin-top: 50px;">Ȯ��</button>
		</form>		
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