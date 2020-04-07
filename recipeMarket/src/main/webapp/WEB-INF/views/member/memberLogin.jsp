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
    
    #submit {width: 80px; height: 30px; font-size: 14px; font-weight: 600; text-align: center; border:1px solid #fee0a1; 
    		border-radius: 4px; background: white; padding-left: 40px; padding-right: 40px; padding-bottom: 10px; padding-top: 10px; 
    		margin-left: 35%;}
    #submit:hover{cursor: pointer; background: #fee0a1; color: white;}   
    .forgot{color: #263238; padding-top: 20px;}    
    a{color: #263238; text-decoration: none;}
    
/*     @media (max-width: 600px) {
        .main {
            border-radius: 0px;
        } */
</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>
	<div class="outer">
		<div class="cotainer">
			  <div class="content">
			    <p class="title" align="center">로그인</p>
				<form action="<%= request.getContextPath() %>/content.au" method="post" id="content" name="usercontent">
					<input class="id" type="text" placeholder="아이디">
					<input class="pwd" type="password" placeholder="비밀번호">
					<a href="#" id="submit">로그인</a>
					<p class="forgot" align="center"><a href="#">아이디 찾기</a>&nbsp;&nbsp;<a href="#">비밀번호 찾기</a></p>		      
			      </form>                    
    			</div>
    		</div>	
		</div>	
	<c:import url="../common/footer.jsp"/>		
</body>
</html>