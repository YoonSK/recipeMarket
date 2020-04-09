<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정</title>
<style>
	/* 가운데 정렬 */
	div.content{position: absolute; width: 400px; top: 25%; left: 42%;}
	/*  입력 창 */
	p.input_con {font-size: 16px; color: #000; margin-top: 10px; margin-bottom: 10px;}
	p.input_info {font-size: 14px; color: #5d5d5d;}
	input.input_text{border-top: none; border-left: none; border-right: none;}
	/* 우편번호 */
	form#joinUser > div.location > input {width: 200px; border-top: none; border-left: none; border-right: none;}
	form#joinUser > div.location > input {margin: 5px 0; border-top: none; border-left: none; border-right: none;}
	form#joinUser > div.location > .postcodify_searchBtn {width: 39%; border: 1px solid #000; font-size: 13px; padding: 10px; cursor: pointer;}
	form#joinUser > div.location > .postcodify_searchBtn:hover {border-color: #aedefc; background: #aedefc; color: #fff;}		
	/*  라디오 버튼 */
	.box-radio-input input[type="radio"]{display:none;}
	.box-radio-input input[type="radio"] + span{display:inline-block; background:none; border:1px solid #dfdfdf; padding:0px 10px;
    											text-align:center; height:25px; line-height:23px; font-weight:500; cursor:pointer;}
	.box-radio-input input[type="radio"]:checked + span{border:1px solid #fee0a1; background: #fee0a1; color:#fff; 	border-radius: 4px;}
 	/* 버튼 */
 	 input[type="submit"]{width: 80px; height: 30px; font-size: 14px; font-weight: 600; text-align: center; border:1px solid #fee0a1; border-radius: 4px; background: white;}
 	 input[type="submit"]:hover{cursor: pointer; background: #fee0a1; color: white;}
 	 button{width: 80px; height: 30px; font-size: 14px; font-weight: 600; text-align: center; border:1px solid #fee0a1; border-radius: 4px; background: white;}
 	 button:hover{cursor: pointer; background: #fee0a1; color: white;}
 	/* 버튼 */
 	 input[type="submit"]{width: 100px; height: 30px; font-size: 14px; font-weight: 600; text-align: center; border:1px solid #fee0a1; border-radius: 4px; background: white;}
 	 input[type="submit"]:hover{cursor: pointer; background: #fee0a1; color: white;}
 	 button{width: 80px; height: 30px; font-size: 14px; font-weight: 600; text-align: center; border:1px solid #fee0a1; border-radius: 4px; background: white;}
 	 button:hover{cursor: pointer; background: #fee0a1; color: white;}
	 input[type="button"]{width: 120px; height: 30px; font-size: 14px; font-weight: 600; text-align: center; border:1px solid #fee0a1; border-radius: 4px; background: white;}
	 input[type="button"]:hover{cursor: pointer; background: #fee0a1; color: white;}
	    	
    .modal {display: none; position: fixed; z-index: 1; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background-color: rgb(0,0,0); background-color: rgba(0,0,0,0.4);}
    .modal-content {background-color: #fefefe; margin: 20% auto; padding: 20px; border: 1px solid #888; width: 40%; height: 380px;}
    .close {color: #aaa; float: right; font-size: 28px; font-weight: bold;}
    .close:hover, .close:focus {color: black; text-decoration: none; cursor: pointer;}	
</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>
	<div class="outer">
		<div class="container">		
			<h1 align="center">정보 수정</h1>
				<div class="content">
				<form method="post" action="<%= request.getContextPath() %>/joinUser.us" id="joinUser" name="joinUser">
		    		<div class="profile-icon">
		    			<input type="hidden" name="savedPhoto" id="savedPhoto" value="">
						<img name="usPhoto" width=100px; height=100px; style="border-radius: 40px;" id="usPhoto" src="../images/flower.PNG">
						<input type="submit" id="updateBtn" value="사진 수정">
					</div>				
						<p class="input-label">아이디 &nbsp; <input type="text" class="input_text" name="userId" id="userId" autocomplete="off" disabled></p>
						<p class="input-label">비밀번호 &nbsp; <input type="password" class="input_text" name="userPwd" id="userPwd" required></p>
						<p class="input-label">비밀번호 확인 &nbsp; <input type="password" class="input_text" name="userPwdChk" id="userPwdChk" required></p>
						<p class="input-label">이름 &nbsp; <input type="text" name="userName" class="input_text" id="userName" autocomplete="off" required></p>
						<p class="input-label">닉네임 &nbsp; <input type="text" name="nickName" class="input_text" id="nickName" maxlength="6" autocomplete="off" required></p>
						<p class="input-label">연락처 &nbsp; <input type="text" name="phone" class="input_text" id="phone" maxlength="11" autocomplete="off" onkeyup="inputNumber(this);" required></p>
						<p class="input-label">이메일 &nbsp; <input type="email" name="email" class="input_text" id="email" autocomplete="off" required></p>
					<div class="input-box location">
						<p class="input-label">주소</p>
						<input type="text" name="post" class="postcodify_postcode5" value="" size="6">
						<button type="button" id="postcodify_search_button">주소 검색</button><br>
						<input type="text" name="address1" class="postcodify_address" value=""><br>
						<input type="text" name="address2" class="postcodify_extra_info" value="">
					</div>				
					<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
					<script>
						// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
						$(function(){
							$("#postcodify_search_button").postcodifyPopUp();
						});
					</script>	
					<br>			
					<div class="input-submit">
						<input type="submit" id="joinBtn" value="수정하기">
						<span><input type="button" id="pwdUp" value="비밀번호 변경"></span>
					</div>				
				</form>
				
		    <!-- The Modal -->
		    <div id="cmodal" class="modal">	 
		      <!-- Modal content -->
		      <form action="<%= request.getContextPath() %>/coupon.pt" id="cForm" method="post">
			      <div class="modal-content">
			        <span class="close">&times;</span>                                                               
			        <p><font style="font-size:25px; font-weight:500;">비밀번호 변경</font></p>
			        <br>
					<div class="input-box">
						<p class="input-label">기존 비밀번호</p><input type="password" name="userPwd" id="userPwd" required>
					</div>		        
					<div class="input-box">
						<p class="input-label">변경할 비밀번호</p><input type="password" name="userPwd" id="userPwd" required>
					</div>
					<div class="input-box">
						<p class="input-label">비밀번호 확인</p><input type="password" name="userPwdChk" id="userPwdChk" required>
					</div>
					<br>
					<span><input type="button" id="pwdUp" value="변경 하기"></span>
			      </div>
		      </form>	 
		    </div>
			<script type="text/javascript">	  
				$('#pwdUp').click(function(){
					$('#cmodal').attr('style', 'display:block');
				});
				$('span.close').click(function(){
					$('#cmodal').attr('style', 'display:none');
				});		
			
			</script>			
			</div>
		</div>
	</div>
	<c:import url="../common/footer.jsp"/>
</body>
</html>