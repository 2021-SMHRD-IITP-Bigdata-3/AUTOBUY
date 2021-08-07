<%@page import="auto.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link rel="stylesheet" href="assest/css/Login.css">
</head>
<style>
a { text-decoration:none } 
body{
font-family: 'Spoqa Han Sans Neo', 'sans-serif'
}
</style>
<body>
<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
%>
<div class="main-container">
		<div class="main-wrap">
			<header>		
				<div class="logo-wrap">
					마이페이지
				</div>
			</header>
		<div class="login-input-section-wrap">

			<table style="line-height:50px;">
			
				<tr>
					<td><p style="border-right:1px solid lightgray; width:200px">대표자</p></td>
					<td>
							<%if(info != null){%>
									<%= info.getCeo() %>
							<%} %></td>
				</tr>
				<tr>
					<td><p style="border-right:1px solid lightgray; width:200px">닉네임</p></td>
					<td>
							<%if(info != null){%>
									<%= info.getNickName() %>
				
							<%} %>
					</td>
				</tr>
				<tr>
					<td><p style="border-right:1px solid lightgray; width:200px">비밀번호</p></td>
					<td>
							<%if(info != null){%>
									<%= info.getCustomer_pw() %>
							<%} %>	
					</td>
				</tr>
				<tr>		
					<td><p style="border-right:1px solid lightgray; width:200px">이메일</p></td>
					<td>
							<%if(info != null){%>
									<%= info.getEmail() %>
							<%} %>
					</td>
				</tr>
				<tr>
					<td><p style="border-right:1px solid lightgray; width:200px">상호명</p></td>
					<td>
							<%if(info != null){%>
									<%= info.getStore_name() %>
							<%} %>
					</td>
				</tr>
				<tr>
					<td><p style="border-right:1px solid lightgray; width:200px">사업자 등록번호</p></td>
					<td>
							<%if(info != null){%>
									<%= info.getCustomer_regist_number() %>
							<%} %>
					</td>
				</tr>
				<tr>
					<td><p style="border-right:1px solid lightgray; width:200px">주소</p></td>
					<td>
							<%if(info != null){%>
									<%= info.getAddress() %>
							<%} %>
					</td>
				</tr>
				<tr>
					<td><p style="border-right:1px solid lightgray; width:200px">전화번호</p></td>
					<td>
							<%if(info != null){%>
									<%= info.getTel() %>
							<%} %>
					</td>
				</tr>
				<tr>
					<td><p style="border-right:1px solid lightgray; width:200px">결제방식</p></td>
					<td>
					 		<%if(info != null){%>
									<%= info.getPayment() %>
							<%} %>
					</td>
				</tr>
				</table>
		 		<br><br>
		 		<div class="login-button-wrap1">
				<button><a href="Update_change.jsp" style="color:white">수정</a></button>
		 		</div>
			</div>
		</div>
	</div>

</body>
</html>