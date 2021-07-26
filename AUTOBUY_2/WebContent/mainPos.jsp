<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">

.container{
	width : 660px;
	height : 440px;
	border: 0.7px solid #accbee;

}


.menu{
	width : 67%;
	height: 100%;
	background-color: white;
	float : left;
}

.card{
	width:100px;
	height: 100px;
	line-height: 100px;
	background-color: #e7f0fd;
	color : black;
	font-size: 13px;
	text-align: center;
	float : left;
	margin: 5px 5px;	
}

.bills{
	height : 100%;	
    font-size: 12px;
	background-color: wihte;
	text-align: center;
}

.bills1{
	height : 55%;	
    font-size: 12px;
	background-color: wihte;
	text-align: center;
	border-top: 2px solid #e7f0fd;
}
.bills2{
	height : 20%;
	width : 33%;
    font-size: 12px;
	background-color: wihte;
	text-align: center;
	border-top: 2px solid #e7f0fd;
}
 button {
	background-color:white;
		
	color: #29323c;
	font-size: 13px; 
	text-align: center;
		
	height: 40px;
	width: 75px;
	border: 0.7px solid #accbee;
	border-radius: 10%;
	align-content: center; 
	margin: 10px 3px;	 	
	
	flex-wrap : wrap;
}

button:hover {
  background-color: #cfd9df;
  border: 0.7px solid #6991c7;
  color: #29323c;
} 
</style>
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
			<div class="card">딸바 스무디</div>
			<div class="card">초바 스무디</div>
	

		</div>
		<div class=bills>
			<table class= bills1>
				<caption><h3>주문서</h3></caption>
				<tr valign="top" height="3px">
					<td width="5px">   </td>
					<td width="150px" align="left"></td>
					<td width="35px" align="center"></td>
					<td width="90" align="left"></td>							
				</tr>
				<tr valign="top">
					<td width="5px"></td>
					<td width="120px" align="left">아메리카노</td>
					<td width="2px" align="right">-</td>
					<td width="5px" align="center">1</td>
					<td width="2px" align="left">+</td>
					<td width="90px" align="center">3500원</td>							
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
				<button><a href="main.jsp">결제</a></button>							
			</div>	
		</div>
		
	</div>
 </form>
</body>
</html>