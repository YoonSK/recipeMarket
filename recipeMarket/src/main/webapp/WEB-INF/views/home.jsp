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
	<!-- 		<script type="text/javascript">
	    function getLocation() {
	    	  if (navigator.geolocation) { // GPS를 지원하면
	    	    navigator.geolocation.getCurrentPosition(function(position) {
	    	      console.log(position.coords.latitude + ' ' + position.coords.longitude);
	    	    }, function(error) {
	    	      console.error(error);
	    	    }, {
	    	      enableHighAccuracy: false,
	    	      maximumAge: 0,
	    	      timeout: Infinity
	    	    });
	    	  } else {
	    	    alert('GPS를 지원하지 않습니다');
	    	  }
	    	}
	    	getLocation();
	</script> -->
	<!-- <script>
	 function askForCoords(){
    navigator.geolocation.getCurrentPosition(handleGeoSucces, handleGeoError);
  }
	 
	 function handleGeoSucces(position){
		    const latitude =  position.coords.latitude;
		    const longitude = position.coords.longitude;
		    const coordsObj = {
		      latitude,
		      longitude
		    };
		    saveCoords(coordsObj);
		    getWeather(latitude, longitude);
		  }

		  function handleGeoError(position){
		    console.log('Cant get your position.');
		  }
		  

		  function getWeather(lat, lon){
		    fetch(
		      `https:api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${ae4959dc548a8eabf9e9a03f8ff2866e}&units=metric`
		    )
		      .then(function(response){
		      return response.json();
		    })
		      .then(function(json){
		        console.log(json);
		        const temparature = json.main.temp;  //온도
		        const place = json.name;   // 사용자 위치
		        weather.innerText = `${temparature} @${place}`;

		      });
		  }

	 </script>
	 -->
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
	
	
/* 	var apiURI = "http://api.openweathermap.org/data/2.5/weather?q="+seoul+"&appid="+"ae4959dc548a8eabf9e9a03f8ff2866e";
    $.ajax({
        url: apiURI,
        dataType: "json",
        type: "GET",
        async: "false",
        success: function(resp) {
            console.log(resp);
            console.log("현재온도 : "+ (resp.main.temp- 273.15) );
            console.log("현재습도 : "+ resp.main.humidity);
            console.log("날씨 : "+ resp.weather[0].main );
            console.log("상세날씨설명 : "+ resp.weather[0].description );
            console.log("날씨 이미지 : "+ resp.weather[0].icon );
            console.log("바람   : "+ resp.wind.speed );
            console.log("나라   : "+ resp.sys.country );
            console.log("도시이름  : "+ resp.name );
            console.log("구름  : "+ (resp.clouds.all) +"%" );                 
        }
    });
 */
	</script>
</html>