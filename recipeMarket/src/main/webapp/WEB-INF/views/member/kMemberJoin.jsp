<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	/* 가운데 정렬 */ 
	div.container{width: 100%; height: 100%;}
	div.content{width: 400px; margin: auto; padding-bottom: 10px;}
	/*  입력 창 */
	p.input_con {font-size: 16px; color: #000; margin-top: 10px; margin-bottom: 10px; margin-left: 80px;}
	p.input-label {font-size: 14px; color: gray; margin-left: 80px;}
	p.info-label {font-size: 14px; color: red; margin-left: 80px;}
	input.input_text{border-top: none; border-left: none; border-right: none;}
	input.input_birth{width: 35px; border-top: none; border-left: none; border-right: none;}
	/* 주소 */
	form#joinUser > div.location > input {width: 200px; border-top: none; border-left: none; border-right: none; margin-left: 80px;}
	form#joinUser > div.location > input {margin: 5px 0; border-top: none; border-left: none; border-right: none; margin-left: 80px;}
	form#joinUser > div.location > button#postcodify_searchBtn {width: 80px; height: 30px; font-size: 14px; font-weight: 600; text-align: center; border:1px solid #fee0a1; border-radius: 4px; background: white;}
	form#joinUser > div.location > button#postcodify_searchBtn:hover {cursor: pointer; background: #fee0a1; color: white;}		
 	/* 버튼 */
	input[type="submit"]{width: 80px; height: 30px; font-size: 14px; font-weight: 600; text-align: center; border:1px solid #fee0a1; border-radius: 4px; background: white;}
	input[type="submit"]:hover{cursor: pointer; background: #fee0a1; color: white;}
	input[type="button"]{width: 80px; height: 30px; font-size: 14px; font-weight: 600; text-align: center; border:1px solid #fee0a1; border-radius: 4px; background: white;}
	input[type="button"]:hover{cursor: pointer; background: #fee0a1; color: white;}
	div.input-submit{margin-left: 100px;}
 	 /* 사진 첨부 */
	figcaption {background: rgba(255, 243, 200, 0.5); padding: 1em; line-height: 1; position: absolute; left: 0; right: 0; bottom: 0; width: 71px; height: 10px; font-weight: bolder;}
	figure {margin: 0; line-height: 0; position: relative;} 	
	#imageArea{margin-left: 140px;}
	#imageArea:hover{cursor: pointer;}
	/* 중복 검사 */
	p.ava{display: none; font-size: 12px; margin-left: 80px;}
	p.ok{color: green; font-weight: bold;}
	p.error{color: red; font-weight: bold;}	
	p.ok2{color: green; font-weight: bold;}
	p.error2{color: red; font-weight: bold;}	
</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>
	<div class="outer">
		<div class="container">	
			<h1 align="center" class="title">회원가입</h1>
				<div class="content">
					<form method="post" action="kJoin.me" id="joinUser" name="joinUser" enctype="Multipart/form-data">			
			    		<div id="imageArea">
			    			<figure>
								<img name="mImageArea" width=100px; height=100px; id="mImageArea" src="resources/images/user.png">
								<figcaption>사진 첨부</figcaption>
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
										}
										reader.readAsDataURL(value.files[0]);
									}
								}
						</script>				
						<p class="info-label">*필수 입력란</p>				
						<p class="input_con">*이름 &nbsp; <input type="text" class="input_text" name="name" id="userName" autocomplete="off" required></p>
						<p class="input_con">*닉네임 &nbsp; <input type="text" class="input_text" name="nickName" id="nickName" maxlength="6" value="${ m.nickName }" autocomplete="off" required></p>	
						<p class="ava ok 2">이 닉네임은 사용 가능합니다.</p>
						<p class="ava error 2">이 닉네임은 사용 불가능합니다.</p>
						<input type="hidden" name="nickDupCheck" id="nickDupCheck" value="0"> 									
						<p class="input_con">*연락처 &nbsp; <input type="text" class="input_text" name="phone" id="phone" maxlength="11" autocomplete="off" onkeyup="inputNumber(this);" required></p>
						<p class="input-label">- 제외한 번호만 입력해주세요. </p>
						<p class="input_con">*이메일 &nbsp; <input type="email" class="input_text" id="email" value="${ m.email }" disabled><input type="hidden" name="email" value="${ m.email }"></p>
						<p class="input_con">*생년월일 &nbsp; 
							<input type="text" class="input_birth" name="year" id="year" maxlength="4"> 년
							<input type="text" class="input_birth" name="month" id="month" maxlength="2"> 월
							<input type="text" class="input_birth" name="day" id="day" maxlength="2"> 일
						</p>									
						<div class="input-box location">
							<p class="input_con">*주소</p>
							<input type="text" name="zip" class="postcodify_postcode5" value="" size="6" required>
							<button type="button" id="postcodify_searchBtn">주소 검색</button><br>
							<input type="text" name="address" class="postcodify_address" value="" required><br>
							<input type="text" name="address2" class="postcodify_extra_info" value="" required>
						</div>				
						<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
						<script>
							// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
							$(function(){
								$("#postcodify_searchBtn").postcodifyPopUp();
							});
							
							var isId, isPwd, isPwd2, isNick = false;
							
							$('input').focus(function(){
								$(this).css("box-shadow", "rgb(254, 224, 161) 1px 1px 1px 1px");
							});
							$('input').blur(function(){
								$(this).css("box-shadow", "none");
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
											$('p.ava.error.2').hide();
											$('p.ava.ok.2').show();
											$('#nickDupCheck').val(1);
											isNick = true;
										}else{
											$('p.ava.error.2').show();
											$('p.ava.ok.2').hide();
											$('#nickDupCheck').val(0);	
											isNick = false;
											}
										}
									});
								});

							$('form').submit(function(){
								if(isNick){
									if(confirm('회원가입 하시겠습니까?')){						
										return true;
									} else{
										return false;
									}
								} else{
									alert('회원가입 양식에 맞춰주세요.');
									if(!isNick) $('#nickName').focus();


									return false;
								}
							});							
							
						</script>	
						<br>			
						<div class="input-submit">
							<input type="submit" id="joinBtn" value="가입">
							<span><input type="button" id="backBtn" onclick='history.back();' value="돌아가기"></span>
						</div>				
					</form>		
			</div>	
		</div>	
	</div>
	<c:import url="../common/footer.jsp"/>	
</body>
</html>