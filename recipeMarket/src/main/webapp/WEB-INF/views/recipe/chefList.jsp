<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인기 셰프</title>
<style>
	button{
    	border: none;
        }
		
</style>
</head>
<body>

<div class="outer" style="display:flex; justify-content: center;">
    <div class="container" style="width: 1000px; margin: 0 auto; display: flex; flex-direction: column; ">
        <h1>구독 셰프</h1>
        <div class="content" style="display: flex; margin: 30px 10px 30px 10px">
     		<c:forEach items="${chefList}" var="chef">
      			
     		</c:forEach>
        </div>
	</div>
</div>


</body>
</html>