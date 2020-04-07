<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<form>
		<div class="wrapper">
			<br>
			<div class="content" style="background: white;">
	         	<table>
	         		<tr>
	         		
						<td rowspan=6><img width="150" height="150" src="../images/user.PNG"/></td>
						<td width="80%" style="font-size:30px">닉네임2</td>
						<td style="font-size:20px">♡</td>
						<td width="30px" style="font-size:20px">0</td>
						<td style="font-size:20px">댓글수</td>
						<td style="font-size:20px">0</td>			         		
	         		</tr>
	         		<tr>
	         			<td width="80%" colspan=5 style="color:gray; font-size:20px">요리톡</td>
	         		</tr>
	         		
	         		<tr>
	         			<td width="80%" colspan=5 style="font-size:20px">
	         				내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
	         				내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
	         				내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
	         				내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
	         			</td>
	         		</tr>
	         		
	         		<tr>
	         			<td width="80%" colspan=5 style="font-size:20px">
	         				<img width="500" height="300" src="../images/food.PNG"/>
	         			</td>
	         		</tr>
	         		<tr>
	         			<td><button id="like">♥</button></td>
	         		</tr>
	         
	         		
	         	</table>
	         </div>
	         <br>
	         <div class="content" style="background: white;">
	         	<h2>댓글</h2>
	         	<hr>
	         	<table>
	         		<tr>
						<td rowspan=3><img width="100" height="100" src="../images/user.PNG"/></td>
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
	         	
	         	<table>
	         		<tr>
						<td rowspan=3><img width="100" height="100" src="../images/user.PNG"/></td>
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
	         	
	         	<br>
	         	<div class="btnArea">
	         		<input type="text" placeholder="댓글을 입력해주세요." style="width:1000px; height:150px; font-size:15px;">
	         		<button style="width:150px; height:150px; font-size:30px;vertical-align: sub;">등록</button>
	         	</div>
	         </div>
	         
	         
				
		</div>
	</form>
	
</body>
</html>