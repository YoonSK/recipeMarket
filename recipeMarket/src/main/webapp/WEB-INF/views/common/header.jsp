<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 마켓 RECIPE MARKET</title>
<style>
	/* 로고 */
	div.nav h1{margin: 0 30px 0 0; display: inline-block; vertical-align: top; margin-left: 150px; }
	/* 네비 상단 */
	div.menubar_top {margin: 0 auto; padding: 16px 0 0 176px; height: 60px;}
	p#welcome {position: absolute; right: 60px; top: -5px;}
	ul.nav_mem {display:inline; padding:0 10px; display: inline; padding: 0 10px; position: absolute; right: 1%; top: 80px;}
	ul.nav_mem li{list-style: none; padding: 0 3px; display: inline-block; font-size: 14px;}
	ul.nav_mem li a:link {text-decoration: none; color: grey;}
	#search_con{position: absolute; left: 30%; top: 40px;}
	#topSearch{height: 100px;}
	div#nick{position: absolute; right:70px; top: 75px; font-size: 15px; font-weight: bold;}
	/* 메뉴바*/
	div.menubar{margin-top: 10px; margin-bottom: 10px; height: 50px; background-color: #fee0a1;}
	div.menubar ul{margin: 0 auto; padding: 9px 30px 0; text-align: center;}
	div.menubar ul li{list-style: none; padding: 0; width: 1%; display: table-cell;}
	div.menubar ul li a:link {text-decoration: none; color: white; font-weight: 800; font-size: 20px;}
	div.menubar ul li a:hover {color: #76a693;}
	/* 검색창 */
	input {outline: none;}
	input[type=search] {-webkit-appearance: textfield; -webkit-box-sizing: content-box;	font-family: inherit; font-size: 100%;}
	input::-webkit-search-decoration,
	input::-webkit-search-cancel-button {display: none;}
	input[type=search] {background: #ffff url(https://static.tumblr.com/ftv85bp/MIXmud4tx/search-icon.png) no-repeat 9px center;
		border: solid 1px #add1c3; padding: 9px 10px 9px 32px; width: 200px; -webkit-border-radius: 10em; -moz-border-radius: 10em;
		border-radius: 10em; -webkit-transition: all .5s; -moz-transition: all .5s; transition: all .5s; margin-top: 20px; margin-left: 100px;}
	input[type=search]:focus {width: 300px; background-color: #fff; border-color: #377a71; -webkit-box-shadow: 0 0 5px rgba(109,207,246,.5); -moz-box-shadow: 0 0 5px rgba(109,207,246,.5); box-shadow: 0 0 5px rgba(109,207,246,.5);}
	input:-moz-placeholder {color: #999;}
	input::-webkit-input-placeholder {color: #999;}

</style>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script> 
</head>
<body>
	<header>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>	
	<div class="nav">
		<div class="nav_top">
		<form id="topSearch">
			<h1>
				<a href="${ contextPath }"><img src="resources/images/logo.png" width="250px" height="85px" style="position: absolute; left: 1%; top: 35px;"></a>
			</h1>
			<input type="search" placeholder="검색" id="search_con">
			<c:if test="${ empty sessionScope.loginUser }">				
			<ul class="nav_mem">						
				<li><a href="goLogin.me">로그인</a></li>
				<li><a href="goTerm.me">회원가입</a></li>						
			</ul>
			</c:if>	
			<c:if test="${ !empty sessionScope.loginUser && loginUser.id != 'ADMIN' }">	
				<p id="welcome">
		    		<c:if test="${ loginUser.pName != null }">	
						<img name="profile" width=60px; height=60px; style="border-radius: 40px;" id="profile" src="resources/upload/${ loginUser.pName }">
					</c:if>
					<c:if test="${ loginUser.pName == null }">
						<img name="profile" width=60px; height=60px; style="border-radius: 40px;" id="profile" src="resources/images/user.png">
					</c:if>							
				</p>				
				<div id="nick">
					${ loginUser.nickName }
				</div>
				<ul class="nav_mem">
					<li><a href="mypage.mp">마이페이지</a></li>
					<li><a href="logout.me">로그아웃</a></li>
				</ul>
			</c:if>	
			<c:if test="${ loginUser.id == 'ADMIN' }">	
				<p id="welcome">
					<img name="profile" width=60px; height=60px; style="border-radius: 40px;" id="profile" src="resources/images/user.png">						
				</p>				
				<div id="nick">
					${ loginUser.nickName }
				</div>
				<ul class="nav_mem">
					<li><a href="manager.ma">관리자 페이지</a></li>
					<li><a href="logout.me">로그아웃</a></li>
				</ul>
			</c:if>													
		</form>
		</div>
		<div class="menubar">
			<ul class="menubar_name">
				<li>
					<a href="${ contextPath }">홈</a>
				</li>
				<li>
					<a href="#">레시피</a>
				</li>
				<li>
					<a href="list.bu">스토어</a>
				</li>
				<li>
					<a href="blist.bo">자유게시판</a>
				</li>
				<li>
					<a href="#">쉐프 소개</a>
				</li>																
			</ul>				
		</div>
	</div>
	</header>
	<script>
		$(document).ready(function() {
			$("#search_con").keydown(function(e){
				if(e.keyCode == 13)
					alert("검색");
			});
		});
	</script>
</body>
</html>