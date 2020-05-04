<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 완료</title>
<style>
	div.container{height: 200px;}
	div.content{font-align: center; margin-top: 5%; margin-left: 40%;}
</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>	
	<div class="outer">
		<div class="container">
			<div class="content">
				<h2>주문번호 : ${ orderNo }</h2><br>
				결제가 완료되었습니다.<br>
				구매해주셔서 감사합니다.<br>
			</div>
		</div>
	</div>
	<c:import url="../common/footer.jsp"/>			
</body>
</html>