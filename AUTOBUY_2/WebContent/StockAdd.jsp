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
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link rel="stylesheet" href="assest/css/StockAdd.css">
</head>
<body>
<body>
	<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
	
	
		ProductDAO product_dao = new ProductDAO();
		String won = "��";

		ArrayList<ProductDTO> product_list = new ArrayList<ProductDTO>();
		product_list = product_dao.showProduct();	
		
		
		StockDAO stock_dao = new StockDAO();		
		ArrayList<StockDTO> stock_list = new ArrayList<StockDTO>();
		stock_list = stock_dao.showStock();
		
		if(product_list!=null){
			System.out.println("����");

		}else{
			System.out.println("����");
		}
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
			<div class="mypage"><a href="Update.jsp"><img src="../img/mypage.png" height="40px" width="40px"></a></div>			
		</div>
		<div class="list">
			<div class="list_1 list_common"><p><a href="Main.jsp">��ǰ���</a></p></div>
			<div class="list_2 list_common"><p><a href="Incoming.jsp">�԰�</a></p></div>
			<div class="list_3 list_common"><p><a href="Outgoing.jsp">���</a></p></div>
			<div class="list_4 list_common"><p><a href="Shelf_life.jsp">������� ����</a></p></div>
			<div class="list_5 list_common"><p><a href="Sup_con.jsp">�ŷ�ó ����</a></p></div>
			<div class="list_6 list_common"><p><a href="Data.jsp">��ú���</a></p></div>
			<div class="list_7 list_common"><p><a href="Limit.jsp">����</a></p></div>
			<div class="list_8 list_common"><p><a href="Product_reg.jsp">���� ����</a></p></div>
		</div>
		<div class="content">
			<div class="small_title"><p>��ǰ��� > ��ǰ���</p></div>
			<div class="board">
           		<table class="list_board">
					<tr>
						<td>��ǰ��</td>
						<td>����</td>
						<td>�ŷ�ó</td>
						<td>���</td>
					</tr>
					<%for(int i = 0; i<product_list.size();i++){ %>
					<tr>
						<td width = ""><%=product_list.get(i).getProduct_name() %></td>
						<td><%=product_list.get(i).getProduct_price() %><%=won %></td>
						<td><%=product_list.get(i).getSupplier_name() %></td>
						<td><a href="RegistOneProductServiceCon?product_num=<%=product_list.get(i).getProduct_num()%>"><input type="button" value ="���"></a></td>
					</tr>
					<%} %>
			
				</table>
			
			</div>
			<form action="RegistProductQnttyServiceCon" method="post">
			<div class="board2">
			
            <table class="list_board2">
               <tr>
                  <td>��ǰ��</td>
                  <td>�ŷ�ó</td>
                  <td>����</td>
                  <td>����</td>
               </tr>
 			   
               <%for(int i = 0; i<stock_list.size();i++){ %>
					<tr>
						<td><%=stock_list.get(i).getProduct_name() %></td>
						<td><%=stock_list.get(i).getSupplier_name() %></td>
						<td><input type="number"  name = "stock_qntty" min="0" value="0" size="10px" style="width:50px;"></td>
						<td><a href="DeleteOneStockServiceCon?stock_num=<%=stock_list.get(i).getProduct_num()%>"><input type="button" value ="����"></a></td>				
					</tr>
				<%} %>	
            </table>
            
        	</div>		
        	<div><input type="submit" value="��ϿϷ�" ></div>	
        	</form>
		</div>
		<div class ="footer">
			<div class="banner">AUTOBUY</div>
			<div class="company">��)����������<br>
								��ǥ : �۱����� | ����� ��� ��ȣ : 000-00-00000<br>
								���ֱ����� ���� �۾Ϸ�60 ����CGI����</div>
		</div>
	

</body>

</body>
</html>