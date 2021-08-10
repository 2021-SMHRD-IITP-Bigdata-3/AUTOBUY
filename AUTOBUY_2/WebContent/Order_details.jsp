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
					<td id="hello" onclick="location.href='Update.jsp'"><h3><%=info.getStore_name() %> �����<br>ȯ���մϴ�</h3></td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='Main_Sup.jsp'" > &emsp;&emsp;&nbsp;���</td>
				</tr>
				<tr >
					<td class="select" onclick="location.href='Cus_management.jsp'"style="background-color:#5F0080; color: white;">&emsp;&emsp;&nbsp;������</td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='SupProductShow.jsp'">&emsp;&emsp;&nbsp;��ǰ���</td>
				</tr>
				
			</table>
		</div>
		<div class="content">			
 			<div class="small_title"><p> ��� > �ֹ� ��</p></div>
 			
 			
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
			<div class="order_num" style="float:left; margin-left:105px;">�ֹ���ȣ<br><%=order_num%> </div>	
			<div class="cafe_name" style="float:left; margin-left:80px;" >ī���ȣ<br><%=customer_store_name%></div>			
			<div class="all_money" style="float:left; margin-left:80px;">�� �ֹ��ݾ�<br><%=sum%>�� </div>			
			<div class="order_date" style="float:left; margin-left:80px;">�ֹ�����<br><%=order_date%></div>
			<div class="Delivery_status" style="float:left; margin-left:80px; margin-right:10px;">�����Ȳ  :</div> 
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
					<div class="Delivery_status" style=" " >��ǰ����</div> 							
					<%}else if(Reccnt == dto.size()){%>
						<div class="Delivery_status" style=" ">��ǰ�Ϸ�</div> 							
					<%}else {%>
					<div class="Delivery_status" style="">��ǰ����</div> 							
					<%}%>
					</div>			
			<div class="board">
				<table id="show" style="margin:auto; width : 1300px; margin-top:20px;">
					<tr  style ="text-align: center; width: 400px; font-size: 18px;">
						<td>��ȣ</td>
						<td>����</td>
						<td>��ǰ��</td>
						<td>����</td>
						<td>��ǰ ����</td>
						<td>�ֹ� �ݾ�</td>
						<td>���Ȯ��</td>
						<td>�����</td>
					</tr>
					<%	sum = 0;
						for(int i = 0; i<dto.size();i++){ %>
				<tr style="height: 40px; text-align: center; width: 400px; font-size: 17px;" onMouseOver="this.style.backgroundColor='#EFF8FB';" onMouseOut="this.style.backgroundColor=''">

							<td style = "width: 5%"><%=i+1%></td>
							<td style = "width: 10%; text-align: center;"><img src="img/<%=dto.get(i).getProduct_pic()%>"></td>
							<td style = "width: 20%"><%=dto.get(i).getProduct_name()%></td>
							<td style = "width: 6%"><%=dto.get(i).getOrder_qntty()%></td>
							<% int price = product_dao.getPrice(dto.get(i).getProduct_num());%>
							<td style = "width: 15%"><%=price%>��</td>
							<td style = "width: 15%"><%= dto.get(i).getOrder_qntty() * price %>��</td>
							<td style = "width: 13%"><a href="ForwardServiceCon?product_num=<%=dto.get(i).getProduct_num()%>">���Ϸ�</a></td>	
							<%if(dto.get(i).getForwarding_date()==null){%>							
								<td style = "width: 15%">-</td>
							<%}	else {%>
								<td style = "width: 15%"><%=dto.get(i).getForwarding_date()%></td>	
							<%} %>																		
						</tr>
					<%} %>		
			 </table>
			 <div><button type="button" class ="submitbutton" onclick="location.href='Main_Sup.jsp'" style="margin-top: 20px; margin-right: 48.2%;">Ȯ��</button></a></div>
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