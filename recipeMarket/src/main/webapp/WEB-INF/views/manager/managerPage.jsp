<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script> 
<style>
	div#content{width: 800px; margin-left: 30%; margin-top: 2%; margin-bottom: 1%;}
	.menu_box {display: inline-block; width: 300px; height: 200px; margin: 10px; border: double 8px #fee0a1;}
	.menu_box:hover {display: inline-block; width: 300px; height: 200px; margin: 10px; border: double 8px #fff3c8;}	
	div > div.icon_con {margin-left: 100px; margin-top: 25px;}
	figcaption {padding: 1em; line-height: 1;}	
	figure {margin: 0; line-height: 0;}		
	img:hover{cursor: pointer;}	
	div > h2{margin-left: 25%;}
</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>	
	<div class="outer">
		<div id="container">
			<h2>관리자 페이지</h2>
			<div id="content">
				<div class="menu_box">
					<div class="icon_con">
						<figure>
							<a href="pManage.ma"><img src="resources/images/grocery.png" width=100px; height=100px;></a>
							<figcaption>상품 관리</figcaption>
						</figure>	
					</div>	
				</div>
				<div class="menu_box">
					<div class="icon_con">
						<figure>
							<a href="oManage.ma"><img src="resources/images/transport.png" width=100px; height=100px;></a>
							<figcaption>주문 관리</figcaption>
						</figure>					
					</div>
				</div>
				<div class="menu_box">
					<div class="icon_con">
						<figure>				
							<img src="resources/images/recipe.png" width=100px; height=100px;>
							<figcaption> 레시피</figcaption>
						</figure>						
					</div>
				</div>
				<div class="menu_box">
					<div class="icon_con">
						<figure>				
							<img src="resources/images/chef.png" width=100px; height=100px;>
							<figcaption>쉐프 소식</figcaption>
						</figure>						
					</div>
				</div>
			</div>
		</div>
	</div>	
	<c:import url="../common/footer.jsp"/>		
</body>
</html>