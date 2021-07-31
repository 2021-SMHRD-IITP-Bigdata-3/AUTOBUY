<%@page import="auto.model.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="auto.model.OrderDAO"%>
<%@page import="auto.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<head>
	<link rel="stylesheet" href="assest/css/Main_Sup.css">
</head>
<body> 
	<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		OrderDAO dao = new OrderDAO();
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		list = dao.showOrder();		
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
			<div class=""><p><a href="Sup_Product_reg.jsp">��ǰ ���</a></p></div>
		</div>
		<div class="content">
			<div class="small_title"><p>���</p></div>
				<form><div class="search"><img src="img/search.png" height="35px" width="35px" >   <input type="text" name="Searching"> <input type="submit" value="�˻�"></div></form>
			<div class="sup">�ŷ�ó
					<select name="sub_search" class="sub_search" >
						<option value="����">����</option>
				    	<option value="��������">��������</option>
				   		<option value="�ϴϾ�������">�ϴϾ�������</option>
		 			</select>
		 	</div>
		 	<div class="term">�Ⱓ��                     
		 		������ : <input type="date" value="start" min="yyy" max="zzz">
		 		
		 		������ : <input type="date" value="end" min="yyy" max="zzz">
		 	</div>
			<div class="board">
				<table class="list_board">
					<tr>
						<td>�ֹ���ȣ</td>
						<td>ī���ȣ</td>
						<td>������</td>
						<td>�����Ȳ<br><p class="small">(��ǰ ����/Ȯ��/�Ϸ�)</p></td>
						<td>�ֹ���</td>
					</tr>
					<%for(int i = 0; i<list.size();i++){ %>
					<tr>
						<td style = "width: 15%"><%=list.get(i).getOrder_num()%></td>
						<td style = "width: 25%"><%=list.get(i).getCustomer_store_name()%></td>
						<td style = "width: 20%"><%=list.get(i).getOrder_date()%></td>
						<td style = "width: 20%">��ǰ ����</td>
						<td><a href="OrderDetailServiceCon?order_num=<%=list.get(i).getOrder_num()%>"><input type="button" value ="�ֹ���"></a></td>	
					</tr>
					<%} %>					
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