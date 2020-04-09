<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#insertBtn { 
		float: right;
		background: #377a71;
		border-radius:5px;
		color:white; 
		border:none; 
		vertical-align: middle; 
		font-size: 25px;
    	width: 120px;
    	height: 50px; 
    	font-align:center; 
	}
	.wrapper{
		height:1500px;
		background:#EAEAEA;
	}
	
	#profileImg{
		width:100px; 
		height:100px;
		vertical-align: middle;  
		margin-left: 15%;
	}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
		<div class="wrapper">
			<br>
			<div class="title"  style="background: white; height:70px; width:1500px; margin:0 auto;">
	            <span style=" vertical-align: middle; font-size:30px; font-align:center; font-weight:bold; padding:15px;">
	               	토크 전체의 글을 볼수 있습니다.
	            </span>
	            <span style="float:right; padding:10px; margin:0 auto;">
	            	<c:if test="${ !empty loginUser }">
	                <button id="insertBtn" onclick="location.href='insertView.bo';">등록하기</button>
	            	</c:if>
	            </span>
	         </div>

	         
	         <br>
	         <c:if test="${ empty list }">
	         	<h2 align="center">게시글이 존재하지 않습니다.</h2>
	         </c:if>
	         
	         <c:forEach var="b" items="${ list }">
		         <div style="background: white; width:1500px; margin:0 auto;">
		         	<table>
		         		<tr>
							<td rowspan=6 width="150" height="150"><img id="profileImg" src="resources/images/user.png"/></td>
							<td width="80%" style="font-size:30px">${ b.memberNo }</td>
							<td style="font-size:20px">♡</td>
							<td width="30px" style="font-size:20px">0</td>
							<td style="font-size:20px">댓글수</td>
							<td style="font-size:20px">0</td>			         		
		         		</tr>
		         		
		         		<tr>
		         			<td width="80%" colspan=5 style="color:gray; font-size:20px">${ b.category }  (작성일:${b.createDate})</td>
		         		</tr>
		         		
		         		<tr>
		         			<td width="80%" colspan=5 style="font-size:20px">${ b.content }</td>
		         		</tr>
		         		
		         		<tr>
		         			<td width="80%" colspan=5 >
		         				<img width="500" height="300" src="resources/images/food.PNG"/>
		         			</td>
	         			</tr>
		         		
		       
		         		
		         	</table>
		         </div>
		         <br>
	         
	         </c:forEach>
	         
	         
	         
	         
	         <!-- <div style="background: white; width:1500px; margin:0 auto;">
	         	<table>
	         		<tr>
	         		
						<td rowspan=6><img width="150" height="150" src="resources/images/user.png"/></td>
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
	         				<img width="500" height="300" src="resources/images/food.PNG"/>
	         			</td>
	         		</tr>
	         
	         		
	         	</table>
	         </div>
	         
	         <br>
	         
	         <div style="background: white; width:1500px; margin:0 auto;">
	         	<table>
	         		<tr>
	         		
						<td rowspan=6><img width="150" height="150" src="resources/images/user.png"/></td>
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
	         </div> -->
	         
	         
	</div>	         
	         

	<%@ include file="../common/footer.jsp" %>
</body>
</html>