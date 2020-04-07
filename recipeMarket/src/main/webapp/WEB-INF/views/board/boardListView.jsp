<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#insertBtn { 
		float: right;
	}
	.wrapper{
		height:1500px;
		background:#EAEAEA;
	}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<form>
		<div class="wrapper">
			<br>
			<div class="title"  style="background: white; height:70px">
	            <span style=" vertical-align: middle; font-size:30px; font-align:center; font-weight:bold; padding:15px;">
	               	토크 전체의 글을 볼수 있습니다.
	            </span>
	            <span style="float:right; padding:10px;">
	                <button style="background: #377a71; border-radius:5px;color:white; border:none; vertical-align: middle; font-size:20px;    font-size: 25px;
    								width: 120px;height: 50px; font-align:center; " id="insertBtn " >등록하기</button>
	            </span>
	         </div>
	         <br>
	         <div style="background: white; ">
	         	<table>
	         		<tr>
						<td rowspan=6><img width="150" height="150" src="../images/user.PNG"/></td>
						<td width="80%" style="font-size:30px">닉네임1</td>
						<td style="font-size:20px">♡</td>
						<td width="30px" style="font-size:20px">0</td>
						<td style="font-size:20px">댓글수</td>
						<td style="font-size:20px">0</td>			         		
	         		</tr>
	         		
	         		<tr>
	         			<td width="80%" colspan=5 style="color:gray; font-size:20px">자유톡</td>
	         		</tr>
	         		
	         		<tr>
	         			<td width="80%" colspan=5 style="font-size:20px">
	         				내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
	         				내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
	         				내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
	         				내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
	         			</td>
	         		</tr>
	         		
	       
	         		
	         	</table>
	         </div>
	         <br>
	         
	         <div style="background: white;">
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
	         
	         		
	         	</table>
	         </div>
	         
	         <br>
	         
	         <div style="background: white; ">
	         	<table>
	         		<tr>
	         		
						<td rowspan=6><img width="150" height="150" src="../images/user.PNG"/></td>
						<td width="80%" style="font-size:30px">닉네임3</td>
						<td style="font-size:20px">♡</td>
						<td width="30px" style="font-size:20px">0</td>
						<td style="font-size:20px">댓글수</td>
						<td style="font-size:20px">0</td>			         		
	         		</tr>
	         		<tr>
	         			<td width="80%" colspan=5 style="color:gray; font-size:20px">자유톡</td>
	         		</tr>
	         		
	         		<tr>
	         			<td width="80%" colspan=5 style="font-size:20px">
	         				내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
	         				내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
	         				내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
	         				내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
	         			</td>
	         		</tr>
	         		
	         		
	         		
	         		
	         	</table>
	         </div>
	         
	         
		         
	         
		</div>			
	</form>
</body>
</html>