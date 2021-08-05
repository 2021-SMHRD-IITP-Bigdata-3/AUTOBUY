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
	<link rel="stylesheet" href="assest/css/Order_details.css">
</head>
<body>
	<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
	
		MemberDAO member_dao = new MemberDAO();
		
		ArrayList<OrderDetailDTO> dto = (ArrayList<OrderDetailDTO>)session.getAttribute("dto");
		ArrayList<OrderDTO> order_dto = (ArrayList<OrderDTO>)session.getAttribute("order_dto");
		
		ProductDAO product_dao = new ProductDAO();
		ArrayList<ProductDTO> product_list = new ArrayList<ProductDTO>();
		product_list = product_dao.showProduct();
		
		OrderDAO dao = new OrderDAO();
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		list = dao.showOrder();	
		
		
	%>

	<div class="container" >
		<div class="header">
			<div class="title"><p>AUTOBUY</p></div>
			<%if(info != null){%>
				<div class="store_name">
					<h4><%= info.getCustomer_id() %>��<h4>
				</div>
			<%} %>					
			<div class="logout"><a href="LogoutServiceCon">�α׾ƿ�</a></div>
			<div class="mypage"><a href="Update.jsp"><img src="img/mypage.png" height="40px" width="40px"></a></div>			
		</div>
		<div class="list">
			<div class="small_list">
				<div class="main_p"><p><a href="Main.jsp"><img src="img/list_i.png" height="30px" width="30px">��ǰ���</a></p></div>
				<div class="incoming"><p><a href="Incoming.jsp"><img src="img/in.png" height="30px" width="30px">�԰�</a></p></div>
				<div class="outgoing"><p><a href="Outgoing.jsp"><img src="img/out.png" height="30px" width="30px">���</a></p></div>
				<div class="shelf"><p><a href="Shelf_life.jsp"><img src="img/shelf.png" height="30px" width="30px">������� ����</a></p></div>
				<div class="sup_con"><p><a href="Sup_con.jsp"><img src="img/sup.png" height="30px" width="30px">�ŷ�ó ����</a></p></div>
				<div class="data"><p><a href="Data.jsp"><img src="img/chart.png" height="30px" width="30px">��ú���</a></p></div>
				<div class="limit"><p><a href="Limit.jsp"><img src="img/li.png" height="30px" width="30px">����</a></p></div>
				<div class="product"><p><a href="Product_reg.jsp"><img src="img/product.png" height="30px" width="30px">��������</a></p></div>
			</div>
		</div>
		<div class="content">
			<div class="small_title"><p>�԰� > �� ����</p></div>
			<%int sum = 0;
				for(int i = 0; i<dto.size();i++){ 
					int price = product_dao.getPrice(dto.get(i).getProduct_num()); 
					int qntty = dto.get(i).getOrder_qntty();
					sum += price * qntty;					
				}
			
	 			int order_num = 0;
	 			String supplier_store_name = "";
	 			String order_date = "";
	 			for(int i=0; i<order_dto.size();i++){ 
					if(dto.get(i).getOrder_num().equals(order_dto.get(i).getOrder_num())){
						order_num = order_dto.get(i).getOrder_num();
						supplier_store_name = dto.get(i).getSupplier_name();
						order_date = order_dto.get(i).getOrder_date();
					}
 			}%>
									
			<div class="order_num">�ֹ���ȣ </div>
			<div class="order_num"><%=order_num%></div>			
			<div class="cafe_name">�ŷ�ó��  </div>
			<div class="cafe_name"><%=supplier_store_name%></div>	
			<div class="all_money">�� �ֹ��ݾ�  </div>			
			<div class="all_money"><%=sum%>��</div>		
			<div class="all_money">�ֹ�����  </div>			
			<div class="all_money"><%=order_date%></div>
												
			<div class="board">
				<table class="list_board">
					<tr>
						<td>��ȣ</td>
						<td>����</td>
						<td>��ǰ��</td>
						<td>����</td>
						<td>�����</td>
						<td>����Ȯ��</td>
						<td>�԰���</td>
					</tr>
					<% for(int i = 0; i<dto.size();i++){ %>
						<tr>
							<td style = "width: 8%"><%=i+1%></td>
							<td style = "width: 18%"><%=dto.get(i).getProduct_name()%>.png</td>
							<td style = "width: 22%"><%=dto.get(i).getProduct_name()%></td>
							<td style = "width: 6%"><%=dto.get(i).getOrder_qntty()%></td>																			
							<%if(dto.get(i).getForwarding_date()==null){%>							
								<td style = "width: 17%">-</td>
							<%}	else {%>
								<td style = "width: 17%"><%=dto.get(i).getForwarding_date()%></td>	
							<%} %>
							<td style = "width: 13%"><a href="ReceiptServiceCon?product_num=<%=dto.get(i).getProduct_num()%>"><input type="checkbox"></a></td>
							<%if(dto.get(i).getForwarding_date()==null){%>							
								<td style = "width: 17%">-</td>
							<%}	else {%>
								<td style = "width: 17%"><%=dto.get(i).getReceipt_date()%></td>	
							<%} %>
						</tr>	
					<%} %>		
			 </table>
			 <a href="ReceiptServiceCon?order_num=<%=order_num%>"><input type="button" value ="���� �Ϸ�"></a>
			 <a href="Incoming.jsp"><input type="button" value ="Ȯ��"></a>
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