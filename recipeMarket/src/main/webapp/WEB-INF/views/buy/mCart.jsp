<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
	<c:import url="../common/header.jsp"/>	
	<div class="outer">
		<div class="container">
			<div class="content">	
					<table id="table">
						<thead> <!-- 게시판 라벨 부분 -->
						<tr>
							<th width="10%"><input type='checkbox' name='checkAll' value='All' /></th>
							<th width="10%">사진</th>
							<th width="50%" class="title">상품명</th>
							<th width="15%">개수</th>
							<th width="20%">금액</th>
						</tr>
						</thead>
						<tbody>				
						<c:forEach var="order" items="${ list }">	
						<tr class="orderT">
							<td><input type='checkbox' class='check'/></td>
							<td><img src="/resources/upload/${ order.phName }"></td>
							<td>${ order.pName }</td>
							<td>${ order.prCount }</td>
							<td class="order_D"><fmt:formatNumber maxFractionDigits="3" value="${ order.price }"/> 원</td>																		
						</tr>		 
						</c:forEach>																						
						</tbody>
					</table>			
			</div>
		</div>
	</div>		
</body>
</html>