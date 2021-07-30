<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
 <meta charset="UTF-8">
        <title>AUTO BUY 회원가입</title>
        <link rel="stylesheet" href="assest/css/Join.css">
</head>
<body>
 <div id="header" >
            	거래처
        </div>
		<div id="wrapper">

            <!-- content-->
            <div id="content">
	<form action="JoinServiceCon" method="post">
                <!-- ID -->
                <div>
                    <h3 class="join_title">
                        <label for="id">이름</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" id="id" class="int" maxlength="20" name="name">
                    </span>
                </div>

                <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="pswd1">전화번호</label></h3>
                    <span class="box int_pass">
                        <input type="text" id="pw" class="int" maxlength="20" name="sup_tel">
                    </span>
                </div>
                <div>
                    <h3 class="join_title"><label for="pswd1">이메일</label></h3>
                    <span class="box int_pass">
                        <input type="text" id="pswd1" class="int" maxlength="20" name="sup_email">
                    </span>
                </div>
                <div>
                	<h3 class="join_title"><label for="pswd1">메모</label></h3>
                	 <textarea name="memo" wrap="virtual" rows="10" cols="63" ></textarea>
                </div>
                <div class="btn_area">
                    <button type="submit" id="btnJoin" value="회원가입">
                        <span>거래처 삭제</span>
                    </button>
                    <br><br>
                    <button type="submit" id="btnJoin" value="회원가입">
                        <span>정보 수정</span>
                    </button>
                </div>
                
                </form>
                </div>
                </div>
	
</body>
</html>