<%@page import="auto.model.MemberDTO"%>
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
<head>
	<link rel="stylesheet" href="assest/css/StockAdd.css">
</head>
<body> 
	<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
	
	
		ProductDAO product_dao = new ProductDAO();
		String won = "원";

		ArrayList<ProductDTO> product_list = new ArrayList<ProductDTO>();
		product_list = product_dao.showProduct();	
		
		
		
		if(product_list!=null){
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
				<div style="margin-left: 1130px; margin-top: 20px">
				
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
					<td id="hello" onclick="location.href='Update.jsp'"><h3><%=info.getStore_name() %> 사장님<br>환영합니다</h3></td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='Main_Sup.jsp'" > &emsp;&emsp;&nbsp;출고</td>
				</tr>
				<tr >
					<td class="select" onclick="location.href='Cus_management.jsp'">&emsp;&emsp;&nbsp;고객관리</td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='SupProductShow.jsp'"style="background-color: #5F0080; color: white;">&emsp;&emsp;&nbsp;제품목록</td>
				</tr>
				
			</table>
		</div>
		<div class="content">
			<div class="small_title"><p>제품목록</p></div>
			<div class="board">
           		<table id="show" style="margin:auto; width : 1400px; margin-top:40px;">
					<tr  style ="text-align: center; width: 400px; font-size: 18px;">
						<td><b>제품명</b></td>
						<td><b>가격</b></td>
						<td><b>거래처</b></td>
					</tr>
					<%for(int i = 0; i<product_list.size();i++){ 
						if(info.getNickName().equals(product_list.get(i).getSupplier_name())){
						%>
					<tr style="height: 40px; text-align: center; width: 400px; font-size: 17px;" onMouseOver="this.style.backgroundColor='#EFF8FB';" onMouseOut="this.style.backgroundColor=''">
						<td style = "width: 40%"><%=product_list.get(i).getProduct_name() %></td>
						<td style = "width: 18%"><%=product_list.get(i).getProduct_price() %><%=won %></td>
						<td style = "width: 27%"><%=product_list.get(i).getSupplier_name() %></td>
					</tr>
						<%} 
					}%>
				</table>
				</div>
			<div><button type="button" class = "submitbutton" onclick="location.href='Sup_Product_reg.jsp'" style="margin-top: 20px; margin-right: 710px;">+등록/삭제</button></div>
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