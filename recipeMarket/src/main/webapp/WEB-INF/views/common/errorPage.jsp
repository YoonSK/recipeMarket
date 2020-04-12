<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../common/header.jsp"/>
	<div id="error-container" style="text-align: center;">
		<h1>Error</h1>
		<h2 style="color:red;">${ message }</h2>
		<h2 style="color:red;">${ requestScope['javax.servlet.error.message'] }</h2>
	</div>
	<script type="text/javascript">
		var msg = '${msg}';
		var url = '${url}';
		alert(msg);
		document.location.href="gomupdate.mp";

	</script>
</body>
</html>