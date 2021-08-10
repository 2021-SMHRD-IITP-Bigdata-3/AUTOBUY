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
			<div class="container_line"></div>
	
		<div class="header">
			<div class="title"><p><a href="Main.jsp" id="auto"><b><b>AUTO</b></b></a><a href="Main.jsp" id="buy">BUY</a></p></div>					
			<%if(info != null){%>
				<div style="margin-left: 49%; margin-top: 20px">
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
					<td id="hello" onclick="location.href='Update.jsp'"><h3><%=info.getStore_name() %>ī�� �����<br>ȯ���մϴ�</h3></td>
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
					<td class="select" onclick="location.href='Product_reg.jsp'" style="background-color: #5F0080; color: white;">&emsp;&emsp;&nbsp;����</td>
				</tr>
			</table>
		</div>
		<div class="content">
			<div class="small_title"><p>��������</p></div>
			<div class="board1">
           		<table id="show" style="margin-left:3.8%;  text-align: center;">
					<tr style="text-align: center; width:; font-size: 18px; font-weight: bold;">
						<td style="width: 15%; text-align: center;"><b>����</b></td>					
						<td style="width: 35%">��ǰ��</td>
						<td style="width: 35%;">�ŷ�ó</td>
						<td style="width: 15%; text-align: center;"></td>
					</tr>
					<%for(int i = 0; i<stock_list.size();i++){ %>
					<tr id = "data" class="event" style="height: 40px; width: 600px; cursor: pointer; font-size: 17px;" onMouseOver="this.style.backgroundColor='#EFF8FB';" onMouseOut="this.style.backgroundColor=''"
					onclick="location.href='RegistSuggestServiceCon?product_num=<%=stock_list.get(i).getProduct_num()%>'">
						<td style="text-align: center;"><img src="img/<%=stock_list.get(i).getProduct_pic()%>"></td>	
						<td><%=stock_list.get(i).getProduct_name() %></td>
						<td style="text-align: center;"><%=stock_list.get(i).getSupplier_name() %></td>
						<td style = "width: 48px; color: #5F0080; text-align: center;" > <b>></b></td>
					</tr>
					<%} %>
				
			
				</table>
			
			</div>
			<form action="SuggestOrderServiceCon" method="post">
			<div class="board2">
			
            <table id="show" style="margin-left:3.8%;  text-align: center; ">
               <tr style="text-align: center; width:; font-size: 18px; font-weight: bold;">
              	  <td style="width: 15%;">����</td>
                  <td style="width: 35%;">��ǰ��</td>
                  <td style="width: 35%;">����</td>
                  <td style="width: 15%;"></td>
               </tr>
 			   
               <%for(int i=0; i<suggest_list.size();i++){%>
					<tr style="font-size: 17px;">
						<td style="text-align: center;"><img src="img/<%=suggest_list.get(i).getProduct_pic()%>"></td>	
						<td style=""><%=suggest_list.get(i).getProduct_name()%></td>
						<td style="text-align: center;"><input type="number"  name = "stock_qntty" min="0" value=<%if(suggest_list.get(i).getSuggest_qntty()<=1){%>
																			<%=default_num %><%}else{ %>
																			<%=suggest_list.get(i).getSuggest_qntty() %><%} %> size="10px" style="width:50px;"></td>
						<td  class="event" style="width: 48px; cursor: pointer; color: #5F0080; text-align: center;" onMouseOver="this.style.backgroundColor='#EFF8FB';" onMouseOut="this.style.backgroundColor=''"
					onclick="location.href='DeleteSuggestServiceCon?stock_num=<%=suggest_list.get(i).getProduct_num()%>'"><b>x</b></td>						
					</tr>
		
				<%} %>
				
            </table>
            
        	</div>	
        	<button  class="submitbutton" style="margin-right: 50%; margin-top: 50px;">����</button>	
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