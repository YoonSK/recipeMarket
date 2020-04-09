<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#insertBtn { 
		float: right;
	}
	.wrapper{
		height:1500px;
		background:#EAEAEA;
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
		         	<table ID="boardInsertTable">
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
		         				<textarea placeholder="내용" style="width:1300px; height:300px; font-size:25px;" name="content"></textarea>
		         			</th>
		         		</tr>
		         		
		         		<tr>
		         			<!-- <td colspan=2><input type="file" style="font-size:25px;" value="+"></td> -->
		         			<td colspan=2> <button style="font-size:50px;">+</button></td>
		         			<td colspan=3>사진을 넣으시려면 +를 눌러주세요.</td>
		         		</tr>
		         		
		         		<tr>
		         			<td rowspan="2"colspan="5" align="center">
		         				<input type="submit" value="등록하기" style="font-size:25px;"> &nbsp; &nbsp;
		         				<button onclick="location.href='blist.bo'" style="font-size:25px;">목록으로</button>
		         			</td>
		         			
		         		</tr>
		         	</table>
				</form>
			</div>
		</div>			
</body>
</html>