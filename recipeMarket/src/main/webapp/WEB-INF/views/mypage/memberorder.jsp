<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역 조회</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script> 
<style>
	div.content{height: 600px;}
	h2{margin-left: 135px;}
	.tableArea{width: 80%; height: 650px; margin: 0 auto; margin-top: 80px;}
	table {width: 100%;}
	table > class{margin-left: 100px; margin-top: 30px; width: 680px;}
	table, th, td{word-spacing: 5px; padding: 5px; height: 40px;}
	table thead th{border-bottom: 2px solid #e8e5da; background-color: #e8e5da; height: 30px; font-weight: 600; text-align: center;}
	table tbody th{font-weight: 600; border-bottom: 1px solid #5d5d5d; text-align: center;}
	table tbody td{border-bottom: 2px solid #e8e5da; font-family: inherit; text-align: center; font-size: 11pt;}
	input[type="submit"]{width: 60px; height: 20px; font-size: 10px; font-weight: 600; text-align: center; border:1px solid #fee0a1; border-radius: 4px; background: white;}
	input[type="submit"]:hover{cursor: pointer; background: #fee0a1; color: white;}
    
    .modal {display: none; position: fixed; z-index: 1; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background-color: rgb(0,0,0); background-color: rgba(0,0,0,0.4);}
    .modal-content {background-color: #fefefe; margin: 20% auto; padding: 20px; border: 1px solid #888; width: 50%; height: 500px;}
    .close {color: #aaa; float: right; font-size: 28px; font-weight: bold;}
    .close:hover, .close:focus {color: black; text-decoration: none; cursor: pointer;}	
    p#total{font-weight: 900; font-size: 18px; text-align: right;}
    span#orderInfo_head{font-weight: 800; font-size: 17px;}
	table#tableD > thead th{border-bottom: 2px solid #e8e5da; background-color: #e8e5da; height: 20px; font-weight: 600; text-align: center;}    
	table#tableD {width: 100%;}
	table#tableD > th, td{word-spacing: 5px; padding: 5px; height: 20px;}   
	#buttonTab{border-left: hidden; border-right: hidden;}	 
</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>	
	<div class="outer">
		<div class="container">
			<div class="content">	
				<h2>주문 내역 조회</h2>			
				<div class="tableArea">
					<table id="table">
						<thead> <!-- 게시판 라벨 부분 -->
						<tr>
							<th width="15%">날짜</th>
							<th width="55%" class="title">주문 정보</th>
							<th width="15%">결제금액</th>
							<th width="15%">주문 상태</th>
						</tr>
						</thead>
						<tbody>				
						<c:forEach var="order" items="${ list }">	
						<tr>
							<td>${ order.date }</td>
							<td class="order_D">${ order.oList }</td>
							<td>${ order.total }</td>
							<td>
								<c:if test="${ order.status == 0}">
									결제완료
								</c:if>	
								<c:if test="${ order.status == 1}">
									배송중
								<br>
								<input type="submit" id="updateBtn" value="수취 확인">									
								</c:if>	
								<c:if test="${ order.status == 2}">
									배송완료
								<br>
								<input type="submit" id="updateBtn" value="후기 작성">									
								</c:if>																	
							</td>
						</tr>		
						</c:forEach>																						
						</tbody>
						
						<!-- 페이징 처리 -->
						<tr align="center" height="20" id="buttonTab">
							<td colspan="6">
							
								<!-- [이전] -->
								<c:if test="${ pi.currentPage <= 1 }">
									[이전] &nbsp;
								</c:if>
								<c:if test="${ pi.currentPage > 1 }">
									<c:url var="before" value="blist.bo">
										<c:param name="page" value="${ pi.currentPage - 1 }"/>
									</c:url>
									<a href="${ before }">[이전]</a> &nbsp;
								</c:if>
								
								<!-- 페이지 -->
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
									<c:if test="${ p eq pi.currentPage }">
										<font color="red" size="4"><b>[${ p }]</b></font>
									</c:if>
									
									<c:if test="${ p ne pi.currentPage }">
										<c:url var="pagination" value="blist.bo">
											<c:param name="page" value="${ p }"/>
										</c:url>
										<a href="${ pagination }">${ p }</a> &nbsp;
									</c:if>
								</c:forEach>
								
								<!-- [다음] -->
								<c:if test="${ pi.currentPage >= pi.maxPage }">
									[다음]
								</c:if>
								<c:if test="${ pi.currentPage < pi.maxPage }">
									<c:url var="after" value="blist.bo">
										<c:param name="page" value="${ pi.currentPage + 1 }"/>
									</c:url> 
									<a href="${ after }">[다음]</a>
								</c:if>
							</td>
						</tr>						
					</table>
				</div>
				
		    <!-- The Modal -->
		    <div id="cmodal" class="modal">	 
		      <!-- Modal content -->
		      <form action="<%= request.getContextPath() %>/coupon.pt" id="cForm" method="post">
			      <div class="modal-content">
			        <span class="close">&times;</span>                                                               
			        <p><font style="font-size:25px; font-weight:500;">주문 상세</font></p>
			        <br>
					<table id="table_D">
						<thead> <!-- 게시판 라벨 부분 -->
						<tr>
							<th width="15%">No.</th>
							<th width="55%" class="title">상품명</th>
							<th width="15%">수량</th>
							<th width="15%">가격</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td>1</td>
							<td>D 참치</td>
							<td>2</td>
							<td>4,000원</td>
						</tr>
						<tr>
							<td>2</td>
							<td>CC 냉동 새우</td>
							<td>2</td>
							<td>12,000원</td>
						</tr>							
						</tbody>
					</table> 
					<br>
					<span class="tHead">총 금액</span>
					<p id="total">16,000원</p>
					<hr>
					<span id="orderInfo_head">주문자 정보</span><br>
					<p class="orderInfo">
						이름 : 홍길동<br>
						연락처 : 010-1234-5678<br>
						주소 : 서울특별시 강남구 테헤란로<br>
						메모 : 부재시 경비실에 맡겨주세요<br>
						결제 수단 : 신용카드<br>
					<p>
			      </div>
		      </form>	 
		    </div>
			<script type="text/javascript">	  
				$('td.order_D').click(function(){
					$('#cmodal').attr('style', 'display:block');
				});
				$('span.close').click(function(){
					$('#cmodal').attr('style', 'display:none');
				});		
			
			</script>
			</div>
		</div>
	</div>	
	<c:import url="../common/footer.jsp"/>				
</body>
</html>