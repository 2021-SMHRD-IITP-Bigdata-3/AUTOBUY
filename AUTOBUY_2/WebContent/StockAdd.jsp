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
	</style>
</head>
<body>
<body>
	<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		ProductDAO dao = new ProductDAO();
		
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
						
		if(info!=null){
			list = dao.showProduct();
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
			<div class="mypage"><a href="Update.jsp">마이페이지</a></div>			
		</div>
		<div class="list">
			<div class="list_1 list_common"><p><a href="#">제품목록</a></p></div>
			<div class="list_2 list_common"><p><a href="#">입고</a></p></div>
			<div class="list_3 list_common"><p><a href="#">출고</a></p></div>
			<div class="list_4 list_common"><p><a href="#">유통기한 관리</a></p></div>
			<div class="list_5 list_common"><p><a href="#">거래처 관리</a></p></div>
			<div class="list_6 list_common"><p><a href="#">대시보드</a></p></div>
			<div class="list_7 list_common"><p><a href="#">조정</a></p></div>
			<div class="list_8 list_common"><p><a href="#">제품 등록</a></p></div>
		</div>
		<div class="content">
			<div class="small_title"><p>제품목록 > 제품등록</p></div>
				<table>
					<tr>
						<td>사진</td>
						<td>제품명</td>
						<td>거래처</td>
					</tr>
					<%for(int i = 0; i<list.size();i++){ %>
											<tr>
										
												<td><%=list.get(i).getProduct_name() %></td>
												<td><%=list.get(i).getProduct_price() %></td>
												<td><%=list.get(i).getProduct_qntty() %></td>
										
											</tr>
											<%} %>
				</table>
			</div>
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