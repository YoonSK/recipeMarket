<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅 문의</title>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<div class="wrapper" style="min-height:750px">
			<br>
			<div class="title"  style="background: white; height:70px; width:1450px; margin:0 auto;">
	            <span style=" vertical-align: middle; font-size:30px; font-align:center; font-weight:bold; padding:15px;">
	               	회원님들의 실시간 질문
	            </span>
	            <span style="float:right; padding:10px; margin:0 auto;">
	            </span>
	         </div>

	         <h2 style="padding-left:230px; margin:auto;">채팅 문의 목록</h2>
	         <br>
	         <c:if test="${ empty qlist }">
	         	<hr>
	         	<h3 align="center">채팅 문의글이 없습니다.</h3>
	         	<hr>
	         </c:if>
	         
	         <table style="background: white; width:1450px; margin:0 auto; border-collapse: collapse;">
	         	<c:forEach var="b" items="${ qlist }" varStatus="status">
		        	<!-- <div > -->
		        	<tr class="contentTR">
		        		<td width="75%" style="font-size:30px; border-top:1px solid lightgray; border-bottom:1px solid lightgray;">
			        		- ${ b.nickName }님의 질문<span style="color:red">[NEW]</span>
			        		<input type="hidden" id="postNo" value="${ b.postNo }" name = "postNo">
		        		</td>	
		        		
		        	</tr>	
	        	</c:forEach>
	        	
	        	<%-- <!-- 페이징 처리 -->
		      	<tr align="center" height="20" id="buttonTab">
		        	<td colspan="6">
		         
		        	<!-- [이전] -->
		        	<c:if test="${ pi.currentPage <= 1 }">
		            	   [이전] &nbsp;
		            </c:if>
		            <c:if test="${ pi.currentPage > 1 }">
		               <c:url var="before" value="qlist.bo">
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
		                  <c:url var="pagination" value="qlist.bo">
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
		               <c:url var="after" value="qlist.bo">
		                  <c:param name="page" value="${ pi.currentPage + 1 }"/>
		               </c:url> 
		               <a href="${ after }">[다음]</a>
		            </c:if>
		         </td>
		      </tr> --%>
			</table>
			
			
			
	    <script>
	    	$(function(){
	    		$('.contentTR').mouseenter(function(){
	    			$(this).css('cursor','pointer');
	    			$(this).css('background-color','#d9d9d9');
	    			
	    		}).mouseleave(function(){
	    			$(this).css('background-color','white');
	    		}).click(function(){
	    			 $(this).children('td').children('span').css('visibility','hidden');	 
	    			 var postNo= $(this).children('td').children('input').val();
	    			console.log(postNo);
		    		//location.href="bdetail.bo?postNo="+postNo+"&page="+${pi.currentPage}; 
	    			qnaList(postNo);
		    	});
	    	}); 
	    	
	    	
	    	function qnaList(postNo){
				$('#kmodal').attr('style', 'display:block');
				//$('#listT tbody').css("overflow", "scroll");
			}
	    	
	    </script>     
	    
	    <!-- The Modal -->
			    <div id="kmodal" class="kmodal">
				 <!-- Modal content -->
					<div class="kmodal-content">
						<span class="close">&times;</span>
				        <div id="titleName">관리자와 1:1 채팅 문의</div>
						<textarea id="messageArea" readonly style="resize:none;"></textarea> <br>
						<input type="text" id="message"/>
						<input type="button" id="sendBtn" value="보내기"/>
			    	</div>
			    </div>
			    
			    <script type="text/javascript">
					$("#sendBtn").click(function() {
						sendMessage();
						$('#message').val('')
					});

					let sock = new SockJS("http://localhost:9780/recipeMarket/echo");
					sock.onmessage = onMessage;
					sock.onclose = onClose;
					// 메시지 전송
					function sendMessage() {
						sock.send($("#message").val());
					}
					// 서버로부터 메시지를 받았을 때
					function onMessage(msg) {
						var data = msg.data;
						$("#messageArea").append(data + "\n");
					}
					// 서버와 연결을 끊었을 때
					function onClose(evt) {
						$("#messageArea").append("연결 끊김");
				
					}
				</script>
				
				
				 <script>	
				$('span.close').click(function(){
					$('#kmodal').attr('style', 'display:none');
				});		
				
				
				function cancelBtn(){
					$('#kmodal').attr('style', 'display:none');
				}
				</script>
	         
	         
	         
	</div>	         
	<%@ include file="../common/footer.jsp" %>
</body>
</html>