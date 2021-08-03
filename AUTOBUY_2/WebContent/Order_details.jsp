<%@page import="auto.model.OrderDTO"%>
<%@page import="auto.model.OrderDAO"%>
<%@page import="auto.model.ProductDAO"%>
<%@page import="auto.model.ProductDTO"%>
<%@page import="pos.model.MenuDAO"%>
<%@page import="auto.model.MemberDAO"%>
<%@page import="pos.model.MenuDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="auto.model.OrderDetailDTO"%>
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
	
		ArrayList<OrderDetailDTO> dto = (ArrayList<OrderDetailDTO>)session.getAttribute("dto");
		ArrayList<OrderDTO> order_dto = (ArrayList<OrderDTO>)session.getAttribute("order_dto");
		
		ProductDAO product_dao = new ProductDAO();
		ArrayList<ProductDTO> product_list = new ArrayList<ProductDTO>();
		product_list = product_dao.showProduct();
		
		OrderDAO dao = new OrderDAO();
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		list = dao.showOrder();		
	%>
	<%	int sum = 0;
		for(int i = 0; i<dto.size();i++){ 
				int price = product_dao.getPrice(dto.get(i).getProduct_num()); 
				int qntty = dto.get(i).getOrder_qntty();
				sum += price * qntty;					
	}%>

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
			<div class=""><p><a href="Main_Sup.jsp">���</a></p></div>
			<div class=""><p><a href="Cus_management.jsp">������</a></p></div>
			<div class=""><p><a href="Sup_Product_reg.jsp">��ǰ ���</a></p></div>
		</div>
		<div class="content">			
 			<div class="small_title"><p> ��� > �ֹ� ��</p></div>
 			<%
 			int order_num = 0;
 			String customer_store_name = "";
 			String order_date = "";
 			for(int i=0; i<order_dto.size();i++){ 
				if(dto.get(i).getOrder_num().equals(order_dto.get(i).getOrder_num())){
					order_num = order_dto.get(i).getOrder_num();
					customer_store_name = order_dto.get(i).getCustomer_store_name();
					order_date = order_dto.get(i).getOrder_date();
				}
 			}%>
 			
			<div class="order_num">�ֹ���ȣ </div>
			<div class="order_num"><%=order_num%></div>			
			<div class="cafe_name">ī���ȣ  </div>
			<div class="cafe_name"><%=customer_store_name%></div>			
			<div class="all_money">�� �ֹ��ݾ�  </div>			
			<div class="all_money"><%=sum%>��</div>
			<div class="order_date">�ֹ�����</div>
			<div class="order_date"><%=order_date%></div>
			<div class="Delivery_status">�����Ȳ</div> 
			<div class="Delivery_status">(��ǰ ����/Ȯ��/�Ϸ�)</div> 			
			<div class="board">
				<table class="list_board">
					<tr>
						<td>��ȣ</td>
						<td>����</td>
						<td>��ǰ��</td>
						<td>����</td>
						<td>��ǰ ����</td>
						<td>�ֹ� �ݾ�</td>
					</tr>
					<%	sum = 0;
						for(int i = 0; i<dto.size();i++){ %>
						<tr>
							<td style = "width: 5%"><%=i+1%></td>
							<td style = "width: 25%"><%=dto.get(i).getProduct_name()%>.png</td>
							<td style = "width: 25%"><%=dto.get(i).getProduct_name()%></td>
							<td style = "width: 10%"><%=dto.get(i).getOrder_qntty()%></td>
							<% int price = product_dao.getPrice(dto.get(i).getProduct_num());%>
							<td style = "width: 15%"><%=price%>��</td>
							<td style = "width: 20%"><%= dto.get(i).getOrder_qntty() * price %>��</td>																			
						</tr>
					<%} %>		
			 </table>
			 <a href="Main_Sup.jsp"><input type="button" value ="��ü ���Ϸ�"></a>
			 <a href="Main_Sup.jsp"><input type="button" value ="Ȯ��"></a>
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