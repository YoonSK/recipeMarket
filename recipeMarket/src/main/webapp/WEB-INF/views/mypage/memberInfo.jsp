<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 조회</title>
<style>
	/* 가운데 정렬 */
	div.content{margin-left: 780px;}
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
	<c:import url="../common/header.jsp"/>
	<div class="outer">	
		<div class="container">
	    	<div class="content">
				<h2>회원 정보 조회</h2>
		    		<div class="profile-icon">
			    		<c:if test="${ loginUser.pName != null }">	
							<img name="profile" width=100px; height=100px; style="border-radius: 40px;" id="profile" src="resources/upload/${ loginUser.pName }">
						</c:if>
						<c:if test="${ loginUser.pName == null }">
							<img name="profile" width=100px; height=100px; style="border-radius: 40px;" id="profile" src="resources/images/user.png">
						</c:if>
					</div>
		    			<p class="input-label">아이디<span class="input-text">${ loginUser.id }</span></p>		    			
		    			<input type="hidden" name="userGender" value="">			
						<p class="input-label">이름<span class="input-text">${ loginUser.name }</span></p>
						<input type="hidden" name="userName" value="">
		    			<p class="input-label">닉네임<span class="input-text">${ loginUser.nickName }</span></p>
		    			<input type="hidden" name="userNick" value="">
		    			<p class="input-label">연락처<span class="input-text">${ loginUser.phone }</span></p>
		    			<input type="hidden" name="userPhone" value="">
		    			<p class="input-label">이메일<span class="input-text">${ loginUser.nickName }</span></p>
		    			<input type="hidden" name="userEmail" value="">
		    			<p class="input-label">생년월일<span class="input-text">${ loginUser.birth }</span></p>
		    			<input type="hidden" name="usBirth" value="">
		    			<p class="input-label">주소		    			
			    			<c:if test="${ loginUser.zip != null && loginUser.address !=null && loginUser.address2 != null }">	
							<span class="input-text">${ loginUser.zip }<br>${ loginUser.address }<br>${ loginUser.address2 }</span>
			    			</c:if>	
		    			</p>		    					    			
			    		<input type="button" id="updateBtn" onclick="location.href='gomupdate.mp'" value="회원정보 수정">
						<c:url var="mdelete" value="mdelete.me">
							<c:param name="no" value="${ loginUser.memberNo }"/>
						</c:url>			 		
			    		<input id="deleteBtn" type="button" onclick="mDelete();" value="회원탈퇴">
			    		<script>
				    		function mDelete(){
				    			var answer = confirm("정말로 탈퇴하시겠습니까?");
				    			if(answer){
				    				location.replace('${ mdelete }');
				    			}
				    		}
			    		</script>
	    	</div>
    	</div>
	</div>
	<c:import url="../common/footer.jsp"/>
</body>
</html>