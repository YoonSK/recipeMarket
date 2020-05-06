<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인기 셰프</title>
<style>
	table{
		border-collapse: collapse;
	}
	button{
    	border: none;
        }
    th{
    	height: 15px;
    }
    td{
    	border-top: 1px solid #444444;
    
    }
	.rank{
		min-width: 40px;
		font-size: 25px;
		font-weight: 500;
	}
	.nickName{
		min-width: 100px;
		margin-right: 20px;
		font-size: 25px;
		font-weight: 500;
	}
	.photo{
		border-radius: 25px;
	}
	.posts{
		width: 80px;
		font-size: 20px;
		font-weight: 500;
	}
	.rating{
		min-width: 100px;
		font-size: 20px;
		font-weight: 500;
	}
	.follows{
		min-width: 100px;
		font-size: 20px;
		font-weight: 500;
	}
	.hits{
		width: 80px;
		font-size: 20px;
		font-weight: 500;
	}
	.followBox{
		width: 80px;
	}
	.followBtn{
		width: 80px;
		height: 30px;
		border-radius: 5px;
		font-size: 15px;
		font-weight: 400;
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
        		<c:set var="rankNo" value="${rankNo +1}"/>
	        		<tr>
	        			<td class="rank"><c:out value='${rankNo}'/></td>
	        			<td class="nickName"><c:out value='${chef.nickName}'/></td>
	        			<td class="photoBox"><img class="photo" width="40px" height="40px" src="resources/upload/<c:out value="${chef.pName}"/>"></td>
	        			<td class="posts">레시피 <c:out value='${chef.posts}'/></td>
	        			<td class="rating">별점 <c:out value='${chef.rating}'/></td>
	        			<td class="follows">구독	<c:out value='${chef.follows}'/></td>
	        			<td class="hits">조회수 <c:out value='${chef.hits}'/></td>
	        			<td class="followBox"><button class="followBtn" type="button" onclick='follow.rc?memberNo="${chef.memberNo}"'>구독하기</button></td>
	        		</tr>
        		</c:forEach>
        	</table>
        </div>
	</div>
</div>


</body>
</html>