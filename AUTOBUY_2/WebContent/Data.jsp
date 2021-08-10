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
			System.out.println("����");
		}else{
			System.out.println("����");
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
						<td ><a href="Update.jsp">����������</a></td>		
						<td ><a href="Incoming.jsp">�ֹ����</a></td>		
						<td ><a href="Product_reg.jsp">��ٱ���</a></td>
						<td ><a href="#">������</a></td>
						<td ><a href="LogoutServiceCon">�α׾ƿ�</a></td>				
					</tr>
			</table>
            </div>
         
         <%} %>         

      </div>

			<div class="list">
				<table id="menu">
					<tr>
							<td id="hello" onclick="location.href='Update.jsp'"><h3><%=info.getStore_name() %>ī�� �����<br>ȯ���մϴ�!!</h3></td>
						</tr>
						<tr>
							<td class="select" onclick="location.href='Main.jsp'"> &emsp;&emsp;&nbsp;�����</td>
						</tr>
						<tr >
							<td class="select" onclick="location.href='Incoming.jsp'" >&emsp;&emsp;&nbsp;�԰�</td>
						</tr>
						<tr>
							<td class="select" onclick="location.href='Outgoing.jsp'" >&emsp;&emsp;&nbsp;���</td>
						</tr>
						<tr>
							<td class="select" onclick="location.href='Shelf_life.jsp'" >&emsp;&emsp;&nbsp;�������</td>
						</tr>
						<tr>
							<td class="select" onclick="location.href='Sup_con.jsp'" >&emsp;&emsp;&nbsp;�ŷ�ó</td>
						</tr>
						<tr>
							<td class="select" onclick="location.href='Data.jsp'" style="background-color: #5F0080; color: white;">&emsp;&emsp;&nbsp;��ú���</td>
						</tr>
						<tr>
							<td class="select" onclick="location.href='Limit.jsp'">&emsp;&emsp;&nbsp;����</td>
						</tr>
						<tr>
							<td class="select" onclick="location.href='Product_reg.jsp'">&emsp;&emsp;&nbsp;����</td>
					</tr>
				</table>
			</div>
		<div class="content">
			<div class="small_title"><p>��ú���</p></div>
			<div class="board">
			<canvas width='500' height='500' id='canvas' style="margin-top:40px;  font-family: 'Spoqa Han Sans Neo', 'sans-serif';"></canvas>
			<script>
			 const canvas = document.getElementById('canvas');
			    const ctx = canvas.getContext('2d');
			   
			    var width = canvas.clientWidth;
			    var height = canvas.clientHeight;

			    var value = [
			        {number : 15, text : 'ī���'},
			        {number : 10, text : 'ī��Ḷ���߶�'},
			        {number : 30, text : '�Ƹ޸�ī��'},
			        {number : 14, text : '�ٴҶ��'},
			        {number : 11, text : '���۹�Ʈ'},
			        {number : 18, text : '�����̵�'}
			    ];
			    var degree = 360;
			    var radius = width * 0.7 / 2;  //������ ���� �ο�

			    if(radius > height * 0.7 / 2){  //ĵ������ ���̿� ���̸� ����Ͽ� �ּ�ũ�� ����
			        radius = height * 0.7 / 2;
			    }

			    const colorArray = ['#f5444e', '#4bbfbc', '#fcb362','#949fb0','#c4c24a','#6faab0'];  //����迭(������ 6��..)

			    var sum = 0;
			    value.forEach( arg=> sum+= arg.number);

			    var conv_array = value.slice().map((data)=>{  //������ ����ִ� �迭
			        var rate = data.number / sum;
			        var myDegree = degree * rate;
			        return myDegree;
			    });

			    degree = 0;
			    var event_array = value.slice().map( arg=> []);  //�̺�Ʈ(���� ������ �ִ�)�� �迭


			    var current = -1;  //���� ������ �ε���
			    var zero = 0;   //��(degree)�� ���ؼ� �����ϴ� ��

			    //���� �ε� �̺�Ʈ(�� 1���� ���� �����ϸ� �׸����Լ�)   -> ����ؼ� �����⸦ �ϹǷ� ����� ������� �ʴ�.(���߿� �����Ͽ�����.)
			    var clr = setInterval(() => {
			        for(var i=0;i < conv_array.length;i++){
			            var item = conv_array[i];
			            if(current == -1|| current == i){
			                current = i;
			                if(zero < item){ //��
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

			    //�׸��� ��� �и�(���� ������ ��� �����Ƿ� �и�)
			    function arcMaker(radius, begin, end, color){
			        ctx.save();
			        ctx.lineJoin = 'round'; //���̸��� ���̴� �κж����� �ο�(���������� ���� ����)
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
			        middelMaker();  //��� �����׸��� �Լ� �߰�
			    }

			    //���콺 ������ �̺�Ʈ ������
			    var drawed = false;
			    canvas.addEventListener('mousemove', function (event) {
			        var x1 = event.clientX - canvas.offsetLeft;
			        var y1 = event.clientY - canvas.offsetTop;
			        var inn = isInsideArc(x1, y1);
			        if(inn.index > -1){  //����� ������
			            drawed = true;
			            hoverCanvas(inn.index);
			            makeText(inn.index);
			        } else {  //����� �ƴϸ�
			            if(drawed){  //����̿��ٰ� ����� ���� �ƴϸ�
			                hoverCanvas(-1);
			                makeText(-1);
			            }
			            drawed = false;
			        }
			    }); 

			    //���� + ������ ������ Ȯ���ϴ� �Լ�
			    function isInsideArc(x1, y1){
			        var result1 = false;
			        var result2 = false;
			        var index = -1;
			        var circle_len = radius;
			        var x = width/2 - x1;
			        var y = height/2 - y1;
			        var my_len = Math.sqrt(Math.abs(x * x) + Math.abs(y * y));  //�ﰢ�Լ�
			        if(circle_len >= my_len){
			            result1 = true;
			        }            
			        var rad = Math.atan2(y, x);
			        rad = (rad*180)/Math.PI;  //������ ���´�
			        rad += 180;  //ĵ������ ������ ����
			        if(result1){
			            event_array.forEach( (arr,idx) => {   //���� ������ �ش��ϴ��� Ȯ��
			                if( rad >= arr[0] && rad <= arr[1]){
			                    result2 = true;
			                    index = idx;
			                }
			            });
			        }
			        return {result1:result1, result2:result2 ,index:index, degree : rad};
			    }

			    
			    //���콺 ����ȿ��
			    function hoverCanvas(index){
			        ctx.clearRect(0,0,width, height);
			        for (var i = 0; i < conv_array.length; i++) {
			            var item = conv_array[i];
			            var innRadius = radius;
			            if(index == i){  
			                innRadius = radius * 1.1;  //����� ������ 1.1�� ũ�� Ű���.
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


			    //��(degree)�� ����(radian)���� �ٲٴ� �Լ�
			    function degreesToRadians(degrees) {
			        const pi = Math.PI;
			        return degrees * (pi / 180);
			    }

			    //�ؽ�Ʈ�Լ�
			    function makeText(index){
			        event_array.forEach((itm, idx) => {
			            var half = (itm[1] - itm[0]) / 2;
			            var degg = itm[0] + half;
			            var xx = Math.cos(degreesToRadians(degg)) * radius * 0.7 + width / 2;
			            var yy = Math.sin(degreesToRadians(degg)) * radius * 0.7 + height / 2;

			            var txt = value[idx].text + '';
			            var minus = ctx.measureText(txt).width / 2;  //�ؽ�Ʈ ���ݱ���
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

			    //�߾� ����(��)�� ����� �Լ�
			    function middelMaker(){
			        ctx.save();
			        ctx.fillStyle='white';
			        ctx.strokeStyle='white';
			        ctx.lineJoin = 'round'; //���̸��� ���̴� �κж����� �ο�(���������� ���� ����)
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
			        ctx.fillText("�Ǹŷ�", width/2 - ctx.measureText("Total").width/2, height/2);
			        ctx.fillText(total, width/2 - minus, height/2 * 1.1);
			        ctx.restore();
			    }
			</script>
		</div>
		</div>
		<div class ="footer">
			<div class="banner">AUTOBUY</div>
			<div class="company">��)����������<br>
								��ǥ : �۱����� | ����� ��� ��ȣ : 000-00-00000<br>
								���ֱ����� ���� �۾Ϸ�60 ����CGI����</div>
		</div>
</div>
</body>
</html>