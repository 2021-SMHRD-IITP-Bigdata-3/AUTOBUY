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
						<td ><a href="Update.jsp">마이페이지</a></td>		
						<td ><a href="Incoming.jsp">주문배송</a></td>		
						<td ><a href="Product_reg.jsp">장바구니</a></td>
						<td ><a href="Update.jsp">고객센터</a></td>
						<td ><a href="LogoutServiceCon">로그아웃</a></td>				
					</tr>
			</table>
            </div>
         
         <%} %>         

      </div>
		<div class="list">
			<table id="menu">
				<tr>
						<td id="hello" onclick="location.href='Update.jsp'"><h3><%=info.getStore_name() %>카페 사장님<br>환영합니다!!</h3></td>
					</tr>
					<tr>
						<td class="select" onclick="location.href='Main.jsp'"> &emsp;&emsp;&nbsp;재고목록</td>
					</tr>
					<tr >
						<td class="select" onclick="location.href='Incoming.jsp'" style="background-color: #5F0080; color: white;" >&emsp;&emsp;&nbsp;입고</td>
					</tr>
					<tr>
						<td class="select" onclick="location.href='Outgoing.jsp'" >&emsp;&emsp;&nbsp;출고</td>
					</tr>
					<tr>
						<td class="select" onclick="location.href='Shelf_life.jsp'" >&emsp;&emsp;&nbsp;유통기한</td>
					</tr>
					<tr>
						<td class="select" onclick="location.href='Sup_con.jsp'" >&emsp;&emsp;&nbsp;거래처</td>
					</tr>
					<tr>
						<td class="select" onclick="location.href='Data.jsp'">&emsp;&emsp;&nbsp;대시보드</td>
					</tr>
					<tr>
						<td class="select" onclick="location.href='Limit.jsp'">&emsp;&emsp;&nbsp;조정</td>
					</tr>
					<tr>
						<td class="select" onclick="location.href='Product_reg.jsp'">&emsp;&emsp;&nbsp;발주</td>
				</tr>
			</table>
		</div>
		<div class="content">
			<div class="small_title"><p>입고 > 상세 내역</p></div>
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
						<td>번호</td>
						<td>사진</td>
						<td>제품명</td>
						<td>수량</td>
						<td>거래처명</td>
						<td>출고일</td>
						<td>수령확인</td>
						<td>입고일</td>
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
							
							<td style = "width: 7%" ><a onMouseOver="this.style.backgroundColor='lightgray';" onMouseOut="this.style.backgroundColor=''" href="ReceiptServiceCon?product_num=<%=dto.get(i).getProduct_num()%>">수령완료</a></td>
							
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
			<button onclick="location.href='Incoming.jsp'" class="submitbutton" style="margin-right: 50%; margin-top: 50px;">확인</button>
		</form>		
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