<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script> 
<style>
	div#content{width: 800px; height: 400px; position:absolute; left:40%; top:45%; margin-left:-150px; margin-top:-150px;}
	.menu_box {display: inline-block; width: 300px; height: 200px; margin: 10px; border: double 8px #fee0a1;}
	.menu_box:hover {display: inline-block; width: 300px; height: 200px; margin: 10px; border: double 8px #fff3c8;}	
	div > div.icon_con {margin-left: 100px; margin-top: 25px;}
	figcaption {padding: 1em; line-height: 1;}	
	figure {margin: 0; line-height: 0;}		
	img:hover{cursor: pointer;}	
	div > h2{position: absolute; left: 410px;}
</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<jsp:include page="footer.jsp"/>	
	<div class="outer">
		<div id="container">
			<h2>마이 페이지</h2>
			<div id="content">
				<div class="menu_box">
					<div class="icon_con">
						<figure>
							<img src="../images/user.png" width=100px; height=100px;>
							<figcaption>회원 정보</figcaption>
						</figure>	
					</div>	
				</div>
				<div class="menu_box">
					<div class="icon_con">
						<figure>
							<img src="../images/cart.png" width=100px; height=100px;>
							<figcaption>주문 내역</figcaption>
						</figure>					
					</div>
				</div>
				<div class="menu_box">
					<div class="icon_con">
						<figure>				
							<img src="../images/recipe.png" width=100px; height=100px;>
							<figcaption> 레시피</figcaption>
						</figure>						
					</div>
				</div>
				<div class="menu_box">
					<div class="icon_con">
						<figure>				
							<img src="../images/chef.png" width=100px; height=100px;>
							<figcaption>쉐프 소식</figcaption>
						</figure>						
					</div>
				</div>
			</div>
		</div>
	</div>	
</body>
</html>