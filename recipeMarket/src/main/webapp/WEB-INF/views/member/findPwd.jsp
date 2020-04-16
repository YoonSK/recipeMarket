<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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
	margin-left: 47%;
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
.outer{
	width: 1000px; 
	height: 500px;
	   margin: 50px auto 50px auto;
}

</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
		<div class="outer">
			<div class="wrapper">
				<div class ="pageTitle">
					<h1 style="text-align: center;  margin-top:100px;">비밀번호 찾기</h1>
				</div>	
				<div class ="findArea">
					<p style="text-align: center;">비밀번호 재설정  안내를 가입시 입력했던 이메일로 발송합니다.</p>
					<img src="${ contextPath }/resources/images/user.png" id="userImg"/>
					<h5 style="text-align: center; margin: 0; padding:0;">아이디</h5>
			 		<input type="text"  class="inputBox" id="id" name="id" placeholder="아이디를 입력해주세요" >
			 <h5 style="text-align: center; margin: 0; padding:0;">이메일</h5>
			 <input type="email" class="inputBox" id="email" name="email" placeholder="이메일을 입력해주세요" >
		</div>
		<div class="btnBox">
			<button type="submit" id="searchBtn" onclick="findPwd();"class="defaultBtn">확인</button> 
		</div>
			</div>
		</div>
	<script>
	function findPwd(){
		$('#findForm').submit();
		var $result = '${message}';
		$.ajax({
			
			url: 'sendEmail.me',
			type: 'post',
			data: {id: $('#id').val(),
					email: $('#email').val()
					},
			
			success: function(data){
				if(data == 'success'){
					alert('임시 비밀번호가 발급 되었습니다.\n 메일을 확인해주세요~');
					location.href="goLogin.me";
					location.reload();
				} else{
					alert('존재하지 않는 아이디 혹은 이메일입니다. 다시 확인해주세요.');
					location.reload();
				}
			},
			error: function(data){
				alert('존재하지 않는 회원입니다. 다시 확인해주세요~');
				alert($result);
				location.reload();
			}
		});
		/* var result = '${message}';
		if(result =='success'){
			alert(result);
			alert('메일이 발송되었습니다.');
		} else{
			alert('존재하지 않는 아이디 혹은 이메일입니다.');
			alert(result);
		} */
	}
	</script>
<!--  		<script>
		$('#searchBtn').click(function(){
			var charArr = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z','^','!'];
			var temPwd = "";
			for(var i = 0; i < 6; i++) {
				var idx = parseInt(charArr.length * Math.random());
				temPwd += charArr[idx];
			}
			
			$.ajax({
				url: 'sendEmail.me',
				type: 'post',
				data: {id: $('#id').val(),
						email: $('#email').val(),
						temPwd: temPwd,
						newPwd: temPwd},
				success: function(data){
					if(data == 'success'){
						alert('임시 비밀번호가 발급 되었습니다.\n 메일을 확인해주세요~');
						location.href="goLogin.me";
					} else{
						alert('임시 비밀번호 발급에 실패하였습니다.');
						console.log(data);
					}
				},
				error: function(data){
					alert('존재하지 않는 회원입니다. 다시 확인해주세요~');
					console.log(data);
				}
			});
		});
	</script> -->								 							
</body>
<c:import url="../common/footer.jsp"/>
</html>