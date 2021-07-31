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
<style>
.add{
	float:right;
	font-size:25px;
	margin-right:30px;
	margin-top:10%;
	}

</style>
<head>
	<link rel="stylesheet" href="assest/css/Main_Sup.css">
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
			<div class=""><p><a href="Main_Sup.jsp">���</a></p></div>
			<div class=""><p><a href="Cus_management.jsp">������</a></p></div>
			<div class=""><p><a href="SupProducShow.jsp">��ǰ���</a></p></div>
		</div>
		<div class="content">
			<div class="small_title"><p>��ǰ���</p></div>
			<div class="add"><p><a href="Sup_Product_reg.jsp">+��ǰ ���/����</a></p></div>
			<div class="board">
           		<table class="list_board">
					<tr>
						<td>��ǰ��</td>
						<td>����</td>
						<td>�ŷ�ó</td>
					</tr>
					<%for(int i = 0; i<product_list.size();i++){ 
						if(info.getNickName().equals(product_list.get(i).getSupplier_name())){
						%>
					<tr>
						<td style = "width: 40%"><%=product_list.get(i).getProduct_name() %></td>
						<td style = "width: 18%"><%=product_list.get(i).getProduct_price() %><%=won %></td>
						<td style = "width: 27%"><%=product_list.get(i).getSupplier_name() %></td>
					</tr>
					<%} }%>
				
			
				</table>
			
			</div>
			
			
			
			
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