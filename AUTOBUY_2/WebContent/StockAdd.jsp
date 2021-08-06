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
	<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
	
		ProductDAO product_dao = new ProductDAO();
		

		ArrayList<ProductDTO> product_list = new ArrayList<ProductDTO>();
		product_list = product_dao.showProduct();	
		
		
		StockDAO stock_dao = new StockDAO();		
		ArrayList<StockDTO> stock_list = new ArrayList<StockDTO>();
		
		stock_list = stock_dao.showStock(info.getCustomer_id());
		
		for(int i=0; i<product_list.size(); i++){
			for(int j=0; j<stock_list.size(); j++){
				if(product_list.get(i).getProduct_num()==stock_list.get(j).getProduct_num()){
					product_list.remove(i);
					i=0;
				}
			}
		}
		
		
		if(product_list!=null){
			System.out.println("����");

		}else{
			System.out.println("����");
		}
	%>

	<div class="container" >
		<div class="header">
			<div class="title"><p><a href="Main.jsp" id="auto"><b><b>AUTO</b></b></a><a href="Main.jsp?after" id="buy">BUY</a></p></div>
			
			<%if(info != null){%>
				<div style="margin-left: 1270px; margin-top: 20px">
				
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
					<td class="select" onclick="location.href='Main.jsp'" style="background-color: #5F04B4; color: white;"> &emsp;&emsp;&nbsp;�����</td>
				</tr>
				<tr >
					<td class="select" onclick="location.href='Incoming.jsp'">&emsp;&emsp;&nbsp;�԰�</td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='Outgoing.jsp'">&emsp;&emsp;&nbsp;���</td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='Shelf_life.jsp'">&emsp;&emsp;&nbsp;�������</td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='Sup_con.jsp'">&emsp;&emsp;&nbsp;�ŷ�ó</td>
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
			<div class="small_title"><p>����� > �����</p>
			<div id="search">
				<input id="searchInput" type="text" placeholder="�˻����Է�">
				<button>�˻�</button>
			</div>
			</div>
			
			<div class="board1" style="float:left;">
			<div style="width:810px; height:800px; overflow:auto">
           		<table id="show"  style="margin-top:24px;">
					<tr  style ="text-align: center; width: 400px; font-size: 18px;">
						<td style="whidth:15%; "><b>����</b></td>
						<td style="width: 37%"><b>��ǰ��</b></td>
						<td style = "width: 15%"><b>����</b></td>
						<td style = "width: 25%"><b>�ŷ�ó</b></td>
						<td style = "width: 8%"><b></b></td>
					</tr>
					<%for(int i = 0; i<product_list.size();i++){ %>
					<tr id = "data" class="event" style="height: 40px; width: 600px; cursor: pointer; font-size: 17px;" onMouseOver="this.style.backgroundColor='#EFF8FB';" onMouseOut="this.style.backgroundColor=''"
					onclick="location.href='RegistOneProductServiceCon?product_num=<%=product_list.get(i).getProduct_num()%>'">
						<td style="width: 15%">����</td>
						<td scope="row" style="width: 37%"><%=product_list.get(i).getProduct_name() %></td>
						<td style = "width: 15%; text-align: center;"><%=product_list.get(i).getProduct_price() %>��</td>
						<td style = "width: 25%; text-align: center;"><%=product_list.get(i).getSupplier_name() %></td>
						<td style = "width: 8%; color: #5F04B4; " > <b>></b></td>
					</tr>
					<%} %>
				</table>
				</div>
				</div>
			<form action="RegistProductQnttyServiceCon" method="post">
			
			
			
				
			
			<div class="board2" style="width: 700px;">
			
            <table id = "show" style="margin-left: -50px;">
               <tr style="text-align: center; width: 600px; font-size: 18px;">
               	  <td style="width: 15%;"><b>����</b></td>
                  <td style="width: 37%"><b>��ǰ��</b></td>
                  <td style="width: 25%;"><b>�ŷ�ó</b></td>
                  <td style="width: 15%;"><b>����</b></td>
                  <td style="width: 8%"><b></b></td>
               </tr>
 			   
               <%for(int i = 0; i<stock_list.size();i++){ %>
					<tr id = "data" style="font-size:17px;  height: 40px; width: 600px; " >
						<td style="width: 15%;">����</td>
						<td style="width: 37%"><%=stock_list.get(i).getProduct_name() %></td>
						<td style="width: 25%; text-align: center;"><%=stock_list.get(i).getSupplier_name() %></td>
						<td style="width: 15%; text-align: center;"><input type="number"  name = "stock_qntty" min="0" value=<%=stock_list.get(i).getStock_qntty() %> size="10px" style="width:50px;"></td>
						<td  class="event" style="width: 8%; cursor: pointer; color: #5F04B4; text-align: center;" onMouseOver="this.style.backgroundColor='#EFF8FB';" onMouseOut="this.style.backgroundColor=''"
					onclick="location.href='DeleteOneStockServiceCon?stock_num=<%=stock_list.get(i).getProduct_num()%>'"><b>x</b></td>				
					</tr>
				<%} %>
				
            </table>
          
            </div>
          
  				<button  class="submitbutton" style="margin-right: 1030px; margin-top: 20px;">��ϿϷ�</button>
  			
          
        	
        	
        	</form>
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