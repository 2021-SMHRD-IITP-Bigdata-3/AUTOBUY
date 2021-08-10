<%@page import="auto.model.OrderDetailDAO"%>
<%@page import="auto.model.OrderDetailDTO"%>
<%@page import="auto.model.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="auto.model.OrderDAO"%>
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
		
		OrderDAO dao = new OrderDAO();
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		list = dao.showOrderSup(info.getStore_name());
		
		ArrayList<OrderDetailDTO> dto = null;
		OrderDetailDAO orderdetail_dao = new OrderDetailDAO();
	%>
	<div class="container" >
	<div class="container_line"></div>
		<div class="header">
			<div class="title"><p><a href="Main_Sup.jsp" id="auto"><b><b>AUTO</b></b></a><a href="Main_Sup.jsp" id="buy">BUY</a></p></div>
			
			<%if(info != null){%>
				<div style="margin-left: 49%; margin-top: 20px">
				 <table id="topmenu">
					<tr>
						<td ><a href="Update.jsp">마이페이지</a></td>		
						<td ><a href="Incoming.jsp">주문배송</a></td>		
						<td ><a href="Product_reg.jsp">장바구니</a></td>
						<td ><a href="Update.jsp">고객센터</a></td>
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
					<td class="select" onclick="location.href='Main_Sup.jsp'" style="background-color: #5F0080; color: white;"> &emsp;&emsp;&nbsp;출고</td>
				</tr>
				<tr >
					<td class="select" onclick="location.href='Cus_management.jsp'">&emsp;&emsp;&nbsp;고객관리</td>
				</tr>
				<tr>
					<td class="select" onclick="location.href='SupProductShow.jsp'">&emsp;&emsp;&nbsp;제품목록</td>
				</tr>
				</table>
		</div>
		<div class="content">
			<div class="small_title"><p>출고</p></div>
				<div id="search" style="margin-left:100px; margin-top:10px;">
				<input id="searchInput" type="text" placeholder="검색어입력">
				<button>검색</button>
			</div>
			<div class="sup" style="margin-left:330px; margin-top:33px; font-size:18px; float:left;"><b>거래처</b>
					<select name="sub_search" class="sub_search" style="width:150px; height:25px; margin-left:20px;" >
						<option value="선택">선택</option>
				    	<option value="언즈유통">언즈유통</option>
				   		<option value="니니언즈유통">니니언즈유통</option>
		 			</select>
		 	</div>
		 	<div class="term"  style="margin-left:100px;  margin-top:35px; font-size:18px; float:left;"><b>기간별</b>  </div>                   
		 		<div style="float:left; margin-left:50px; margin-top:36px;">시작일 : <input type="date" value="start" min="yyy" max="zzz"></div>
		 		
		 		<div style="float:left; margin-left:50px; margin-top:36px;">종료일 : <input type="date" value="end" min="yyy" max="zzz"></div>
		 	
			<div class="board">
				<table id="show" style="margin:auto; width : 1400px; margin-top:50px;">

					<tr  style ="text-align: center; width: 400px; font-size: 18px;">
						<td><b>주문번호</b></td>
						<td><b>카페상호</b></td>
						<td><b>발주일</b></td>
						<td><b>출고현황</b><br><div style="font-size:13px;">(납품 예정/확인/완료)</div></td>
						<td><b>주문상세</b></td>
					</tr>
					<%for(int i = 0; i<list.size();i++){ %>
					<tr style="height: 40px; text-align: center; width: 400px; font-size: 17px;" onMouseOver="this.style.backgroundColor='#EFF8FB';" onMouseOut="this.style.backgroundColor=''">
						<td style = "width: 15%"><%=list.get(i).getOrder_num()%></td>
						<td style = "width: 25%"><%=list.get(i).getCustomer_store_name()%></td>
						<td style = "width: 20%"><%=list.get(i).getOrder_date()%></td>
						<td style = "width: 20%">
						<% dto = orderdetail_dao.showOrderDetail(list.get(i).getOrder_num_s());
							dto = orderdetail_dao.showOrderDetail_s(list.get(i).getOrder_num_s(), info.getStore_name());
								int Reccnt = 0;
								int Forcnt = 0;
								for(int j=0; j<dto.size(); j++){
									if(dto.get(j).getReceipt_date()==null){
										Reccnt++;
									}
									if(dto.get(j).getForwarding_date()==null){
										Forcnt++;
									}
								}
								Reccnt = dto.size() - Reccnt; 
								Forcnt = dto.size() - Forcnt; 
								
								if(Forcnt == 0){%>
								<div class="Delivery_status">납품예정</div> 							
								<%}else if(Reccnt == dto.size()){%>
									<div class="Delivery_status">납품완료</div> 							
								<%}else {%>
								<div class="Delivery_status">납품시작</div> 							
								<%}%>
						</td>
						<td><a href="OrderDetailServiceCon?order_num=<%=list.get(i).getOrder_num_s()%>"><input type="button" value ="주문상세"></a></td>	
					</tr>
					<%} %>					
			 </table>
			</div>
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