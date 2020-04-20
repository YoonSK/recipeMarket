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
    
    #update{
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
</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>	
	<div class="outer">
		<div id="container">
			<h2>재고 관리</h2>
			<div id="content" >
				<div id="slectBox">
					<table id="selectT" style="border: 1px solid #dee6c3">
						<tr>
							<th class="head">상품분류</th>
							<td><select name="big">
							    <option value="">대분류</option>
							    <option value="학생">학생</option>
							    <option value="회사원">회사원</option>
							    <option value="기타">기타</option>
								</select>
								
								<select name="mid">
							    <option value="">중분류</option>
							    <option value="학생">학생</option>
							    <option value="회사원">회사원</option>
							    <option value="기타">기타</option>
								</select>
								
								<select name="small">
							    <option value="">소분류</option>
							    <option value="학생">학생</option>
							    <option value="회사원">회사원</option>
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
							<button>검색</button>
							</td>
						</tr>
					</table>
					<div id="count">
						<span>총 상품수  : </span><span id="pCount"></span><span> 검색 상품수 : </span><span id="sCount"></span>
						<button style="float: right; margin-right: 10px;" class="insertBtn" onclick="insertProduct();">상품등록</button>
						<button style="float: right;  margin-right: 10px;"class="exChangeBtn">엑셀파일로 만들기</button>
					</div>
					<table id="productT">
						<tr>
							<th>상품코드</th>
							<th>상품명</th>
							<th>판매가</th>
							<th>입고</th>
							<th>출고</th>
							<th>재고</th>
							<th>기능</th>
						</tr>
						<tr>
							<td>상품코드</td>
							<td>상품명</td>
							<td>판매가</td>
							<td>20</td>
							<td>20</td>
							<td>0</td>
							<td>
								<button id="update">수정</button>
								<button id="update1">수정</button>
							</td>
						</tr>
					</table>
				</div>
				
			</div>
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
			      <form action="<%= request.getContextPath() %>/insertProduct.pa" id="cForm" method="post">
				      <div class="modal-content">
				        <span class="close">&times;</span>                                                               
				        <p><font style="font-size:25px; font-weight:500;">상품 등록</font></p>
				        <br>
						<div id="slectBox">
						  	<div id="imageArea">
					    		<figure>
									<img name="bImageArea" width=140px; height=140px; id="bImageArea" src="https://recipe1.ezmember.co.kr/img/pic_none3.gif">
								</figure>	
							</div>	
										
						<div id="uArea">
							<input type="file" name= "bImage" id="bImage" multiple="multiple" onchange="LoadImg(this)">
						</div>
					
						<br>
							<script>
								$(function(){
									$("#uArea").hide();
									$("#imageArea").click(function(){
										$("#bImage").click();
									});
								});
									function LoadImg(value){
										if(value.files && value.files[0]){
											var reader = new FileReader();
											reader.onload = function(e){								
											$("#bImageArea").attr("src", e.target.result);
											}
											reader.readAsDataURL(value.files[0]);
										}
									}
							</script>
						<table id="selectT" style="border: 1px solid #dee6c3">
							<tr>
								<th class="head">상품분류</th>
								<td>
									<select name="big">
									    <option value="">대분류</option>
									    <option value="회사원">회사원</option>
									    <option value="기타">기타</option>
									</select>
									
									<select name="mid">
									    <option value="">중분류</option>
									    <option value="회사원">회사원</option>
									    <option value="기타">기타</option>
									</select>
									
									<select name="small">
									    <option value="">소분류</option>
									    <option value="회사원">회사원</option>
									    <option value="기타">기타</option>
									</select>
								</td>
							</tr>
							<tr>
								<th class="head">상품명</th>
								<td>
									<input type="text" name="productName" placeholder="상품명을 입력해주세요." class="insertDate" style="width: 200px;">
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
								<td><input type="number" min="1" max="999999" class="insertDate" style="width:70px;">개</td>
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
						
				</script>

<%-- 	<c:import url="../common/footer.jsp"/> --%>
</body>
</html>