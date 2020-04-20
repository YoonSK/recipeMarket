<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	#insertBtn{
		font-size: 25px;
    	background: #74b243;
    	color: #fff;
    	padding: 10px 30px;
    	border-radius: 10px;
    	border: 1px solid #497725;
    	cursor:pointer;
	}
	
	#backBtn{
		font-size: 25px;
		padding: 10px 30px; 
    	border-radius: 10px;
    	cursor:pointer;
	}
	#boardInsertTable{
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
	               	소소한 일상 등 여러 이야기를 편하게 올려요.
	            </span>
	            
	         </div>
	         <br>
		     <div style="background: white; width:1500px; margin:0 auto;">
				<form action="insert.bo" method="post" enctype="Multipart/form-data">
		         	<table id="boardInsertTable">
		         		<tr>
		         			<th style="width:200px; height:30px; font-size:25px;">카테고리</th>
		         			<td colspan=4 style="font-size:25px">
		         				<select style="font-size:20px" name="category">
		         					<option value="자유톡">자유톡</option>
		         					<option value="요리톡">요리톡</option>
		         				</select>
		         			</td>
		         		</tr>
		         		
		         		<tr>
		         			<th colspan=5>
		         				<textarea id="bContent" placeholder="내용"  name="content"></textarea>
		         			</th>
		         		</tr>
		         		
		         		<%-- <tr height="300px">
		         			<!-- <td colspan=2> <button id="picBtn">+</button></td> -->
		         			<td colspan=2 style="padding:50px;">
		         				<!-- <img src="https://recipe1.ezmember.co.kr/img/pic_none3.gif"> -->
		         				<label for="ex_file"><img src="https://recipe1.ezmember.co.kr/img/pic_none3.gif" id="contentImg1"></label>
  								<input type="file" id="ex_file"  style="display:none">
		         			</td>
		         			
		         			<c:if test="${ ex_file eq null }">
				         		<td colspan=3 >
				         			사진을 넣으시려면 +를 눌러주세요.
				         		</td>
							</c:if>
							
							<c:if test="${ ex_file ne null }">
				         		<td colspan=3 >
				         			55.
				         		</td>
							</c:if>
		         			
		       
		         		</tr> --%>
		         		
		         		
		         		<!-- <tr>
		         			<td rowspan="2" colspan="5" align="center">
		         				<input type="submit" value="등록하기"  id="insertBtn"> &nbsp; &nbsp;
		         				<button onclick="location.href='blist.bo'" id="backBtn">목록으로</button>
		         			</td>
		         		</tr> -->
		         		
		         	</table>
		         	
		         	<div id="imageArea">
		         		<h2>사진 첨부</h2>
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
					
					
		         	
		         	
		         	<div class="input-submit" align="center" style="padding-bottom: 30px">
		         	    <input type="submit" value="등록하기"  id="insertBtn"> &nbsp; &nbsp;
		         		<button onclick="location.href='blist.bo'" id="backBtn">목록으로</button>
		         	</div>
		         	

				</form>
			</div>
		</div>			
</body>
</html>