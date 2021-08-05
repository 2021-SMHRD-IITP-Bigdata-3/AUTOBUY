<%@page import="auto.model.StockDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="auto.model.StockDAO"%>
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
	

.inputbutton:hover{
	background : white;
	border : 1px solid #5F04B4;
	color : black;
}


@font-face{
	src: url("../assest/fonts/Cocogoose Pro Light-trial.ttf");
    font-family: "Cocogoose"; 
 }
 #topmenu a:hover {
	text-decoration: underline;
}
#topmenu td{
	width: 100px;
	text-align: center;
}
</style>
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
		stock_list = stock_dao.showStock(info.getCustomer_id());
	%>

	<div class="container" >
		<div class="header">
			<div class="title"><a href="Main.jsp?after"><p style="color: black; font-family:Cocogoose">AUTOBUY</p></a></div>
			
			<%if(info != null){%>
				<div style="margin-left: 860px; margin-top: 20px">
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
					<td class="select" onclick="location.href='Limit.jsp'" style="background-color: #5F04B4; color: white;">&emsp;&emsp;&nbsp;����</td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='Product_reg.jsp'">&emsp;&emsp;&nbsp;����</td>
				</tr>
			</table>
		</div>
		<div class="content">
			<div class="small_title"><p>����</p></div>
			<div class="board">
				<table class="list_board">
					<tr style="text-align: center; font-weight: bold; font-size: 18px">
						<td>����</td>
						<td>��ǰ��</td>
						<td>�ŷ�ó</td>
						<td>���</td>
						<td>���� ���</td>
						<td>�ּ� ���</td>
					</tr>
					<tr>
		            <%for(int i = 0; i<stock_list.size();i++){ %>
						<tr style="font-size: 17px;">
							<td>����</td>
							<td><%=stock_list.get(i).getProduct_name() %></td>
							<td><%=stock_list.get(i).getSupplier_name() %></td>
							<td><%=stock_list.get(i).getStock_qntty() %></td>
							<td><%=stock_list.get(i).getStandard_qntty() %></td>	
							<td><%=stock_list.get(i).getMinimum_qntty() %></td>
						</tr>
					<%} %>		
				
					
			 </table>
			</div>
			<button type="button" onclick="location.href='LimitModify.jsp'" class="submitbutton" style="margin-right: 500px">����</button>
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