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
			<div class="mypage"><a href="UpdateServiceCon">����������</a></div>			
		</div>
		<div class="list">
			<div class="list_1 list_common"><p><a href="Main_Sup.jsp">���</a></p></div>
			<div class="list_2 list_common"><p><a href="#">������</a></p></div>
			<div class="list_3 list_common"><p><a href="#">��ǰ ���</a></p></div>
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
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><button ><a href="Order_details.jsp">�ֹ���</a></button></td>
					</tr>		
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