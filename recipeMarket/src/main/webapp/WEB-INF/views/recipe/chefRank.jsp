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
	table{
		border-collapse: collapse;
		    width: 100%;
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
		font-size: 24px;
	}
	.profileBox{
		display:flex;
		justify-conten:center;
		margin-right: 10px;
	}
	.nickName{
		min-width: 70px;
		font-size: 20px;
		font-weight: 500;
		margin-right: 5px;
	}
	.photo{
		border-radius: 25px;
	}
	.posts{
		width: 80px;
	}
	.rating{
		min-width: 100px;
	}
	.follows{
		min-width: 100px;
	}
	.hits{
		width: 80px;
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
	.itemName{
		font-size: 15px;
		font-weight: 400;
	}
	.itemVal{
		font-size: 20px;
		font-weight: 500;
	}
		
</style>
</head>
<body>
<c:import url="../common/header.jsp"/>

<div class="outer" style="display:flex; justify-content: center;min-height:800px;">
    <div class="container" style="width: 1000px; margin: 0 auto; display: flex; flex-direction: column; ">
        <h1>인기 셰프</h1>
        <div class="content" style="display: flex; margin: 30px 10px 30px 10px">
        	<table>
        		<c:set var="sorter" value="${searchCon.sorter}"/>
        			<tr>
        				<th></th>
        				<th></th>
        				<th></th>
        				<th><button id="psort" type="submit" onclick='location.href="chefRank.rc?sorter=POSTS"'>작성순</button></th>
        				<th><button id="rsort" type="submit" onclick='location.href="chefRank.rc?sorter=RATE"'>별점순</button></th>
        				<th><button id="fsort" type="submit" onclick='location.href="chefRank.rc?sorter=FOLLOWS"'>구독순</button></th>
        				<th><button id="hsort" type="submit" onclick='location.href="chefRank.rc?sorter=HITS"'>조회순</button></th>
        				<th></th>
        			</tr>
        		<c:forEach items="${chefList}" var="chef">
        		<c:set var="rankNo" value="${rankNo +1}"/>
	        		<tr>
	        			<td><div class="rank">
	        					<c:out value='${rankNo}'/>
	        				</div>
	        			</td>
	        			<td><div class="profileBox">
		        			<div class="nickName">
		        				<a href="list.rc?memberNo=${chef.memberNo}">
		        				<c:out value='${chef.nickName}'/>
		        				</a>
		        			</div>
		        			<div class="photoBox">
	        				<a href="list.rc?memberNo=${chef.memberNo}">
	        				<img class="photo" width="40px" height="40px" src="resources/upload/<c:out value="${chef.pName}"/>">
	        				</a>
	        				</div>
	        			</div>
	        			</td>
	        			<td>
	        			</td>
	        			<td><div class="posts">
	        				<span class="itemName">레시피</span>
	        				<span class="itemVal"><c:out value='${chef.posts}'/></span>
	        			</div></td>
	        			<td><div class="rating">
	        				<span class="itemName">별점</span>
	        				<span class="itemVal"><c:out value='${chef.rating}'/></span>
	        				</div>
	        			</td>
	        			<td><div class="follows">
	        				<span class="itemName">구독</span>
	        				<span class="itemVal"><c:out value='${chef.follows}'/></span>
	        				</div>
	        			</td>
	        			<td><div class="hits">
	        				<span class="itemName">조회수</span>
	        				<span class="itemVal"><c:out value='${chef.hits}'/></span>
	        				</div>	
	        			</td>
	        			<td><div class="followBox"><a href='follow.rc?targetNo=${chef.memberNo}'>
	        				<button class="followBtn" type="button">구독하기</button>
	        				</a></div>
	        			</td>
	        		</tr>
        		</c:forEach>
        	</table>
        </div>
	</div>
</div>
<c:import url="../common/footer.jsp"/>
</body>
<script>

window.onload = function(){
	var sorter = ${sorter};
	if (sorter == "POSTS"){document.getElementById("psort").style.backgroundColor = "#ccc";}
	if (sorter == "RATE"){document.getElementById("rsort").style.backgroundColor = "gray";}
	if (sorter == "FOLLOWS"){document.getElementById("fsort").style.backgroundColor = "gray";}
	if (sorter == "HITS"){document.getElementById("hsort").style.backgroundColor = "gray";}
};

</script>
</html>