<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 마켓 RECIPE MARKET</title>
<style>

	/* 로고 */
	div.nav h1{margin: 0 30px 0 0; display: inline-block; vertical-align: top; margin-left: 150px; }
	/* 네비 상단 */
	div.menubar_top {margin: 0 auto; padding: 16px 0 0 176px; height: 60px;}
	p#welcome {position: absolute; right: 60px; top: -5px;}
	ul.nav_mem {display:inline; padding:0 10px; display: inline; padding: 0 10px; position: absolute; right: 1%; top: 7%;}
	ul.nav_mem li{list-style: none; padding: 0 3px; display: inline-block; font-size: 14px;}
	ul.nav_mem li a{list-style: none; padding: 0 3px; display: inline-block; font-size: 14px;}
	ul.nav_mem li a:link {text-decoration: none; color: grey;}
	#search_con{position: absolute; left: 30%; top: 40px;}
	#topSearch{height: 100px;}
	div#nick{position: absolute; right: 5%; top: 7%; font-size: 15px; font-weight: bold;}
	/* 메뉴바*/
	div.menubar{margin-top: 10px; margin-bottom: 10px; height: 50px; background-color: #fee0a1;}
	div.menubar ul{margin: 0 auto; padding: 9px 30px 0; text-align: center;}
	div.menubar ul li{list-style: none; padding: 0; width: 1%; display: table-cell;}
	div.menubar ul li a:link {text-decoration: none; color: white; font-weight: 800; font-size: 20px;}
	div.menubar ul li a:hover {color: #76a693;}
	/* 검색창 */
	input[type=search]#search_con {outline: none;}
	input[type=search]#search_con {-webkit-appearance: textfield; -webkit-box-sizing: content-box;	font-family: inherit; font-size: 100%;}
	input::-webkit-search-decoration,
	input::-webkit-search-cancel-button {display: none;}
	input[type=search]#search_con {background: #ffff url(https://static.tumblr.com/ftv85bp/MIXmud4tx/search-icon.png) no-repeat 9px center;
		border: solid 1px #add1c3; padding: 9px 10px 9px 32px; width: 200px; -webkit-border-radius: 10em; -moz-border-radius: 10em;
		border-radius: 10em; -webkit-transition: all .5s; -moz-transition: all .5s; transition: all .5s; margin-top: 20px; margin-left: 100px;}
	input[type=search]#search_con:focus {width: 300px; background-color: #fff; border-color: #377a71; -webkit-box-shadow: 0 0 5px rgba(109,207,246,.5); -moz-box-shadow: 0 0 5px rgba(109,207,246,.5); box-shadow: 0 0 5px rgba(109,207,246,.5);}
	input:-moz-placeholder {color: #999;}
	input::-webkit-input-placeholder {color: #999;}

  /* 모달창 */
    .hmodal {display: none; position: fixed; z-index: 1; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background-color: rgb(0,0,0); background-color: rgba(0,0,0,0.4);}
    .modal-content {background-color: #fefefe; margin: 15% auto; padding: 20px; border: 1px solid #888; width: 500px; height: 400px;}
    .close {color: #aaa; float: right; font-size: 28px; font-weight: bold;}
    .close:hover, .close:focus {color: black; text-decoration: none; cursor: pointer;}	
     
     /* 삭제 버튼 */
     .deleteBtn{ background: orangered; color: white; height: 30px; border: none; border-radius: 5px; width: 50px; }
     
     /* follow table */
     #listT{ margin-left: 10%; width: 100%; overflow:scroll;}
     
     /* follow버튼 */
     .follow{width: 120px;
    height: 40px;
    border-radius: 5px;
    background: #c5db91;
    color: white;
    border: none;
    margin-right: 20px;}
    button{cursor:pointer;}
    /* 모달창 스크롤 */
    #listArea{overflow-y: scroll; overflow-x: hidden; height: 70%;}
    
    #qnaDiv{
    	position:fixed;
    	right:100px;
    	bottom:0px;
    	width:120px;
    	height:150px;
    	
    }
    #qnaBtn{
    	border-radius: 100px;
    	font-size: 18px;
    	background: greenyellow;
    }
    
    #titleName{
		width: 705px;
		heght:100px;
		text-align:center;
		color:white;
		background:black;
		font-size:25px;
	}
	#messageArea{
		width: 700px;
		height: 500px;
		font-size:20px;
		overflow-y: scroll;
	}
	
	#message{
		width: 595px;
    	height: 60px;
    	font-size:20px;
	}
	
	#sendBtn{
		width:100px;
		height:65px;
		margin-left: -5px;
	}
	
	 /* 모달창 */
    .kmodal {display: none; position: fixed; z-index: 1; left: 0; top: 0; width: 100%; height: 100%; background-color: rgb(0,0,0); background-color: rgba(0,0,0,0.4);}
    .kmodal-content { margin: 15% auto;  border: 1px solid #888; width: 700px; height: 400px;}
    .close {color: #aaa; float: right; font-size: 28px; font-weight: bold;}
    .close:hover, .close:focus {color: black; text-decoration: none; cursor: pointer;}	
</style>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
</head>
<body>
	<header>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>	
	<div class="nav">
		<div class="nav_top">
		<form id="topSearch" action="search.rc" method="post">
			<h1>
				<a href="${ contextPath }"><img src="resources/images/logo.png" width="250px" height="85px" style="position: absolute; left: 1%; top: 35px;"></a>
			</h1>
			<input type="search" placeholder="검색" id="search_con" name="keyword">
			<c:if test="${ empty sessionScope.loginUser }">				
			<ul class="nav_mem">					
				<li><a href="goLogin.me">로그인</a></li>
				<li><a href="goTerm.me">회원가입</a></li>						
			</ul>
			</c:if>	
			<c:if test="${ !empty sessionScope.loginUser && loginUser.id != 'ADMIN' }">	
				<p id="welcome" onclick="followList();" style="cursor: pointer">
		    		<c:if test="${ loginUser.pName != null }">	
						<img name="profile" width=60px; height=60px; style="border-radius: 40px;" id="profile" src="resources/upload/${ loginUser.pName }">
					</c:if>
					<c:if test="${ loginUser.pName == null }">
						<img name="profile" width=60px; height=60px; style="border-radius: 40px;" id="profile" src="resources/images/user.png">
					</c:if>							
				</p>				
				<div id="nick">
					${ loginUser.nickName }
				</div>
				<ul class="nav_mem">		
					<li><a href="goCart.by">장바구니</a></li>						
					<li><a href="mypage.mp">마이페이지</a></li>
					<li><a href="logout.me">로그아웃</a></li>
				</ul>
			</c:if>	
			<c:if test="${ loginUser.id == 'ADMIN' }">	
				<p id="welcome">
					<img name="profile" width=60px; height=60px; style="border-radius: 40px;" id="profile" src="resources/images/user.png">						
				</p>				
				<div id="nick">
					${ loginUser.nickName }
				</div>
				
				<ul class="nav_mem">
					<li><a href="manager.ma">관리자 페이지</a></li>
					<li><a href="logout.me">로그아웃</a></li>
				</ul>
			</c:if>													
		</form>
		</div>
		<div class="menubar">
			<ul class="menubar_name">
				<li>
					<a href="${ contextPath }">홈</a>
				</li>
				<li>
					<a href="search.rc">레시피</a>
				</li>
				<li>
					<a href="list.bu">스토어</a>
				</li>
				<li>
					<a href="blist.bo">자유게시판</a>
				</li>
				<li>
					<a href="chefRank.rc">쉐프 소개</a>
				</li>																
			</ul>				
		</div>
	</div>
	</header>
	<script>
		$(document).ready(function() {
			$("#search_con").keydown(function(e){
				if(e.keyCode == 13)
					alert("검색");
			});
		});
	</script>
<script>
		function followList(){
			$('#hmodal').attr('style', 'display:block');
			$('#listT tbody').css("overflow", "scroll");
		}
</script>

<script>
var stylyObj ={
		'margin-left':'20%',
		'background':'#d9d9d9'
};
var followingStyle ={
		'background':'#d9d9d9'
}
var noStyle={'background':'#c5db91','margin-left':'20%'}
var noStyleF={'background':'#c5db91'}

$(document).on('click', '#following', function(){
	$(this).css(followingStyle);
	$('#follower').css(noStyle);
	
	var memberNo = ${loginUser.memberNo};
	$.ajax({
		url:'followingList.me',
		data:{memberNo:memberNo},
		dataType:'json',
		success:function(data){
			console.log(data);
			//$('#hmodal').attr('style', 'display:block');
			$tableBody = $("#listT tbody");
			$tableBody.html("");
			
			for(var i in data){
				var $tr = $('<tr>');
				
					var $followerpName = $('<td>').text(decodeURIComponent(data[i].pName));
					 var $followerpName=$('<td>').html('<img src=' + '"resources/upload/' + data[i].pName + '"' + 'width=40px; height=40px;>');									
                    var $followernickName = $('<td>').text(decodeURIComponent(data[i].nickName));
                    var $followerdeleteBtn=$('<td>').html('<button type="button" class="deleteBtn" id="deleteFollowing" value="'+data[i].targetNo+'">삭제</button>');				
                    $tr.append($followerpName);									
                    $tr.append($followernickName);
					$tr.append($followerdeleteBtn);
				     $tableBody.append($tr);	
			}
				
		}
	});
});

$(document).on('click', '#follower', function(){
	$(this).css(stylyObj);
	$('#following').css(noStyleF);
	
	var targetNo = ${loginUser.memberNo};
	$.ajax({
		url:'followerList.me',
		data:{targetNo:targetNo},
		dataType:'json',
		success:function(data){
			console.log(data);
			//$('#hmodal').attr('style', 'display:block');
			$tableBody = $("#listT tbody");
			$tableBody.html("");
			
			if(data != null){
				for(var i in data){
					var $tr = $('<tr>');
					
					var $followermemberNo = $('<td>').text(decodeURIComponent(data[i].memberNo));
						var $followerpName = $('<td>').text(decodeURIComponent(data[i].pName));
						 var $followerpName=$('<td>').html('<img src=' + '"resources/upload/' + data[i].pName + '"' + 'width=40px; height=40px;>');					
						 var $followerNOpName=$('<td>').html('<img src="resources/images/user.png" width=40px; height=40px;>');									
	                    var $followerdeleteBtn=$('<td>').html('<button type="button" class="deleteBtn" id="deleteFollower"  value="'+data[i].memberNo+'" onclick="deleteFollow();">삭제</button>');									
	                    var $followernickName = $('<td>').text(decodeURIComponent(data[i].nickName));
	                    
	                    	 $tr.append($followerpName);		
	                   							
	                    $tr.append($followernickName);
						$tr.append($followerdeleteBtn);
					     $tableBody.append($tr);	
					     
				}
			} else{
				var $tr = $('<tr>');
				  var $no = $('친구가 없습니다.^^');
				  $tr.append($no);		
				  $tableBody.append($tr);
			}
			
				
		}
	});
});

$(document).on('click', '#deleteFollowing', function(){
	var targetNo = $(this).val();
	var memberNo =${loginUser.memberNo};
	console.log("targetNO" + targetNo);
	console.log("memberNo" + memberNo);
	var nickName = $(this).parent().children().eq(2).val();
	alert("정말 삭제하시겠습니까?");
	$.ajax({
		url:'deleteFollow.me',
		data:{targetNo:targetNo,memberNo:memberNo},
		dataType:'json',
		success:function(data){
			window.location.reload();
		}				
		});
	});
$(document).on('click', '#deleteFollower', function(){
	var targetNo = $(this).val();
	var memberNo =${loginUser.memberNo};
	console.log("targetNO" + targetNo);
	console.log("memberNo" + memberNo);
	alert("정말 삭제하시겠습니까?");
	$.ajax({
		url:'deleteFollower.me',
		data:{targetNo:targetNo,memberNo:memberNo},
		dataType:'json',
		success:function(data){
			window.location.reload();
		}				
		});
	});
</script>

		 <!-- The Modal -->
			    <div id="hmodal" class="hmodal">	 

		 <!-- Modal content -->
				      <div class="modal-content">
				        <span class="close">&times;</span>     
				        <div id="a" style="border-bottom: 1px solid #d9d9d9;">
				        <p><font style="font-size:25px; font-weight:500;">[${loginUser.nickName }]님의 팔로워, 팔로잉 목록</font></p>
				        </div>                                                          
				        <br>
				        <button class="follow" style="margin-left: 20%;" id="follower">팔로워</button>
				        <button class="follow" id="following">팔로잉</button>
						<div id="listArea">
						 	<table id="listT">
						 	<tbody></tbody>
							</table> 
				     	</div>
				    </div>
			    </div>
			    
			    <script>	
				$('span.close').click(function(){
					$('#hmodal').attr('style', 'display:none');
				});		
				
				
				function cancelBtn(){
					$('#hmodal').attr('style', 'display:none');
				}
				</script>
				
	<script>
		function qnaList(){
			$('#kmodal').attr('style', 'display:block');
			//$('#listT tbody').css("overflow", "scroll");
		}
	</script>			
				
				<!-- The Modal -->
			    <div id="kmodal" class="kmodal">
				 <!-- Modal content -->
					<div class="kmodal-content">
						<span class="close"style="margin-top: -8px;">&times;</span>
				        <div id="titleName">관리자와 1:1 채팅</div>
						<textarea id="messageArea" readonly style="resize:none;"></textarea> <br>
						<input type="text" id="message" style="margin-top: -5px;"/>
						<input type="button" id="sendBtn" value="보내기" style="margin-top: -5px;"/>
			    	</div>
			    </div>
			    
			    <script type="text/javascript">
					$("#sendBtn").click(function() {
						sendMessage();
						$('#message').val('')
					});

					let sock = new SockJS("http://localhost:9780/recipeMarket/echo");
					sock.onmessage = onMessage;
					sock.onclose = onClose;
					// 메시지 전송
					function sendMessage() {
						
						sock.send($("#message").val());
					}
					// 서버로부터 메시지를 받았을 때
					function onMessage(msg) {
						var data = msg.data;
						$("#messageArea").append(data + "\n");
					}
					// 서버와 연결을 끊었을 때
					function onClose(evt) {
						$("#messageArea").append("연결 끊김");
				
					}
				</script>
				
				
				 <script>	
				$('span.close').click(function(){
					$('#kmodal').attr('style', 'display:none');
				});		
				
				
				function cancelBtn(){
					$('#kmodal').attr('style', 'display:none');
				}
				</script>
				
				
				
				<c:if test="${ loginUser != null  && loginUser.id != 'ADMIN' }">
					<div id = "qnaDiv">
						<!-- <button id= "qnaBtn" onclick="location.href='test1.bo';">실시간 채팅 문의</button> -->
						<img src="resources/images/chat1.png" onclick="qnaList();" style="width:100px">
						<!-- <button id= "qnaBtn" onclick="qnaList();">실시간 채팅 문의</button>					 -->
					</div>
			 	</c:if>
			 	
			 	
				
</body>
</html>