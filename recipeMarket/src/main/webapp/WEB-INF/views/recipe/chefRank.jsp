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
    tr{
    	height: 15px;
    }
	.rank{
		width: 15px;
	}
	.nickName{
		width: 100px;
	}
	.posts{
		width: 80px;
	}
	.rating{
		width: 80px;
	}
	.follows{
		width: 80px;
	}
	.hits{
		width: 80px;
	}
	.followBox{
		width: 80px;
	}
	.followBtn{
		width: 80px;
		border-radius: 15px;
	}
		
</style>
</head>
<body>

<div class="outer" style="display:flex; justify-content: center;">
    <div class="container" style="width: 1000px; margin: 0 auto; display: flex; flex-direction: column; ">
        <h1>인기 셰프</h1>
        <div class="content" style="display: flex; margin: 30px 10px 30px 10px">
        	<table>
        		<c:forEach items="${chefList}" var="chef">
	        		<tr>
	        			<td class="rank">		<c:out value='rankNo'/>위</td>
	        			<td class="nickName">	<c:out value='chef.nickName'/></td>
	        			<td class="photoBox"><img class="photo" width="40px" height="40px" src=""></td>
	        			<td class="posts">		<c:out value='chef.posts'/>레시피</td>
	        			<td class="rating">		<c:out value='chef.rating'/>별점</td>
	        			<td class="follows">	<c:out value='chef.follows'/>구독</td>
	        			<td class="hits">		<c:out value='chef.hits'/>조회수</td>
	        			<td class="followBox"><button class="followBtn" type="button" onclick=''>구독하기</button></td>
	        		</tr>
        		</c:forEach>
        	</table>
        
        </div>
	</div>
</div>


</body>
</html>