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
			<div class=""><p><a href="Main_Sup.jsp">출고</a></p></div>
			<div class=""><p><a href="Cus_management.jsp">고객관리</a></p></div>
			<div class=""><p><a href="SupProductShow.jsp">제품 목록</a></p></div>
		</div>
		<div class="content">
			<div class="small_title"><p>제품 등록</p></div>
			<form action="#" method="post">
			<div class="board">
				<table class="list_board">
				
					<tr>
						<td>제품명</td>
						<td><input type="text" id="size" name="product_N"></td>
					</tr>
					<tr>
						<td>재고 수량</td>
						<td><input type="text" id="size" name="Sup_stock"></td>
					</tr>
					<tr>
						<td>초기 재고</td>
						<td><input type="text" id="size" name="first_stock"></td>					
					</tr>
					<tr>
						<td>종류</td>
						<td>
							<select name="kinds" class="kinds" >
						    <option value="Expendables">소모품</option>
						    <option value="dairy_product">유제품</option>
						    <option value="beans">원두</option>
				 			</select>
				 		</td>					
					</tr>
					<tr>
						<td>사진</td>
						<td><input type="file" name="fileName" style="float:center;">		
			 </table>
			 <input type="submit" value="입력 완료" style="float:center">
			 <a href="Sup_Product_reg.jsp"></a><button style="float:center">취소</button>
			</div>
			
			</form>
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