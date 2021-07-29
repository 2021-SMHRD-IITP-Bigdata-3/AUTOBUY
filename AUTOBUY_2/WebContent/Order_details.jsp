<%@page import="auto.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link rel="stylesheet" href="assest/css/Order_details.css">
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
			<div class=""><p><a href="Main_Sup.jsp"><img src="img/out.png" height="30px" width="30px">출고</a></p></div>
			<div class=""><p><a href="#"><img src="img/sup.png" height="30px" width="30px">고객관리</a></p></div>
			<div class=""><p><a href="#"><img src="img/product.png" height="40px" width="40px">제품 등록</a></p></div>
		</div>
		<div class="content">
			<div class="small_title"><p> 출고 > 주문 상세</p></div>
			<div class="order_num">주문번호 </div>
			<div class="cafe_name">카페상호  </div>
			<div class="all_money">총 주문금액  </div>
			<div class="order_date">주문일자</div>
			<div class="Delivery_status">출고현황</div>
			
			<div class="board">
				<table class="list_board">
					<tr>
						<td>항목</td>
						<td>제품명</td>
						<td>수량</td>
						<td>가격</td>
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