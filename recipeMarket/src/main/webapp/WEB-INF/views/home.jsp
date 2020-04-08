<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 마켓</title>
<style>
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
</head>
<body>
	<c:import url="common/header.jsp"/>
	<div class="outer">
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	
	
	<div class="slide">
	<div class="imageBar"></div>
		<div class="boxOuter">
			<div class="firstBox" id="slick"  style="margin: 5%;">
			    <div><img class="icon" src="resources/images/all.png"/></div>
			    <div><img class="icon" src="resources/images/mainmenu.png"/></div>
			    <div><img class="icon" src="resources/images/soup.png"/></div>
			    <div><img class="icon" src="resources/images/diet.png"/></div>
			    <div><img class="icon" src="resources/images/sidemenu.png"/></div>
			    <div><img class="icon" src="resources/images/rice.png"/></div>
			    <div><img class="icon" src="resources/images/drink.png"/></div>
			    <div><img class="icon" src="resources/images/sauce.png"/></div>
			    <div><img class="icon" src="resources/images/dessert.png"/></div>
			    <div><img class="icon" src="resources/images/speed.png"/></div>
			    <div><img class="icon" src="resources/images/etc.png"/></div>
			</div>
			
		</div>
	</div>
		<div class="currentLocation">
			<h1>위도 : <span id="latitude"></span></h1>
			<h1>경도 : <span id="longitude"></span></h1>
			
			
		<div id="weather">
			<h2>- 오늘의 날씨 정보</h2>
			<div class="ctemp">현재 온도 : </div>
			<div class="clowtemp">최저 온도 : </div>
			<div class="chightemp">최고 온도 : </div>
			<div class="cicon">아이콘 : </div>
		</div>
	<script>
	navigator.geolocation.getCurrentPosition(function(pos) {
	    var $lat =pos.coords.latitude;
	    var $lon =pos.coords.longitude;
	    
	  /*   alert($lat);
	    alert($lon);
	    alert("http://api.openweathermap.org/data/2.5/weather?lat="+$lat+"+&lon="+$lon+"&appid=ae4959dc548a8eabf9e9a03f8ff2866e&units=metric"); */
	    $.getJSON("http://api.openweathermap.org/data/2.5/weather?lat="+$lat+"&lon="+$lon+"&appid=ae4959dc548a8eabf9e9a03f8ff2866e&units=metric",function(data){
	    	
	    	//data로 할일(data : 날씨 정보를 통째로 가져오는것)
			/* alert(data.cod);
			alert(data.city.name);
			alert(data.list[0].main.temp_min); */
			
			/* 현재의 날씨 정보 */
			var $minTemp = data.main.temp_min;
			var $maxTemp = data.main.temp_max;
			var $cTemp = data.main.temp;
			var $now = new Date($.now());
			var $cDate = $now.getFullYear() + '년' +$now.getMonth() + '월' + $now.getDate()+'일'+ +$now.getHours() + ':' + $now.getMinutes()
			var $wIcon = data.weather[0].icon;
			
			
			//A.appne(B) A요소의 내용의 뒤에 B를 추가
			//A.prepend(B)  A요소의 내용의 앞에 B를 추가
			$('.clowtemp').append($minTemp);
			$('.ctemp').append($cTemp);
			$('.chightemp').append($maxTemp);
			$('h2').prepend($cDate);
			$('.cicon').append('<img src="http://openweathermap.org/img/wn/'+ $wIcon +'@2x.png"/>');
			// <img src="http://openweathermap.org/img/wn/10d@2x.png"/>
			
			
			
		});
	});
		

		
	
	</script> 
		  
	
	</div>
	</div>	
	
	
	<c:import url="common/footer.jsp"/>
</body>

<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="resources/js/slick/slick.min.js"></script>
<script>
$(document).ready(function(){
 $('#slick').slick({
	  dots: true,
	  infinite: false,
	  speed: 300,
	  slidesToShow: 5,
	  slidesToScroll: 5,
	  responsive: [
	    {
	      breakpoint: 1024,
	      settings: {
	        slidesToShow: 3,
	        slidesToScroll: 3,
	        infinite: true,
	        dots: true
	      }
	    },
	    {
	      breakpoint: 600,
	      settings: {
	        slidesToShow: 2,
	        slidesToScroll: 2
	      }
	    },
	    {
	      breakpoint: 480,
	      settings: {
	        slidesToShow: 1,
	        slidesToScroll: 1
	      }
	    }
	  ]
	});
});
	$('#slick').slick({
		  infinite: true,
		  slidesToShow: 5,
		  slidesToScroll: 5
		}); 
	

	</script>
</html>