<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link rel="stylesheet" href="assest/css/MainPos.css">
</head>
<body>
 <form>
	<div class = "container">
		<div class="menu">
			<div class="card">아메리카노</div>
			<div class="card">카페라떼</div>
			<div class="card">카페모카</div>
			<div class="card">카푸치노</div>
			<div class="card">바닐라라떼</div>
			<div class="card">카라멜 마끼아또</div>
			<div class="card">에스프레소</div>
			<div class="card">자몽에이드</div>
			<div class="card">청포도에이드</div>	
			<div class="card">레몬에이드</div>
			<div class="card">페퍼민트 티</div>	
			<div class="card">히비스커스 티</div>
			<div class="card">청포도에이드</div>	
			<div class="card">레몬에이드</div>
			<div class="card">페퍼민트 티</div>	
			<div class="card">히비스커스 티</div>		

		</div>
		<div class=bills>
			<table class= bills1>
				<caption><h3>주문서</h3></caption>
				<tr valign="top" height="3px">
					<td width="5px">   </td>
					<td width="15px" align="center"> </td>
					<td width="120px" align="left"></td>
					<td width="35px" align="center"></td>
					<td width="90" align="left"></td>							
				</tr>
				<tr valign="top">
					<td width="5px">   </td>
					<td width="120px" align="left">아메리카노</td>
					<td width="5px" align="center">-</td>
					<td width="35px" align="center">1</td>
					<td width="5px" align="center">+</td>
					<td width="90" align="left">3500원</td>							
				</tr>												
			</table>
			<table class= bills2>
				<tr valign="top">
					<td width="80px" align="left"><h3>총 금액</h3></td>
					<td width="15px" align="left"><h4>3500원</h4></td>						
				</tr>												
			</table>
			<div class=bills3>
				<button><a href="main.jsp">마감</a></button>
				<button>결제</button>							
			</div>	
		</div>
		
	</div>
 </form>
</body>
</html>