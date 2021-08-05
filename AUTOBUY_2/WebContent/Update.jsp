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
		<form action="UpdateServiceCon" method="post">
		<p>대표자명</p><div class="login-input-wrap1">
				<%if(info != null){%>
						<h4><%= info.getCeo() %><h4>
				<%} %></div>
		<p>닉네임</p><div class="login-input-wrap1">
				<%if(info != null){%>
						<h4><%= info.getCustomer_id() %><h4>
	
				<%} %>
				</div>
		<p>비밀번호</p><div class="login-input-wrap1">
				<%if(info != null){%>
						<h4><%= info.getCustomer_pw() %><h4>
				<%} %>	
				</div>
				
		<p>이메일</p><div class="login-input-wrap1">
				<%if(info != null){%>
						<h4><%= info.getEmail() %><h4>
				<%} %>
				</div>
		<p>상호명</p><div class="login-input-wrap1">
				<%if(info != null){%>
						<h4><%= info.getStore_name() %><h4>
				<%} %>
				</div>
		<p>사업자 등록번호</p><div class="login-input-wrap1">
				<%if(info != null){%>
						<h4><%= info.getCustomer_regist_number() %><h4>
				<%} %>
				</div>
		<p>주소</p><div class="login-input-wrap1">
				<%if(info != null){%>
						<h4><%= info.getAddress() %><h4>
				<%} %>
				</div>
		<p>전화번호</p><div class="login-input-wrap1">
				<%if(info != null){%>
						<h4><%= info.getTel() %><h4>
				<%} %>
				</div>
		<p>결제 방식</p><div class="login-input-wrap1">		
		 		<%if(info != null){%>
						<h4><%= info.getPayment() %><h4>
				<%} %>
				</div>
		 		<br><br>
		 		<div class="login-button-wrap">
		 	<button><a href="Update_change.jsp" style="color:white">수정</a></button>
		 	</div>
		 	<br><br><br>
		 	<div class="login-button-wrap">
		 	<button><a href="Main.jsp" style="color:white">수정 완료</a></button>
		 	</div>
		</form>
		</div>
	</div>
</div>
</body>
</html>