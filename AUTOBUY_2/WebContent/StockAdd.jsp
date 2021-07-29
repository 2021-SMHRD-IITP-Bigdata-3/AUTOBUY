<%@page import="auto.model.StockDAO"%>
<%@page import="auto.model.StockDTO"%>
<%@page import="auto.model.ProductDTO"%>
<%@page import="auto.model.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
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
<body>
	<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
	
	
		ProductDAO product_dao = new ProductDAO();
		String won = "원";

		ArrayList<ProductDTO> product_list = new ArrayList<ProductDTO>();
		product_list = product_dao.showProduct();	
		
		
		StockDAO stock_dao = new StockDAO();		
		ArrayList<StockDTO> stock_list = new ArrayList<StockDTO>();
		stock_list = stock_dao.showStock();
		
		if(product_list!=null){
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
			<div class="mypage"><a href="Update.jsp"><img src="../img/mypage.png" height="40px" width="40px"></a></div>			
		</div>
		<div class="list">
			<div class="list_1 list_common"><p><a href="Main.jsp">제품목록</a></p></div>
			<div class="list_2 list_common"><p><a href="Incoming.jsp">입고</a></p></div>
			<div class="list_3 list_common"><p><a href="Outgoing.jsp">출고</a></p></div>
			<div class="list_4 list_common"><p><a href="Shelf_life.jsp">유통기한 관리</a></p></div>
			<div class="list_5 list_common"><p><a href="Sup_con.jsp">거래처 관리</a></p></div>
			<div class="list_6 list_common"><p><a href="Data.jsp">대시보드</a></p></div>
			<div class="list_7 list_common"><p><a href="Limit.jsp">조정</a></p></div>
			<div class="list_8 list_common"><p><a href="Product_reg.jsp">수동 발주</a></p></div>
		</div>
		<div class="content">
			<div class="small_title"><p>제품목록 > 제품등록</p></div>
			<div class="board">
           		<table class="list_board">
					<tr>
						<td>제품명</td>
						<td>가격</td>
						<td>거래처</td>
						<td>등록</td>
					</tr>
					<%for(int i = 0; i<product_list.size();i++){ %>
					<tr>
						<td width = ""><%=product_list.get(i).getProduct_name() %></td>
						<td><%=product_list.get(i).getProduct_price() %><%=won %></td>
						<td><%=product_list.get(i).getSupplier_name() %></td>
						<td><a href="RegistOneProductServiceCon?product_num=<%=product_list.get(i).getProduct_num()%>"><input type="button" value ="등록"></a></td>
					</tr>
					<%} %>
			
				</table>
			
			</div>
			<form action="RegistProductQnttyServiceCon" method="post">
			<div class="board2">
			
            <table class="list_board2">
               <tr>
                  <td>제품명</td>
                  <td>거래처</td>
                  <td>수량</td>
                  <td>삭제</td>
               </tr>
 			   
               <%for(int i = 0; i<stock_list.size();i++){ %>
					<tr>
						<td><%=stock_list.get(i).getProduct_name() %></td>
						<td><%=stock_list.get(i).getSupplier_name() %></td>
						<td><input type="number"  name = "stock_qntty" min="0" value="0" size="10px" style="width:50px;"></td>
						<td><a href="DeleteOneStockServiceCon?stock_num=<%=stock_list.get(i).getProduct_num()%>"><input type="button" value ="삭제"></a></td>				
					</tr>
				<%} %>	
            </table>
            
        	</div>		
        	<div><input type="submit" value="등록완료" ></div>	
        	</form>
		</div>
		<div class ="footer">
			<div class="banner">AUTOBUY</div>
			<div class="company">주)오도바이절<br>
								대표 : 송김정정 | 사업자 등록 번호 : 000-00-00000<br>
								광주광역시 남구 송암로60 광주CGI센터</div>
		</div>
	

</body>

</body>
</html>