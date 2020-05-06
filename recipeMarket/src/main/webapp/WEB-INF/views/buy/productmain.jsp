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
		<c:forEach items="${ grain }" var="gr">
				<h3>곡류</h3>
				<c:if test="${ empty grain }">
					<div class="book">
						등록된 곡류가 없습니다.
					</div>
				</c:if>
				<c:if test="${ !empty grain }">
					<div class="book">
						<a href="${contextPath}/productdetail.bu?prductNo=${gr.productNo}">
			            <img class="link"  src="images/1px.gif"> 
			            </a> 
			                <img width="121" height="154" 
			                     src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
			            <div class="title">${ gr.name }</div>
			            <div class="price">${ gr.price }</div>
					</div>
					<div class="book">
			           <font size=20> <a href="#">more</a></font>
			         </div>
				</c:if>
		</c:forEach>
	</div>
	<div class="clear"></div>
	
 	<div class="main_book">
		<c:forEach items="${ fruit }" var="fr">
				<h3>과일류</h3>
				<c:if test="${ empty fruit }">
					<div class="book">
						등록된 과일류가 없습니다.
					</div>
				</c:if>
				<c:if test="${ !empty fruit }">
					<div class="book">
						<a href="${contextPath}/goods/goodsDetail.do?goods_id=${fr.productNo }">
			            <img class="link"  src="images/1px.gif"> 
			            </a> 
			                <img width="121" height="154" 
			                     src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
			            <div class="title">${ fr.name }</div>
			            <div class="price">${ fr.price }</div>
					</div>
					<div class="book">
			           <font size=20> <a href="#">more</a></font>
			         </div>
				</c:if>
		</c:forEach>
	</div>
	<div class="clear"></div>
	
	<div class="main_book">
		<c:forEach items="${ vegitable }" var="vg">
				<h3>채소류</h3>
				<c:if test="${ empty vegitable }">
					<div class="book">
						등록된 채소류가 없습니다.
					</div>
				</c:if>
				<c:if test="${ !empty vegitable }">
					<div class="book">
						<a href="${contextPath}/goods/goodsDetail.do?goods_id=${vg.productNo }">
			            <img class="link"  src="images/1px.gif"> 
			            </a> 
			                <img width="121" height="154" 
			                     src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
			            <div class="title">${ vg.name }</div>
			            <div class="price">${ vg.price }</div>
					</div>
					<div class="book">
			           <font size=20> <a href="#">more</a></font>
			         </div>
				</c:if>
		</c:forEach>
	</div>
	<div class="clear"></div>
	
	<div class="main_book">
		<c:forEach items="${ fish }" var="fi">
				<h3>어류</h3>
				<c:if test="${ empty fish }">
					<div class="book">
						등록된 어류가 없습니다.
					</div>
				</c:if>
				<c:if test="${ !empty fish }">
					<div class="book">
						<a href="${contextPath}/goods/goodsDetail.do?goods_id=${fi.productNo }">
			            <img class="link"  src="images/1px.gif"> 
			            </a> 
			                <img width="121" height="154" 
			                     src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
			            <div class="title">${ fi.name }</div>
			            <div class="price">${ fi.name }</div>
					</div>
					<div class="book">
			           <font size=20> <a href="#">more</a></font>
			         </div>
				</c:if>
		</c:forEach>
	</div>
	<div class="clear"></div>
	
	<div class="main_book">
		<c:forEach items="${ meat }" var="me">
				<h3>육류</h3>
				<c:if test="${ empty meat }">
					<div class="book">
						등록된 육류가 없습니다.
					</div>
				</c:if>
				<c:if test="${ !empty meat }">
					<div class="book">
						<a href="${contextPath}/goods/goodsDetail.do?goods_id=${me.productNo }">
			            <img class="link"  src="images/1px.gif"> 
			            </a> 
			                <img width="121" height="154" 
			                     src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
			            <div class="title">${ me.name }</div>
			            <div class="price">${ me.price }</div>
					</div>
					<div class="book">
			           <font size=20> <a href="#">more</a></font>
			         </div>
				</c:if>
		</c:forEach>
	</div>
	<div class="clear"></div>
	
	<div class="main_book">
		<c:forEach items="${ beverage }" var="bv">
				<h3>음료</h3>
				<c:if test="${ empty beverage }">
					<div class="book">
						등록된 음료가 없습니다.
					</div>
				</c:if>
				<c:if test="${ !empty beverage }">
					<div class="book">
						<a href="${contextPath}/goods/goodsDetail.do?goods_id=${bv.productNo }">
			            <img class="link"  src="images/1px.gif"> 
			            </a> 
			                <img width="121" height="154" 
			                     src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
			            <div class="title">${ bv.name }</div>
			            <div class="price">${ bv.price }</div>
					</div>
					<div class="book">
			           <font size=20> <a href="#">more</a></font>
			         </div>
				</c:if>
		</c:forEach>
	</div>
	<div class="clear"></div>
	
	<div class="main_book">
		<c:forEach items="${ ect }" var="ec">
				<h3>기타</h3>
				<c:if test="${ empty ect }">
					<div class="book">
						등록된 기타가 없습니다.
					</div>
				</c:if>
				<c:if test="${ !empty ect }">
					<div class="book">
						<a href="${contextPath}/goods/goodsDetail.do?goods_id=${ec.ect }">
			            <img class="link"  src="images/1px.gif"> 
			            </a> 
			                <img width="121" height="154" 
			                     src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
			            <div class="title">${ ec.name }</div>
			            <div class="price">${ ec.price }</div>
					</div>
					<div class="book">
			           <font size=20> <a href="#">more</a></font>
			         </div>
				</c:if>
		</c:forEach>
	</div>
	<div class="clear"></div>
	</div>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>