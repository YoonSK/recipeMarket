<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>레시피 목록</title>
    <style>
        a{
            color: #0b2e13;
            text-decoration: none;
        }
        .box{
            display: flex;
            flex-direction: column;
            text-align: center;
            width: 150px;
            min-height: 175px;
            margin: 15px 15px auto;
        }
    </style>
</head>
<body>
<c:import url="../common/header.jsp"/>
<div class="outer" style="display:flex; justify-content: center;">
    <div class="container" style="width: 1000px; margin: 0 auto; display: flex; flex-direction: column">

        <h1>레시피 목록</h1>
		<div class="content" style="display: flex; flex-wrap : wrap;">
			<c:forEach items="${rlist}" var="recipe" varStatus="status">
				<div class="box">
	        		<a href="detail.rc?postNo=${recipe.postNo}">
	            	<img width="150px" height="150px" src="resources/upload/<c:out value="${recipe.thumb}"/>">
	       			<label class="recipeName"><c:out value="${recipe.title}"/></label>
	    			</a>
				</div>
			</c:forEach>
        </div>
    </div>
</div>
<c:import url="../common/footer.jsp"/>
</body>
</html>