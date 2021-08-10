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
	<link rel="stylesheet" href="assest/css/StockAdd.css">
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
		<div class="container_line"></div>
		<div class="header">
			<div class="title"><p><a href="Main_Sup.jsp" id="auto"><b><b>AUTO</b></b></a><a href="Main_Sup.jsp" id="buy">BUY</a></p></div>
			
			<%if(info != null){%>
				<div style="margin-left: 1130px; margin-top: 20px">
				
				 <table id="topmenu">
					<tr>
						<td ><a href="Update.jsp">마이페이지</a></td>		
						<td ><a href="#">고객센터</a></td>
						<td ><a href="LogoutServiceCon">로그아웃</a></td>				
					</tr>
				</table>
				
				</div>
			
			<%} %>			

		</div>
		<div class="list">
			<table id="menu">
				<tr>
					<td id="hello" onclick="location.href='Update.jsp'"><h3><%=info.getStore_name() %> 사장님<br>환영합니다</h3></td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='Main_Sup.jsp'" > &emsp;&emsp;&nbsp;출고</td>
				</tr>
				<tr >
					<td class="select" onclick="location.href='Cus_management.jsp'"style="background-color:#5F0080; color: white;">&emsp;&emsp;&nbsp;고객관리</td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='SupProductShow.jsp'">&emsp;&emsp;&nbsp;제품목록</td>
				</tr>
				
			</table>
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
 			<div style="margin-top:20px; font-family: 'Spoqa Han Sans Neo', 'sans-serif';">
			<div class="order_num" style="float:left; margin-left:105px;">주문번호<br><%=order_num%> </div>	
			<div class="cafe_name" style="float:left; margin-left:80px;" >카페상호<br><%=customer_store_name%></div>			
			<div class="all_money" style="float:left; margin-left:80px;">총 주문금액<br><%=sum%>원 </div>			
			<div class="order_date" style="float:left; margin-left:80px;">주문일자<br><%=order_date%></div>
			<div class="Delivery_status" style="float:left; margin-left:80px; margin-right:10px;">출고현황  :</div> 
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
					<div class="Delivery_status" style=" " >납품예정</div> 							
					<%}else if(Reccnt == dto.size()){%>
						<div class="Delivery_status" style=" ">납품완료</div> 							
					<%}else {%>
					<div class="Delivery_status" style="">납품시작</div> 							
					<%}%>
					</div>			
			<div class="board">
				<table id="show" style="margin:auto; width : 1300px; margin-top:20px;">
					<tr  style ="text-align: center; width: 400px; font-size: 18px;">
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
				<tr style="height: 40px; text-align: center; width: 400px; font-size: 17px;" onMouseOver="this.style.backgroundColor='#EFF8FB';" onMouseOut="this.style.backgroundColor=''">

							<td style = "width: 5%"><%=i+1%></td>
							<td style = "width: 10%; text-align: center;"><img src="img/<%=dto.get(i).getProduct_pic()%>"></td>
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
			 <div><button type="button" class ="submitbutton" onclick="location.href='Main_Sup.jsp'" style="margin-top: 20px; margin-right: 48.2%;">확인</button></a></div>
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