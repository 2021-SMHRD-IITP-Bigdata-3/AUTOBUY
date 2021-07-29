<%@page import="auto.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="assest/css/Closing.css">
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
			<div class="small_title"><p>발주 목록</p></div>
			<div class="board">
				<table class="list_board">
					<tr>
						<td>번호</td>
						<td>제품</td>
						<td>거래처</td>
						<td>수량</td>
						<td>가격</td>
						<td>삭제</td>
						
					</tr>
					
					<tr>
						<td>1</td>
						<td>원두 900g</td>
						<td>니니언즈유통</td>
						<td><input type = "number"></td>
						<td>10000원</td>
						<td><a href = "#"><img src = "img/remove.png" width="30" height="30"></a></td>						
					</tr>
					<tr>
						<td>2</td>
						<td>원두 900g</td>
						<td>니니언즈유통</td>
						<td><input type = "number"></td>
						<td>10000원</td>
						<td><a href = "#"><img src = "img/remove.png" width="30" height="30"></a></td>						
					</tr>
					<tr>
						<td>3</td>
						<td>원두 900g</td>
						<td>니니언즈유통</td>
						<td><input type = "number"></td>
						<td>10000원</td>
						<td><a href = "#"><img src = "img/remove.png" width="30" height="30"></a></td>						
					</tr>
					<tr>
						<td colspan="4">총 주문 금액</td>
						<td colspan="2">10000원</td>
												
					</tr>
					<tr>
						<td></td>
						
						<td></td>
						<td><a href = "Product_reg.jsp"><img src = "img/add.png" width=90" height="50"></a></td> 
						<td><a href="Closing_end.jsp" onclick="window.open(this.href, '_blank', 'width=가로사이즈px,height=세로사이즈px,toolbars=no,scrollbars=no'); return false;"><img src = "img/order.png" width=90" height="50"></a></td>
											
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