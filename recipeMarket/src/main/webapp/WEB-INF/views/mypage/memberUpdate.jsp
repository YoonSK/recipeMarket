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
	div.container{width: 100%; height: 100%;}
	div.content{width: 400px; margin: auto; padding-bottom: 10px;}
	/*  입력 창 */
	p.input_con {font-size: 16px; color: #000; margin-top: 10px; margin-bottom: 10px; margin-left: 80px;}
	p.input-label {font-size: 14px; color: gray; margin-left: 80px;}
	p.input-mlabel {font-size: 14px; color: gray;}	
	p.info-label {font-size: 14px; color: red; margin-left: 80px;}
	input.input_text{border-top: none; border-left: none; border-right: none;}
	input.input_birth{width: 35px; border-top: none; border-left: none; border-right: none;}
	/* 주소 */
	form#mUpdate > div.location > p.input-label {font-size: 14px; color: gray; margin-left: 80px;}	
	form#mUpdate > div.location > input {width: 200px; border-top: none; border-left: none; border-right: none; margin-left: 80px;}
	form#mUpdate > div.location > input {margin: 5px 0; border-top: none; border-left: none; border-right: none; margin-left: 80px;}
	form#mUpdate > div.location > #postcodify_searchBtn {width: 80px; height: 30px; font-size: 14px; font-weight: 600; text-align: center; border:1px solid #fee0a1; border-radius: 4px; background: white;}
	form#mUpdate > div.location > #postcodify_searchBtn:hover {cursor: pointer; background: #fee0a1; color: white;}		
 	/* 버튼 */
	input[type="submit"]{width: 80px; height: 30px; font-size: 14px; font-weight: 600; text-align: center; border:1px solid #fee0a1; border-radius: 4px; background: white;}
	input[type="submit"]:hover{cursor: pointer; background: #fee0a1; color: white;}
	input[type="button"]{width: 100px; height: 30px; font-size: 14px; font-weight: 600; text-align: center; border:1px solid #fee0a1; border-radius: 4px; background: white;}
	input[type="button"]:hover{cursor: pointer; background: #fee0a1; color: white;}
	div.input-submit{margin-left: 100px;}
 	 /* 사진 첨부 */
 	div#imageArea {margin-left: 150px;}
	figcaption {background: rgba(255, 243, 200, 0.5); padding: 1em; line-height: 1; position: absolute; left: 0; right: 0; bottom: 0; width: 71px; height: 10px; font-weight: bolder;}
	figure {margin: 0; line-height: 0; position: relative;} 	
	#ImageArea{margin-left: 140px;}
	#ImageArea:hover{cursor: pointer;}
	
	/*  닉네임 중복 검사 */
	#mUpdate > p.ava{display: none; font-size: 12px; margin-left: 80px;}
	p.ok{color: green; font-weight: bold; font-size: 12px;}
	p.error{color: red; font-weight: bold; display: none; font-size: 12px;}	
	
	/* 비밀번호 변경 */	    	
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
			<h1 align="center">회원 정보 수정</h1>
				<div class="content">
					<form method="post" action="mUpdate.mp" id="mUpdate" name="mUpdate" enctype="Multipart/form-data">			
			    		<div id="imageArea">
			    			<figure>
				    		<c:if test="${ loginUser.pName != null }">	
								<img name="profile" width=100px; height=100px; class="profile" src="resources/upload/${ loginUser.pName }">
							</c:if>
							<c:if test="${ loginUser.pName == null }">
								<img name="profile" width=100px; height=100px; class="profile" src="resources/images/user.png">
							</c:if>
								<img id="mImageArea" width=100px; height=100px; style="display: none;" src="">
								<figcaption>사진 수정</figcaption>
							</figure>	
						</div>						
						<div id="uArea">
							<input type="file" name= "mImage" id="mImage" multiple="multiple" onchange="LoadImg(this)">
						</div>
						<br>
						<script>
							$(function(){
								$("#uArea").hide();
								$("#imageArea").click(function(){
									$("#mImage").click();
								});
							});
								function LoadImg(value){
									if(value.files && value.files[0]){
										var reader = new FileReader();
										reader.onload = function(e){								
											$("#mImageArea").attr("src", e.target.result);
											$('.profile').css("display", "none");	
											$('#mImageArea').css("display", "block");													
										}
										reader.readAsDataURL(value.files[0]);
									}
								}
						</script>	
						<p class="input-label">아이디 &nbsp; <input type="text" class="input_text" name="id" id="id" autocomplete="off" value="${ loginUser.id }" disabled></p>
						<p class="input-label">이름 &nbsp; <input type="text" name="name" class="input_text" id="userName" autocomplete="off" required value="${ loginUser.name }" ></p>
						<p class="input-label">닉네임 &nbsp; <input type="text" class="input_text" name="nickName" id="nickName" maxlength="6" autocomplete="off" required value="${ loginUser.nickName }"></p>	
						<p class="ava ok">이 닉네임은 사용 가능합니다.</p>
						<p class="ava error">이 닉네임은 사용 불가능합니다.</p>
						<input type="hidden" name="nickDupCheck" id="nickDupCheck" value="0"> 
						<p class="input-label">연락처 &nbsp; <input type="text" name="phone" class="input_text" id="phone" maxlength="11" autocomplete="off" onkeyup="inputNumber(this);" required value="${ loginUser.phone }" ></p>
						<p class="input-label">이메일 &nbsp; <input type="email" name="email" class="input_text" id="email" autocomplete="off" required value="${ loginUser.email }" ></p>
						<div class="input-box location">
							<p class="input-label">주소</p>
							<input type="text" name="zip" class="postcodify_postcode5" size="6" value="${ loginUser.zip }" >
							<button type="button" id="postcodify_searchBtn">주소 검색</button><br>
							<input type="text" name="address" class="postcodify_address" value="${ loginUser.address }" ><br>
							<input type="text" name="address2" class="postcodify_extra_info" value="${ loginUser.address2 }" >
						</div>
					<!-- 보낼 값  -->	
					<input type="hidden" name="memberNo" value="${ loginUser.memberNo }">		
					<input type="hidden" name="memberNo" value="${ loginUser.pwd }">									
					<input type="hidden" name="id" value="${ loginUser.id }">	
					<input type="hidden" name="birth" value="${ loginUser.birth }">	
					<input type="hidden" name="grade" value="${ loginUser.grade }">	
					<input type="hidden" name="deleted" value="${ loginUser.deleted }">	
					<input type="hidden" name="pName" value="${ loginUser.pName }">	
																																
					<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
					<script>
						// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
						$(function(){
							$("#postcodify_searchBtn").postcodifyPopUp();
						});
					</script>	
					<br>			
					<div class="input-submit">
						<input type="submit" id="updateBtn" value="수정하기">
						<span><input type="button" id="pwdUp" value="비밀번호 변경"></span>
					</div>				
				</form>
				
		    <!-- The Modal -->
		    <div id="cmodal" class="modal">	 
		      <!-- Modal content -->
		      <form action="pwdUpdate.mp" id="pForm" method="post">
			      <div class="modal-content">
			        <span class="close">&times;</span>                                                               
			        <p><font style="font-size:25px; font-weight:500;">비밀번호 변경</font></p>
			        <br>
					<div class="input-box">
						<p class="input-mlabel">기존 비밀번호</p><input type="password" name="pwd" id="pwd" required>
					</div>		        
					<div class="input-box">
						<p class="input-mlabel">변경할 비밀번호</p><input type="password" name="newPwd" id="newPwd" required>
						<p class="ava error 3">이 비밀번호는 사용 불가능합니다.</p>	
					</div>
					<div class="input-box">
						<p class="input-mlabel">비밀번호 확인</p><input type="password" name="newPwd2" id="newPwd2" required>
						<p class="ava error 2">비밀번호가 다릅니다.</p>									
					</div>
					<br>
					<span><input type="submit" id="pwdUp" value="변경 하기"></span>
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

				
				// 닉네임 중복 검사
				$('#nickName').on('keyup', function(){
					var nickName = $(this).val().trim();
					
					if(nickName.length < 1){
						$('.ava').hide();
						$('#nickDupCheck').val(0);
						
						return;
					}

					$.ajax({
						url: 'dupnick.me',
						data: {nickName:nickName},
						success: function(data){
							if(data == 'true'){
								$('p.ava.error').hide();
								$('p.ava.ok').show();
								$('#nickDupCheck').val(1);
							}else{
								$('p.ava.error').show();
								$('p.ava.ok').hide();
								$('#nickDupCheck').val(0);												
								}
							}
						});
					});				

				// 비밀번호 유효성 검사
				$('#newPwd').on('keyup', function(){
					var userPwd = $(this).val().trim();
					var pwdCheck = /^(?=.*[a-zA-Z!@#\$%\^&*?])(?=.*[0-9]).{6,16}$/;								
					if(userPwd == '' || !pwdCheck.test(userPwd)){
						$(this).focus();
						$('p.ava.error.3').show();	
					}else{
						$('p.ava.error.3').hide();										
					}
				});		
									
				
				// 비밀번호 확인
				$('#newPwd2').focusout(function(){
					if($('#newPwd').val() != $('#newPwd2').val()){
						$('p.ava.error.2').show();
					}else{
						$('p.ava.error.2').hide();									
					}
				});
				
			</script>			
			</div>
		</div>
	</div>
	<c:import url="../common/footer.jsp"/>
</body>
</html>