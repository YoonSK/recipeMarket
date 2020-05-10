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
<style>
	div.content{height: 600px;}
	h2{margin-left: 135px;}
	.tableArea{width: 80%; height: auto; margin: 0 auto; margin-top: 80px;}
	table {width: 100%; border-collapse: collapse;}
	table > thead{border-bottom: 1px solid black;}
	table > class{margin-left: 100px; margin-top: 30px; width: 680px;}
	hr{width: 80%;}
	#summary{margin-left: 70%;}
	.sHead{font-weight: bold; font-size: 18px;}
	.sBody{margin-left: 30%}
	tr.orderT > td > input[type="button"].deleteBtn{border: none; background: white; color: black;}
	tr.orderT > td > input[type="button"].deleteBtn:hover{border: none; background: white; cursor: pointer;}
	
	div#button {margin-left: 40%; margin-top: 10%;}
	div#button > input[type="button"]{width: 80px; height: 30px; font-size: 14px; font-weight: 600; text-align: center; border:1px solid #fee0a1; border-radius: 4px; background: white;}
	div#button > input[type="button"]:hover{cursor: pointer; background: #fee0a1; color: white;}
	span > input[type="button"]{width: 80px; height: 30px; font-size: 14px; font-weight: 600; text-align: center; border:1px solid #fee0a1; border-radius: 4px; background: white;}
	span > input[type="button"]:hover{cursor: pointer; background: #fee0a1; color: white;}	
	
</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>	
	<div class="outer">
		<div class="container">
			<div class="content">	
				<h2>장바구니</h2>	
				<form>
				<div class="tableArea">
					<table id="table">
						<thead> <!-- 게시판 라벨 부분 -->
						<tr>
							<td width="10%"><input type='checkbox' id='all' onclick="selectAll(this.form);"/></td>
							<td width="10%"></td>
							<td width="40%" class="title">상품명</td>
							<td width="15%">개수</td>
							<td width="20%">금액</td>
							<td width="1%"></td>
						</tr>
						</thead>
						<tbody>				
						<c:forEach var="order" items="${ list }">	
						<tr class="orderT">
							<td><input type='checkbox' name='checkP' onclick="selectOne(this.form);" value="${ order.price }"/><input type="hidden" name="prN" value="${ order.productNo }"></td>
							<td><img src="resources/upload/${ order.phName }" width= 50px; height = 50px;></td>
							<td>${ order.pName }</td>
							<td>${ order.prCount }<input type="hidden" name="prC" value="${ order.prCount }"></td>
							<td class="order_D"><span><fmt:formatNumber maxFractionDigits="3" value="${ order.price }"/></span>원</td>		
							<td><input type="button" value="x" class="deleteBtn"></td>																
						</tr>		 
						</c:forEach>																						
						</tbody>
					</table>	
				</div>		
				<br>
				<hr style="width=80%;">
				<div id="summary">
					<span class="sHead">상품금액</span><span class="sBody" id="price">0</span> 원<br>
					<span class="sHead">배송비</span><span class="sBody"><fmt:formatNumber maxFractionDigits="3" value="2500"/> 원</span><br>
					<span class="sHead">합계</span><span class="sBody" id="total">0</span> 원
				</div>	
				<div id="button">
					<input type="button" id="buyBtn" value="주문하기">
					<span><input type="button" id="backBtn" onclick='history.back();' value="돌아가기"></span>					
				</div>
				</form>
				<script>
					var all = document.getElementById("all");
					var checkP = document.getElementsByName("checkP");	
					var prC = document.getElementsByName("prC");					
					
					function selectAll(){
						var total = 2500;
						var prCount = 0;
					   if(all.checked){
					      for(var i = 0; i < checkP.length; i++){
					    	  checkP[i].checked = true;}
				    	  var sum = 0;
				    	  var length = checkP.length;
				    	  for(var i = 0; i < length; i++){
							  prCount = parseInt(prC[i].value);
							  sum += parseInt((checkP[i].value * prCount));
				    	  }
				    	  $('span#price').html(sum.toLocaleString());
				    	  total += sum;
				    	  $('span#total').html(total.toLocaleString());
					   } else{
					      for(var i = 0; i < checkP.length; i++){
					    	  checkP[i].checked = false;
					      }
					      $('span#price').html('0');
					      $('span#total').html('0');
					   }
					}

					function selectOne(frm){
						var count;
						var sum = 0;
						var total = 2500;
						var prCount = 0;
						var length = frm.checkP.length;
		
						for(var i = 0; i < length; i++){
							if(checkP[i].checked == true){
								prCount = parseInt(frm.prC[i].value);
								sum += parseInt((frm.checkP[i].value * prCount));
							}
						}

						total += sum;
						$('span#price').html(sum.toLocaleString());
						$('span#total').html(total.toLocaleString());
					   for(var i = 0; i < checkP.length; i++){
					      if(checkP[i].checked){
					         count++;
					      }
					   }
					   
					   if(count != checkP.length){
					      all.checked = false;
					   } else{
					      all.checked = true;
					   }
					}
					
				      
				      // 장바구니 삭제
				      $('.deleteBtn').click(function(){
				    	  var productNo = $(this).parent().parent().children().children('input[name=prN]').val();
							$.ajax({
								url: 'cartDelete.by',
								data: {no:productNo},
								dataType: 'json',
								success: function(data){
									location.reload();	
									
								}
							});
				      });
				      
				      // 구매
				      $('#buyBtn').click(function(){
				    	  var prN = document.getElementsByName("prN");
				    	  var prArray = new Array();				    	  
						   for(var i = 0; i < checkP.length; i++){
							      if(checkP[i].checked){							    	  
							         prArray[i] = parseInt(prN[i].value);	
							      }else{
							    	  prArray[i] = 0;
							      }
							   }
						   location.href="goBuy.by?prArray="+prArray;
				      });
				      
				</script>
			</div>
		</div>
	</div>	
	<c:import url="../common/footer.jsp"/>			
</body>
</html>