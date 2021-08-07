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
	<link rel="stylesheet" href="assest/css/Main_Sup.css">
</head>
<body> 
	<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
	
		ArrayList<OrderDetailDTO> dto = null;
		OrderDetailDAO orderdetail_dao = new OrderDetailDAO();
			
		OrderDAO dao = new OrderDAO();
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		list = dao.showOrderSup(info.getStore_name());		
	%>
	<div class="container" >
		<div class="header">

			<div class="title"><p><a href="Main_Sup.jsp" id="auto"><b><b>AUTO</b></b></a><a href="Main_Sup.jsp" id="buy">BUY</a></p></div>
			
			<%if(info != null){%>
				<div class="store_name">
					<h4><%= info.getCustomer_id() %>님<h4>
				</div>
			<%} %>
			<div class="logout"><a href="LogoutServiceCon">로그아웃</a></div>
			<div class="mypage"><a href="Update.jsp"><img src="img/mypage.png" height="40px" width="40px"></a></div>		
		</div>
		<div class="list">
			<div class=""><p><a href="Main_Sup.jsp">출고</a></p></div>
			<div class=""><p><a href="Cus_management.jsp">고객관리</a></p></div>
			<div class=""><p><a href="SupProductShow.jsp">제품목록</a></p></div>
		</div>
		<div class="content">
			<div class="small_title"><p>출고</p></div>
				<form><div class="search"><img src="img/search.png" height="35px" width="35px" >   <input type="text" name="Searching"> <input type="submit" value="검색"></div></form>
			<div class="sup">거래처
					<select name="sub_search" class="sub_search" >
						<option value="선택">선택</option>
				    	<option value="언즈유통">언즈유통</option>
				   		<option value="니니언즈유통">니니언즈유통</option>
		 			</select>
		 	</div>
		 	<div class="term">기간별                     
		 		시작일 : <input type="date" value="start" min="yyy" max="zzz">
		 		
		 		종료일 : <input type="date" value="end" min="yyy" max="zzz">
		 	</div>
			<div class="board">
				<table class="list_board">
					<tr>
						<td>주문번호</td>
						<td>카페상호</td>
						<td>발주일</td>
						<td>출고현황<br><p class="small">(납품 예정/시작/완료)</p></td>				
						<td>주문상세</td>
					</tr>
					<%for(int i = 0; i<list.size();i++){ %>
					<tr>
						<td style = "width: 15%"><%=list.get(i).getOrder_num_s()%></td>
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