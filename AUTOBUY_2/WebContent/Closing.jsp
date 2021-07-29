<%@page import="auto.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	.container{
	border:1px solid black;
	width:1400px;
	}
	.header{
	float:left;
	width:1400px;
	height:84px;	
	border-bottom:1px solid black;
	}
	.title{
	width:25%;
	height:6%;
	}
	.header p{
	width:300px;
	height:64px;
	font-size:50px;
	color:blue;
	margin-left:30px;
	margin-top:5px;
	}
	.mypage{
	float:right;
	font-size:25px;
	margin-right:30px;
	margin-top:12px;
	}
	.logout{
	float:right;
	font-size:25px;
	margin-right:30px;
	margin-top:12px;
	}
	.store_name{
	float:right;
	font-size:25px;
	margin-right:30px;
	margin-top:12px;
	}
	.list{
	float:left;
	width:280px;
	height:1232px;
	border-right: 1px solid black;
	}
	.list_common{
	width:80%;
	height:8%;
	float:left;
	margin:21.5px;
	background-color: #bdf;
  	border:2px solid #1bf;
  	border-radius: 15px;
	}
	.list p {
   	width:180px;
   	margin:0 auto;
   	margin-top:25px;
   	text-align:center;
   	font-size:28px;
    }
	.content{
	float:left;
	width:1118px;
	height:1232px;
	}
	.small_title{
	border-bottom:1px solid black;
	height:64px;
   	font-size:28px;
   	margin-left:50px;
   	margin-right:50px;
	}
	.small_title p{
	width:500px;
	margin-right:30px;
	}
	.add{
	float:right;
	font-size:25px;
	margin-right:30px;
	margin-top:12px;
	}
	.footer{
	clear:both;
	width:1400px;
	height:84px;
	border-top: 1px solid black;
	}
	.banner {
	font-size:40px;
	width:15%;
	float:left;
	margin-top:12px;
	margin-left:35px;
	}
	.company{
	font-size:18px;
	width:50%;
	float:left;
	margin-top:3px;
	line-height:27px;
	}
	.list_board{
	float:top;
	width:1018px;
	text-align:center;
	font-size:25px;
	}
	.board{
	margin-top:50px;
	margin-left:50px;
   	margin-right:50px;
	}
	.button{
	border:0;
	outline::0;
	background-color: white;
	}
	</style>
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
			<div class="list_1 list_common"><p><a href="Main.jsp">제품목록</a></p></div>
			<div class="list_2 list_common"><p><a href="Incoming.jsp">입고</a></p></div>
			<div class="list_3 list_common"><p><a href="Outgoing.jsp">출고</a></p></div>
			<div class="list_4 list_common"><p><a href="Shelf_life.jsp">유통기한 관리</a></p></div>
			<div class="list_5 list_common"><p><a href="Sup_con.jsp">거래처 관리</a></p></div>
			<div class="list_6 list_common"><p><a href="Data.jsp">대시보드</a></p></div>
			<div class="list_7 list_common"><p><a href="Limit.jsp">조정</a></p></div>
			<div class="list_8 list_common"><p><a href="Product_reg.jsp">수동발주</a></p></div>
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