<%@page import="pos.model.PosDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pos.model.PosDAO"%>
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
    canvas{
    border-radius: 3px;
    font-family: 'Spoqa Han Sans Neo', 'sans-serif';
    font-color:black;
    }
    
</style>
</head>
<body>
	<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		PosDAO dao=new PosDAO();
		ArrayList<PosDTO> pos_list=new ArrayList<PosDTO>();
		pos_list =dao.showSale();
		
		System.out.println(pos_list.size());
		
		for(int i=0; i<pos_list.size(); i++){
			System.out.println(pos_list.get(i).getMenu_name());
		}
		if(pos_list!=null){
			System.out.println("성공");
		}else{
			System.out.println("실패");
		}
		
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
							<td class="select" onclick="location.href='Shelf_life.jsp'" >&emsp;&emsp;&nbsp;유통기한</td>
						</tr>
						<tr>
							<td class="select" onclick="location.href='Sup_con.jsp'" >&emsp;&emsp;&nbsp;거래처</td>
						</tr>
						<tr>
							<td class="select" onclick="location.href='Data.jsp'" style="background-color: #5F0080; color: white;">&emsp;&emsp;&nbsp;대시보드</td>
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
			<div class="small_title"><p>대시보드</p></div>
			<div class="board">
			<canvas width='500' height='500' id='canvas' style="margin-top:40px;  font-family: 'Spoqa Han Sans Neo', 'sans-serif';"></canvas>
			<script>
			 const canvas = document.getElementById('canvas');
			    const ctx = canvas.getContext('2d');
			   
			    var width = canvas.clientWidth;
			    var height = canvas.clientHeight;

			    var value = [
			        {number : 15, text : '카페라떼'},
			        {number : 10, text : '카라멜마끼야또'},
			        {number : 30, text : '아메리카노'},
			        {number : 14, text : '바닐라라떼'},
			        {number : 11, text : '페퍼민트'},
			        {number : 18, text : '레몬에이드'}
			    ];
			    var degree = 360;
			    var radius = width * 0.7 / 2;  //반지름 동적 부여

			    if(radius > height * 0.7 / 2){  //캔버스의 넓이와 높이를 고려하여 최소크기 적용
			        radius = height * 0.7 / 2;
			    }

			    const colorArray = ['#f5444e', '#4bbfbc', '#fcb362','#949fb0','#c4c24a','#6faab0'];  //색깔배열(지금은 6개..)

			    var sum = 0;
			    value.forEach( arg=> sum+= arg.number);

			    var conv_array = value.slice().map((data)=>{  //각도가 들어있는 배열
			        var rate = data.number / sum;
			        var myDegree = degree * rate;
			        return myDegree;
			    });

			    degree = 0;
			    var event_array = value.slice().map( arg=> []);  //이벤트(각도 범위가 있는)용 배열


			    var current = -1;  //현재 동작중 인덱스
			    var zero = 0;   //각(degree)에 대해서 증가하는 값

			    //최초 로딩 이벤트(값 1개씩 점차 증가하며 그리는함수)   -> 계속해서 덮어씌우기를 하므로 가운데가 깔끔하지 않다.(나중에 수정하여보자.)
			    var clr = setInterval(() => {
			        for(var i=0;i < conv_array.length;i++){
			            var item = conv_array[i];
			            if(current == -1|| current == i){
			                current = i;
			                if(zero < item){ //비교
			                    if(i == 0){
			                        arcMaker(radius, 0, zero, colorArray[i]);
			                    } else {
			                        arcMaker(radius, degree, degree+zero, colorArray[i]);
			                    }
			                    zero+=3;             
			                } else {
			                    current = i+1;
			                    zero = 0;
			                    if(i != 0){
			                        arcMaker(radius, degree, degree + item, colorArray[i]);
			                        event_array[i] = [degree, degree+item];
			                        degree =  degree + item;     
			                    } else {
			                        arcMaker(radius, 0, item, colorArray[i]);
			                        degree = item;
			                        event_array[i] = [0, degree];
			                    }
			                }                               
			            } else if (current == conv_array.length){
			                clearInterval(clr);
			                makeText(-1);
			            } 
			        }
			    }, 1);

			    //그리는 기능 분리(같은 내용이 계속 나오므로 분리)
			    function arcMaker(radius, begin, end, color){
			        ctx.save();
			        ctx.lineJoin = 'round'; //선이만나 꺾이는 부분때문에 부여(삐져나오는 현상 방지)
			        ctx.lineWidth = 4; 
			        ctx.beginPath();
			        ctx.moveTo(width/2, height/2);                           
			        ctx.arc(width/2, height/2, radius, (Math.PI/180)*begin, (Math.PI/180)* end , false);
			        ctx.closePath();
			        ctx.fillStyle = color;
			        ctx.strokeStyle = 'white';
			        ctx.fill();
			        ctx.stroke();
			        ctx.restore();        
			        middelMaker();  //가운데 원형그리기 함수 추가
			    }

			    //마우스 움직임 이벤트 리스너
			    var drawed = false;
			    canvas.addEventListener('mousemove', function (event) {
			        var x1 = event.clientX - canvas.offsetLeft;
			        var y1 = event.clientY - canvas.offsetTop;
			        var inn = isInsideArc(x1, y1);
			        if(inn.index > -1){  //대상이 맞으면
			            drawed = true;
			            hoverCanvas(inn.index);
			            makeText(inn.index);
			        } else {  //대상이 아니면
			            if(drawed){  //대상이였다가 대상이 이제 아니면
			                hoverCanvas(-1);
			                makeText(-1);
			            }
			            drawed = false;
			        }
			    }); 

			    //내부 + 범위에 들어온지 확인하는 함수
			    function isInsideArc(x1, y1){
			        var result1 = false;
			        var result2 = false;
			        var index = -1;
			        var circle_len = radius;
			        var x = width/2 - x1;
			        var y = height/2 - y1;
			        var my_len = Math.sqrt(Math.abs(x * x) + Math.abs(y * y));  //삼각함수
			        if(circle_len >= my_len){
			            result1 = true;
			        }            
			        var rad = Math.atan2(y, x);
			        rad = (rad*180)/Math.PI;  //음수가 나온다
			        rad += 180;  //캔버스의 각도로 변경
			        if(result1){
			            event_array.forEach( (arr,idx) => {   //각도 범위에 해당하는지 확인
			                if( rad >= arr[0] && rad <= arr[1]){
			                    result2 = true;
			                    index = idx;
			                }
			            });
			        }
			        return {result1:result1, result2:result2 ,index:index, degree : rad};
			    }

			    
			    //마우스 오버효과
			    function hoverCanvas(index){
			        ctx.clearRect(0,0,width, height);
			        for (var i = 0; i < conv_array.length; i++) {
			            var item = conv_array[i];
			            var innRadius = radius;
			            if(index == i){  
			                innRadius = radius * 1.1;  //대상이 맞으면 1.1배 크게 키운다.
			            }
			            if (i == 0) {
			                arcMaker(innRadius, 0, item, colorArray[i])
			                degree = item;
			            } else {
			                arcMaker(innRadius, degree, degree + item, colorArray[i])
			                degree = degree + item;
			            }
			        }
			    }


			    //도(degree)를 라디안(radian)으로 바꾸는 함수
			    function degreesToRadians(degrees) {
			        const pi = Math.PI;
			        return degrees * (pi / 180);
			    }

			    //텍스트함수
			    function makeText(index){
			        event_array.forEach((itm, idx) => {
			            var half = (itm[1] - itm[0]) / 2;
			            var degg = itm[0] + half;
			            var xx = Math.cos(degreesToRadians(degg)) * radius * 0.7 + width / 2;
			            var yy = Math.sin(degreesToRadians(degg)) * radius * 0.7 + height / 2;

			            var txt = value[idx].text + '';
			            var minus = ctx.measureText(txt).width / 2;  //텍스트 절반길이
			            ctx.save();
			            if(index == idx){
			                ctx.font = "normal bold 18px sans-serif";
			                ctx.fillStyle = 'blue';
			            } else {
			                ctx.font = "normal 14px sans-serif";
			                ctx.fillStyle = 'white';
			            }
			            ctx.fillText(txt, xx - minus, yy);
			            var txt2 = value[idx].number;
			            ctx.fillText(txt2, xx - ctx.measureText(txt2).width / 3, yy + 16);
			            ctx.restore();
			        });
			    }

			    //중앙 구멍(원)을 만드는 함수
			    function middelMaker(){
			        ctx.save();
			        ctx.fillStyle='white';
			        ctx.strokeStyle='white';
			        ctx.lineJoin = 'round'; //선이만나 꺾이는 부분때문에 부여(삐져나오는 현상 방지)
			        ctx.lineWidth = 1; 
			        ctx.beginPath();
			        ctx.moveTo(width/2, height/2);
			        ctx.arc(width/2, height/2, radius/3, (Math.PI/180)*0, (Math.PI/180)* 360 , false);
			        ctx.fill();
			        ctx.stroke();
			        ctx.closePath();
			        ctx.restore();

			        var total = 0;
			        value.forEach( (arg)=> total+=arg.number);
			        var minus = ctx.measureText(total).width; 
			        ctx.save();
			        ctx.font = "normal 20px sans-serif";
			        ctx.fillStyle = '#656565';
			        ctx.fillText("판매량", width/2 - ctx.measureText("Total").width/2, height/2);
			        ctx.fillText(total, width/2 - minus, height/2 * 1.1);
			        ctx.restore();
			    }
			</script>
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