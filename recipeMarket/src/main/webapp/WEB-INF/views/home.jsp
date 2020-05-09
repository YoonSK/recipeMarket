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
	
	#popularChef,#popularFood{background: white;height: 220px;
    font-size: 20px;
    font-weight: 500;
    text-align: center;}
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
		    min-height: 1340px;
		background:#f9f9f9;
		margin-left: 20%;
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
	#timg{width:200px;height:150px }
/* 	.slide{
		background: lightblue;
	} */
	
	
	.plusBtn{float: right;
    background: #dee6c3;
    color: white;
    width: 80px;
    height: 30px;
    border: none;
    border-radius: 5px;}
    
    #topFoodT td, #weatherT td{
    padding: 15px;
    text-align: center;
    margin-bottom: 20px;
    line-height: 1.42857143;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 4px;
    -webkit-transition: border .2s ease-in-out;
    -o-transition: border .2s ease-in-out;
    transition: border .2s ease-in-out;
    box-shadow: 0 2px 3px #eee;
    
    }
    a{text-decoration: none;
    color: black;
    text-align: ceter;
    font-size: 20px;}
    
    #profileimg{
    	    width: 150px;
    height: 150px;
    border-radius: 100%;
    }
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
			    <div><a href='search.rc?category=main'><img class="icon" src="resources/images/mainmenu.png"/></a></div>
			    <div><a href='search.rc?category=soup'><img class="icon" src="resources/images/soup.png"/></a></div>
			    <div><a href='search.rc?tag=다이어트'><img class="icon" src="resources/images/diet.png"/></a></div>
			    <div><a href='search.rc?category=sub'><img class="icon" src="resources/images/sidemenu.png"/></a></div>
			    <div><a href='search.rc?category=meal'><img class="icon" src="resources/images/rice.png"/></a></div>
			    <div><a href='search.rc?category=drink'><img class="icon" src="resources/images/drink.png"/></a></div>
			    <div><a href='search.rc?category=sauce'><img class="icon" src="resources/images/sauce.png"/></a></div>
			    <div><a href='search.rc?category=dessert'><img class="icon" src="resources/images/dessert.png"/></a></div>
			    <div><a href='search.rc?tag=초스피드'><img class="icon" src="resources/images/speed.png"/></a></div>
			    <div><a href='search.rc?category=etc'><img class="icon" src="resources/images/etc.png"/></a></div>
			</div>
		</div>
	</div>
		<div id="weather" style="border: 1px solid #d9d9d9; text-align: center; background: white;">
			<h2>오늘의 날씨 </h2>
				<!-- <span class="cicon" style="width: 10%; "></span>
			<span>체감온도</span> <span class="feels"  style="font-size: 30px;"></span>  <img class="icon"  style="width:30px;" src="resources/images/celsius.png"/></span>
			<div class="sky" style="font-size:15px"></div> -->
		<table style="margin-left: 38%;">
			<tr>
				<td rowspan="2" class="cicon" style="vertical-align: top;"></td>
				<td style="vertical-align: bottom;">체감온도</td>
				<td class="feels" style="vertical-align: bottom; font-size:30px;"></td>
				<td style="vertical-align: bottom;"><img class="icon"  style="width:20px; height:20px" style="vertical-align: top;" src="resources/images/celsius.png"/></td>
			</tr>
			<tr>
				<td colspan="2" class="sky" style="vertical-align: top;"></td>
			</tr>
		</table>
		</div>
		<script>
		navigator.geolocation.getCurrentPosition(function(pos) {
		    var $lat =pos.coords.latitude;
		    var $lon =pos.coords.longitude;
		    
		    $.getJSON("http://api.openweathermap.org/data/2.5/weather?lat="+$lat+"&lon="+$lon+"&appid=ae4959dc548a8eabf9e9a03f8ff2866e&units=metric",function(data){
		    	
		    	//data로 할일(data : 날씨 정보를 통째로 가져오는것)
				
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
				$('.cicon').append('<img src="http://openweathermap.org/img/wn/'+ $wIcon +'@2x.png"/>');
				// <img src="http://openweathermap.org/img/wn/10d@2x.png"/>
				 if($sky == 'clear sky'){
					$('.sky').append('맑은 하늘이네요~');
				} else if($sky =='scattered clouds'){
					$('.sky').append('구름이 많네요!');
				} else if($sky == 'broken clouds'){
					$('.sky').append('흐린날이네요');
				} else if($sky == 'few clouds'){
					$('.sky').append('구름이 조금 있군요!');
				} else if($sky == 'light rain'){
					$('.sky').append('흐리고 가끔 비');
				} else if($sky == 'mist'){
					$('.sky').append('안개가 있네요');
				} else if($sky =='light intensity drizzle'){
					$('.sky').append('흐리고 가끔 비');
				}
				 
					function weatherList(){
						
						var sky = data.weather[0].description;
						$.ajax({
							url:'weatherFood.ma',
							dataType:'json',
							data:{sky:sky},
							success: function(data){
								$tableBody = $('#weatherT tbody tr');
								$tableBody.html("");
								console.log(sky);
								for(var i in data){
									var $tr = $("<tr>");
									var $bTitle = $("<td>").text(decodeURIComponent(data[i].title.replace(/\+/g,' ')));
									var $thumb = $("<td>").html('<a href="detail.rc?postNo='+data[i].postNo+'"><img id= "timg" src="resources/upload/'+data[i].thumb+'"/><br>'+decodeURIComponent(data[i].title.replace(/\+/g,' '))+'</a>');
									$tableBody.append($thumb);
									
									console.log($bTitle);
								}
								
							}
						});
					}
					
					$(function(){
						weatherList();
						
						setInterval(function(){
							topList();
						}, 5000);
					});
			});
		});	
		
		
	
		</script> 
			<div id="weatherFood">
			<h2 style="border-bottom: 1px solid #d9d9d9; padding: 4px;">쉐프들의 날씨 요리 추천</h2>
		<table id="weatherT">
			<thead>
				<tr>
					<th colspan=2></th>
				</tr>
			</thead>
				<tbody><tr></tr></tbody>
		</table>
	</div>
		
			
			<h2 style="border-bottom: 1px solid #d9d9d9;  padding: 4px;">인기있는 레시피 TOP5 <button class="plusBtn" type="button" onclick="location.href='search.rc'">더보기</button></h2>
		<div id="popularFood">
		<table id="topFoodT">
			<thead>
				<tr>
					<th colspan=2></th>
				</tr>
			</thead>
			<tbody><tr></tr></tbody>
		</table>
	</div>
	
	
	
			<h2 style="border-bottom: 1px solid #d9d9d9; padding: 4px;">인기있는 쉐프 TOP5<button class="plusBtn" type="button" onclick="location.href='chefRank.rc'">더보기</button></h2>
			<div id="popularChef">
		<table id="popularChefT">
			<thead>
				<tr>
					<th colspan=2></th>
				</tr>
			</thead>
				<tbody>
					<tr>
					</tr>
				</tbody>
		</table>
	</div>
	

	</div>

	<script>
