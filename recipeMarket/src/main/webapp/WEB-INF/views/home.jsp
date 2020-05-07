<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %> 
<!DOCTYPE html>
<html>
<head>
 <link rel="icon" type="image/png" href="resources/images/tablogo.png"/>

<meta charset="UTF-8">
<title>레시피 마켓</title>
<style>
	body{background:#f9f9f9}
	.slick-prev{
		background: blue;
	}
	.icon{
		width:100px;
	}
	.slick-slide slick-current slick-active, .slick-slide slick-active{
		width:120px;
	}
	.outer{
		width:1200px;
		height:680px;
		background:#f9f9f9;
		margin-left: 10%;
	}
	.slick-prev:before{
		color: black;
	}
		/* 슬라이드 화살표 */
.slick-prev:before,.slick-next:before{
	background: black;
}
.slick-next{
	right: 0;
}
	
/* 	.slide{
		background: lightblue;
	} */
</style>
 <!-- Add the slick-theme.css if you want default styling -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<!-- Add the slick-theme.css if you want default styling -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<%-- <script type="text/javascript" src="${contextPath}/resources/js/jquery-3.4.1.min.js"></script> --%>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script> 
<!-- 사용자 위치 js -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="resources/sockjs.min.js"></script>
</head>
<body>
	<c:import url="common/header.jsp"/>
	<div class="outer">
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	
	
	<div class="slide">
	<div class="imageBar"></div>
		<div class="boxOuter">
			<div class="firstBox" id="slick"  style="margin: 5%;">
			
			    <div><a href='search.rc'><img class="icon" src="resources/images/all.png"/></a></div>
			    <div><a href='search.rc?=""'><img class="icon" src="resources/images/mainmenu.png"/></a></div>
			    <div><a href='search.rc?=""'><img class="icon" src="resources/images/soup.png"/></a></div>
			    <div><a href='search.rc?=""'><img class="icon" src="resources/images/diet.png"/></a></div>
			    <div><a href='search.rc?=""'><img class="icon" src="resources/images/sidemenu.png"/></a></div>
			    <div><a href='search.rc?=""'><img class="icon" src="resources/images/rice.png"/></a></div>
			    <div><a href='search.rc?=""'><img class="icon" src="resources/images/drink.png"/></a></div>
			    <div><a href='search.rc?=""'><img class="icon" src="resources/images/sauce.png"/></a></div>
			    <div><a href='search.rc?=""'><img class="icon" src="resources/images/dessert.png"/></a></div>
			    <div><a href='search.rc?=""'><img class="icon" src="resources/images/speed.png"/></a></div>
			    <div><a href='search.rc?=""'><img class="icon" src="resources/images/etc.png"/></a></div>
			</div>
		</div>
	</div>
		<div id="weather">
			<h2>오늘의 날씨 </h2>
			<div class="ctemp" style="font-size:40px"><span class="feels">체감온도는</span>  <img class="icon"  style="width:30px;" src="resources/images/celsius.png"/>,</div>
			<div class="sky">하늘 상태 : </div>
			<div class="cicon" style="background:lightblue;width: 10%; "></div>
		</div>
		<script>
		navigator.geolocation.getCurrentPosition(function(pos) {
		    var $lat =pos.coords.latitude;
		    var $lon =pos.coords.longitude;
		    
		    $.getJSON("http://api.openweathermap.org/data/2.5/weather?lat="+$lat+"&lon="+$lon+"&appid=ae4959dc548a8eabf9e9a03f8ff2866e&units=metric",function(data){
		    	
		    	//data로 할일(data : 날씨 정보를 통째로 가져오는것)
				/* alert(data.cod);
				alert(data.city.name);
				alert(data.list[0].main.temp_min); */
				
		    	/* 현재의 날씨 정보 */
				var $minTemp = data.main.temp_min;
				var $maxTemp = data.main.temp_max;
				var $cTemp = data.main.feels_like;
				var $now = new Date($.now());
				var $cDate = $now.getFullYear() + '년' +$now.getMonth() + '월' + $now.getDate()+'일'+ +$now.getHours() + ':' + $now.getMinutes()
				var $wIcon = data.weather[0].icon;
				var $sky = data.weather[0].description;
				console.log($sky);
				//A.append(B) A요소의 내용의 뒤에 B를 추가
				//A.prepend(B)  A요소의 내용의 앞에 B를 추가
			/* 	$('.clowtemp').append($minTemp); */
				$('.feels').append($cTemp);
				/* 	$('.chightemp').append($maxTemp); */
				/* $('h2').prepend($cDate); */
				/*  $('.sky').append($sky);  */
				$('.cicon').append('<img src="http://openweathermap.org/img/wn/'+ $wIcon +'@2x.png"/>');
				// <img src="http://openweathermap.org/img/wn/10d@2x.png"/>
				 if($sky == 'clear sky'){
					$('.sky').append('맑은 하늘');
				} else if($sky =='scattered clouds'){
					$('.sky').append('구름이 많네요!');
				} else if($sky == 'broken clouds'){
					$('.sky').append('흐린날이네요');
				} else if($sky == 'few clouds'){
					$('.sky').append('구름이 조금 있군요!');
				}
			});
		});	
		</script> 
	</div>
	<div id="weatherFood">
		<table id="weatherT">
			<thead>
				<tr>
					<th>사진</th>
					<th>제목</th>
				</tr>
			</thead>
				<tbody></tbody>
		</table>
	</div>
	
	<div id="papularFood">
		<table id="popFoodT">
			<thead>
				<tr>
					<th>사진</th>
					<th>제목</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
	<script>
		function topList(){
			$.ajax({
				url: 'topFoodList.ma',
				dataType: 'json',
				success: function(data){
					$tableBody = $('#popFoodT tbody');
					$tableBody.html("");
					
					for(var i in data){
						var $tr = $("<tr>");
			//			var $bId = $("<td>").text(data[i].bId);
						var $bTitle = $("<td>").text(decodeURIComponent(data[i].bTitle.replace(/\+/g,' ')));
						var $bWriter = $("<td>").text(data[i].bWriter);
						var $bCreateDate = $("<td>").text(data[i].bCreateDate);
						var $bCount = $("<td>").text(data[i].bCount);
						var $bFile = $("<td>").text(" ");
						
						
//						$tr.append($bId);
						$tr.append($bTitle);
						$tr.append($bWriter);
						$tr.append($bCreateDate);
						$tr.append($bCount);
						$tr.append($bFile);
						
						$tableBody.append($tr);
					}
				}
			});
		}
		
		$(function(){
			topList();
			
			setInterval(function(){
				topList();
			}, 5000);
		});
	</script>
	
	

	
	
	
	<c:import url="common/footer.jsp"/>
</body>

<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="resources/js/slick/slick.min.js"></script>
<script>
$(document).ready(function(){
    $('#slick').slick({
    	infinite: true, 	/* 맨끝이미지에서 끝나지 않고 다시 맨앞으로 이동 */         
    	slidesToShow: 5, 	/* 화면에 보여질 이미지 갯수*/        
    	slidesToScroll: 5,  /* 스크롤시 이동할 이미지 갯수 */         
    	autoplay: true, 	/* 자동으로 다음이미지 보여주기 */         
    	arrows: false, 		/* 화살표 */         
    	dots:true, 			/* 아래점 */         
    	autoplaySpeed: 1300,	/* 다음이미지로 넘어갈 시간 */         
    	speed: 700, 		/* 다음이미지로 넘겨질때 걸리는 시간 */         
    	pauseOnHover:true, 	/* 마우스 호버시 슬라이드 이동 멈춤 */
    	//vertical:true,	/* 세로방향으로 슬라이드를 원하면 추가하기// 기본값 가로방향 슬라이드*/ 
    });
});

	</script>
	
</html>