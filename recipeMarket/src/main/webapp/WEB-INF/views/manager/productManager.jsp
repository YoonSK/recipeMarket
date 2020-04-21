<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 마켓  - 재고관리</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script> 
<style>
	select{
		    height: 30px;
    width: 150px;
    border-radius: 10px;
    margin-left: 1%;
	}
	#selectT{
		margin-bottom: 10px;
	}
	#count{
		height:35px;
	}
	#selectT, #productT, #count{
		width: 80%;
		margin-left:10%;
	}
	th{
		background: #e8e5da;
		    height: 40px;
	}
	#searchText{
		outline: none;
	    height: 25px;
	    border-radius: 5px;
	    border: 1px solid lightgray;
	    vertical-align: bottom;
    }
    
    #updateBtn, #updateProduct{
    	background: orangered;
    	color: white;
   		height: 30px;
	    border: none;
	    border-radius: 5px;
	    width: 50px;
    }
    span{
    	font-size: 13pt;
	    font-weight: 700;
    }
    .insertDate{
    	height: 25px;
    width: 150px;
    border-radius: 5px;
    border:1px solid lightgray;
    margin-left: 1%;
    }
    
    .insertBtn{
    	background : #ff6464;
    	color: white;
   		height: 30px;
	    border: none;
	    border-radius: 5px;
	    width: 70px;
    }
    .exChangeBtn{
    	background: #c5c5c5;
    	color: white;
    	float: right;
    	margin-right: 10px;
    	border: none;
    	height: 30px;
    	border-radius: 5px;
    }
    button{
    	cursor:pointer;
    }
    .modal {display: none; position: fixed; z-index: 1; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background-color: rgb(0,0,0); background-color: rgba(0,0,0,0.4);}
    .modal-content {background-color: #fefefe; margin: 20% auto; padding: 20px; border: 1px solid #888; width: 50%; height: auto;}
    .close {color: #aaa; float: right; font-size: 28px; font-weight: bold;}
    .close:hover, .close:focus {color: black; text-decoration: none; cursor: pointer;}	
    
    .defaultBtn{
    	width: 70px;
	    height: 30px;
	    background: #fee0a1;
	    color: white;
	    border: none;
	    border-radius: 5px;
	    margin-left: 40%;
    }
    
    #cancel{
    	background:lightgray;
    	color: white;
	    border: none;
	    border-radius: 5px;
	    width: 70px;
	    height: 30px;
    }
    input, select{outline: none;}
    
    #moneyBtn{
    	background: #dee6c3;
    	height: 30px;
	    border: none;
	    border-radius: 5px;
	    width: 70px;
    }
    #searchBtn{
    	width: 60px;
	    height: 30px;
	    border-radius: 5px;
	    color: white;
	    background: steelblue;
	    border: none;
    }
    #income{
    	background: orangered;
    	color: white;
   		height: 30px;
	    border: none;
	    border-radius: 5px;
	    width: 50px;
    }
