<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	a{text-decoration: none}
	.borderTable{
		border-bottom: 1px solid gray;
	
	}
	
	.content{
		margin-left:20%;
	}
	.newsArea{
		border-top: 1px solid darkgray;
		width: 1000px;
	}
</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>
	<div class="outer">
		<div class="container">
			<div class="content">
				<div class="title">
					<h1>팔로우한 쉐프 소식</h1>
				</div>			
				<div class="newsArea">
					<table style="border-bottom: 1px solid lightgray;">
					<!-- 반복할 테이블 구성 -->
						<tr>
							<td><img src="../images/user.png" style="width:70px"/></td>
							<td><a href="">최고의요리사</a></td>
						</tr>
						<tr>
							<td></td>
							<td><img src="../images/1.jpg" style="width:200px"/></td>
							<td><img src="../images/1.jpg" style="width:200px"/></td>
							<td><img src="../images/1.jpg" style="width:200px"/></td>
							<td><img src="../images/1.jpg" style="width:200px"/></td>
						</tr>
					</table>
					<br>
					<table style="border-bottom: 1px solid lightgray;">
					<!-- 반복할 테이블 구성 -->
						<tr>
							<td><img src="../images/user.png" style="width:70px"/></td>
							<td><a href="">최고의요리사</a></td>
						</tr>
						<tr>
							<td></td>
							<td><img src="../images/1.jpg" style="width:200px"/></td>
							<td><img src="../images/1.jpg" style="width:200px"/></td>
							<td><img src="../images/1.jpg" style="width:200px"/></td>
							<td><img src="../images/1.jpg" style="width:200px"/></td>
						</tr>
					</table>
				</div>
			</div>		
		</div>
	</div>
	
</body>
	<c:import url="../common/footer.jsp"/>
</html>