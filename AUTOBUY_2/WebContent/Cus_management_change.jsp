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
 <div id="header" >
            	�ŷ�ó
        </div>
		<div id="wrapper">

            <!-- content-->
            <div id="content">
	<form action="JoinServiceCon" method="post">
                <!-- ID -->
                <div>
                    <h3 class="join_title">
                        <label for="id">�̸�</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" id="id" class="int" maxlength="20" name="name">
                    </span>
                </div>

                <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="pswd1">��ȭ��ȣ</label></h3>
                    <span class="box int_pass">
                        <input type="text" id="pw" class="int" maxlength="20" name="sup_tel">
                    </span>
                </div>
                <div>
                    <h3 class="join_title"><label for="pswd1">�̸���</label></h3>
                    <span class="box int_pass">
                        <input type="text" id="pswd1" class="int" maxlength="20" name="sup_email">
                    </span>
                </div>
                <div>
                	<h3 class="join_title"><label for="pswd1">�޸�</label></h3>
                	 <textarea name="memo" wrap="virtual" rows="10" cols="63" ></textarea>
                </div>
                <div class="btn_area">
                    <button type="submit" id="btnJoin" value="ȸ������">
                        <span>�ŷ�ó ����</span>
                    </button>
                    <br><br>
                    <button type="submit" id="btnJoin" value="ȸ������">
                        <span>���� ����</span>
                    </button>
                </div>
                
                </form>
                </div>
                </div>
	
</body>
</html>