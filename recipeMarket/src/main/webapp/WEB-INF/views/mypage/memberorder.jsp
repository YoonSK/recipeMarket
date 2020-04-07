<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역 조회</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script> 
<style>
	div.container{left: 18%; position: absolute; width: 900px; top: 30%;}
	div.content{height: 600px;}
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
</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<jsp:include page="footer.jsp"/>	
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
						<tr>
							<td>2020-03-30</td>
							<td class="order_D">가지, 양파 외</td>
							<td>32,000원</td>
							<td>
								배송중<br>
								<input type="submit" id="updateBtn" value="수취 확인">
							</td>
						</tr>	
						<tr>
							<td>2020-03-30</td>
							<td>가지, 양파 외</td>
							<td>32,000원</td>
							<td>
								배송중<br>
								<input type="submit" id="updateBtn" value="수취 확인">
							</td>
						</tr>			
						<tr>
							<td>2020-03-30</td>
							<td>가지, 양파 외</td>
							<td>32,000원</td>
							<td>
								배송중<br>
								<input type="submit" id="updateBtn" value="수취 확인">
							</td>
						</tr>
						<tr>
							<td>2020-03-30</td>
							<td>가지, 양파 외</td>
							<td>32,000원</td>
							<td>
								배송완료<br>
								<input type="submit" id="updateBtn" value="후기 작성">
							</td>
						</tr>																		
						</tbody>
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
</body>
</html>