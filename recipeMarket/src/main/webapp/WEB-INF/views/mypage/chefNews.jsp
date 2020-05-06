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
						<c:forEach items="${clist}" var="recipe" varStatus="status">
						<tr>
						<td>
						<img width=40px; height=40px; src='resources/upload/${ recipe.pName }'></td>
						<td>${recipe.nickName}</td>
						</tr>
						</c:forEach>
						<c:forEach items="${rlist}" var="r" varStatus="status">
						<tr>
							<td><img width="150px" height="150px" src="resources/upload/<c:out value="${r.thumb}"/>"></td>
						</tr>
						<tr>
						<td><c:out value="${r.title}"/></td>
						</tr>
						</c:forEach>
						
						<tr >
							<td></td>
							<%-- <td><img width="150px" height="150px" src="resources/upload/<c:out value="${recipe.thumb}"/>"></td> --%>
							<%-- <td><c:out value="${recipe.title}"/></td> --%>
						</tr>
						
						
						
	            	
					</table>
					<br>
				</div>
			</div>		
		</div>
	</div>
	
</body>
	<c:import url="../common/footer.jsp"/>
</html>