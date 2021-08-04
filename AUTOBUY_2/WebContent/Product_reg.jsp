<%@page import="auto.model.CartDTO"%>
<%@page import="auto.model.OrderDAO"%>
<%@page import="auto.model.StockDAO"%>
<%@page import="auto.model.StockDTO"%>
<%@page import="auto.model.ProductDTO"%>
<%@page import="auto.model.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="auto.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<style>
@import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css);

 #search {
	height : 40px;
	width : 400px;
	border : 2px solid #5F04B4;
	background : #ffffff;
}
#searchInput{
	font_size : 16px;
	width : 325px;
	padding : 10px;
	border : 0px;
	outline : none;
	float : left;
}
button{
	width : 50px;
	height : 100%;
	border : 0px;
	background : #5F04B4;
	outline : none;
	float : right;
	color : #ffffff;
	
}

.inputbutton{
width : 50px;
	height : 100%;
	border : 0px;
	background : #5F04B4;
	outline : none;
	float : right;
	color : #ffffff
}
.list_board{
border-collapse: separate;
  border-spacing: 1px;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  margin : 20px 10px;
  border-left: 3px solid #5F04B4;
  margin-left: 0px;
}

#show th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}

.list_board td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  font-family: 'Spoqa Han Sans Neo', 'sans-serif';
}
.submitbutton{
	width : 100px;
	height : 50px;
	border : 0px;
	border-radius : 3px;
	background : #5F04B4;
	color : #ffffff;
	font-size: 18px;
	border-style: ridge;
	
}

a{
	text-decoration: none;
	color: black;
 
}

#menu{
	
	text-align: left;
	margin-top: 45px;
	
}
#menu td{
	width: 350px;
  	padding: 10px;
  	vertical-align: top;
  	height: 30px;
  	font-family: 'Spoqa Han Sans Neo', 'sans-serif';
  	
  	
}
.select:hover {
	border-left: 3px solid #5F04B4;
	font-weight: bold;
	background-color: #5F04B4;
	color: white;
}
.select{
	font-weight: 450;
	font-size : 18px;

}
#hello{
	text-align: center;
}
	
a:hover {
	text-decoration: underline;
}

.inputbutton:hover{
	background : white;
	border : 1px solid #5F04B4;
	color : black;
}


@font-face{
	src: url("../assest/fonts/Cocogoose Pro Light-trial.ttf");
    font-family: "Cocogoose"; 
 }
</style>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link rel="stylesheet" href="assest/css/StockAdd.css">
</head>
<body>
	<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		String customer_id = info.getCustomer_id();
	
		ProductDAO product_dao = new ProductDAO();

		ArrayList<ProductDTO> product_list = new ArrayList<ProductDTO>();
		product_list = product_dao.showProduct();
		
		
		
		OrderDAO order_dao = new OrderDAO();		
		ArrayList<CartDTO> cart_list = order_dao.showCart(customer_id);		
		
		for(int i=0; i<product_list.size(); i++){
			for(int j=0; j<cart_list.size(); j++){
				if(product_list.get(i).getProduct_num()==cart_list.get(j).getProduct_num()){
					product_list.remove(i);
					i=0;
				}
			}
		}
	%>

	<div class="container" >
		<div class="header">
			<div class="title"><p style="color: black; font-family:Cocogoose">AUTOBUY</p></div>
			
			<%if(info != null){%>
				<div class="logout" style="float : right; font-size:18px; font-family: 'Spoqa Han Sans Neo', 'sans-serif';;"  ><a href="LogoutServiceCon">�α׾ƿ�</a></div>
				<div class="store_name" style="float: right; font-size: 18px; font-family: 'Spoqa Han Sans Neo', 'sans-serif';;">
					<a href="Update.jsp"><%= info.getCustomer_id() %>��</a>
				</div>
			<%} %>		
		</div>
		<div class="list">
			<table id="menu">
				<tr>
					<td id="hello" onclick="location.href='Update.jsp'"><h3><%=info.getStore_name() %>ī�� �����<br>ȯ���մϴ�!!</h3></td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='Main.jsp'" > &emsp;&emsp;&nbsp;�����</td>
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
					<td class="select" onclick="location.href='Product_reg.jsp'" style="background-color: #5F04B4; color: white;">&emsp;&emsp;&nbsp;����</td>
				</tr>
			</table>
		</div>
		<div class="content">
			<div class="small_title"><p>��ǰ�ֹ�</p></div>
				<div class="board">
           		<table class="list_board" style="width: 500px">
					<tr>
						<td >��ǰ��</td>
						<td >����</td>
						<td>�ŷ�ó</td>
						<td>���</td>
					</tr>
					<%for(int i = 0; i<product_list.size();i++){ %>
					<tr>
						<td style = "width:25%"><%=product_list.get(i).getProduct_name() %></td>
						<td style = "width:25%"><%=product_list.get(i).getProduct_price() %>��</td>
						<td style = "width:25%"><%=product_list.get(i).getSupplier_name() %></td>
						<td style = "width:25%"><a href="CartServiceCon?product_num=<%=product_list.get(i).getProduct_num()%>"><input type="button" value ="�߰�"></a></td>
					</tr>
					<%} %>

				</table>                                                                                                                        
				
			</div>
			<form action="ManualOrderServiceCon" method="post">
			<div class="board2">
			
            <table class="list_board">
               <tr>
                  <td>��ǰ��</td>
                  <td>�ŷ�ó</td>
                  <td>����</td>
                  <td>����</td>
               </tr>
 			   
               <%for(int i=0; i<cart_list.size(); i++){ %>
					<tr>
						<td><%=cart_list.get(i).getProduct_name() %></td>
						<td><%=cart_list.get(i).getSupplier_name() %></td>
						<td><input type="number"  name = "order_qntty" min="0" value=0 size="10px" style="width:50px;"></td>
						<td><a href="CartDeleteServiceCon?product_num=<%=cart_list.get(i).getProduct_num()%>"><input type="button" value ="����"></a></td>				
					</tr>
				<%} %>
				
				<tr>
					<td colspan="4" align="right"><input type="submit" value="����" ></td>
				</tr>
            </table>
            
        	</div>		
        	<div></div>	
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