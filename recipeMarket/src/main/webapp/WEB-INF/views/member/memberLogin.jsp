<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
	.content {width: 400px; height: 400px; margin: 7em auto; border-radius: 1.5em;}
	.title {padding-top: 40px; font-weight: bold; font-size: 25px;}
	 form#content {padding-top: 30px;}   
	.id, .pwd {width: 76%; color: #263238; font-weight: 700; font-size: 14px; letter-spacing: 1px; background: white;
		padding: 10px 20px; border: none; border-radius: 20px; outline: none; box-sizing: border-box; border: 2px solid rgba(0, 0, 0, 0.02);
		margin-bottom: 50px; margin-left: 46px; text-align: center; margin-bottom: 27px;}
	
	.id:focus, .pwd:focus {border: 2px solid #fee0a1 !important;}
	
	input[type=submit]#submit {width: 120px; height: 40px; font-size: 14px; font-weight: 600; text-align: center; border:1px solid #fee0a1; 
			border-radius: 4px; background: white; padding-left: 40px; padding-right: 40px; padding-bottom: 10px; padding-top: 10px; 
			margin-left: 35%;}
	input[type=submit]#submit:hover {cursor: pointer; background: #fee0a1; color: white;}   
	.forgot{color: #263238; padding-top: 20px;}    
	a{color: #263238; text-decoration: none;}
	a#kakao-login-btn{margin-left: 100px;}
    
</style>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
	<c:import url="../common/header.jsp"/>	
	<div class="outer">
		<div class="cotainer">
			  <div class="content">
			    <p class="title" align="center">로그인</p>
				<form action="login.me" method="post" id="content" name="usercontent">
					<input class="id" type="text" name="id" placeholder="아이디">
					<input class="pwd" type="password" name="pwd" placeholder="비밀번호">
					<input type="submit" id="submit" value="로그인">
					<br><br>
					<a id="kakao-login-btn"></a>
					
					<script type="text/javascript">
						Kakao.init('92cf389f43df107fed17c5a1e2cdc865');	
						Kakao.Auth.createLoginButton({ 
						    container: '#kakao-login-btn', 
						    success: function(authObj) { 
						           Kakao.API.request({
						 
						               url: "/v2/user/me",
						               success: function(res) {
						            	   
						          		var nickname=res.properties.nickname;
						                var email=res.kakao_account.email;
						                console.log(nickname);
						                console.log(email);
						                
						                     
						          		location.href="http://192.168.10.224:9780/recipeMarket/kLogin.me?nickname="+nickname+"&email="+email;
						                   }
						                 })
						               },
						               fail: function(error) {
						                 alert(JSON.stringify(error));
						               }
						             });						 
					</script>
					<p class="forgot" align="center"><a href="findIdView.me">아이디 찾기</a>&nbsp;&nbsp;<a href="findPwdView.me">비밀번호 찾기</a></p>		      
			      </form>                    
    			</div>
    		</div>	
		</div>	
		<c:import url="../common/footer.jsp"/>	
</body>
</html>