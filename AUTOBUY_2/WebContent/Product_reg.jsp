<%@page import="auto.model.CartDTO"%>
<%@page import="auto.model.OrderDAO"%>
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
	<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		String customer_id = info.getCustomer_id();
	
		ProductDAO product_dao = new ProductDAO();

		ArrayList<ProductDTO> product_list = new ArrayList<ProductDTO>();
		product_list = product_dao.showProduct();
		
		
		
		OrderDAO order_dao = new OrderDAO();		
		ArrayList<CartDTO> cart_list = order_dao.showCart(customer_id);		
		
		for(int i=0; i<product_list.size(); i++){
			for(int j=0; j<cart_list.size(); j++){
				if(product_list.get(i).getProduct_num()==cart_list.get(j).getProduct_num()){
					product_list.remove(i);
					i=0;
				}
			}
		}
	%>

	<div class="container" >
		<div class="header">
			<div class="title"><p><a href="Main.jsp" id="auto"><b><b>AUTO</b></b></a><a href="Main.jsp" id="buy">BUY</a></p></div>
			
			<%if(info != null){%>
				<div style="margin-left: 1270px; margin-top: 20px">
				<table id="topmenu">
					<tr>
						<td style="font-size: 18px; font-family: 'Spoqa Han Sans Neo', 'sans-serif';"><a href="Update.jsp">마이페이지</a></td>		
						<td style="font-size: 18px; font-family: 'Spoqa Han Sans Neo', 'sans-serif'; border-left : 1px solid lightgray;"><a href="Incoming.jsp">주문배송</a></td>		
						<td style="font-size: 18px; font-family: 'Spoqa Han Sans Neo', 'sans-serif'; border-left : 1px solid lightgray;"><a href="Product_reg.jsp">장바구니</a></td>
						<td style="font-size: 18px; font-family: 'Spoqa Han Sans Neo', 'sans-serif'; border-left : 1px solid lightgray;"><a href="Update.jsp">고객센터</a></td>
						<td style="font-size: 18px; font-family: 'Spoqa Han Sans Neo', 'sans-serif'; border-left : 1px solid lightgray;"><a href="LogoutServiceCon">로그아웃</a></td>				
					</tr>
				</table>
				</div>
			
			<%} %>				
		</div>
		<div class="list">
			<table id="menu">
				<tr>
					<td id="hello" onclick="location.href='Update.jsp'"><h3><%=info.getStore_name() %>카페 사장님<br>환영합니다!!</h3></td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='Main.jsp'" > &emsp;&emsp;&nbsp;재고목록</td>
				</tr>
				<tr >
					<td class="select" onclick="location.href='Incoming.jsp'">&emsp;&emsp;&nbsp;입고</td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='Outgoing.jsp'">&emsp;&emsp;&nbsp;출고</td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='Shelf_life.jsp'">&emsp;&emsp;&nbsp;유통기한</td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='Sup_con.jsp'">&emsp;&emsp;&nbsp;거래처</td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='Data.jsp'">&emsp;&emsp;&nbsp;대시보드</td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='Limit.jsp'">&emsp;&emsp;&nbsp;조정</td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='Product_reg.jsp'" style="background-color: #5F04B4; color: white;">&emsp;&emsp;&nbsp;발주</td>
				</tr>
			</table>
		</div>
		<div class="content">
			<div class="small_title"><p>상품주문</p>
			<div id="search">
				<input id="searchInput" type="text" placeholder="검색어입력">
				<button>검색</button>
			</div>
			</div>
			
				<div id="board1" style="float: left;">
				<div style="width:930px; height:800px; overflow:auto">
           		<table id="show" style="margin-top:60px; margin-left: 100px;">
					<tr style="text-align: center; width: 400px; font-size:18px;">
						<td style="whidth:15%; "><b>사진</b></td>
						<td style="width: 37%"><b>제품명</b></td>
						<td style = "width: 15%"><b>가격</b></td>
						<td style = "width: 25%"><b>거래처</b></td>
						<td style = "width:8%"><b></b></td>
					</tr>
					<%for(int i = 0; i<product_list.size();i++){ %>
					<tr id = "data" class="event" style="height: 40px; width: 600px; cursor: pointer; font-size: 17px;" onMouseOver="this.style.backgroundColor='#EFF8FB';" onMouseOut="this.style.backgroundColor=''"
					onclick="location.href='CartServiceCon?product_num=<%=product_list.get(i).getProduct_num()%>'">
						<td style="whidth:15%; ">사진</td>		
						<td style = "width:37%"><%=product_list.get(i).getProduct_name() %></td>
						<td style = "width:15%; text-align: center;"><%=product_list.get(i).getProduct_price() %>원</td>
						<td style = "width:25%; text-align: center;"><%=product_list.get(i).getSupplier_name() %></td>
						<td style = "width: 8%; color: #5F04B4; text-align: center;" > <b>></b></td>
					</tr>
					<%} %>

				</table>
				</div>                                                                                                                      
				
			</div>
			<form action="ManualOrderServiceCon" method="post">
			<div class="board2">
			
            <table id="show" style="margin-left: 20px">
               <tr style="text-align: center; width: 400px; font-size:18px;">
               	  <td style="width: 15%"><b>사진</b></td>
                  <td style="width: 37%"><b>제품명</b></td>
                  <td style = "width: 25%;"><b>거래처</b></td>
                  <td style = "width: 15%;"><b>수량</b></td>
                  <td style = "width: 8%"><b></b></td>
               </tr>
 			   
               <%for(int i=0; i<cart_list.size(); i++){ %>
					<tr id = "data" style="font-size:17px;  height: 40px; width: 600px; ">
					    <td style="width: 15%">사진</td>
						<td style="width: 37%"><%=cart_list.get(i).getProduct_name() %></td>
						<td style = "width: 25%;"><%=cart_list.get(i).getSupplier_name() %></td>
						<td style = "width: 15%; text-align: center;"><input type="number"  name = "order_qntty" min="0" value=0 size="10px" style="width:50px;"></td>
						<td class="event" style="width: 8%; color: #5F04B4; text-align: center; cursor: pointer;" onMouseOver="this.style.backgroundColor='#EFF8FB';" onMouseOut="this.style.backgroundColor=''"
					onclick="location.href='CartDeleteServiceCon?product_num=<%=cart_list.get(i).getProduct_num()%>'"><b>x</b></td>
					</tr>
				<%} %>
				
				
            </table>
            
        	</div>	
        	
        	<button  class="submitbutton" style="margin-right: 1040px; margin-top: 20px;">발주</button>
        	</form>
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