<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<style>

.rDeleteBtn{
	    background: orangered;
    border: none;
    color: white;
    border-radius: 5px;
    height: 30px;
    margin-left: 15px;
}
	.wrapper{
		
		/* height:1800; */
		background:#EAEAEA;
		min-height: 1300px;
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
	
	#removeBtn{
		    font-size: 25px;
    background: tomato;
    color: white;
    border: none;
    padding: 10px 30px;
    border-radius: 5px;
    cursor: pointer;
	}
	
	#likeBtn{
	width: 150px;
    height: 100px;
    float: left;
    background: white;
    border: none;
    margin-top: 2%;}
	#rtb{
		width:100%;
	}

	#rContent{
		width: 770px;
    height: 135px;
    font-size: 25px;
    float: left;
    /* padding: 15px; */
    border: 1px solid lightgray;
    border-radius: 5px;
    resize: none;
        margin-left: 20px;
	}
	
	 
	#rSubmit {  
    text-align: center;
    border: 1px solid #fee0a1;
    border-radius: 4px;
    background: white;    width: 150px;
    height: 70px;
    font-size: 30px;
    vertical-align: sub;
    float: right;
    margin-top: 40px;
    margin-left: 30px;}
	#rSubmit:hover {cursor: pointer; background: #fee0a1; color: white;} 
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<!-- <form> -->
	<div class="outer">
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
						<c:if test="${ gCount.rCount ne null}">
						<td width="30px" style="font-size:20px"><b>${ gCount.rCount }</b></td>
						</c:if>
						
						<c:if test="${ gCount.rCount eq null}">
						<td width="30px" style="font-size:20px"><b>0</b></td>
						</c:if>
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
	         	
	         	<!-- <form action="rDelete.bo" id="ReplyForm" method="post"> -->
		         <table class="replyTable" id="rtb">
		         		
		         	<tbody></tbody>
		         	
		         </table>
	         	<!-- </form> -->
	         	
	         	
	         	
	         	
	         	<hr>
	         	
	         	
	         	<br>
	         	
	         	<div style="background: white;  height: 170px;">
	         	
	         		<c:if test="${likeCheck == null }">
	         		<button type="button" id="likeBtn" onclick="insertLike();">
		         		<img style="width:70%; height:70%;" src="resources/images/like.png">
		         	</button>
		         	</c:if>
		         	
		         	<c:if test="${likeCheck != null }">
		         	<button type="button" id="likeBtn" onclick="deleteLike();">
		         		<img style="width:70%; height:70%;" src="resources/images/unlike.png">
		         	</button>
		         	</c:if>
	         	
	         	
	         	<div style=" height:135px; float:left;">
	         		<!-- <input type="text" id="rContent" placeholder="댓글을 입력해주세요." style="width:800px; height:150px; font-size:25px; float:left;"> -->
	         		<textarea id="rContent" placeholder="댓글을 입력해주세요."></textarea>
	         		<button type="button" id="rSubmit">등록</button>
	         	</div>
	         </div>
	         </div>
	         
		</div>
		
	<!-- </form> -->
	
	<script>
		function deleteBoard(){
			var bool = confirm("정말 삭제하시겠습니까?");
	    	if(bool){
	    		location.href='${ bdelete }';
	    	}
	    }
    </script>
	
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
		         	var $replyNo;
		         	
		         	var $rDeleteBtn;
		         	
		         	$('#rCount').text(data.length);
		         				
		         	if(data.length > 0){
		         		for(var i in data){
		         			var pName = data[i].pName;
		         			//var replyNo = data[i].replyNo;
		         			var loginUserNick = "${loginUser.nickName}";
		         			
		         			$tr1 = $('<tr class="TR1">');
		         			$tr2 = $('<tr>');
		         			$profileTd =  $('<td rowspan="2" width="120px">');
		         			if(pName == null){
		         				$profile = $('<img width="100" height="100"  src="resources/images/user.png">');
		         			} else{
		         				$profile = $('<img width="100" height="100" style="border-radius: 100%" src="resources/upload/' + data[i].pName + '">');
		         			}
		         			$rWriter = $('<td style="width:120px; font-size:20px">').text(decodeURIComponent(data[i].nickName));
		         			$rCreateDate = $('<td class="rCreateTd" style="font-size:17px;">').text(data[i].createDate);
		         			$rContent = $('<td colspan=6 style="font-size:20px">').text(decodeURIComponent(data[i].content.replace(/\+/g," ")));
		         			
		         			$rDeleteBtn=$('<button type="button" class="rDeleteBtn">').text("댓글 삭제").attr('value',data[i].replyNo);
		         			//$rDeleteBtn=$('<div onclick="rDeleteBtn();">').text("댓글 삭제").attr('value',data[i].replyNo);
		         			$replyNo = $('<input type="hidden"  id="replyNo">').attr('value',data[i].replyNo);
		         			
		         			$profileTd.append($profile);
		         			$tr1.append($profileTd);
		         			//$tr1.append($replyNo);
		         			//$rWriter.append($replyNo);
		         			$tr1.append($rWriter);
		         			
		         			if(loginUserNick == decodeURIComponent(data[i].nickName)){
		         				$rCreateDate.append($rDeleteBtn);
		         				$rCreateDate.append($replyNo);
		         			}
		         			
	
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
		
		// 좋아요 누름
		function insertLike(){
			var targetNo = ${ board.postNo };
			var memberNo = ${ loginUser.memberNo };
			//var nickName = ${ board.nickName };
			
			$.ajax({
				url:'insertLike.bo',
				data:{targetNo:targetNo, memberNo:memberNo},
				type:'post',
				success:function(data){ 
					console.log(data);
					if(data == "success"){	
						alert('${ board.nickName}' + "님의 게시글을 추천했습니다.");
						window.location.reload();
					}
				}
			});
		}
		
		
		// 좋아요 취소
		function deleteLike(){
			var targetNo = ${ board.postNo };
			var memberNo = ${ loginUser.memberNo };
			//var nickName = ${ board.nickName };
			
			$.ajax({
				url:'deleteLike.bo',
				data:{targetNo:targetNo, memberNo:memberNo},
				type:'post',
				success:function(data){ 
					console.log(data);
					if(data == "success"){	
						alert('${ board.nickName}' + "님의 게시글 추천을 취소 했습니다.");
						window.location.reload();
					}
				}
			});
			
			
		}
					
			
			$(document).on('click', '.rDeleteBtn', function(){
				var replyNo = $(this).val();
				var bool = confirm("정말 삭제하시겠습니까?");
				//var replyNo = {reply}
	 			if(bool){
					//var replyNo = $('#replyNo').val();
					//console.log(che);
					
					$.ajax({
						url:'rDelete.bo',
						data:{replyNo:replyNo},
						type:'post',
						success:function(data){
							alert("댓글이 삭제되었습니다.");
						}
					}); 
				}
			})
		
	</script>
	</div>
	<%@ include file="../common/footer.jsp" %>
	
</body>

</html>