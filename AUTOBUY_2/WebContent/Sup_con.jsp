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
	%>

	<div class="container" >
		<div class="header">
			<div class="title"><p><a href="Main.jsp" id="auto"><b><b>AUTO</b></b></a><a href="Main.jsp" id="buy">BUY</a></p></div>
			
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
						<td class="select" onclick="location.href='Main.jsp'"> &emsp;&emsp;&nbsp;�����</td>
					</tr>
					<tr >
						<td class="select" onclick="location.href='Incoming.jsp'" >&emsp;&emsp;&nbsp;�԰�</td>
					</tr>
					<tr>
						<td class="select" onclick="location.href='Outgoing.jsp'" >&emsp;&emsp;&nbsp;���</td>
					</tr>
					<tr>
						<td class="select" onclick="location.href='Shelf_life.jsp'" >&emsp;&emsp;&nbsp;�������</td>
					</tr>
					<tr>
						<td class="select" onclick="location.href='Sup_con.jsp'" style="background-color: #5F04B4; color: white;">&emsp;&emsp;&nbsp;�ŷ�ó</td>
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
			<div class="small_title"><p>�ŷ�ó ����</p></div>
			<div class="board">
				<table id="show">
					<tr  style ="text-align: center; width: 400px; font-size: 18px;">
						<td  style ="width: 25% "><b>�̸�</b></td>
						<td  style ="width: 25% "><b>��ȭ��ȣ</b></td>
						<td  style ="width: 25% "><b>�̸���</b></td>
						<td  style ="width: 25% "><b>�޸�</b></td>
					</tr>
					<tr style="text-align: center;">
							<tr style="height: 40px; text-align: center; width: 400px; font-size: 17px;" onMouseOver="this.style.backgroundColor='#EFF8FB';" onMouseOut="this.style.backgroundColor=''">
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>		
			 </table>
			</div>
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