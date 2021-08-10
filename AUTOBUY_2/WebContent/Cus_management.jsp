<%@page import="java.util.ArrayList"%>
<%@page import="auto.model.MemberDAO"%>
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
	<div class="container_line"></div>
		<div class="header">
			<div class="title"><p><a href="Main_Sup.jsp" id="auto"><b><b>AUTO</b></b></a><a href="Main_Sup.jsp" id="buy">BUY</a></p></div>
			
			<%if(info != null){%>
<<<<<<< HEAD
				<div style="margin-left: 49%; margin-top: 20px">
=======
				<div style="margin-left: 1130px; margin-top: 20px">
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/AUTOBUY.git
				
				 <table id="topmenu">
					<tr>
						<td ><a href="Update.jsp">마이페이지</a></td>		
						<td ><a href="#">고객센터</a></td>
						<td ><a href="LogoutServiceCon">로그아웃</a></td>				
					</tr>
				</table>
				
				</div>
			
			<%} %>			

		</div>
		<div class="list">
			<table id="menu">
				<tr>
					<td id="hello" onclick="location.href='Update.jsp'"><h3><%=info.getStore_name() %> 사장님<br>환영합니다!!</h3></td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='Main_Sup.jsp'" > &emsp;&emsp;&nbsp;출고</td>
				</tr>
				<tr >
					<td class="select" onclick="location.href='Cus_management.jsp'"style="background-color: #5F0080; color: white;">&emsp;&emsp;&nbsp;고객관리</td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='SupProductShow.jsp'">&emsp;&emsp;&nbsp;제품목록</td>
				</tr>
				
			</table>
		</div>
		<div class="content">
			<div class="small_title"><p>고객 관리</p></div>
			<div class="board">
				<table id="show" style="margin:auto; width : 1400px; margin-top:40px;">
					<tr style ="text-align: center; width: 400px; font-size: 18px;">
						<td><b>이름</b></td>
						<td><b>전화번호</b></td>
						<td><b>이메일</b></td>
						<td><b>주소</b></td>
					</tr>

					<%for(int i=0;i<member_list.size();i++){
						if(member_list.get(i).getCustomer_type().equals("점포점주")){						
						%>
					<tr style="height: 40px; text-align: center; width: 400px; font-size: 17px;" onMouseOver="this.style.backgroundColor='#EFF8FB';" onMouseOut="this.style.backgroundColor=''">
						<td><%=member_list.get(i).getStore_name() %></td>
						<td><%=member_list.get(i).getTel() %></td>
						<td><%=member_list.get(i).getEmail() %></td>
						<td><%=member_list.get(i).getAddress() %></td>			
					</tr>
					<% }
						} %>
		
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