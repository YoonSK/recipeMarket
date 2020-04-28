<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     

<% response.setContentType("text/html"); %>


<!DOCTYPE html>
<html>
<head>
 <link rel="icon" type="image/png"  href="resources/images/tablogo.png"/>
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
	#keyword{
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
    
    .show {display:block} /*보여주기*/
	.hide {display:none} /*숨기기*/
	
	
	@-webkit-keyframes blink{
        0% {opacity:0.4;}
        100% {opacity:1;}
    }
    @-moz-keyframes blink{
        0% {opacity:0.4;}
        100% {opacity:1;}
    }
    @keyframes blink{
        0% {opacity:0.4;}
        100% {opacity:1;}
    }
	 /* 기간별 조회 */
    ul.dateS{height: 29px; float: left; list-style: none; padding-left: 0px; margin-left: 1%;}
    ul.dateS li{width: 100px; text-align: center; float: left; font-weight: bold; border: 3px solid #e8e5da;}
    ul.dateS li:hover{background-color: #e8e5da; color: white; cursor: pointer;}
</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>	
	<div class="outer">
		<div id="container">
			<form action="<%= request.getContextPath() %>/updateProduct.ma" id="cForm" name ="cForm" method="post" enctype="Multipart/form-data">
				<h2>재고 관리</h2>
				<div id="content" >
					<div id="slectBox">
						<table id="selectT" style="border: 1px solid #dee6c3">
							<tr>
								<th class="head">상품분류</th>
								<td><select name="category" id="category">
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
									<input type="radio" id="chk_info" name="chk_info" value="전체">전체
									<input type="radio" id="chk_info" name="chk_info" value="품절">품절
									<input type="radio" id="chk_info" name="chk_info" value="부족">부족
									<input type="radio" id="chk_info" name="chk_info" value="여유">여유
								</td>
							</tr>
							
							<tr>
								<th class="head">상품등록일</th>
								<td>
									<!-- 기간별 조회  -->
										<ul class="dateS">
											<li onclick=sortDate(this);>전체</li>
											<li onclick=sortDate(this);>1개월</li>
											<li onclick=sortDate(this);>3개월</li>
											<li onclick=sortDate(this);>6개월</li>
											<li onclick=sortDate(this);>1년</li>																														
										</ul>
								</td>
							</tr>
							
							
							<tr>
								<th  class="head">검색조건</th>
								<td>
								<select name="searchCate" id="searchCate">
								    <option value="상품명">상품명</option>
								    <option value="상품코드">상품코드</option>
								</select>
								<input type="text" id="keyword" name="keyword" placeholder="검색어를 입력해주세요.">
								<button type="button" id="searchBtn" onclick="searchProduct();">검색</button>
								</td>
							</tr>
						</table>
						<div id="count">
							<span>총 상품수  : ${ listCount }</span><span id="pCount"></span><span> 검색 상품수 : ${ slistCount }<b id="listSearchCount"></b></span><span id="sCount"></span>
							<button type="button" style="float: right; margin-right: 10px;" class="insertBtn" onclick="insertProduct();">상품등록</button>
							<button type="button" style="float: right;  margin-right: 10px;"class="exChangeBtn" onclick="doExcelDownloadProcess()">엑셀파일로 만들기</button>
						</div>
						
						<table id="productT" style="text-align:center;">
							<thead>
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
							</thead>
							<tbody>
							<c:if test="${ empty list}">
							<tr>
								<td colspan="8">
									<h2 align="center">상품이 존재하지 않습니다.</h2>
								</td>
							</tr>
							</c:if>
							
							
							<c:forEach var="product" items="${ list }" varStatus="status">
								<tr>
									<td>${ product.productNo }<input type="hidden" value="${ product.productNo }" name="productNo"></td>
									<c:if test="${ list[status.index].pName != null}">
										<td>
											<img id="profileImg" name="pName" style="width:70px; float:right" src="resources/upload/${ list[status.index].pName }"/>
										</td>
									</c:if>
									
									<td>${ product.name }<input type="hidden" value="${ product.name }" id="name" name="name"></td>
									<td>${ product.price }<input type="hidden" value="${ product.price }" id="price" name="price"></td>
									<td id="incomeVal${product.productNo}">${ product.income }<input type="hidden" id="income" value="${ product.income }" name="income"></td>
									<td>${ product.export }<input type="hidden" value="${ product.export }" name="export" id="export"></td>
									<td>${ product.stock }<input type="hidden" value="${ product.stock }" name="stock" id="stock"></td>
									<td>
										<c:if test="${ product.stock eq 0 }">
											<span class="blinking" style="border-radius:5px;padding: 5px">품절</span>
										</c:if>
										<c:if test="${ product.stock le 100 and product.stock gt 0  }">
											부족
										</c:if>
										<c:if test="${ product.stock ge 100 }">
											여유
										</c:if>
									</td>
									<td id="btnArea${product.productNo}">
										<button id="moneyBtn" type="button">판매수익</button>
										<button id="updateBtn${product.productNo}" style="background: orangered; color: white; height: 30px; border: none; border-radius: 5px; width: 50px;" type="button">수정</button>
									</td>
								</tr>
								<tr id="a"></tr>
								<script>
									var reset = "";
									$('#updateBtn${product.productNo}').click(function(){
										$('#btnArea${product.productNo}').html('<button type="submit" id="updateProduct">확인</button>');
										
										$('#incomeVal${product.productNo}').html(reset);
										$('#incomeVal${product.productNo}').html('<input type="text" id="income" value="${product.income}" style="height: 30px;border: none; border-radius: 5px;width: 50px; background: #ddfcff; color: black;" name="income"><input type="hidden" name="productNo" value="${product.productNo }">');
										
									});
									var count = 0;
									
									/* 판매수익 버튼 이벤트 */
									$('#moneyBtn').click(function(){
										//	$('#a').html('<tr><td id="count" colspan="8">수량</td></tr>');
									});
								 	
									/* 엑셀 파일 만들기 이벤트 */
								/*	function doExcelDownloadProcess(){
									         var productNo = ${product.productNo};
									        
									        $.ajax({
									            url: "downloadExcelFile.ma",
									            type: "POST",
									            success: function(data){
									                console.log(data);
									            }
									        });
									    } */
									    
									    
										/* 기간별 조회  */	
										function sortDate(data){
											var sortDate = data.innerText;
											location.href = "productSort.ma?sortDate="+sortDate+"&page=1";
										}
								</script>
							</c:forEach>
							
							 	<!-- 페이징 처리 -->
						      	<tr align="center" height="20" id="buttonTab">
						        	<td colspan="9">
						         
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
		/* 검색 버튼 이벤트 */
		function searchProduct(){
			var keyword= $('#keyword').val();
			var searchCate= $('#searchCate').val();
			var category= $('#category').val();
			var startDate = $('#startDate').val();
			var endDate = $('#endDate').val();
			 location.href = "searchProduct.ma?keyword="+keyword+"&searchCate="+searchCate+"&category="+category; 
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
									<img name="pImageArea" width=140px; height=140px; id="pImageArea" src="https://recipe1.ezmember.co.kr/img/pic_none3.gif" >
								</figure>	
							</div>	
										
						<div id="uArea">
							<input type="file" name= "pImage" id="pImage" multiple="multiple" onchange="LoadImg(this)" required>
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
									<select name="category" required>
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
									<input type="text" name="name" required placeholder="상품명을 입력해주세요." class="insertDate" style="width: 200px;">
								</td>
							</tr>
						
							<tr>
								<th class="head">상품가격</th>
								<td>
									<input type="text" name="price" class="insertDate" required> 원
								</td>
							</tr>
							
						
							<tr>
								<th  class="head">상품수량</th>
								<td><input type="number" name="stock" min="1" max="999999" class="insertDate" style="width:70px;" required>개</td>
							</tr>
						</table>
							<button type="submit" class="defaultBtn" id="insertP">등록</button>
							<button type="button" id="cancel" onclick="cancelBtn();">취소</button>
				      </div>
				    </div>
			      </form>	 
			    </div>
			    <script>	
			    $('#insertP').click(function(){
			    	console.log($('#pImage').val());
			    	  if($('#pImage').val() == "" ){
						alert("사진을 등록해주세요.");
						}
			    });
			    	
			   
				$('span.close').click(function(){
					$('#cmodal').attr('style', 'display:none');
				});		
					

				</script>

<%-- <c:import url="../common/footer.jsp"/> --%>
</body>
</html>