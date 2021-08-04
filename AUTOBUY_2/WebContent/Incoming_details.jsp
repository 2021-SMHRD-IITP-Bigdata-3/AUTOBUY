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
					<h4><%= info.getCustomer_id() %>님<h4>
				</div>
			<%} %>					
			<div class="logout"><a href="LogoutServiceCon">로그아웃</a></div>
			<div class="mypage"><a href="Update.jsp"><img src="img/mypage.png" height="40px" width="40px"></a></div>			
		</div>
		<div class="list">
			<div class="small_list">
				<div class="main_p"><p><a href="Main.jsp"><img src="img/list_i.png" height="30px" width="30px">제품목록</a></p></div>
				<div class="incoming"><p><a href="Incoming.jsp"><img src="img/in.png" height="30px" width="30px">입고</a></p></div>
				<div class="outgoing"><p><a href="Outgoing.jsp"><img src="img/out.png" height="30px" width="30px">출고</a></p></div>
				<div class="shelf"><p><a href="Shelf_life.jsp"><img src="img/shelf.png" height="30px" width="30px">유통기한 관리</a></p></div>
				<div class="sup_con"><p><a href="Sup_con.jsp"><img src="img/sup.png" height="30px" width="30px">거래처 관리</a></p></div>
				<div class="data"><p><a href="Data.jsp"><img src="img/chart.png" height="30px" width="30px">대시보드</a></p></div>
				<div class="limit"><p><a href="Limit.jsp"><img src="img/li.png" height="30px" width="30px">조정</a></p></div>
				<div class="product"><p><a href="Product_reg.jsp"><img src="img/product.png" height="30px" width="30px">수동발주</a></p></div>
			</div>
		</div>
		<div class="content">
			<div class="small_title"><p>입고 > 상세 내역</p></div>
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
									
			<div class="order_num">주문번호 </div>
			<div class="order_num"><%=order_num%></div>			
			<div class="cafe_name">거래처명  </div>
			<div class="cafe_name"><%=supplier_store_name%></div>	
			<div class="all_money">총 주문금액  </div>			
			<div class="all_money"><%=sum%>원</div>		
			<div class="all_money">주문일자  </div>			
			<div class="all_money"><%=order_date%></div>
												
			<div class="board">
				<table class="list_board">
					<tr>
						<td>번호</td>
						<td>사진</td>
						<td>제품명</td>
						<td>수량</td>
						<td>출고일</td>
						<td>수령확인</td>
						<td>입고일</td>
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
			 <a href="ReceiptServiceCon?order_num=<%=order_num%>"><input type="button" value ="수령 완료"></a>
			 <a href="Incoming.jsp"><input type="button" value ="확인"></a>
			</div>
		</div>
		<div class ="footer">
			<div class="banner">AUTOBUY</div>
			<div class="company">주)오도바이절<br>
								대표 : 송김정정 | 사업자 등록 번호 : 000-00-00000<br>
								광주광역시 남구 송암로60 광주CGI센터</div>
		</div>
	</div>

</body>
</html>