<%@page import="auto.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link rel="stylesheet" href="assest/css/StockAdd.css">
<style>
.notice{
width:90%;
height:125px;
margin-top:20px;
margin-left:100px;
border:1px solid #ffeaa7;
background-color:#ffeaa7;
border-radius:20px;
font-family: 'Spoqa Han Sans Neo', 'sans-serif';
}
.checkbox{
float:left;
margin-left:100px;
margin-top:20px;
}
.checkbox input.checkbox1{
font-size:1em;
width:1.25em;
height:1.25em;
vertical-align:middle;
font-family: 'Spoqa Han Sans Neo', 'sans-serif';
}
</style>
</head>
<body>
	<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
	%>

	<div class="container" >
	<div class="container_line"></div>
		<div class="header">
			<div class="title"><p><a href="Main.jsp" id="auto"><b><b>AUTO</b></b></a><a href="Main.jsp" id="buy">BUY</a></p></div>
			
			<%if(info != null){%>
            <div style="margin-left: 900px; margin-top: 20px">
            <table id="topmenu">
					<tr>
						<td ><a href="Update.jsp">마이페이지</a></td>		
						<td ><a href="Incoming.jsp">주문배송</a></td>		
						<td ><a href="Product_reg.jsp">장바구니</a></td>
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
						<td id="hello" onclick="location.href='Update.jsp'"><h3><%=info.getStore_name() %>카페 사장님<br>환영합니다!!</h3></td>
					</tr>
					<tr>
						<td class="select" onclick="location.href='Main.jsp'"> &emsp;&emsp;&nbsp;재고목록</td>
					</tr>
					<tr >
						<td class="select" onclick="location.href='Incoming.jsp'" >&emsp;&emsp;&nbsp;입고</td>
					</tr>
					<tr>
						<td class="select" onclick="location.href='Outgoing.jsp'" >&emsp;&emsp;&nbsp;출고</td>
					</tr>
					<tr>
						<td class="select" onclick="location.href='Shelf_life.jsp'" style="background-color: #5F0080; color: white;">&emsp;&emsp;&nbsp;유통기한</td>
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
						<td class="select" onclick="location.href='Product_reg.jsp'">&emsp;&emsp;&nbsp;발주</td>
				</tr>
			</table>
		</div>
		<div class="content">
		<div class="notice">
		<div style="margin-left:70px; margin-top:5px;position:relative; ">
			<div style=" position:absolute; margin-left:-40px;"><img src="img/notice.png" style=" width:30px; height:30px;"></div>
			<b>유닛에 유통기한을 설정해 두시면, 매일 아침 9시에 유통기한이 임박한 삼품들에 대한 알림을 보내 드립니다.</b><br><br>
									1.유통기한 속성을 설정 하세요.<br>
									2.유통기한 별로 유닛을 나누어 등록하세요.<br>
									3.유통기한 임박 순으로 제품을 확인할 수 있습니다. (재고가 있는 제품만 표시됩니다.)</div>
		</div>
			<div class="small_title"><p>유통기한</p></div>
				<div class="board">
				<table id="show" style="margin:auto; width : 1300px; margin-top:40px;">
					<tr  style ="text-align: center; width: 400px; font-size: 18px;">
							<td  style ="width: 25% "><b>사진</b></td>
							<td  style ="width: 25% "><b>제품명</b></td>
							<td  style ="width: 25% "><b>거래처</b></td>
							<td  style ="width: 25% "><b>유통기한</b></td>
							<td></td>
						</tr>
					
					<tr style="text-align: center;">
							<tr style="height: 40px; text-align: center; width: 400px; font-size: 17px;" onMouseOver="this.style.backgroundColor='#EFF8FB';" onMouseOut="this.style.backgroundColor=''">
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><a href="Shelf_life_change.jsp"><button>수정</button></a><br>      
							<a href="Shelf_life_delete.jsp"><button>삭제</button></a></td>
					</tr>		
			 </table>
			</div>
			<div class="checkbox">
				<input type="checkbox" name="check"id="check" value="1" class="checkbox1">
				<label for ="check">알림 설정</lable>
				</div>
				<div style="float:left; margin-top:20px; margin-left:30px; width:200px;">
                    <select>
                    	<option selected>1 일전</option>
                    	<option>3 일전</option>
                    	<option>7 일전</option>
                    	<option>10 일전</option>
                    </select>
                </div>
                 <div><button type="button" class = "submitbutton" onclick="location.href='Main.jsp'" style="margin-top: 20px; margin-right: 100px;">완료</button></div>
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