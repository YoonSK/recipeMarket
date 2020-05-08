<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토어</title>
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
		<h3>곡류</h3>
		<c:forEach items="${ grain }" var="gr">
				<c:if test="${ empty grain }">
					<div class="book">
						등록된 곡류가 없습니다.
					</div>
				</c:if>
				<c:if test="${ !empty grain }">
					<div class="book">
						<a href="detail.by?productNo=${gr.productNo}">			         
			                <img width="121" height="154" 
			                     src="resources/upload/${ gr.phName }">   </a> 
			            <div class="title">${ gr.name }</div>
			            <div class="price">${ gr.price }</div>
					</div>
				</c:if>
		</c:forEach>
	</div>
	<div class="clear"></div>
	
 	<div class="main_book">
 		<h3>과일류</h3>
		<c:forEach items="${ fruit }" var="fr">
				<c:if test="${ empty fruit }">
					<div class="book">
						등록된 과일류가 없습니다.
					</div>
				</c:if>
				<c:if test="${ !empty fruit }">
					<div class="book">
						<a href="detail.by?productNo=${fr.productNo}">     
						<img width="121" height="154" 
			                     src="resources/upload/${ fr.phName }"></a> 
			            <div class="title">${ fr.name }</div>
			            <div class="price">${ fr.price }</div>
					</div>

				</c:if>
		</c:forEach>
	</div>
	<div class="clear"></div>
	
	<div class="main_book">
		<h3>채소류</h3>
		<c:forEach items="${ vegitable }" var="vg">
				<c:if test="${ empty vegitable }">
					<div class="book">
						등록된 채소류가 없습니다.
					</div>
				</c:if>
				<c:if test="${ !empty vegitable }">
					<div class="book">
						<a href="detail.by?productNo=${vg.productNo}">    
			                <img width="121" height="154" 
			                     src="resources/upload/${ vg.phName }"></a> 
			            <div class="title">${ vg.name }</div>
			            <div class="price">${ vg.price }</div>
					</div>
				</c:if>
		</c:forEach>
	</div>
	<div class="clear"></div>
	
	<div class="main_book">	
		<h3>어류</h3>
		<c:forEach items="${ fish }" var="fi">
				<c:if test="${ empty fish }">
					<div class="book">
						등록된 어류가 없습니다.
					</div>
				</c:if>
				<c:if test="${ !empty fish }">
					<div class="book">
						<a href="detail.by?productNo=${fi.productNo}">    
			                <img width="121" height="154" 
			                     src="resources/upload/${ fi.phName }">  </a> 
			            <div class="title">${ fi.name }</div>
			            <div class="price">${ fi.price }</div>
					</div>
				</c:if>
		</c:forEach>
	</div>
	<div class="clear"></div>
	
	<div class="main_book">
		<h3>육류</h3>
		<c:forEach items="${ meat }" var="me">
				<c:if test="${ empty meat }">
					<div class="book">
						등록된 육류가 없습니다.
					</div>
				</c:if>
				<c:if test="${ !empty meat }">
					<div class="book">
						<a href="detail.by?productNo=${me.productNo}">    
			                <img width="121" height="154" 
			                     src="resources/upload/${ me.phName }"></a> 
			            <div class="title">${ me.name }</div>
			            <div class="price">${ me.price }</div>
					</div>
				</c:if>
		</c:forEach>
	</div>
	<div class="clear"></div>
	
	<div class="main_book">
		<h3>음료</h3>
		<c:forEach items="${ beverage }" var="bv">
				<c:if test="${ empty beverage }">
					<div class="book">
						등록된 음료가 없습니다.
					</div>
				</c:if>
				<c:if test="${ !empty beverage }">
					<div class="book">
						<a href="detail.by?productNo=${bv.productNo}">    
			                <img width="121" height="154" 
			                     src="resources/upload/${ bv.phName }"></a> 
			            <div class="title">${ bv.name }</div>
			            <div class="price">${ bv.price }</div>
					</div>
				</c:if>
		</c:forEach>
	</div>
	<div class="clear"></div>
	
	<div class="main_book">
		<h3>기타</h3>
		<c:forEach items="${ ect }" var="ec">
				<c:if test="${ empty ect }">
					<div class="book">
						등록된 기타가 없습니다.
					</div>
				</c:if>
				<c:if test="${ !empty ect }">
					<div class="book">
						<a href="detail.by?productNo=${ec.productNo}">    		         
			                <img width="121" height="154" 
			                     src="resources/upload/${ ec.phName }"></a> 
			            <div class="title">${ ec.name }</div>
			            <div class="price">${ ec.price }원</div>
					</div>
				</c:if>
		</c:forEach>
	</div>
	<div class="clear"></div>
	</div>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>