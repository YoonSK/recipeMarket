<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 작성 페이지</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script> 
<script type="text/javascript" src="resources/js/jquery.raty.js"></script>
<style>
	#table_D {border-collapse: initial; border-spacing: initial;}
	#table_D th, td{text-align: center; border-bottom: 2px solid #e8e5da; padding: 10px;}
	input[type="button"]{width: 100px; height: 40px; font-size: 15px; font-weight: 600; text-align: center; border:1px solid #e8e5da; border-radius: 4px; background: white;}
	input[type="button"]:hover{cursor: pointer; background: #e8e5da; color: white;}	
	textarea {border: 2px solid #e8e5da;}
</style>
</head>
<body>
	<div class="outer">
		<div class="content">
			<table id="table_D">			
				<c:forEach var="order" items="${ list }">
				<tr>
					<th width="5%">${ order.detailNo }</th>
					<th width="10%"><img src="resources/upload/${ order.phName }"></th>							
					<th width="30%" class="title">${ order.pName }</th>
					<td width="30%"><div id="star"></div></td>
					<td colspan="2"><textarea rows=3 cols=80 required></textarea></td>
					<td><input type="button" class="writeBtn" value="작성"></td>
				</tr>
				<input type="hidden" id="orderNo" value="${ order.orderNo }">
				</c:forEach>							
			</table> 
				<script>
					// 별점 부분
					var star = null;
					var rating = null;
					$(document).ready(function() {
				        $('div#star').raty({
				            path : "resources/images",
				            width : 100,
				            half: false,
				            halfShow: true,
				            click: function(score, evt) {
				            }            
				        });			 	        
				        
						// 후기 데이터 전송
						$('.writeBtn').click(function(){
							var targetNo = $(this).parent().parent().children().eq(0).text();
							var content = $('textarea').val();
							var rating = $('#star').raty('score');
							var orderNo = $('#orderNo').val();
					
							$.ajax({
								url: 'insertRv.mp',
								data: {targetNo:targetNo, orderNo:orderNo, content:content, rating:rating},
								dataType: 'json',
								success: function(data){	
									if(data != null){
										alert(decodeURIComponent(data).replace(/\+/g,' '));}
									opener.parent.location.reload();  
								}
							}); 
						});					        
				        
				    });
			</script>		
		</div>
	</div>
</body>
</html>