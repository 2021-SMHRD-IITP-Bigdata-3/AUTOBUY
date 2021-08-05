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
			System.out.println("성공");

		}else{
			System.out.println("실패");			
		}
	
	%>
	<div class="container" >
		<div class="header">
			<div class="title"><p>AUTOBUY</p></div>
			<%if(info != null){%>
				<div class="store_name">
					<h4><%= info.getCustomer_id() %>님<h4>
				</div>
			<%} %>
			<div class="logout"><a href="LogoutServiceCon">로그아웃</a></div>
			<div class="mypage"><a href="Update.jsp"><img src="img/mypage.png" height="40px" width="40px"></a></div>		
		</div>
		<div class="list">
			<div class=""><p><a href="Main_Sup.jsp">출고</a></p></div>
			<div class=""><p><a href="Cus_management.jsp">고객관리</a></p></div>
			<div class=""><p><a href="SupProductShow.jsp">제품목록</a></p></div>
		</div>
		<div class="content">
			<div class="small_title"><p>고객 관리</p></div>
			<div class="board">
				<table class="list_board">
					<tr>
						<td>이름</td>
						<td>전화번호</td>
						<td>이메일</td>
						<td>주소</td>
					</tr>
					<%for(int i=0;i<member_list.size();i++){
						if(member_list.get(i).getCustomer_type().equals("점포점주")){						
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
			<div class="company">주)오도바이절<br>
								대표 : 송김정정 / 사업자 등록 번호 : 000-00-00000<br>
								광주광역시 남구 송암로60 광주CGI센터</div>
		</div>
	</div>

</body>
</html>