<%@page import="java.util.ArrayList"%>
<%@page import="auto.model.MemberDTO"%>
<%@page import="auto.model.MemberDAO"%>
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
	
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberDTO> member_list = new ArrayList<MemberDTO>();
		member_list = dao.showMember();	
		
		System.out.println(member_list.size());
		
		for(int i=0; i<member_list.size(); i++){
			System.out.println(member_list.get(i).getCustomer_type());
		}
		
		if(member_list!=null){
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
			<div class=""><p><a href="SupProductShow.jsp">��ǰ���</a></p></div>
		</div>
		<div class="content">
			<div class="small_title"><p>�� ����</p></div>
			<div class="board">
				<table class="list_board">
					<tr>
						<td>�̸�</td>
						<td>��ȭ��ȣ</td>
						<td>�̸���</td>
						<td>�ּ�</td>
					</tr>
					<%for(int i=0;i<member_list.size();i++){
						if(member_list.get(i).getCustomer_type().equals("��������")){						
						%>
					<tr>
						<td><%=member_list.get(i).getStore_name() %></td>
						<td><%=member_list.get(i).getTel() %></td>
						<td><%=member_list.get(i).getEmail() %></td>
						<td><%=member_list.get(i).getAddress() %></td>			
					</tr>
					<% } } %>		
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