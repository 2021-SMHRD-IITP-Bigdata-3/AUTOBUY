<%@page import="auto.model.MemberDTO"%>
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
<head>
	<link rel="stylesheet" href="assest/css/StockAdd.css">
</head>
<body> 
	<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
	
	
		ProductDAO product_dao = new ProductDAO();
		String won = "��";

		ArrayList<ProductDTO> product_list = new ArrayList<ProductDTO>();
		product_list = product_dao.showProduct();	
		
		
		
		if(product_list!=null){
			System.out.println("����");

		}else{
			System.out.println("����");
		}
	%>

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
					<td class="select" onclick="location.href='Cus_management.jsp'">&emsp;&emsp;&nbsp;������</td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='SupProductShow.jsp'"style="background-color: #5F0080; color: white;">&emsp;&emsp;&nbsp;��ǰ���</td>
				</tr>
				
			</table>
		</div>
		<div class="content">
			<div class="small_title"><p>��ǰ���</p></div>
			<div class="board">
           		<table id="show" style="margin:auto; width : 1400px; margin-top:40px;">
					<tr  style ="text-align: center; width: 400px; font-size: 18px;">
						<td><b>��ǰ��</b></td>
						<td><b>����</b></td>
						<td><b>�ŷ�ó</b></td>
					</tr>
					<%for(int i = 0; i<product_list.size();i++){ 
						if(info.getNickName().equals(product_list.get(i).getSupplier_name())){
						%>
					<tr style="height: 40px; text-align: center; width: 400px; font-size: 17px;" onMouseOver="this.style.backgroundColor='#EFF8FB';" onMouseOut="this.style.backgroundColor=''">
						<td style = "width: 40%"><%=product_list.get(i).getProduct_name() %></td>
						<td style = "width: 18%"><%=product_list.get(i).getProduct_price() %><%=won %></td>
						<td style = "width: 27%"><%=product_list.get(i).getSupplier_name() %></td>
					</tr>
						<%} 
					}%>
				</table>
				</div>
			<div><button type="button" class = "submitbutton" onclick="location.href='Sup_Product_reg.jsp'" style="margin-top: 20px; margin-right: 710px;">+���/����</button></div>
		</div>
		<div class ="footer">
			<div class="banner">AUTOBUY</div>
			<div class="company">��)����������<br>
								��ǥ : �۱����� / ����� ��� ��ȣ : 000-00-00000<br>
								���ֱ����� ���� �۾Ϸ�60 ����CGI����</div>
		</div>
	</div>

</body>
</html>