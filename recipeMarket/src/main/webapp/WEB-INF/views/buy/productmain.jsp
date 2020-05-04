<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    
</style>
<link rel="stylesheet" type="text/css" href="<c:url value='resources/css/list.css'/>">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<header>
    <%@ include file="../common/header.jsp" %>
   
    </header>
    <div class="s_contents">
	<div class="main_book">
		<c:forEach items="${ productMap }" var="pm">
			<c:if test="${ pm.key == '곡류' }">
				<h3>곡류</h3>
				<c:if test="${ empty pm.value }">
					<div class="book">
						등록된 곡류가 없습니다.
					</div>
				</c:if>
				<c:if test="${ !empty pm.value }">
					<div class="book">
						<a href="${contextPath}/productdetail.bu?name=${pm.value.name}">
			            <img class="link"  src="images/1px.gif"> 
			            </a> 
			                <img width="121" height="154" 
			                     src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
			            <div class="title">${ pm.value.name }</div>
			            <div class="price">${ pm.value.price }</div>
					</div>
					<div class="book">
			           <font size=20> <a href="#">more</a></font>
			         </div>
				</c:if>
			</c:if>
		</c:forEach>
	</div>
	<div class="clear"></div>
	
	<div class="main_book">
		<c:forEach items="${ productMap }" var="pm">
			<c:if test="${ pm.key == '과일류' }">
				<h3>과일류</h3>
				<c:if test="${ empty pm.value }">
					<div class="book">
						등록된 과일류가 없습니다.
					</div>
				</c:if>
				<c:if test="${ !empty pm.value }">
					<div class="book">
						<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
			            <img class="link"  src="images/1px.gif"> 
			            </a> 
			                <img width="121" height="154" 
			                     src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
			            <div class="title">${ pm.value.name }</div>
			            <div class="price">${ pm.value.price }</div>
					</div>
					<div class="book">
			           <font size=20> <a href="#">more</a></font>
			         </div>
				</c:if>
			</c:if>
		</c:forEach>
	</div>
	<div class="clear"></div>
	
	<div class="main_book">
		<c:forEach items="${ productMap }" var="pm">
			<c:if test="${ pm.key == '채소류' }">
				<h3>채소류</h3>
				<c:if test="${ empty pm.value }">
					<div class="book">
						등록된 채소류가 없습니다.
					</div>
				</c:if>
				<c:if test="${ !empty pm.value }">
					<div class="book">
						<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
			            <img class="link"  src="images/1px.gif"> 
			            </a> 
			                <img width="121" height="154" 
			                     src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
			            <div class="title">${ pm.value.name }</div>
			            <div class="price">${ pm.value.price }</div>
					</div>
					<div class="book">
			           <font size=20> <a href="#">more</a></font>
			         </div>
				</c:if>
			</c:if>
		</c:forEach>
	</div>
	<div class="clear"></div>
	
	<div class="main_book">
		<c:forEach items="${ productMap }" var="pm">
			<c:if test="${ pm.key == '어류' }">
				<h3>어류</h3>
				<c:if test="${ empty pm.value }">
					<div class="book">
						등록된 어류가 없습니다.
					</div>
				</c:if>
				<c:if test="${ !empty pm.value }">
					<div class="book">
						<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
			            <img class="link"  src="images/1px.gif"> 
			            </a> 
			                <img width="121" height="154" 
			                     src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
			            <div class="title">${ pm.value.name }</div>
			            <div class="price">${ pm.value.price }</div>
					</div>
					<div class="book">
			           <font size=20> <a href="#">more</a></font>
			         </div>
				</c:if>
			</c:if>
		</c:forEach>
	</div>
	<div class="clear"></div>
	
	<div class="main_book">
		<c:forEach items="${ productMap }" var="pm">
			<c:if test="${ pm.key == '육류' }">
				<h3>육류</h3>
				<c:if test="${ empty pm.value }">
					<div class="book">
						등록된 육류가 없습니다.
					</div>
				</c:if>
				<c:if test="${ !empty pm.value }">
					<div class="book">
						<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
			            <img class="link"  src="images/1px.gif"> 
			            </a> 
			                <img width="121" height="154" 
			                     src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
			            <div class="title">${ pm.value.name }</div>
			            <div class="price">${ pm.value.price }</div>
					</div>
					<div class="book">
			           <font size=20> <a href="#">more</a></font>
			         </div>
				</c:if>
			</c:if>
		</c:forEach>
	</div>
	<div class="clear"></div>
	
	<div class="main_book">
		<c:forEach items="${ productMap }" var="pm">
			<c:if test="${ pm.key == '음료' }">
				<h3>음료</h3>
				<c:if test="${ empty pm.value }">
					<div class="book">
						등록된 음료가 없습니다.
					</div>
				</c:if>
				<c:if test="${ !empty pm.value }">
					<div class="book">
						<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
			            <img class="link"  src="images/1px.gif"> 
			            </a> 
			                <img width="121" height="154" 
			                     src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
			            <div class="title">${ pm.value.name }</div>
			            <div class="price">${ pm.value.price }</div>
					</div>
					<div class="book">
			           <font size=20> <a href="#">more</a></font>
			         </div>
				</c:if>
			</c:if>
		</c:forEach>
	</div>
	<div class="clear"></div>
	
	<div class="main_book">
		<c:forEach items="${ productMap }" var="pm">
			<c:if test="${ pm.key == '기타' }">
				<h3>기타</h3>
				<c:if test="${ empty pm.value }">
					<div class="book">
						등록된 기타가 없습니다.
					</div>
				</c:if>
				<c:if test="${ !empty pm.value }">
					<div class="book">
						<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
			            <img class="link"  src="images/1px.gif"> 
			            </a> 
			                <img width="121" height="154" 
			                     src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
			            <div class="title">${ pm.value.name }</div>
			            <div class="price">${ pm.value.price }</div>
					</div>
					<div class="book">
			           <font size=20> <a href="#">more</a></font>
			         </div>
				</c:if>
			</c:if>
		</c:forEach>
	</div>
	<div class="clear"></div>
	</div>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>