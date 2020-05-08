<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 관리</title>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js"></script>
<style>
	div.content{height: 800px;}
	h2{margin-left: 10%;}
	.tableArea{width: 80%; height: 650px; margin: 0 auto; margin-top: 5%;}
	table {width: 100%;}
	table > class{margin-left: 100px; margin-top: 30px; width: 680px;}
	table, th, td{word-spacing: 5px; padding: 5px; height: 40px;}
	table thead th{border-bottom: 2px solid #add1c3; background-color: #add1c3; height: 30px; font-weight: 600; text-align: center;}
	table tbody th{font-weight: 600; border-bottom: 1px solid #add1c3; text-align: center;}
	table tbody td{border-bottom: 2px solid #add1c3; font-family: inherit; text-align: center; font-size: 11pt;}
	input[type="button"]{width: 65px; height: 20px; font-size: 12px; font-weight: 600; text-align: center; border:1px solid #add1c3; border-radius: 4px; background: white;}
	input[type="button"]:hover{cursor: pointer; background: #add1c3; color: white;}
	
	/* 페이징 버튼 */
	.pagingArea{border-left: hidden; border-right: hidden;}
	.pagingArea button{background-color: white; color: black; text-decoration: none; transition: background-color .3s; border: 1px solid #add1c3; font-size: 15px; font-weight: 700;}	
	.pagingArea button:hover{background-color: #add1c3; color: white; cursor: pointer;}
	.pagingArea button:disabled{background-color: gray;}
	.pagingArea button:disabled:hover{cursor: not-allowed; color: black;}
		
	/* 카테고리 */
	th ul{display: none; position: absolute; width: 70px; background:white; cursor: pointer;}
	th ul > li{border: 1px solid #add1c3; list-style: none;}
	#listBtn{font-size: small;}
	#listBtn:hover{cursor: pointer;}

	/* 모달 */
    .modal {display: none; position: fixed; z-index: 1; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background-color: rgb(0,0,0); background-color: rgba(0,0,0,0.4);}
    .modal-content2 {background-color: #fefefe; margin: 20% auto; padding: 20px; border: 1px solid #888; width: 50%; height: auto;}
    .close {color: #aaa; float: right; font-size: 28px; font-weight: bold;}
    .close:hover, .close:focus {color: black; text-decoration: none; cursor: pointer;}	
    p#total{font-weight: 900; font-size: 18px; text-align: right;}
    span#orderInfo_head{font-weight: 800; font-size: 17px;}
	table#tableD > thead th{border-bottom: 2px solid #e8e5da; background-color: #e8e5da; height: 20px; font-weight: 600; text-align: center;}    
	table#tableD {width: 100%;}
	table#tableD > th, td{word-spacing: 5px; padding: 5px; height: 20px;}    	

</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>	
	<div class="outer">
		<div class="container">
			<div class="content">	
				<h2>회원 주문 조회</h2>			
				<div class="tableArea">
					<table id="table">
						<thead> <!-- 게시판 라벨 부분 -->
						<tr>
							<th width="10%">주문 번호</th>
							<th width="10%">날짜</th>							
							<th width="30%" class="title">주문 정보</th>
							<th width="10%">결제 금액</th>
							<th width="15%"><p style="display: inline;">주문 상태</p><span id="listBtn">&nbsp;▼</span>
								<ul id="list">
									<li onclick=sortCate(this);>전체</li>								
									<li onclick=sortCate(this);>결제완료</li>
									<li onclick=sortCate(this);>배송중</li>
									<li onclick=sortCate(this);>배송완료</li>
									<li onclick=sortCate(this);>후기완료</li>									
									<li onclick=sortCate(this);>주문취소</li>									
								</ul>				
							</th>
						</tr>
						</thead>					
						<tbody>				
						<c:forEach var="order" items="${ list }">
						<tr class="orderT">
							<td class="orderN">${ order.orderNo }</td>
							<td>${ order.date }</td>						
							<td class="order_D">${ order.oList }</td>
							<td><fmt:formatNumber maxFractionDigits="3" value="${ order.total }"/> 원</td>
							<td class="orderS">
								<c:if test="${ order.status == 0}">
									결제완료
									<br>
								<input type="button" id="btn" class="statBtn" value="배송 처리">		
								<input type="hidden" class="oStatus" value="${ order.status }">																
								</c:if>	
								<c:if test="${ order.status == 1}">
									배송중
								<br>								
								</c:if>	
								<c:if test="${ order.status == 2}">
									배송완료
								<br>
								</c:if>
								<c:if test="${ order.status == 3}">
									후기완료
								<br>																
								</c:if>	
								<c:if test="${ order.status == 4}">
									주문취소
								<br>								
								</c:if>																									
							</td>
						</tr>		
						</c:forEach>																						
						</tbody>

						<!-- 페이징 처리 -->
						<tr align="center" height="20" class="pagingArea">
							<td colspan="6">
								<!-- [이전] -->
								<c:if test="${ pi.currentPage <= 1 }">
									<button disabled>&laquo;</button>
								</c:if>
								<c:if test="${ pi.currentPage > 1 }">
									<c:choose>
										<c:when test="${requestScope['javax.servlet.forward.servlet_path'] == '/orderSort.ma'}">	
											<c:url var="before" value="orderSort.ma">
												<c:param name="sortCate" value="${ cate }"/>											
												<c:param name="page" value="${ pi.currentPage - 1 }"/>
											</c:url>	
										</c:when>
										<c:otherwise>																	
											<c:url var="before" value="oManage.ma">
												<c:param name="page" value="${ pi.currentPage - 1 }"/>
											</c:url>
										</c:otherwise>
									</c:choose>
									<button onclick="location.href='${ before }'">&laquo;</button>
								</c:if>
								
								<!-- 페이지 -->
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
									<c:if test="${ p eq pi.currentPage }">
										<button disabled>${ p }</button>
									</c:if>
									<c:if test="${ p ne pi.currentPage }">
										<c:choose>
											<c:when test="${requestScope['javax.servlet.forward.servlet_path'] == '/orderSort.ma'}">																												
												<c:url var="pagination" value="orderSort.ma">
													<c:param name="sortCate" value="${ cate }"/>
													<c:param name="page" value="${ p }"/>
												</c:url>
											</c:when>
											<c:otherwise>											
												<c:url var="pagination" value="oManage.ma">
													<c:param name="page" value="${ p }"/>
												</c:url>
											</c:otherwise>
										</c:choose>
										<button onclick="location.href='${ pagination }'">${ p }</button>
									</c:if>							
								</c:forEach>
								
								<!-- [다음] -->
								<c:if test="${ pi.currentPage >= pi.maxPage }">
									<button disabled>&raquo;</button>
								</c:if>
								<c:if test="${ pi.currentPage < pi.maxPage }">
								<c:choose>
									<c:when test="${requestScope['javax.servlet.forward.servlet_path'] == '/orderSort.ma'}">																												
										<c:url var="after" value="orderSort.ma">	
											<c:param name="sortCate" value="${ cate }"/>										
											<c:param name="page" value="${ pi.currentPage + 1 }"/>										
										</c:url>					
									</c:when>	
									<c:otherwise>
										<c:url var="after" value="oManage.ma">
											<c:param name="page" value="${ pi.currentPage + 1 }"/>
										</c:url> 
									</c:otherwise>		
								</c:choose>	
								<button onclick="location.href='${ after }'">&raquo;</button>								
								</c:if>
							</td>
						</tr>						
					</table>
					</div>	
					<script>
						$('.order_D').mouseenter(function(){
							$(this).css({'cursor':'pointer'});	
						}).click(function(){				
							$('#cmodal').attr('style', 'display:block');
							var orderNo = $(this).parent().children().eq(0).text();
							console.log(orderNo);
							$.ajax({
								url: 'orderDetail.mp',
								data: {no:orderNo},
								dataType: 'json',
								success: function(data){
					               $tableBody = $("#table_D tbody");
					               $tableBody.html("");	
					               
									for(var i in data){
					                    var $tr = $('<tr>');
					                    var $phName=$('<td>').html('<img src=' + '"resources/upload/' + data[i].phName + '"' + 'width=40px; height=40px;>');
										var $pName = $('<td>').text(decodeURIComponent(data[i].pName));
										var $prCount = $("<td>").text(data[i].prCount);
										var $price = $("<td>").text(data[i].price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
										
										$tr.append($phName);									
										$tr.append($pName);
					                    $tr.append($prCount);
					                    $tr.append($price);
					                    $tableBody.append($tr);																		
									}
									
									$('#totalP').text(data[0].total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
									$('#mName').text(decodeURIComponent(data[0].mName));
									$('#phone').text(data[0].phone);
									$('#zip').text(data[0].zip);
									$('#address').text(decodeURIComponent(data[0].address));
									$('#address2').text(decodeURIComponent(data[0].address2));
									$('#note').text(decodeURIComponent(data[0].note.replace(/\+/g,' ')));
								}
							});
						});
					
					</script>							
				    <!-- The Modal -->
				    <div id="cmodal" class="modal">	 
				      <!-- Modal content -->
				      <form id="cForm" method="post">
					      <div class="modal-content2">
					        <span class="close">&times;</span>                                                               
					        <p><font style="font-size:25px; font-weight:500;">주문 상세</font></p>
					        <br>
							<table id="table_D">
								<thead> <!-- 게시판 라벨 부분 -->
								<tr>
									<th width="10%"></th>
									<th width="55%" class="title">상품명</th>
									<th width="15%">수량</th>
									<th width="15%">가격</th>
								</tr>
								</thead>
								<tbody>				
								</tbody>
							</table> 
							<br>
							<span class="tHead">총 금액</span>
							<p id="total"><span id="totalP"></span>원</p>
							<hr>
							<span id="orderInfo_head">주문자 정보</span><br>
							<p class="orderInfo">
								이름 : <span id="mName"></span><br>
								연락처 : <span id="phone"></span><br>
								주소 : <span id="zip"></span><br><span id="address" style="margin-left: 45px;"></span><br><span id="address2" style="margin-left: 45px;"></span><br>
								메모 : <span id="note"></span><br>
							<p>
					      </div>
				      </form>	 
				    </div>
					<script>	  
						$('span.close').click(function(){
							$('#cmodal').attr('style', 'display:none');
						});		
					
					</script>			    
				</div>		    
			</div>
		</div>
		<script>
			$("#listBtn").click(function(){
				if($("#list").is(":visible")){
					$("#list").slideUp();
				} else {
					$("#list").slideDown();
				}
			});
		
			// 카테 정렬
			function sortCate(data){
				var sortCate = data.innerText;
				location.href = "orderSort.ma?sortCate="+sortCate+"&page=1";
			}	
			
			
			$('.statBtn').click(function(){
				var orderNo = $(this).parent().parent().children().eq(0).text();
				var status = $('.oStatus').val();	
				$.ajax({
					url: 'oStatus.ma',
					data: {orderNo:orderNo, status:status},
					dataType: 'json',
					success: function(data){
						location.reload();				
					}							
				});
			});
			
		</script>	
	<c:import url="../common/footer.jsp"/>				
</body>
</html>