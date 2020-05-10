<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<style>
	#insertBtn { 
		float: right;
		background: #377a71;
		border-radius:5px;
		color:white; 
		border:none; 
		vertical-align: middle; 
		font-size: 25px;
    	width: 120px;
    	height: 50px; 
    	font-align:center; 
    	cursor:pointer;
	}
	.wrapper{
		height:100%;
		background:#EAEAEA;
	}
	
	#profileImg{
		width:100px; 
		height:100px;
		vertical-align: middle;  
		margin-left: 15%;
		border-radius: 50%;
	}
	
	#thumImgTd{
		/* text-align:center; */
	}
	
	#thumImg{
		 margin:15px; 
		 width:90%;
		 height:100%;
		 border-radius: 20px;
		
	}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
		<div class="wrapper">
			<br>
			<div class="title"  style="background: white; height:70px; width:1450px; margin:0 auto;">
	            <span style=" vertical-align: middle; font-size:30px; font-align:center; font-weight:bold; padding:15px;">
	               	토크 전체의 글을 볼수 있습니다.
	            </span>
	            <span style="float:right; padding:10px; margin:0 auto;">
	            	<c:if test="${ !empty loginUser }">
	                <button id="insertBtn" onclick="location.href='insertView.bo';">등록하기</button>
	               <!--  <button id= "test1" onclick="location.href='test1.bo';">실시간 채팅 문의</button> -->
	            	</c:if>
	            </span>
	         </div>

	         
	         <br>
	         <c:if test="${ empty list }">
	         	<h2 align="center">게시글이 존재하지 않습니다.</h2>
	         </c:if>
	         
	         <table style="background: white; width:1450px; margin:0 auto;">
	         	<c:forEach var="b" items="${ list }" varStatus="status">
		        	<!-- <div > -->
		        	<tr>
		        		<c:if test="${ plist[status.index].pName == null}">
						<td rowspan=4 width="150" height="150">
							<img id="profileImg" src="resources/images/user.png"/>
						</td>
						</c:if>
						<c:if test="${ plist[status.index].pName != null}">
						<td rowspan=4 width="150" height="150">
							<img id="profileImg" src="resources/upload/${ plist[status.index].pName }"/>
						</td>
						</c:if>
						
						<td width="75%" style="font-size:30px">${ b.nickName }
						</td>
							
						<td style="font-size:20px; width:30px;">♡</td>
						<td width="30px" style="font-size:20px">${ glist[status.index].rCount }</td>
						<td style="font-size:20px; width:70px;">댓글수</td>
						<c:if test="${ rlist[status.index].rCount != null}">
						<td style="font-size:20px; width:30px">${ rlist[status.index].rCount }</td>	
						</c:if>	
						<c:if test="${ rlist[status.index].rCount == null}">
						<td style="font-size:20px; width:30px">0</td>	
						</c:if>		         		
		        	</tr>
		         		
		        	<tr>
		        		<td width="75%" colspan=5 style="color:gray; font-size:20px">${ b.category }  (작성일:${b.createDate})</td>
		        	</tr>
		         		
		        	<tr class="contentTR">
		        		<td width="75%" colspan=5 style="font-size:20px">
			        		${ b.content }
			        		<input type="hidden" value="${ b.postNo }" name="postNo" id="postNo">
		        		</td>
		        	</tr>
		        		
		        	<tr class="contentTR">
		        		<td colspan=5 id="thumImgTd">
		        			<c:if test="${ b.pName != null }">
		        			<img  src="resources/upload/${ b.pName }" id="thumImg"/>
		        			</c:if>
		        			
		        			<%-- <c:if test="${ b.pName == null }">
		        			<img  src="resources/images/food.PNG" id="thumImg"/>
		        			</c:if> --%>
		        			
		        			
		        			<input type="hidden" value="${ b.postNo }" name="postNo" id="postNo">
		        		</td>
	         		</tr>
	         		
	         		<tr>
	         			<td colspan=6><hr></td>
	         		</tr>
		         		
	        	</c:forEach>
	        	
	        <%-- 	<!-- 페이징 처리 -->
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
		      </tr> --%>
		      
		      
		      <!-- 페이징 처리 -->
			<tr align="center" height="20" id="buttonTab" class="pagingArea">
				<td colspan="10">
			<!-- [이전] -->
			<c:if test="${ pi.currentPage <= 1 }">
				<button disabled>&laquo;</button>
			</c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="before" value="blist.bo">
		    		<c:param name="page" value="${ pi.currentPage - 1 }"/>
		    	</c:url>
				<button onclick="location.href='${ before }'">&laquo;</button>
			</c:if>
						            
			<!-- 페이지 -->
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<button disabled>${ p }</button>
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
			<button disabled>&raquo;</button>
			</c:if>
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="after" value="blist.bo">
		    		<c:param name="page" value="${ pi.currentPage + 1 }"/>
		   		</c:url> 
				<button onclick="location.href='${ after }'">&raquo;</button>								
				</c:if>
			</td>
		</tr>
	</table>
			
			
			
	    <script>
	    	$(function(){
	    		$('.contentTR').mouseenter(function(){
	    			$(this).css('cursor','pointer');
	    		}).mouseleave(function(){
	    			$(this).css('background-color','white');
	    		}).click(function(){
	    			 var postNo= $(this).children('td').children('input').val();
	    			 
	    			 console.log(postNo);
	    			 	if(${ loginUser eq null }){
	    			 		alert("로그인후 이용해 주세요.");
	    			 		location.href='goLogin.me';
	    			 	}  else{
		    				location.href="bdetail.bo?postNo="+postNo+"&page="+${pi.currentPage};
	    			 	}
		    	});
	    	}); 
	    </script>     
	         
	         
	         
	</div>	         
	         

	<%@ include file="../common/footer.jsp" %>
</body>
</html>