<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="resources/js/jquery.raty.js"></script>
<style>
	
	#layer {
	z-index: 2;
	position: absolute;
	top: 0px;
	left: 0px;
	width: 100%;
}
	#popup {
	z-index: 3;
	position: fixed;
	text-align: center;
	left: 50%;
	top: 45%;
	width: 300px;
	height: 200px;
	background-color: #ccffff;
	border: 3px solid #87cb42;
}
	#close {
	z-index: 4;
	float: right;
}
	span#star img{padding: 0; margin: 0;}
	div.reply{font-size: 15px;}
</style>
<link rel="stylesheet" type="text/css" href="<c:url value='resources/css/list.css'/>">
<!-- <script type="text/javascript">
	function add_cart(goods_id) {
		$.ajax({
			type : "post",
			async : false,
			url : "${contextPath}/cart/addGoodsInCart.do",
			data : {
				goods_id:goods_id
				
			},
			success : function(data, textStatus) {
				//alert(data);
			//	$('#message').append(data);
				if(data.trim()=='add_success'){
					imagePopup('open', '.layer01');	
				}else if(data.trim()=='already_existed'){
					alert("이미 카트에 등록된 상품입니다.");	
				}
				
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
			}
		}); //end ajax	
	}
	function imagePopup(type) {
		if (type == 'open') {
			// 팝업창을 연다.
			jQuery('#layer').attr('style', 'visibility:visible');
			jQuery('#layer').height(jQuery(document).height());
		}
		else if (type == 'close') {
			// 팝업창을 닫는다.
			jQuery('#layer').attr('style', 'visibility:hidden');
		}
	}
	
	function fn_order_each_goods(goods_id,goods_title,goods_sales_price,fileName){
		var _isLogOn=document.getElementById("isLogOn");
		var isLogOn=_isLogOn.value;
	
	 	if(isLogOn=="false" || isLogOn=='' ){
			alert("로그인 후 주문이 가능합니다!!!");
	} 
	
	
		var total_price,final_total_price;
		var order_goods_qty=document.getElementById("order_goods_qty");
		
		var formObj=document.createElement("form");
		var i_goods_id = document.createElement("input"); 
    	var i_goods_title = document.createElement("input");
    	var i_goods_sales_price=document.createElement("input");
    	var i_fileName=document.createElement("input");
    	var i_order_goods_qty=document.createElement("input");
    
	    i_goods_id.name="goods_id";
	    i_goods_title.name="goods_title";
	    i_goods_sales_price.name="goods_sales_price";
	    i_fileName.name="goods_fileName";
	    i_order_goods_qty.name="order_goods_qty";
	    
	    i_goods_id.value=goods_id;
	    i_order_goods_qty.value=order_goods_qty.value;
	    i_goods_title.value=goods_title;
	    i_goods_sales_price.value=goods_sales_price;
	    i_fileName.value=fileName;
	    
	    formObj.appendChild(i_goods_id);
	    formObj.appendChild(i_goods_title);
	    formObj.appendChild(i_goods_sales_price);
	    formObj.appendChild(i_fileName);
	    formObj.appendChild(i_order_goods_qty);
	
	    document.body.appendChild(formObj); 
	    formObj.method="post";
	    formObj.action="${contextPath}/order/orderEachGoods.do";
	    formObj.submit();
		}	
</script> -->
</head>
<body>
	<%@ include file="../common/header.jsp" %>

	<div class="s_contents">
		<h1 style="margin-left:220px;">${ pr.name }</h1>
	<div id="goods_image">
		<figure>
			<img src="resources/upload/${ pr.phName }">
		</figure>
	</div>
	<div id="detail_table">
		<table>
			<tbody>
				<tr class="dot_line">
					<td class="fixed">판매가</td>
					<td class="active"><span>${ pr.price }원</span></td>
				</tr>
				<tr class="dot_line">
					<td class="fixed">배송료</td>
					<td class="fixed"><strong>2500원</strong></td>
				</tr>
				<tr>
					<td class="fixed">수량</td>
					<td class="fixed">
			      	<select style="width: 60px;" id="order_goods_qty">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
			     	</select>
			     </td>
				</tr>
			</tbody>
		</table>
		<ul>

			<li><a class="buy" href="#" onClick="goToBuy();" style="border: none; border-radius: 5px;"> 구매하기 </a></li>
			<li><a class="cart" href="#" onClick="goCart();" style="border: none; border-radius: 5px;"> 장바구니</a></li>

		</ul>
	</div>
	<div class="clear"></div>
	<!-- 내용 들어 가는 곳 -->
	<div id="container">
		<ul class="tabs">
			<li><a href="#tab1">리뷰</a></li>
		</ul>
		<div class="tab_container">
			<div class="tab_content" id="tab1">
				<c:forEach var="rv" items="${ list }">
				<div class="reply">
					<span id="star"></span>
					<span>${ rv.content } | </span>
					<span>${ rv.nickName }</span>
					<script>
						var score = '${rv.rating}';
						var i = jQuery.noConflict();
						i(document).ready(function(){
					        $('span#star').raty({
					            path : "resources/images",
					            width : 100,
					            score: score,
					            half: false,
					            halfShow: true,
					            readOnly : true
					        });            
					     });	
					</script>
				</div>
				</c:forEach>
				
			</div>
		</div>
	</div>
	<script>
		function goToBuy(){
			var productNo = '${pr.productNo}';
			var prCount = $('#order_goods_qty').val();
			var price = '${pr.price}';
			var pName= '${ pr.name }';
			var phName ='${ pr.phName}';
			location.href="goToBuy.by?productNo="+productNo+"&prCount="+prCount+"&price="+price+"&pName="+pName+"&phName="+phName;
		}
	
		function goCart(){
			var productNo = '${pr.productNo}';
			var prCount = $('#order_goods_qty').val();
			var price = '${pr.price}';	
			var pName= '${ pr.name }';
			var phName ='${ pr.phName}';
			$.ajax({
				url: 'insertCart.by',
				data: {productNo:productNo, prCount:prCount, price:price, pName:pName, phName:phName},
				dataType: 'json',
				success: function(data){
						alert('해당 상품이 장바구니에 담겼습니다');
				},
				error:function(request, status, error){
					alert('이미 해당 상품을 장바구니에 담았습니다');
				}
			});
		}
		
	</script>
	<div class="clear"></div>
	<div id="layer" style="visibility: hidden">
		<!-- visibility:hidden 으로 설정하여 해당 div안의 모든것들을 가려둔다. -->
		<div id="popup">
			<!-- 팝업창 닫기 버튼 -->
			<a href="javascript:" onClick="javascript:imagePopup('close', '.layer01');"> <img
				src="${contextPath}/resources/image/close.png" id="close" />
			</a> <br /> <font size="12" id="contents">장바구니에 담았습니다.</font><br>
		<form action='${contextPath}/cart/myCartList.do'  >				
			<input  type="submit" value="장바구니 보기">
		</form>			
		</div>
	</div>
</div>

	<%@ include file="../common/footer.jsp" %>
</body>
</html>