</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>	
	<div class="outer">
		<div id="container">
			<form action="<%= request.getContextPath() %>/updateProduct.ma" id="cForm" method="post" enctype="Multipart/form-data">
				<h2>재고 관리</h2>
				<div id="content" >
					<div id="slectBox">
						<table id="selectT" style="border: 1px solid #dee6c3">
							<tr>
								<th class="head">상품분류</th>
								<td><select name="searchCategory">
								    <option value="">대분류</option>
								    <option value="곡류">곡류</option>
									<option value="과일류">과일류</option>
									<option value="채소류">채소류</option>
									<option value="어류">어류</option>
									<option value="육류">육류</option>
								    <option value="음료">음료</option>
								    <option value="기타">기타</option>
									</select>
								</td>
							</tr>
							<tr>
								<th class="head">재고상태</th>
								<td>
									<input type="radio" name="chk_info" value="전체">전체
									<input type="radio" name="chk_info" value="품절">품절
									<input type="radio" name="chk_info" value="부족">부족
									<input type="radio" name="chk_info" value="여유">여유
								</td>
							</tr>
							
							<tr>
								<th class="head">상품등록일</th>
								<td>
									<input type="date" name="startDate" class="insertDate"> &nbsp; - 
									<input type="date" name="endDate" class="insertDate">
								</td>
							</tr>
							
							
							<tr>
								<th  class="head">검색조건</th>
								<td>
								<select name="searchCate">
								    <option value="상품명">상품명</option>
								    <option value="학생">상품코드</option>
								    <option value="기타">기타</option>
								</select>
								<input type="text" id="searchText" placeholder="검색어를 입력해주세요.">
								<button id="searchBtn">검색</button>
								</td>
							</tr>
						</table>
						<div id="count">
							<span>총 상품수  : ${ listCount }</span><span id="pCount"></span><span> 검색 상품수 : </span><span id="sCount"></span>
							<button type="button" style="float: right; margin-right: 10px;" class="insertBtn" onclick="insertProduct();">상품등록</button>
							<button type="button" style="float: right;  margin-right: 10px;"class="exChangeBtn">엑셀파일로 만들기</button>
						</div>
						<table id="productT" style="text-align:center;">
							<tr>
								<th colspan=2>상품코드</th>
								<th>상품명</th>
								<th>판매가</th>
								<th>입고</th>
								<th>출고</th>
								<th>재고</th>
								<th>상태</th>
								<th>기능</th>
							</tr>
							<c:if test="${ empty list }">
							<tr>
								<td colspan="8">
									<h2 align="center">상품이 존재하지 않습니다.</h2>
								</td>
							</tr>
							</c:if>
							<c:forEach var="product" items="${ list }" varStatus="status">
								<tr>
									<td>${ product.productNo }</td>
									<c:if test="${ plist[status.index].pName != null}">
										<td>
											<img id="profileImg" style="width:70px; float:right" src="resources/upload/${ plist[status.index].pName }"/>
										</td>
									</c:if>
									
									
									<td>${ product.name }</td>
									<td>${ product.price }</td>
									<td id="incomeVal">${ product.income }</td>
									<td>${ product.export }</td>
									<td>${ product.stock }</td>
									<td>
										<c:if test="${ product.stock eq 0 }">
											품절
										</c:if>
										<c:if test="${ product.stock le 100 and product.stock gt 0  }">
											부족
										</c:if>
										<c:if test="${ product.stock ge 100 }">
											여유
										</c:if>
									</td>
									<td id="btnArea">
										<button id="moneyBtn" type="button">판매수익</button>
										<button id="updateBtn" type="button">수정</button>
									</td>
								</tr>
							</c:forEach>
							 	<!-- 페이징 처리 -->
						      	<tr align="center" height="20" id="buttonTab">
						        	<td colspan="6">
						         
						        	<!-- [이전] -->
						        	<c:if test="${ pi.currentPage <= 1 }">
						            	   [이전] &nbsp;
						            </c:if>
						            <c:if test="${ pi.currentPage > 1 }">
						               <c:url var="before" value="pManage.ma">
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
						                  <c:url var="pagination" value="pManage.ma">
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
						               <c:url var="after" value="pManage.ma">
						                  <c:param name="page" value="${ pi.currentPage + 1 }"/>
						               </c:url> 
						               <a href="${ after }">[다음]</a>
						            </c:if>
						         </td>
						      </tr>	
						</table>
					</div>
				</div>
			</form>
		</div>
	</div>
		<script>
		function insertProduct(){
			$('#cmodal').attr('style', 'display:block');
		}
	</script>
		 <!-- The Modal -->
			    <div id="cmodal" class="modal">	 
			      <!-- Modal content -->
			      <form action="<%= request.getContextPath() %>/insertProduct.ma" id="cForm" method="post" enctype="Multipart/form-data">
				      <div class="modal-content">
				        <span class="close">&times;</span>                                                               
				        <p><font style="font-size:25px; font-weight:500;">상품 등록</font></p>
				        <br>
						<div id="slectBox">
						  	<div id="imageArea">
					    		<figure>
									<img name="pImageArea" width=140px; height=140px; id="pImageArea" src="https://recipe1.ezmember.co.kr/img/pic_none3.gif">
								</figure>	
							</div>	
										
						<div id="uArea">
							<input type="file" name= "pImage" id="pImage" multiple="multiple" onchange="LoadImg(this)">
						</div>
					
						<br>
							<script>
								$(function(){
									$("#uArea").hide();
									$("#imageArea").click(function(){
										$("#pImage").click();
									});
								});
									function LoadImg(value){
										if(value.files && value.files[0]){
											var reader = new FileReader();
											reader.onload = function(e){								
											$("#pImageArea").attr("src", e.target.result);
											}
											reader.readAsDataURL(value.files[0]);
										}
									}
							</script>
						<table id="selectT" style="border: 1px solid #dee6c3">
							<tr>
								<th class="head">상품분류</th>
								<td>
									<select name="category">
									    <option value="">대분류</option>
									    <option value="곡류">곡류</option>
									    <option value="과일류">과일류</option>
									    <option value="채소류">채소류</option>
									    <option value="어류">어류</option>
									    <option value="육류">육류</option>
									    <option value="음료">음료</option>
									    <option value="기타">기타</option>
									</select>
								</td>
							</tr>
							<tr>
								<th class="head">상품명</th>
								<td>
									<input type="text" name="name" placeholder="상품명을 입력해주세요." class="insertDate" style="width: 200px;">
								</td>
							</tr>
						
							<tr>
								<th class="head">상품가격</th>
								<td>
									<input type="text" name="price" class="insertDate"> 원
								</td>
							</tr>
							
						
							<tr>
								<th  class="head">상품수량</th>
								<td><input type="number" name="stock" min="1" max="999999" class="insertDate" style="width:70px;">개</td>
							</tr>
						</table>
							<button type="submit" class="defaultBtn">등록</button>
							<button type="button" id="cancel" onclick="cancelBtn();">취소</button>
				      </div>
				    </div>
			      </form>	 
			    </div>
			    <script>	  
					$('span.close').click(function(){
						$('#cmodal').attr('style', 'display:none');
					});		
					
					function cancelBtn(){
						$('#cmodal').attr('style', 'display:none');
					}

					$('#updateBtn').click(function(){
						var reset = "";
						$('#incomeVal').html(reset);
						$('#incomeVal').html('<input type="text" id="income" style="height: 30px;border: none; border-radius: 5px;width: 50px; background: white; color: black; border: 1px solid black" name="income">');
						
						$('#btnArea').html('<button type="submit" id="updateProduct">확인</button>');
						/* $('#btnArea').html('<input type="button" id="income" name="income" value="${ product.income }" >'); */
					});
					
					$('updateProduct').click(function(){
						
					});
				</script>

<%-- 	<c:import url="../common/footer.jsp"/> --%>
</body>
</html>