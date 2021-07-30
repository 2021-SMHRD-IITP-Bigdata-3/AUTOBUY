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
            AUTO BUY
        </div>
		<div id="wrapper">

            <!-- content-->
            <div id="content">
	<form action="JoinServiceCon" method="post">
                <!-- ID -->
                <div>
                    <h3 class="join_title">
                        <label for="id">아이디</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" id="id" class="int" maxlength="20" name="id">
                    </span>
                </div>

                <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="text" id="pw" class="int" maxlength="20" name="pw">
                    </span>
                </div>
                <div>
                    <h3 class="join_title"><label for="pswd1">닉네임</label></h3>
                    <span class="box int_pass">
                        <input type="text" id="pswd1" class="int" maxlength="20" name="nickname">
                    </span>
                </div>
                <input type="radio" value="거래처" id="Choice1" name="Choice">
			 	<label for="Choice1">점포점주</label>
				<input type="radio" value="점포점주"  id="Choice2" name="Choice">
			 	<label for="Choice2">거래처</label>
                <div class="btn_area">
                    <button type="submit" id="btnJoin" value="회원가입">
                        <span>가입하기</span>
                    </button>
                </div>
                </form>
                </div>
                </div>
	
</body>
</html>