<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
 <meta charset="UTF-8">
        <title>AUTO BUY ȸ������</title>
        <link rel="stylesheet" href="assest/css/Join.css">
</head>
<body>
<div class="logo-wrap" style="font-family: Cocogoose; font-size: 58px; color:black; margin-top: 100px; margin-left:43.5%;">

				<a><b>AUTO</b> BUY </a>
			</div>
		<div id="wrapper">

            <!-- content-->
            <div id="content">
	<form action="JoinServiceCon" method="post">
                <!-- ID -->
                <div>
                    <h3 class="join_title">
                        <label for="id">���̵�</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" id="id" class="int" maxlength="20" name="id">
                    </span>
                </div>

                <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="pswd1">��й�ȣ</label></h3>
                    <span class="box int_pass">
                        <input type="password" id="pw" class="int" maxlength="20" name="pw">
                    </span>
                </div>
                <div>
                    <h3 class="join_title"><label for="pswd1">�г���</label></h3>
                    <span class="box int_pass">
                        <input type="text" id="nickname" class="int" maxlength="20" name="nickname">
                    </span>
                </div>
                <div>
                    <h3 class="join_title"><label for="pswd1">��ȣ��</label></h3>
                    <span class="box int_pass">
                        <input type="text" id="store_name" class="int" maxlength="20" name="store_name">
                    </span>
                </div>
                 <div>
                    <h3 class="join_title"><label for="pswd1">�ڵ��� ��ȣ</label></h3>
                 </div>
                
                <div>
                    <select>
                    	<option selected>SKT</option>
                    	<option>KT</option>
                    	<option>LG</option>
                    	<option>�˶���</option>
                    </select>
                </div>
                <div>
                	<span class="box int_pass">
                        <input type="text" id="phone" class="int" maxlength="20" name="phone">
                    </span>
                </div>
                
                 <div>
                    <h3 class="join_title"><label for="pswd1">�ּ�</label></h3>
                    <span class="box int_pass">
                        <input type="text" id="addr" class="int" maxlength="20" name="addr">
                    </span>
                </div>
                
                
              	 <br>
              	 <br>
                <div>
                <input type="radio" value="�ŷ�ó" id="Choice1" name="Choice">
			 	<label for="Choice1">�ŷ�ó</label>
				<input type="radio" value="��������"  id="Choice2" name="Choice">
			 	<label for="Choice2">��������</label>
			 	</div>
                <div class="btn_area" style="background-color:#5F0080">
                    <button type="submit" id="btnJoin" value="ȸ������">
                        <span>�����ϱ�</span>
                    </button>
                </div>
                </form>
                </div>
                </div>
	
</body>
</html>