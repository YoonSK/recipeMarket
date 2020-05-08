<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인기 셰프</title>
<style>
	a:link { color: black; text-decoration: none}
    a:visited {color: black;}
    a:hover{ color : silver;}
	button{
    	border: none;
        }
    .box{
		display: flex;
		flex-direction: column;
		text-align: center;
		width: 70px;
		height: 100px;
		margin: 15px 15px auto;
        }
		
</style>
</head>
<body>
<c:import url="../common/header.jsp"/>
<div class="outer" style="display:flex; justify-content: center;">
    <div class="container" style="width: 1000px; margin: 0 auto; display: flex; flex-direction: column; ">
        <h1>구독 셰프</h1>
        <div class="content" style="display: flex; flex-wrap : wrap;">
     		<c:forEach items="${chefList}" var="chef">
				<div class="box">
	        		<a href="list.rc?memberNo=${chef.memberNo}">
	            	<img width="70px" height="70px" src="resources/upload/<c:out value="${chef.pName}"/>">
	       			<label class="nickName"><c:out value="${chef.nickName}"/></label>
	    			</a>
				</div>
     		</c:forEach>
        </div>
	</div>
</div>
<c:import url="../common/footer.jsp"/>
</body>
</html>
