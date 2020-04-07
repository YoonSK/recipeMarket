<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<style>
.inputBox{
	width: 300px;
	height: 35px;
	margin: 4px;
	border-radius: 5px;
	border: 1px solid lightgray;
	text-align: center;
	margin-left: 35%;
	
}
.button {
	text-align: center;
	margin: 4px;
}
.outer{
	width: 1000px; 
	height: 500px;
	   margin: 50px auto 50px auto;
}
.textbox{
	text-align: center;
	}

.defaultBtn{
	padding: 6px 9px 6px 9px;
	border: 0;
	border-radius: 10px;
	background: #fff3c8;
	color: white;
	font-size: 15px;
  	font-weight: bold;
	text-shadow: 0 1px 1px rgba(0,0,0,.3);
	box-shadow: 0 1px 2px rgba(0,0,0,.2);
	cursor: pointer;
	text-align: center;
	margin-left: 46%;
}

.defaultBtn:hover{
	background: #e8e5da;
}

.btnBox{
	    margin-top: 10px;
}
#userImg{
	height: 100px;
	margin-left: 45%;
}
</style>
</head>
<body>
	<form action="<%= request.getContextPath() %>/findId.me" method="post" ></form>
	<c:import url="../common/header.jsp"/>
		<div class="outer">
		<div class ="pageTitle">
			<h1 style="text-align: center;  margin-top:100px;">아이디 찾기</h1>
		</div>	
		
			<div class ="findArea">
				<img src="../images/user.png" id="userImg"/>
				 <h5 style="text-align: center; margin: 0; padding:0;">이름</h5>
				 <input type="text"  class="inputBox" name="userName" placeholder="고객님의 이름을 입력해주세요" >
				 <h5 style="text-align: center; margin: 0; padding:0;">이메일</h5>
				 <input type="email" class="inputBox" name="email" placeholder="가입 시 등록하신 이메일을 입력해주세요" >
			</div>
			<div class="btnBox">
				<button type="submit" class="defaultBtn">확인</button> 
			</div>
		</div>
	</form>											 							
</body>
<c:import url="../common/footer.jsp"/>
</html>