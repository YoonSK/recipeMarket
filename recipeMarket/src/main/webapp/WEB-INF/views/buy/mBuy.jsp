<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문하기</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
	div.content{height: 900px;}
	h2{margin-left: 135px;}
	.tableArea{width: 80%; height: auto; margin: 0 auto; margin-top: 80px;}
	table {width: 100%; border-collapse: collapse;}
	table > thead{border-bottom: 1px solid black;}
	table > class{margin-left: 100px; margin-top: 30px; width: 680px;}
	hr{width: 80%;}
	#summary{margin-left: 70%;}
	.sHead{font-weight: bold; font-size: 18px;}
	.sBody{margin-left: 30%}
	div#button {margin-left: 40%; margin-top: 1%;}
	div#button > input[type="button"]{width: 80px; height: 30px; font-size: 14px; font-weight: 600; text-align: center; border:1px solid #fee0a1; border-radius: 4px; background: white;}
	div#button > input[type="button"]:hover{cursor: pointer; background: #fee0a1; color: white;}
	span > input[type="button"]{width: 80px; height: 30px; font-size: 14px; font-weight: 600; text-align: center; border:1px solid #fee0a1; border-radius: 4px; background: white;}
	span > input[type="button"]:hover{cursor: pointer; background: #fee0a1; color: white;}	
	div#orderInfo{width: 500px;
				    height: 400px;
				    border: 2px solid #d9d9d9;
				    padding: 10px;
				    margin-left: 10%;}
	input	{border-radius: 5px;
    border: 1px solid #d9d9d9;
    height: 30px;
    width : 200px;}	
		 	    

	
</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>	
	<div class="outer">
		<div class="container">
			<div class="content">	
				<h2>주문하기</h2>	
				<form id="bForm" method="post" onsubmit="purchase();" >
				<div class="tableArea">
					<table id="table">
					
						<thead> <!-- 게시판 라벨 부분 -->
						<tr>
							<td width="10%"></td>
							<td width="40%" class="title">상품명</td>
							<td width="15%">개수</td>
							<td width="20%">금액</td>
						</tr>
						</thead>
						<tbody>				
						<c:forEach var="order" items="${ list }">	
						<tr class="orderT">
							<td><img src="resources/upload/${ order.phName }" height="80px" width="80px"></td>
							<td>${ order.pName }<input type="hidden" name="prN" value="${order.productNo }"><input type="hidden" name="pName" value="${ order.pName }"></td>
							<td>${ order.prCount }<input type="hidden" name="prC" value="${ order.prCount }"></td>
							<td class="order_D"><span><fmt:formatNumber maxFractionDigits="3" value="${ order.price }"/><input type="hidden" name="pPr" value="${ order.price}"></span>원</td>	
							<c:set var = "sum" value="${sum + order.price * order.prCount }"/>																
						</tr>		 
						</c:forEach>																						
						</tbody>
					</table>	
				</div>		
				<br>
				<hr style="width=80%;">
				<div id="summary">
					<span class="sHead">상품금액</span><span class="sBody" id="price"><fmt:formatNumber maxFractionDigits="3" value="${ sum }"/></span> 원<br>
					<span class="sHead">배송비</span><span class="sBody"><fmt:formatNumber maxFractionDigits="3" value="2500"/> 원</span><br>
					<span class="sHead">합계</span><span class="sBody" id="total" name="total"><c:set var="total" value="${ total + sum + 2500}"/><fmt:formatNumber maxFractionDigits="3" value="${ total }"/></span> 원
				</div>	
				<hr style="width=80%;">
				<div id="orderInfo">
					<h4>주문자 정보</h4>
					<p class="input-label">주문자명 &nbsp; <input type="text" name="name" class="input_text" id="userName" autocomplete="off" required value="${ loginUser.name }" ></p>
					<p class="input-label">이메일 &nbsp; <input type="email" name="email" class="input_text" id="email" autocomplete="off" required value="${ loginUser.email }" ></p>
					<p class="input-label">연락처 &nbsp; <input type="text" name="phone" class="input_text" id="phone" maxlength="11" autocomplete="off" onkeyup="inputNumber(this);" required value="${ loginUser.phone }" ></p>
					<div class="input-box location">
						<p class="input-label">주소</p>
						<input type="text" name="zip" id="zip" class="postcodify_postcode5" size="6" value="${ loginUser.zip }" >
						<button type="button" id="postcodify_searchBtn">주소 검색</button><br>
						<input type="text" name="address" id="address" class="postcodify_address" value="${ loginUser.address }" ><br>
						<input type="text" name="address2" id="address2" class="postcodify_extra_info" value="${ loginUser.address2 }" >
					</div>
				<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
				<script>
					// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
					$(function(){
						$("#postcodify_searchBtn").postcodifyPopUp();
					});
				</script>	
				<p class="input-label">메모 &nbsp; <input type="text" name="memo" id="memo" class="input_text"></p>	
				</div>
				<div id="button">
					<input type="button" id="buyBtn" value="결제하기">
					<span><input type="button" id="backBtn" onclick='history.back();' value="돌아가기"></span>					
				</div>
				</form>
				<script>

					$('#buyBtn').click(function(){
						var IMP = window.IMP;
						var amount = '${total}';
						var email = '${loginUser.email}';
						var name = '${loginUser.name}';
						var tel = '${loginUser.phone}';
						var addr = $('#address').val();
						var addr2 = $('#address2').val();
						var postcode = parseInt($('#zip').val());
				    	var prN = document.getElementsByName("prN");
				    	var prC = document.getElementsByName("prC");
				    	var pPr = document.getElementsByName("pPr");
				    	var pName = document.getElementsByName("pName");
				    	var prArray = new Array();	
				    	var prCArray = new Array();
				    	var pPrArray = new Array();
				    	var pNArray =  new Array();
				    	var memo = $('#memo').val();
				    	var orderNo;
						for(var i = 0; i < prN.length; i++){
							prArray[i] = parseInt(prN[i].value);
						}
						for(var i = 0; i < prC.length; i++){
							prCArray[i] = parseInt(prC[i].value);
						}
						for(var i = 0; i < pPr.length; i++){
							pPrArray[i] = parseInt(pPr[i].value);
						}
						for(var i = 0; i < pName.length; i++){
							pNArray[i] = pName[i].value;
						}
						
						IMP.init('imp36559149');
						IMP.request_pay({
						    pg : 'kakao',
						    pay_method : 'card',
						    merchant_uid : 'merchant_' + new Date().getTime(),
						    name : '레시피마켓 :'+ pNArray,
						    amount : amount,
						    buyer_email : email,
						    buyer_name : name,
						    buyer_tel : tel,
						    buyer_addr : addr,
						    buyer_postcode : postcode,
						}, function(response) {
						    if(response.success) {
				                jQuery.ajax({
									url: 'buyComple.by',
									method: 'POST',
									traditional : true,
									data: {amount:amount, email:email, name:name, phone:tel, addr:addr, addr2: addr2, zip:postcode, prArray:prArray, prCArray:prCArray, pPrArray:pPrArray, memo:memo},
									dataType: 'json',
									success: function(data){
										if(data > 0){
										orderNo = data;
										location.href="goComple.by?orderNo="+orderNo;
										}
									}
								});					    	
						       
						    } else {
						        var msg = '결제에 실패하였습니다.';
						        msg += '에러내용 : ' + response.error_msg;
						    }
						});
					});
					
				
				</script>
			</div>
		</div>
	</div>	
	<c:import url="../common/footer.jsp"/>			
</body>
</html>