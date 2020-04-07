<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	/* 가운데 정렬 */
	div.content{position: absolute; width: 400px; top: 25%; left: 42%;}
	/*  입력 창 */
	p.input_con {font-size: 16px; color: #000; margin-top: 10px; margin-bottom: 10px;}
	p.input-info {font-size: 14px; color: #5d5d5d;}
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

</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<jsp:include page="footer.jsp"/>	
	<div class="outer">
		<div class="container">	
			<h1 align="center" class="title">회원가입</h1>
				<div class="content">
					<form method="post" action="<%= request.getContextPath() %>/joinUser.us" id="joinUser" name="joinUser">
						<p class="input_con">아이디 &nbsp; <input type="text" class="input_text" name="userId" id="userId" autocomplete="off" required></p>
					<!-- <p class="input-info">* 영문 소문자/숫자 포함 5~16자</p> -->
						<p class="input_con">비밀번호 &nbsp; <input type="password" class="input_text" name="userPwd" id="userPwd" required></p>
						<!-- <p class="input-info">* 영문/숫자/특수문자 포함 8~16자</p> -->
						<p class="input_con">비밀번호 확인 &nbsp; <input type="password" class="input_text" name="userPwdChk" id="userPwdChk" required></p>
						<p class="input_con">이름 &nbsp; <input type="text" class="input_text" name="userName" id="userName" autocomplete="off" required></p>
						<p class="input_con">닉네임 &nbsp; <input type="text" class="input_text" name="nickName" id="nickName" maxlength="6" autocomplete="off" required></p>
						<p class="input_con">성별</p>
						<label class="box-radio-input"><input type="radio" name="cp_item" value="옵션1" checked="checked"><span>남자</span></label>
						<label class="box-radio-input"><input type="radio" name="cp_item" value="옵션2"><span>여자</span></label>				
						<p class="input_con">연락처 &nbsp; <input type="text" class="input_text" name="phone" id="phone" maxlength="11" autocomplete="off" onkeyup="inputNumber(this);" required></p>
	<!-- 					<p class="input-info">* - 제외한 번호만 입력해주세요. </p> -->
						<p class="input_con">이메일 &nbsp; <input type="email" class="input_text" name="email" id="email" autocomplete="off" required></p>
	<!-- 					<p class="input-info">* 아이디/비밀번호를 찾을 때 사용되므로 정확한 이메일을 입력해주세요.</p> -->
						<p class="input_con">생년월일 &nbsp; <input type="text" class="input_text" name="birth" id="birth" maxlength="8"></p>						
	<!-- 					<p class="input-info">* YYYYMMDD 형식으로 예) 19900101</p>	 -->				
						<div class="input-box location">
							<p class="input_con">주소</p>
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
							<input type="submit" id="joinBtn" value="가입">
							<span><input type="submit" id="joinBtn" value="돌아가기"></span>
						</div>				
					</form>
			</div>
		</div>	
	</div>
</body>
</html>