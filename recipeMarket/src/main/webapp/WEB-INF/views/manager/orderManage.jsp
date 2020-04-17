<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 관리</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js"></script>
<style>
	div.content{height: 600px;}
	h2{margin-left: 10%;}
	.tableArea{width: 80%; height: 650px; margin: 0 auto; margin-top: 80px;}
	table {width: 100%;}
	table > class{margin-left: 100px; margin-top: 30px; width: 680px;}
	table, th, td{word-spacing: 5px; padding: 5px; height: 40px;}
	table thead th{border-bottom: 2px solid #add1c3; background-color: #add1c3; height: 30px; font-weight: 600; text-align: center;}
	table tbody th{font-weight: 600; border-bottom: 1px solid #add1c3; text-align: center;}
	table tbody td{border-bottom: 2px solid #add1c3; font-family: inherit; text-align: center; font-size: 11pt;}
	input[type="submit"]{width: 65px; height: 20px; font-size: 12px; font-weight: 600; text-align: center; border:1px solid #fee0a1; border-radius: 4px; background: white;}
	input[type="submit"]:hover{cursor: pointer; background: #fee0a1; color: white;}
	/* 카테고리 */
	th ul{display: none; position: absolute; width: 70px; background:white; cursor: pointer;}
	th ul > li{border: 1px solid #add1c3; list-style: none;}
	#listBtn{font-size: small;}
	#listBtn:hover{cursor: pointer;}

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
									<li onclick=sortCate(this);>결제완료</li>
									<li onclick=sortCate(this);>배송중</li>
									<li onclick=sortCate(this);>배송완료</li>
									<li onclick=sortCate(this);>주문취소</li>									
								</ul>				
							</th>
						</tr>
						</thead>
						<tbody>				

						<c:forEach var="order" items="${ list }">	
						<tr class="orderT">
							<td>${ order.orderNo }</td>
							<td>${ order.date }</td>
							<td class="order_D">${ order.oList }</td>
							<td><fmt:formatNumber maxFractionDigits="3" value="${ order.total }"/> 원</td>
							<td>
								<c:if test="${ order.status == 0}">
									결제완료
									<br>
								<input type="submit" id="updateBtn" value="배송 처리">									
								</c:if>	
								<c:if test="${ order.status == 1}">
									배송중
								<br>								
								</c:if>	
								<c:if test="${ order.status == 2}">
									배송완료
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
						<tr align="center" height="20" id="buttonTab">
							<td colspan="6">
							
								<!-- [이전] -->
								<c:if test="${ pi.currentPage <= 1 }">
									&laquo;
								</c:if>
								<c:if test="${ pi.currentPage > 1 }">
									<c:url var="before" value="blist.bo">
										<c:param name="page" value="${ pi.currentPage - 1 }"/>
									</c:url>
									<a href="${ before }">&laquo;</a> 
								</c:if>
								
								<!-- 페이지 -->
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
									<c:if test="${ p eq pi.currentPage }">
										<font size="4"><b>[${ p }]</b></font>
									</c:if>
									
									<c:if test="${ p ne pi.currentPage }">
										<c:url var="pagination" value="mOrder.mp">
											<c:param name="page" value="${ p }"/>
										</c:url>
										<a href="${ pagination }">${ p }</a> &nbsp;
									</c:if>
								</c:forEach>
								
								<!-- [다음] -->
								<c:if test="${ pi.currentPage >= pi.maxPage }">
									&raquo;
								</c:if>
								<c:if test="${ pi.currentPage < pi.maxPage }">
									<c:url var="after" value="mOrder.mp">
										<c:param name="page" value="${ pi.currentPage + 1 }"/>
									</c:url> 
									<a href="${ after }">&raquo;</a>
								</c:if>
							</td>
						</tr>					
					</table>
				</div>			    
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
	
		function sortCate(data){
			var sortCate = data.innerText;
			location.href = "orderSort.ma?sortCate="+sortCate+"&page=1";
		}	
		
		console.log(${ pi.startPage });
		console.log(${ p });
	</script>	
	<c:import url="../common/footer.jsp"/>				
</body>
</body>
</html>