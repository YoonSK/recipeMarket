<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.wrapper{
		
		height:1500px;
		background:#EAEAEA;
		
	}
	
	.content{
		width: 60%;
		margin-left:15%;
	}
	#like{
		font-size: 20px;
    	text-align: center;
    	width: 100px;
    	height: 80px;
   		margin-left: 50%;
	}
	
	#profileImg{
		width:100px; 
		height:100px;
		vertical-align: middle;  
		margin-left: 15%;
		border-radius: 50%;

	}
	#bImg{
		width:80%;
		height:500px;
	}
	
	#insertBtn{
		font-size: 25px;
    	background: #74b243;
    	color: #fff;
    	padding: 10px 30px;
    	border-radius: 10px;
    	border: 1px solid #497725;
    	cursor:pointer;
	}
	
	#backBtn{
		font-size: 25px;
		padding: 10px 30px; 
    	border-radius: 10px;
    	cursor:pointer;
	}
	
	#removeBtn{
		font-size: 25px;
		background: tomato;
    	color: white;
    	border: 1px solid red;
		padding: 10px 30px; 
    	border-radius: 10px;
    	cursor:pointer;
	}

	
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<form>
		<div class="wrapper">
			<br>
			<div class="content" style="background: white;">
	         	<table id ="contentTable" style="padding-bottom: 50px">
	         		<tr>
	         			<c:if test="${ profile.pName != null}">
						<td rowspan=5 width="150px" height="150px">
							<img id="profileImg"  src="resources/upload/${ profile.pName }"/>
						</td>
						</c:if>
						
						<c:if test="${ profile.pName == null}">
						<td rowspan=5 width="150px" height="150px">
							<img id="profileImg"  src="resources/images/user.png"/>
						</td>
						</c:if>
						<td width="65%" style="font-size:30px">${ board.nickName }</td>
						<td style="font-size:20px; width:30px;">♡</td>
						<td width="30px" style="font-size:20px">0</td>
						<td style="font-size:20px; width:70px;">댓글수</td>
						<td style="font-size:20px; width:30px">0</td>			         		
	         		</tr>
	         		
	         		<tr>
	         			<td width="80%" colspan=5 style="color:gray; font-size:20px">${board.category }</td>
	         		</tr>
	         		
	         		<tr>
	         			<td width="80%" colspan=5 style="font-size:20px">
	         				${board.content}
	         			</td>
	         		</tr>
	         		
	         		<tr>
	         			<c:if test="${ board.pName != null }">
	         			<td width="80%" colspan=5 style="font-size:20px; text-align:center;">
	         				<img id= "bImg" src="resources/upload/${ board.pName }" style="padding:20px;"/>
	         			</td>
	         			</c:if>
	         		</tr>
	         		<!-- <tr>
	         			<td>
		         			<button id="like">
		         				<img src="https://recipe1.ezmember.co.kr/img/btn_feel.gif" alt="">
		         			</button>
	         			</td>
	         		</tr> -->
	         
	         		
	         	</table>
				<div class="input-submit" align="center" style="padding-bottom: 30px">
		            <input type="submit" value="수정하기"  id="insertBtn"> &nbsp; &nbsp;
		         	<button onclick="location.href='blist.bo'" id="removeBtn">삭제하기</button> &nbsp; &nbsp;
		         	<button onclick="location.href='blist.bo'" id="backBtn">목록으로</button>
		         </div>
	         	
	         </div>
	         <br>
	         <div class="content" style="background: white;">
	         	<h2>댓글</h2>
	         	<hr>
	         	<table>
	         		<tr>
						<td rowspan=3><img width="100" height="100" src="resources/images/user.png"/></td>
						<td style="width:150px; font-size:20px">닉네임2</td>
						<td style="font-size:15px">2020-04-01</td>		         		
	         		</tr>
	         		
	         		<tr>
	         			<td  colspan=5 style="font-size:13px">
	         				내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
	         				내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
	         			</td>
	         		</tr>
	         	</table>
	         	<hr>
	         	
	         	
	         	<br>
	         	
	         	<div>
	         		<button style="width:200px; height:150px; float:left;">
		         		<img style="width:70%; height:70%;" src="resources/images/heart.png">
		         	</button>
	         	</div>
	         	
	         	<div style=" height:150px; float:left;">
	         		<input type="text" placeholder="댓글을 입력해주세요." style="width:800px; height:150px; font-size:25px; float:left;">
	         		<button style="width:200px; height:150px; font-size:30px; vertical-align: sub;  float:left;">등록</button>
	         	</div>
	         </div>
	         
	         
				
		</div>
	</form>
	
</body>
</html>