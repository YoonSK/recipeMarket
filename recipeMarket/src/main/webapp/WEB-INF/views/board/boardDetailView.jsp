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
	
	.content{
		width: 60%;
		margin-left:15%;
	}
	#like{
		font-size: 20px;
    	text-align: center;
    	width: 100px;
    	height: 80px;
   		margin-left: 50%;
	}
	
	#profileImg{
		width:100px; 
		height:100px;
		vertical-align: middle;  
		margin-left: 15%;
		border-radius: 50%;

	}
	#bImg{
		width:80%;
		height:500px;
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
	
	#removeBtn{
		font-size: 25px;
		background: tomato;
    	color: white;
    	border: 1px solid red;
		padding: 10px 30px; 
    	border-radius: 10px;
    	cursor:pointer;
	}

	
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<form>
		<div class="wrapper">
			<br>
			<div class="content" style="background: white;">
	         	<table id ="contentTable" style="padding-bottom: 50px">
	         		<tr>
	         			<c:if test="${ profile.pName != null}">
						<td rowspan=5 width="12%" height="150px">
							<img id="profileImg"  src="resources/upload/${ profile.pName }"/>
						</td>
						</c:if>
						
						<c:if test="${ profile.pName == null}">
						<td rowspan=5 width="12%" height="150px">
							<img id="profileImg"  src="resources/images/user.png"/>
						</td>
						</c:if>
						<td width="65%" style="font-size:30px">${ board.nickName }</td>
						
						<td style="font-size:20px; width:30px;">♡</td>
						<td width="30px" style="font-size:20px">0</td>
						<td style="font-size:20px; width:70px;">댓글수</td>
						<td style="font-size:20px; width:30px">0</td>			         		
	         		</tr>
	         		
	         		<tr>
	         			<td width="80%" colspan=5 style="color:gray; font-size:20px">${board.category }</td>
	         		</tr>
	         		
	         		<tr>
	         			<td width="80%" colspan=5 style="font-size:20px">
	         				${board.content}
	         			</td>
	         		</tr>
	         		
	         		<tr>
	         			<c:if test="${ board.pName != null }">
	         			<td width="80%" colspan=5 style="font-size:20px; text-align:center;">
	         				<img id= "bImg" src="resources/upload/${ board.pName }" style="padding:20px;"/>
	         			</td>
	         			</c:if>
	         		</tr>
	         
	         		
	         	</table>
	         	
				<div class="input-submit" align="center" style="padding-bottom: 30px">
		            <input type="submit" value="수정하기"  id="insertBtn"> &nbsp; &nbsp;
		         	<button onclick="location.href='blist.bo'" id="removeBtn">삭제하기</button> &nbsp; &nbsp;
		         	<button onclick="location.href='blist.bo'" id="backBtn">목록으로</button>
		         </div>
	         	
	         </div>
	         <br>
	         <div class="content" style="background: white; padding-top: 10px;" >
	         	<h2>&nbsp;&nbsp;댓글</h2>
	         	<hr>
	         	<table class="replyTable" id="rtb">
	         		<!-- <tr>
						<td rowspan=2><img width="100" height="100" src="resources/images/user.png"/></td>
						<td style="width:150px; font-size:20px">닉네임2 </td>
						<td style="font-size:15px">2020-04-01</td>		         		
	         		</tr>
	         		
	         		<tr>
	         			<td  colspan=5 style="font-size:13px">
	         				내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
	         				내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
	         				
	         			</td>
	         			
	         		</tr> -->
	         		<tbody></tbody>
	         		
	         		
	         	</table>
	         	<hr>
	         	
	         	
	         	<br>
	         	
	         	<div>
	         		<button style="width:200px; height:150px; float:left;">
		         		<img style="width:70%; height:70%;" src="resources/images/heart.png">
		         	</button>
	         	</div>
	         	
	         	<div style=" height:150px; float:left;">
	         		<!-- <input type="text" id="rContent" placeholder="댓글을 입력해주세요." style="width:800px; height:150px; font-size:25px; float:left;"> -->
	         		<textarea id="rContent"  style="width:799px; height:150px; font-size:25px; float:left;" placeholder="댓글을 입력해주세요."></textarea>
	         		<button type="button" style="width:200px; height:150px; font-size:30px; vertical-align: sub;  float:left;" id="rSubmit">등록</button>
	         	</div>
	         </div>
	         
	         
		</div>
	</form>
	
	<script>
		$(function(){
	    getReplyList();
	    setInterval(function(){
	    	getReplyList();
	    	}, 1000);
	    });
	         
	         
		// 댓글 등록
		$('#rSubmit').on('click',function(){
			var content = $('#rContent').val();
			var targetNo =${ board.postNo };
		    $.ajax({
		    	url:"addReply.bo",
		        data:{targetNo:targetNo, content:content},
		        type:"post",
		        success:function(data){
		        	if(data == "success"){
		        		console.log(data);
		        		//getReplyList();
		        		$("#rContent").val("");
		        		
		        	}
		         }
		    });
		         		
		});
		         	
		// 댓글 리스트 불러오기
		function getReplyList(){
			var postNo = ${ board.postNo };
		         		
			$.ajax({
				url:"rList.bo",
				data:{postNo:postNo},
				dataType:'json',
				success:function(data){
		        	$tableBody = $('#rtb tbody');
		        	$tableBody.html('');
		         				
		         	var $tr;
		         	var $profile;
		         	var $rWriter;
		         	var $rContent;
		         	var $rCreateDate;
		         				
		         	if(data.length > 0){
		         		for(var i in data){
		         			$tr = $('<tr>');
		         			/* $rWriter = $(''); */
		         			$rWriter = $('<td width="100">').text(data[i].nickName);
		         			$rContent = $('<td>').text(decodeURIComponent(data[i].content.replace(/\+/g," ")));
		         			$rCreateDate = $('<td width ="100">').text(data[i].createDate);
		         			
		         			$tr.append($rWriter);
		         			$tr.append($rContent);
		         			$tr.append($rCreateDate);
		         			$tableBody.append($tr);
		         		}
		         					
		         	}else{
		         					
		         		$tr = $('<tr>');
		         		$rContent = $('<td colspan=3>').text('등록된 댓글이 없습니다.');
		         					
		         		$tr.append($rContent);
		         		$tableBody.append($tr);
		         		}
		         	}
		       	});
			}
	</script>
	
</body>
</html>