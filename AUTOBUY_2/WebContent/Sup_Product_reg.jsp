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
	%>
	<div class="container" >
		<div class="container_line"></div>
		<div class="header">
			<div class="title"><p><a href="Main_Sup.jsp" id="auto"><b><b>AUTO</b></b></a><a href="Main_Sup.jsp" id="buy">BUY</a></p></div>
			
			<%if(info != null){%>
<<<<<<< HEAD
				<div style="margin-left: 49%; margin-top: 20px">
=======
				<div style="margin-left: 1140px; margin-top: 20px">
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/AUTOBUY.git
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
					<td id="hello" onclick="location.href='Update.jsp'"><h3><%=info.getStore_name() %> �����<br>ȯ���մϴ�!!</h3></td>
				</tr>
				<tr>
<<<<<<< HEAD
					<td class="select" onclick="location.href='Main_Sup.jsp'" > &emsp;&emsp;&nbsp;���</td>
=======
					<td class="select" onclick="location.href='Main_Sup.jsp'" style="background-color: #5F0080; color: white;"> &emsp;&emsp;&nbsp;���</td>
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/AUTOBUY.git
				</tr>
				<tr >
					<td class="select" onclick="location.href='Cus_management.jsp'">&emsp;&emsp;&nbsp;������</td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='SupProductShow.jsp'" style="background-color: #5F0080; color: white;">&emsp;&emsp;&nbsp;��ǰ���</td>
				</tr>
				</table>
		</div>
		<div class="content">
			<div class="small_title"><p>��ǰ ���</p></div>
			<form action="SupplierRegistOneProductServiceCon" method="post" enctype = "multipart/form-data">
			<div class="board">
				<table id="show" style="margin:auto; width : 1400px; margin-top:40px;">

					<tr  style ="text-align: center; width: 400px; font-size: 18px;">
						<td>��ǰ��</td>
						<td><input type="text" id="size" name="product_name"></td>
					</tr>
					<tr style="height: 40px; text-align: center; width: 400px; font-size: 17px;" onMouseOver="this.style.backgroundColor='#EFF8FB';" onMouseOut="this.style.backgroundColor=''">
						<td>��ǰ ����</td>
						<td><input type="text" id="size" name="product_price"></td>
					</tr>
					
					<tr style="height: 40px; text-align: center; width: 400px; font-size: 17px;" onMouseOver="this.style.backgroundColor='#EFF8FB';" onMouseOut="this.style.backgroundColor=''">
						<td>���� ���</td>
						<td><input type="text" id="size" name="product_qntty"></td>					
					</tr>
				
					<tr style="height: 40px; text-align: center; width: 400px; font-size: 17px;" onMouseOver="this.style.backgroundColor='#EFF8FB';" onMouseOut="this.style.backgroundColor=''">
						<td>����</td>
						<td><input type="file" name="product_pic" style="float:center;">
						<input type="hidden" name="supplier_name" value ="<%= info.getStore_name() %>" >
			 </table>
			 <div  style="margin-top: 40px;"><button type="button" class = "submitbutton" onclick="location.href='Sup_Product_reg.jsp'" style="margin-right:44%;">���</button>
				 <button type="submit" class="submitbutton"  value="�Է¿Ϸ�" style="margin-right: 10px;">�Է¿Ϸ�</button>
			 </div>

			</div>
			
			</form>
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