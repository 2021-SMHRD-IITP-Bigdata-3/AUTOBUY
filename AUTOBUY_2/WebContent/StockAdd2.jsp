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
 #search {
	height : 40px;
	width : 400px;
	border : 2px solid #1b5ac2;
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
	background : #1b5ac2;
	outline : none;
	float : right;
	color : #ffffff;
	
}

.inputbutton{
width : 50px;
	height : 100%;
	border : 0px;
	background : #1b5ac2;
	outline : none;
	float : right;
	color : #ffffff
}
#show{
border-collapse: separate;
  border-spacing: 1px;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  margin : 20px 10px;
  border-left: 3px solid #1b5ac2;
  margin-left: 0px;
}

#show th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}

#show td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}
.submitbutton{
	width : 100px;
	height : 50px;
	border : 0px;
	border-radius : 3px;
	background : #1b5ac2;
	color : #ffffff;
	font-size: 18px;
	border-style: ridge;
	
}
.small_list div{
	
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
  	font-family: "���";
  	
}
#select:hover {
	background-color: #EFF8FB;
	border-left: 3px solid #1b5ac2;
	font-weight: bolder;
}
#select{
	font-weight: bold;
}
#hello{
	text-align: center;
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
			<div class="title"><p style="color: #1b5ac2;">AUTOBUY</p></div>
			
			<%if(info != null){%>
				<div class="logout" style="float : right; font-size: 20px;"  ><a href="LogoutServiceCon">�α׾ƿ�</a></div>
				<div class="store_name" style="float: right; font-size: 20px;">
					<a href="Update.jsp"><%= info.getCustomer_id() %>��</a>
				</div>
			<%} %>					
			

		</div>
		<div class="list">
			<table id="menu">
				<tr>
					<td id="hello" onclick="location.href='Update.jsp'"><h3><%=info.getStore_name() %>ī�� �����<br>ȯ���մϴ�!!</h3></td>
				<tr>
				<tr>
					<td id="select" onclick="location.href='Main.jsp'" style="background-color: red"> &emsp;&emsp;&nbsp;�����</td>
				</tr>
				<tr>
					<td id="select" onclick="location.href='Incoming.jsp'" style="background-color: orange">&emsp;&emsp;&nbsp;�԰�</td>
				</tr>
				<tr>
					<td id="select" onclick="location.href='Outgoing.jsp'" style="background-color: yellow">&emsp;&emsp;&nbsp;���</td>
				</tr>
				<tr>
					<td id="select" onclick="location.href='Shelf_life.jsp'" style="background-color: green">&emsp;&emsp;&nbsp;�������</td>
				</tr>
				<tr>
					<td id="select" onclick="location.href='Sup_con.jsp'" style="background-color: blue">&emsp;&emsp;&nbsp;�ŷ�ó</td>
				</tr>
				<tr>
					<td id="select" onclick="location.href='Data.jsp'" style="background-color: navy">&emsp;&emsp;&nbsp;��ú���</td>
				</tr>
				<tr>
					<td id="select" onclick="location.href='Limit.jsp'" style="background-color: purple">&emsp;&emsp;&nbsp;����</td>
				</tr>
				<tr>
					<td id="select" onclick="location.href='Product_reg.jsp'" style="background-color: gold">&emsp;&emsp;&nbsp;����</td>
				</tr>
			</table>
		</div>
		<div class="content">
			<div class="small_title"><p>��ǰ��� > ��ǰ���</p>
			<div id="search">
				<input id="searchInput" type="text" placeholder="�˻����Է�">
				<button>�˻�</button>
			</div>
			</div>
			<div class="board">
           		<table id = "show">
					<tr style="text-align: center; width: 400px;">
						<td style="width: 46%"><b>��ǰ��</b></td>
						<td style = "width: 18%"><b>����</b></td>
						<td style = "width: 30%"><b>�ŷ�ó</b></td>
						<td style = "width: 6%"><b>���</b></td>
					</tr>
					<%for(int i = 0; i<product_list.size();i++){ %>
					<tr style="height: 40px; width: 400px;" onMouseOver="this.style.backgroundColor='#EFF8FB';" onMouseOut="this.style.backgroundColor=''">
						<td scope="row" style="width: 45%"><%=product_list.get(i).getProduct_name() %></td>
						<td style = "width: 15%; text-align: center;"><%=product_list.get(i).getProduct_price() %>��</td>
						<td style = "width: 30%; text-align: center;"><%=product_list.get(i).getSupplier_name() %></td>
						<td style = "width: 10%"><a href="RegistOneProductServiceCon?product_num=<%=product_list.get(i).getProduct_num()%>"><input class="inputbutton" type="button" value ="���"></a></td>
					</tr>
					
					<%} %>
				
			
				</table>
			<%if(stock_list.size()<product_list.size()){ %>
			<div style="margin-left : 455px;"><input class="submitbutton" type="submit" value="��ϿϷ�" ></div>
			<%} %>
			</div>
			<form action="RegistProductQnttyServiceCon" method="post">
			<div class="board2">
			
            <table style="margin-left: 10px" id = "show">
               <tr style="text-align: center; width: 400px;">
                  <td style="width: 45%"><b>��ǰ��</b></td>
                  <td style = "width: 30%;"><b>�ŷ�ó</b></td>
                  <td style = "width: 15%;"><b>����</b></td>
                  <td style = "width: 10%"><b>����</b></td>
               </tr>
 			   
               <%for(int i = 0; i<stock_list.size();i++){ %>
					<tr style="height: 40px; width: 400px;" onMouseOver="this.style.backgroundColor='#EFF8FB';" onMouseOut="this.style.backgroundColor=''">
						<td scope="row" style="width: 45%"><%=stock_list.get(i).getProduct_name() %></td>
						<td style = "width: 15%; text-align: center;"><%=stock_list.get(i).getSupplier_name() %></td>
						<td><input type="number"  name = "stock_qntty" min="0" value=<%=stock_list.get(i).getStock_qntty() %> size="10px" style="width:50px;"></td>
						<td><a href="DeleteOneStockServiceCon?stock_num=<%=stock_list.get(i).getProduct_num()%>"><input class="inputbutton" type="button" value ="����"></a></td>				
					</tr>
				<%} %>
				
            </table>
            
        	</div>
        	<%if(stock_list.size()>=product_list.size()){ %>		
        	<div style="margin-left : 505px;"><input class="submitbutton" type="submit" value="��ϿϷ�" ></div>
        	<%} %>
        	</form>
		</div>
		<div class ="footer">
			<div class="banner">AUTOBUY</div>
			<div class="company">��)����������<br>
								��ǥ : �۱����� | ����� ��� ��ȣ : 000-00-00000<br>
								���ֱ����� ���� �۾Ϸ�60 ����CGI����</div>
		</div>
	

</body>
</html>