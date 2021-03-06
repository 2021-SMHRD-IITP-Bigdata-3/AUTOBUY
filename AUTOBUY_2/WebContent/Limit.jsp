<%@page import="auto.model.StockDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="auto.model.StockDAO"%>
<%@page import="auto.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link rel="stylesheet" href="assest/css/StockAdd.css">
</head>
<body>
	<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
	
		StockDAO stock_dao = new StockDAO();		
		ArrayList<StockDTO> stock_list = new ArrayList<StockDTO>();
		stock_list = stock_dao.showStock(info.getCustomer_id());
	%>

	<div class="container" >
	<div class="container_line"></div>
		<div class="header">
			<div class="title"><p><a href="Main.jsp" id="auto"><b><b>AUTO</b></b></a><a href="Main.jsp" id="buy">BUY</a></p></div>
			<%if(info != null){%>
				<div style="margin-left: 49%; margin-top: 20px">
					 <table id="topmenu">
					<tr>
						<td ><a href="Update.jsp">마이페이지</a></td>		
						<td ><a href="Incoming.jsp">주문배송</a></td>		
						<td ><a href="Product_reg.jsp">장바구니</a></td>
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
						<td id="hello" onclick="location.href='Update.jsp'"><h3><%=info.getStore_name() %>카페 사장님<br>환영합니다.</h3></td>
					</tr>
					<tr>
						<td class="select" onclick="location.href='Main.jsp'"> &emsp;&emsp;&nbsp;제품 목록</td>
					</tr>
					<tr >
						<td class="select" onclick="location.href='Incoming.jsp'" >&emsp;&emsp;&nbsp;입고</td>
					</tr>
					<tr>
						<td class="select" onclick="location.href='Outgoing.jsp'" >&emsp;&emsp;&nbsp;출고</td>
					</tr>
					<tr>
						<td class="select" onclick="location.href='Shelf_life.jsp'" >&emsp;&emsp;&nbsp;유통기한 관리</td>
					</tr>
					<tr>
						<td class="select" onclick="location.href='Sup_con.jsp'" >&emsp;&emsp;&nbsp;거래처 관리</td>
					</tr>
					<tr>
						<td class="select" onclick="location.href='Data.jsp'" >&emsp;&emsp;&nbsp;대시보드</td>
					</tr>
					<tr>
						<td class="select" onclick="location.href='Limit.jsp'" style="background-color: #5F0080; color: white;">&emsp;&emsp;&nbsp;조정</td>
					</tr>
					<tr>
						<td class="select" onclick="location.href='Product_reg.jsp'">&emsp;&emsp;&nbsp;발주</td>
				</tr>
			</table>
		</div>
		<form action="ModifyLimitQnttyServiceCon" method="post">
		<div class="content">
			<div class="small_title"><p>조정</p></div>
			<div class="board">
				<table id="show" style="margin:auto; width : 1300px; margin-top:40px;">
						<tr  style ="text-align: center; width: 400px; font-size: 18px; ">
							<td style ="width: 15% "><b>사진</b></td>
							<td style ="width: 30%;"><b>제품명</b></td>
							<td style ="width: 25% "><b>거래처</b></td>
							<td style ="width: 10% "><b>재고량</b></td>
							<td style ="width: 10% "><b>기준 재고량</b></td>
							<td style ="width: 10% "><b>최소 재고량</b></td>
						</tr>
					<tr>
		            <%for(int i = 0; i<stock_list.size();i++){ %>
						<tr style="text-align: center;">
							<tr style="height: 40px; text-align: center; width: 400px; font-size: 17px;" onMouseOver="this.style.backgroundColor='#EFF8FB';" onMouseOut="this.style.backgroundColor=''">
								<td style="text-align: center;"><img src="img/<%=stock_list.get(i).getProduct_pic()%>"></td>	
								<td style="text-align: left"><%=stock_list.get(i).getProduct_name() %></td>
								<td><%=stock_list.get(i).getSupplier_name() %></td>
								<td><%=stock_list.get(i).getStock_qntty() %></td>
								<td><%=stock_list.get(i).getStandard_qntty() %></td>	
								<td><%=stock_list.get(i).getMinimum_qntty() %></td>
						</tr>
					<%} %>
					
					
			 </table>
			</div>
			<button type="button" onclick="location.href='LimitModify.jsp'" class="submitbutton" style="margin-right: 45.5%; margin-top: 20px;">수정</button>
			</div>
					
		</form>
		</div>
		<div class ="footer">
			<div class="banner">AUTOBUY</div>
			<div class="company">주)오도바이절<br>
								대표 : 송김정정 | 사업자 등록 번호 : 000-00-00000<br>
								광주광역시 남구 송암로60 광주CGI센터</div>
		</div>


</body>
</html>