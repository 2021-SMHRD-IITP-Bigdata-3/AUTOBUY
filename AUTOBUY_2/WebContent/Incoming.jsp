<%@page import="auto.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link rel="stylesheet" href="assest/css/Main.css">
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
					<h4><%= info.getCustomer_id() %>님<h4>
				</div>
			<%} %>					
			<div class="logout"><a href="LogoutServiceCon">로그아웃</a></div>
			<div class="mypage"><a href="Update.jsp"><img src="img/mypage.png" height="40px" width="40px"></a></div>			
		</div>
		<div class="list">
			<div class="small_list">
				<div class="main_p"><p><a href="Main.jsp"><img src="img/list_i.png" height="30px" width="30px">제품목록</a></p></div>
				<div class="incoming"><p><a href="Incoming.jsp"><img src="img/in.png" height="30px" width="30px">입고</a></p></div>
				<div class="outgoing"><p><a href="Outgoing.jsp"><img src="img/out.png" height="30px" width="30px">출고</a></p></div>
				<div class="shelf"><p><a href="Shelf_life.jsp"><img src="img/shelf.png" height="30px" width="30px">유통기한 관리</a></p></div>
				<div class="sup_con"><p><a href="Sup_con.jsp"><img src="img/sup.png" height="30px" width="30px">거래처 관리</a></p></div>
				<div class="data"><p><a href="Data.jsp"><img src="img/chart.png" height="30px" width="30px">대시보드</a></p></div>
				<div class="limit"><p><a href="Limit.jsp"><img src="img/li.png" height="30px" width="30px">조정</a></p></div>
				<div class="product"><p><a href="Product_reg.jsp"><img src="img/product.png" height="30px" width="30px">수동발주</a></p></div>
			</div>
		</div>
		<div class="content">
			<div class="small_title"><p>입고</p></div>
			<div class="board">
				<table class="list_board">
					<tr>
						<td>사진</td>
						<td>제품명</td>
						<td>재고량</td>
						<td>거래처</td>
					</tr>
					<tr>
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
			<div class="company">주)오도바이절<br>
								대표 : 송김정정 | 사업자 등록 번호 : 000-00-00000<br>
								광주광역시 남구 송암로60 광주CGI센터</div>
		</div>
	</div>

</body>
</html>