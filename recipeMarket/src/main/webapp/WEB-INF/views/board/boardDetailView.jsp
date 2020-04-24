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
		
		height:1800;
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
	<!-- <form> -->
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
						<td style="font-size:20px; width:30px"><b id="rCount"></b></td>			         		
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
	         	
	         	
	         	<c:url var="bupView" value="bupView.bo">
	         		<c:param name="postNo" value="${ board.postNo }"/>
	         		<c:param name="page" value="${ page }"/>
	         	</c:url>
	         	
	         	<c:url var="bdelete" value="bdelete.bo">
	         		<c:param name="postNo" value="${ board.postNo }"/>
	         	</c:url>
	         	
	         	
				<div class="input-submit" align="center" style="padding-bottom: 30px">
					
					<c:if test="${board.nickName eq loginUser.nickName}">
			            <input type="submit" value="수정하기"  id="insertBtn" onclick="location.href='${ bupView }'"> &nbsp; &nbsp;
			         	<button type="button" onclick="deleteBoard();" id="removeBtn">삭제하기</button> &nbsp; &nbsp;
		         	</c:if>
		         	<button type="button" onclick="location.href='blist.bo'" id="backBtn">목록으로</button>
		     		
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
	         	
	         	<script>
	         		function deleteBoard(){
	         			var bool = confirm("정말 삭제하시겠습니까?");
	         			if(bool){
	         				location.href='${ bdelete }';
	         			}
	         		}
	         	</script>
	         	
	         	
	         	
	         	
	         	
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
	<!-- </form> -->
	
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
		        		//console.log(data);
		        		getReplyList();
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
					//console.log(data);
		        	$tableBody = $('#rtb tbody');
		        	$tableBody.html('');
		         				
		         	var $tr1;
		         	var $tr2;
		         	var $profileTd;
		         	var $profile;
		         	var $rWriter;
		         	var $rContent;
		         	var $rCreateDate;
		         	
		         	$('#rCount').text(data.length);
		         				
		         	if(data.length > 0){
		         		for(var i in data){
		         			var pName = data[i].pName;
		         			$tr1 = $('<tr>');
		         			$tr2 = $('<tr>');
		         			$profileTd =  $('<td rowspan="2">');
		         			if(pName == null){
		         				$profile = $('<img width="100" height="100"  src="resources/images/user.png">');
		         			} else{
		         				$profile = $('<img width="100" height="100" style="border-radius: 100%" src="resources/upload/' + data[i].pName + '">');
		         			}
		         			$rWriter = $('<td style="width:120px; font-size:20px">').text(decodeURIComponent(data[i].nickName));
		         			$rCreateDate = $('<td style="font-size:17px">').text(data[i].createDate);
		         			$rContent = $('<td colspan=5 style="font-size:20px">').text(decodeURIComponent(data[i].content.replace(/\+/g," ")));
		         			
		         			$profileTd.append($profile);
		         			$tr1.append($profileTd);
		         			$tr1.append($rWriter);
		         			$tr1.append($rCreateDate); 
		         			$tr2.append($rContent);
		         			$tableBody.append($tr1);
		         			$tableBody.append($tr2);
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