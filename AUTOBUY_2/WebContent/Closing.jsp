<%@page import="auto.model.AutomaticSuggestDTO"%>
<%@page import="auto.model.AutomaticSuggestDAO"%>
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
	<link rel="stylesheet" href="assest/css/StockAdd.css">
</head>
<body>
	<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		StockDAO stock_dao = new StockDAO();		
		ArrayList<StockDTO> stock_list = stock_dao.showStock(info.getCustomer_id());
		
		AutomaticSuggestDAO suggest_dao = new AutomaticSuggestDAO();
		ArrayList<AutomaticSuggestDTO> suggest_list = suggest_dao.showSuggest(info.getCustomer_id());
		
		for(int i=0; i<suggest_list.size();i++){
			System.out.println(suggest_list.get(i).getSuggest_qntty());
		}
		
		int default_num = 1;
		
		for(int i=0; i<stock_list.size(); i++){
			for(int j=0; j<suggest_list.size(); j++){
				if(stock_list.get(i).getProduct_num()==suggest_list.get(j).getProduct_num()){
					stock_list.remove(i);
					i=0;
				}
			}
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
		<div class="content">
			<div class="small_title"><p>��������</p></div>
			<div class="board">
           		<table class="list_board">
					<tr>
						<td>��ǰ��</td>
						<td>�ŷ�ó</td>
						<td>���</td>
					</tr>
					<%for(int i = 0; i<stock_list.size();i++){ %>
					<tr>
						<td><%=stock_list.get(i).getProduct_name() %></td>
						<td><%=stock_list.get(i).getSupplier_name() %></td>
						<td style = "width: 15%"><a href="RegistSuggestServiceCon?product_num=<%=stock_list.get(i).getProduct_num()%>"><input type="button" value ="���"></a></td>
					</tr>
					<%} %>
				
			
				</table>
			
			</div>
			<form action="SuggestOrderServiceCon" method="post">
			<div class="board2">
			
            <table class="list_board2">
               <tr>
                  <td>��ǰ��</td>
                  <td>����</td>
                  <td>����</td>
               </tr>
 			   
               <%for(int i=0; i<suggest_list.size();i++){%>
					<tr>
						<td style="width: '50%'"><%=suggest_list.get(i).getProduct_name()%></td>
						<td style="width: '25%'"><input type="number"  name = "stock_qntty" min="0" value=<%if(suggest_list.get(i).getSuggest_qntty()<=1){%>
																			<%=default_num %><%}else{ %>
																			<%=suggest_list.get(i).getSuggest_qntty() %><%} %> size="10px" style="width:50px;"></td>
						<td style="width: '25%'"><a href="DeleteSuggestServiceCon?stock_num=<%=suggest_list.get(i).getProduct_num()%>"><input type="button" value ="����"></a></td>				
					</tr>
		
				<%} %>
				
				<tr>
					<td colspan="4" align="right"><a href="SuggestOrderServiceCon"><input type="submit" value="����" ></a></td>
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
	

</body>

</html>