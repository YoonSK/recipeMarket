<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	a{text-decoration: none}
	.borderTable{
		border-bottom: 1px solid gray;
	
	}
	
	.content{
		margin-left:20%;
	}
	.newsArea{
		border-top: 1px solid darkgray;
		width: 1000px;
	}
	
	#thumImg{
		width: 150px;
	}
	
	 #topFoodT td, #weatherT td{
    padding: 4px;
    margin-bottom: 20px;
    line-height: 1.42857143;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 4px;
    -webkit-transition: border .2s ease-in-out;
    -o-transition: border .2s ease-in-out;
    transition: border .2s ease-in-out;
    box-shadow: 0 2px 3px #eee;
    
    }
    a{text-decoration: none;
    color: black;
    text-align: ceter;
    font-size: 20px;}
</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>
	
	<div class="wrapper">
			<br>
			<div class="title">
					<h1>팔로우한 쉐프 소식</h1>
				</div>

	         
	         <br>
	         <c:if test="${ empty clist }">
	         	<h2 align="center">팔로우한 쉐프가 존재하지 않습니다.</h2>
	         </c:if>
	         
	         <table style="background: white; width:1450px; margin:0 auto;">
	         	<c:forEach var="c" items="${ clist }" varStatus="status">
		        	<!-- <div > -->
		        	<tr>
		        		<c:if test="${ c.pName == null}">
						<td>
							<img id="profileImg" width="100px;"src="resources/images/user.png"/>
						</td>
						</c:if>
						<c:if test="${ c.pName != null}">
						<td>
							<img id="profileImg" width="100px;" src="resources/upload/${ c.pName }"/>
						</td>
						</c:if>
						<td  colspan=4 width="75%" style="font-size:30px">${ c.nickName }</td>
		        	</tr>
		         		
 	         		
		        	
		  	      		
		        	<tr class="contentTR">
		        		<td  id="thumImgTd">
		        		<c:if test="${rlist[status.index].memberNo == c.targetNo }">
		        			<c:if test="${rlist[status.index].pName != null }">
		        			<img  src="resources/upload/${rlist[status.index].pName }" id="thumImg"/>
		        			</c:if>
		        			<c:if test="${rlist[status.index+1].pName != null }">
		        			<img  src="resources/upload/${rlist[status.index+1].pName }" id="thumImg"/>
		        			</c:if>
		        			<c:if test="${rlist[status.index+2].pName != null }">
		        			<img  src="resources/upload/${rlist[status.index+1].pName }" id="thumImg"/>
		        			</c:if>
		        			<c:if test="${rlist[status.index+3].pName != null }">
		        			<img  src="resources/upload/${rlist[status.index+1].pName }" id="thumImg"/>
		        			</c:if>
		        			</c:if>
		        		</td>
	         		</tr> 
	         	
	         		<%-- <tr class="contentTR">
		        		<td style="font-size:20px">
			        		${ rlist[status.index].title }
		        		</td>
		        	</tr> --%>
		         		
	        	</c:forEach>
	        	
	       <%--  	<!-- 페이징 처리 -->
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
			</table>
			
			
	         
	         
	</div>	         
	         
	
	
</body>
	<c:import url="../common/footer.jsp"/>
</html>