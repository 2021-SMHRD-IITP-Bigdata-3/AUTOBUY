<%@page import="auto.model.StockDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="auto.model.StockDAO"%>
<%@page import="auto.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link rel="stylesheet" href="assest/css/Main.css">
</head>
<body>
	<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
	
		StockDAO stock_dao = new StockDAO();		
		ArrayList<StockDTO> stock_list = new ArrayList<StockDTO>();
		stock_list = stock_dao.showStock();
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
		<form action="ModifyLimitQnttyServiceCon" method="post">
		<div class="content">
			<div class="small_title"><p>����</p></div>
			<div class="board">
				<table class="list_board">
					<tr>
						<td>����</td>
						<td>��ǰ��</td>
						<td>�ŷ�ó</td>
						<td>���</td>
						<td>���� ���</td>
						<td>�ּ� ���</td>
					</tr>
					<tr>
		            <%for(int i = 0; i<stock_list.size();i++){ %>
						<tr>
							<td>����</td>
							<td><%=stock_list.get(i).getProduct_name() %></td>
							<td><%=stock_list.get(i).getSupplier_name() %></td>
							<td><%=stock_list.get(i).getStock_qntty() %></td>
							<td><%=stock_list.get(i).getStandard_qntty() %></td>	
							<td><%=stock_list.get(i).getMinimum_qntty() %></td>
						</tr>
					<%} %>
					<tr>
					<td><a href="LimitModify.jsp">����</a></td>
					</tr>
			 </table>
			</div>
		</div>
		</form>
		<div class ="footer">
			<div class="banner">AUTOBUY</div>
			<div class="company">��)����������<br>
								��ǥ : �۱����� | ����� ��� ��ȣ : 000-00-00000<br>
								���ֱ����� ���� �۾Ϸ�60 ����CGI����</div>
		</div>
	</div>

</body>
</html>