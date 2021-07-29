<%@page import="auto.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link rel="stylesheet" href="assest/css/Update.css">
</head>
<body>
<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
%>
<div class="container">
	<div class="mypage_title">마이 페이지 </div>
	<form action="UpdateServiceCon" method="post">
	<p>대표자명</p><div class="CEO">
			<%if(info != null){%>
					<h4><%= info.getCeo() %><h4>
			<%} %></div>
	<p>닉네임</p><div class="nickname">
			<%if(info != null){%>
					<h4><%= info.getCustomer_id() %><h4>

			<%} %>
			</div>
	<p>비밀번호</p><div class="pw">
			<%if(info != null){%>
					<h4><%= info.getCustomer_pw() %><h4>
			<%} %>	
			</div>
			
	<p>이메일</p><div class="email">
			<%if(info != null){%>
					<h4><%= info.getEmail() %><h4>
			<%} %>
			</div>
	<p>상호명</p><div class="store_name">
			<%if(info != null){%>
					<h4><%= info.getStore_name() %><h4>
			<%} %>
			</div>
	<p>사업자 등록번호</p><div class="sup_num">
			<%if(info != null){%>
					<h4><%= info.getCustomer_regist_number() %><h4>
			<%} %>
			</div>
	<p>주소</p><div class="address">
			<%if(info != null){%>
					<h4><%= info.getAddress() %><h4>
			<%} %>
			</div>
	<p>전화번호</p><div class="tel"
			><%if(info != null){%>
					<h4><%= info.getTel() %><h4>
			<%} %>
			</div>
	<p>결제 방식</p>		
	 		<%if(info != null){%>
					<h4><%= info.getPayment() %><h4>
			<%} %>
	 		<br><br>
	 	<button><a href="Update_change.jsp">수정</a></button>
	 	<button><a href="Main.jsp">수정 완료</a></button>
	</form>
	
</div>
</body>
</html>