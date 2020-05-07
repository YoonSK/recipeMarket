<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

</head>

<style>
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
	}
	
	#message{
		width: 600px;
    	height: 60px;
    	font-size:20px;
	}
	
	#sendBtn{
		width:100px;
		height:65px;
		margin-left: -5px;
	}
</style>
<body>
	<div id="titleName">관리자와 1:1 채팅</div>
	<textarea id="messageArea" readonly></textarea> <br>
	<input type="text" id="message"/>
	<input type="button" id="sendBtn" value="보내기"/>
</body>
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
</html>