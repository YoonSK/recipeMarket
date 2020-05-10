<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<style>
	.wrapper{
		height:1500px;
		background:#EAEAEA;
	}
	
	#picBtn{
		margin:50px;
		font-size:50px;
	}
	
	#bContent{
		width: 90%;
    	height: 500px;
   	 	font-size: 25px;
    	margin: 17px;
    	background: #f5f5f5;
    	line-height: 180%;
	}
	

	
	#updateBtn{
		    font-size: 25px;
    background: #6cb77e;
    color: #fff;
    padding: 10px 30px;
    border-radius: 5px;
    border: none;
    cursor: pointer;
	}
	
	#backBtn{
	font-size: 25px;
    padding: 10px 30px;
    border-radius: 5px;
    cursor: pointer;
    border: none;
	}
	#boardUpdateTable{
		width:100%;
	}
	select {
		width: 200px;
		padding: .8em .5em;
		border: 1px solid #999;
		font-family: inherit;
		background: url('arrow.jpg') no-repeat 95% 50%;
		border-radius: 0px;
		border-radius: 10px;
		cursor:pointer;
		outline:none;
	}

	select::-ms-expand {
    	display: none;
	}
	
	#imageArea{
		margin: 17px;
	}
	
	#bImageArea{
		border: 1px solid black;
	}
	
	
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
		<div class="wrapper">
			<br>
			<div class="title"  style="background: white; height:70px; width:1500px; margin:0 auto;">
	            <span style=" vertical-align: middle; font-size:30px; font-align:center; font-weight:bold; padding:15px;">
	               	게시글 수정
	            </span>
	            
	         </div>
	         <br>
		     <div style="background: white; width:1500px; margin:0 auto;">
				<form action="bupdate.bo" method="post" enctype="Multipart/form-data">
					<input type="hidden" name="page" value="${ page }"> 
					<input type="hidden" name="postNo" value="${ board.postNo }">
					<c:if test="${ board.pName != null }">
						
					</c:if>
					
					<c:if test="${ board.pName == null }">
						
					</c:if>
				
				
		         	<table id="boardUpdateTable">
		         		<tr>
		         			<th style="width:200px; height:30px; font-size:25px;">카테고리</th>
		         			<td colspan=4 style="font-size:25px">
		         				<select style="font-size:20px" name="category">
		         					<c:if test="${ board.category eq '자유톡' }">
			         					<option value="자유톡" selected>자유톡</option>
			         					<option value="요리톡">요리톡</option>
		         					</c:if>
		         					
		         					<c:if test="${ board.category eq '요리톡' }">
			         					<option value="자유톡">자유톡</option>
			         					<option value="요리톡" selected>요리톡</option>
		         					</c:if>
		         				</select>
		         			</td>
		         		</tr>
		         		
		         		<tr>
		         			<th colspan=5>
		         				<textarea id="bContent" placeholder="내용"  name="content">${ board.content }</textarea>
		         			</th>
		         		</tr>
		         		
		        
		         	</table>
		         	
		         	<div id="imageArea">
		         		<h2>사진 첨부</h2>
			    		<figure>
			    		<c:if test="${ board.pName != null }">
							<img name="bImageArea" width=140px; height=140px; id="bImageArea" src="resources/upload/${board.pName}">
							<input type="hidden" name="pName" value="${ board.pName }">
						</c:if>
						<c:if test="${ board.pName == null }">
							<img name="bImageArea" width=140px; height=140px; id="bImageArea" src="https://recipe1.ezmember.co.kr/img/pic_none3.gif">
						</c:if>
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
					
					
		         	
		         	
		         	<div class="input-submit" align="center" style="padding-bottom: 30px">
		         	    <input type="submit" value="수정"  id="updateBtn"> &nbsp; &nbsp;
		         		<button type="button" onclick="location.href='javascript:history.go(-1);'" id="backBtn">취소</button>
		         	</div>
		         	

				</form>
			</div>
		</div>
		
		<%@ include file="../common/footer.jsp" %>			
</body>
</html>