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
					<h4><%= info.getCustomer_id() %>님<h4>
				</div>
			<%} %>					
			<div class="logout"><a href="LogoutServiceCon">로그아웃</a></div>
			<div class="mypage"><a href="Update.jsp"><img src="img/mypage.png" height="40px" width="40px"></a></div>			
		</div>
		<div class="list">
			<div class=""><p><a href="Main_Sup.jsp">출고</a></p></div>
			<div class=""><p><a href="Cus_management.jsp">고객관리</a></p></div>
			<div class=""><p><a href="Sup_Product_reg.jsp">제품 등록</a></p></div>
		</div>
		<div class="content">			
 			<div class="small_title"><p> 출고 > 주문 상세</p></div>
 			
 			
 			<%
  			String order_num = ""; 
 			String customer_store_name = "";
 			String order_date = "";
 			for(int i=0; i<list.size();i++){ 
				if(dto.get(0).getOrder_num().equals(list.get(i).getOrder_num_s())){												
 					order_num = list.get(i).getOrder_num_s(); 
					customer_store_name = list.get(i).getCustomer_store_name();
					order_date = list.get(i).getOrder_date();
				}
 			}%>
 			
			<div class="order_num">주문번호 </div>
			<div class="order_num"><%=order_num%></div>			
			<div class="cafe_name">카페상호  </div>
			<div class="cafe_name"><%=customer_store_name%></div>			
			<div class="all_money">총 주문금액  </div>			
			<div class="all_money"><%=sum%>원</div>
			<div class="order_date">주문일자</div>
			<div class="order_date"><%=order_date%></div>
			<div class="Delivery_status">출고현황</div> 
				<%	int Reccnt = 0;
					int Forcnt = 0;
					for(int i=0; i<dto.size(); i++){
						if(dto.get(i).getReceipt_date()==null){
							Reccnt++;
						}
						if(dto.get(i).getForwarding_date()==null){
							Forcnt++;
						}
					}
					Reccnt = dto.size() - Reccnt; 
					Forcnt = dto.size() - Forcnt; 
					
					if(Forcnt == 0){%>
					<div class="Delivery_status">납품예정</div> 							
					<%}else if(Reccnt == dto.size()){%>
						<div class="Delivery_status">납품완료</div> 							
					<%}else {%>
					<div class="Delivery_status">납품시작</div> 							
					<%}%>
									
			<div class="board">
				<table class="list_board">
					<tr>
						<td>번호</td>
						<td>사진</td>
						<td>제품명</td>
						<td>수량</td>
						<td>제품 가격</td>
						<td>주문 금액</td>
						<td>출고확인</td>
						<td>출고일</td>
					</tr>
					<%	sum = 0;
						for(int i = 0; i<dto.size();i++){ %>
						<tr>
							<td style = "width: 5%"><%=i+1%></td>
							<td style = "width: 10%"><%=dto.get(i).getProduct_pic()%></td>
							<td style = "width: 20%"><%=dto.get(i).getProduct_name()%></td>
							<td style = "width: 6%"><%=dto.get(i).getOrder_qntty()%></td>
							<% int price = product_dao.getPrice(dto.get(i).getProduct_num());%>
							<td style = "width: 15%"><%=price%>원</td>
							<td style = "width: 15%"><%= dto.get(i).getOrder_qntty() * price %>원</td>
							<td style = "width: 13%"><a href="ForwardServiceCon?product_num=<%=dto.get(i).getProduct_num()%>">출고완료</a></td>	
							<%if(dto.get(i).getForwarding_date()==null){%>							
								<td style = "width: 15%">-</td>
							<%}	else {%>
								<td style = "width: 15%"><%=dto.get(i).getForwarding_date()%></td>	
							<%} %>																		
						</tr>
					<%} %>		
			 </table>
			 <a href="Main_Sup.jsp"><input type="button" value ="확인"></a>
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