/* 	function weatherList(){
		
		var sky =$('.sky');
		$.ajax({
			url:'weatherFood.ma',
			dataType:'json',
			data:{sky:sky},
			success: function(data){
				$tableBody = $('#weatherT tbody tr');
				$tableBody.html("");
				console.log(sky);
				for(var i in data){
					var $tr = $("<tr>");
					var $bTitle = $("<td>").text(decodeURIComponent(data[i].title.replace(/\+/g,' ')));
					var $thumb = $("<td>").html('<a href="detail.rc?postNo='+data[i].postNo+'"><img id= "timg" src="resources/upload/'+data[i].thumb+'"/><br>'+decodeURIComponent(data[i].title.replace(/\+/g,' '))+'</a>');
					$tableBody.append($thumb);
					
					console.log($bTitle);
				}
				
			}
		});
	}
	
	$(function(){
		weatherList();
		
		setInterval(function(){
			topList();
		}, 5000000);
	}); */
		function topList(){
			$.ajax({
				url: 'topFoodList.ma',
				dataType: 'json',
				success: function(data){
					$tableBody = $('#topFoodT tbody tr');
					$tableBody.html("");
					
					for(var i in data){
						var $tr = $("<tr>");
						var $bTitle = $("<td>").text(decodeURIComponent(data[i].title.replace(/\+/g,' ')));
						var $thumb = $("<td>").html('<a href="detail.rc?postNo='+data[i].postNo+'"><img id= "timg" src="resources/upload/'+data[i].thumb+'"/><br>'+decodeURIComponent(data[i].title.replace(/\+/g,' '))+'</a>');
					/* 	$tableBody.append($thumb);
						$thumb.append($bTitle); */
						$tableBody.append($thumb);
						/* $tableBody.append($tr);
						$tableBody.append($bTitle); */
						
						console.log($bTitle);
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
		
		
		function topChefList(){
			$.ajax({
				url:'topChefList.ma',
				dataType:'json',
				success: function(data){
					$tableBody = $('#popularChefT tbody tr');
					$tableBody.html("");
					
					for(var i in data){
						var $tr = $("<tr>");
						var $bTitle = $("<td>").text(decodeURIComponent(data[i].nickName.replace(/\+/g,' ')));
						var $thumb = $("<td>").html('<img id= "profileimg" src="resources/upload/'+data[i].pName+'"/><br>'+decodeURIComponent(data[i].nickName.replace(/\+/g,' ')));
						$tableBody.append($thumb);
						
						console.log($bTitle);
					}
					
				}
			});
		}
		$(function(){
			topChefList();
			
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