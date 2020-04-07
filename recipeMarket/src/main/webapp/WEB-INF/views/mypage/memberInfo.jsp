<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 조회</title>
<style>
	/* 가운데 정렬 */
	div.container{position: absolute; width: 400px; /* top: 16%; */ left: 42%;}
 		/* 버튼 */
	input[type="submit"]{width: 90px; height: 30px; font-size: 12px; font-weight: 600; text-align: center; border:1px solid #fee0a1; border-radius: 4px; background: white; margin: 15px;}
	input[type="submit"]:hover{cursor: pointer; background: #fee0a1; color: white;}
	input[type="button"]{width: 90px; height: 30px; font-size: 12px; font-weight: 600; text-align: center; border:1px solid #fee0a1; border-radius: 4px; background: white; margin: 15px;}
	input[type="button"]:hover{cursor: pointer; background: #fee0a1; color: white;}
	/* 텍스트 */
	p.input-label{font-weight: 800;}
	span.input-text{font-weight: 500; margin-left: 40px;}
	p.input-label{margin-bottom:3%;}

</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<jsp:include page="footer.jsp"/>
	<div class="outer">	
		<div class="container">
	    	<div class="content">
				<h2>회원 정보 조회</h2>
	    		<form action="<%= request.getContextPath() %>/views/user/profileUpdate.jsp" id="userProfile" method="post" id="userProfile" name="userProfile">
		    		<div class="profile-icon">
		    			<input type="hidden" name="savedPhoto" id="savedPhoto" value="">
						<img name="usPhoto" width=100px; height=100px; style="border-radius: 40px;" id="usPhoto" src="../images/flower.PNG">
					</div>
		    			<p class="input-label">아이디<span class="input-text">user11</span></p>		    			
		    			<input type="hidden" name="userGender" value="">			
						<p class="input-label">이름<span class="input-text">홍길동</span></p>
						<input type="hidden" name="userName" value="">
		    			<p class="input-label">닉네임<span class="input-text">화요일</span></p>
		    			<input type="hidden" name="userNick" value="">
		    			<p class="input-label">연락처<span class="input-text">01012344568</span></p>
		    			<input type="hidden" name="userPhone" value="">
		    			<p class="input-label">이메일<span class="input-text">kildong@han.com</span></p>
		    			<input type="hidden" name="userEmail" value="">
		    			<p class="input-label">생년월일<span class="input-text">19950101</span></p>
		    			<input type="hidden" name="usBirth" value="">
		    			<p class="input-label">주소<span class="input-text">서울특별시 강남구 역삼로 테헤란로 14길 6</span></p>
		    			<input type="hidden" name="usBirth" value="">
			    		<input type="submit" id="updateBtn" value="회원정보 수정">
			    		<input type="button" onclick="location.href='<%= request.getContextPath() %>/views/user/pwdUpdate.jsp'" value="돌아가기">
		    	</form>
	    	</div>
    	</div>
	</div>
</body>
</html>