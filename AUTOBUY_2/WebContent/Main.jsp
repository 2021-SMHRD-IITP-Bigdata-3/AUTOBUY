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
		ArrayList<StockDTO> stock_list = new ArrayList<StockDTO>();
		stock_list = stock_dao.showStock(info.getCustomer_id());
			
	%>

	<div class="container" >
		<div class="header">
			<div class="title"><p><a href="Main.jsp" id="auto"><b><b>AUTO</b></b></a><a href="Main.jsp" id="buy">BUY</a></p></div>
			
			<%if(info != null){%>
				<div style="margin-left: 1270px; margin-top: 20px">
				<table id="topmenu">
					<tr>
						<td style="font-size: 18px; font-family: 'Spoqa Han Sans Neo', 'sans-serif';"><a href="Update.jsp">����������</a></td>		
						<td style="font-size: 18px; font-family: 'Spoqa Han Sans Neo', 'sans-serif'; border-left : 1px solid lightgray;"><a href="Incoming.jsp">�ֹ����</a></td>		
						<td style="font-size: 18px; font-family: 'Spoqa Han Sans Neo', 'sans-serif'; border-left : 1px solid lightgray;"><a href="Product_reg.jsp">��ٱ���</a></td>
						<td style="font-size: 18px; font-family: 'Spoqa Han Sans Neo', 'sans-serif'; border-left : 1px solid lightgray;"><a href="Update.jsp">������</a></td>
						<td style="font-size: 18px; font-family: 'Spoqa Han Sans Neo', 'sans-serif'; border-left : 1px solid lightgray;"><a href="LogoutServiceCon">�α׾ƿ�</a></td>				
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
			<div class="small_title"><p>��ǰ���</p></div>
			<div class="board">
				<table id="show" style="margin:auto; width : 1300px; margin-top:100px;">
					<tr  style ="text-align: center; width: 400px; font-size: 18px;">
						<td><b>����</b></td>
						<td><b>��ǰ��</b></td>
						<td><b>���</b></td>
						<td><b>��� ����<b></b></td>
						<td><b>�ŷ�ó</b></td>
					</tr>
					<%for(int i = 0; i<stock_list.size();i++){ %>
						<tr style="height: 40px; text-align: center; width: 400px; font-size: 17px;" onMouseOver="this.style.backgroundColor='#EFF8FB';" onMouseOut="this.style.backgroundColor=''">
							<td>����</td>
							<td style="text-align: left;"><%=stock_list.get(i).getProduct_name() %></td>
							<td><%=stock_list.get(i).getStock_qntty() %></td>
							<td><% double stock_qntty = Integer.valueOf(stock_list.get(i).getStock_qntty()); 
								   double standard_qntty = Integer.valueOf(stock_list.get(i).getStandard_qntty());
								   double ratio = stock_qntty/standard_qntty * 100;
								   if(standard_qntty == 0){%>
										 - 
								   <%}else {%>								   								  
								<%= Math.round(ratio) %>%
								<%} %>
							</td>
							<td><%=stock_list.get(i).getSupplier_name() %></td>
						</tr>
					<%} %>	
			 </table>
			</div>
			<div><button type="button" class = "submitbutton" onclick="location.href='StockAdd.jsp'" style="margin-top: 20px; margin-right: 940px;">+���/����</button></div>
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