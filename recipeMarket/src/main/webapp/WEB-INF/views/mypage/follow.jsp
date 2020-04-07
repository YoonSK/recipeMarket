<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#mask {
    position: absolute;
    left: 0;
    top: 0;
    z-index: 999;
    background-color: #000000;
    display: none; }

.layerpop {
    display: none;
    z-index: 1000;
    border: 2px solid #ccc;
    background: #fff;
    cursor: move; }

.layerpop_area .title {
    padding: 10px 10px 10px 10px;
    border: 0px solid #aaaaaa;
    background: #f1f1f1;
    color: #3eb0ce;
    font-size: 1.3em;
    font-weight: bold;
    line-height: 24px; }

.layerpop_area .layerpop_close {
    width: 25px;
    height: 25px;
    display: block;
    position: absolute;
    top: 10px;
    right: 10px;
    background: transparent url('btn_exit_off.png') no-repeat; }

.layerpop_area .layerpop_close:hover {
    background: transparent url('btn_exit_on.png') no-repeat;
    cursor: pointer; }

.layerpop_area .content {
    width: 96%;    
    margin: 2%;
    color: #828282; }
/*-- POPUP common style E --*/

.delete{
	float: right;
	width: 80px;
    height: 40px;
    border-radius: 5px;
    border: none;
    background: #c5db91;
    color: white;
}
.followList{
	margin: 10px;
}

.follow{
	border:none;
	width: 100px;
    height: 30px;
}
.profile{
	    margin-left: 40%;
    margin-top: 5%;
    
}
#introduction{
	 resize: none;
    width: 300px;
    height: 200px;
    margin-left:-3%;
    margin-top:10px;

}
</style>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script> 
</head>

<body>
	<c:import url="../common/header.jsp"/>
	
	<div class="outer">
		<div class="container">
			<div class="content">
				<div class="profile">
					<div class="a">
						<img src="../images/user.png" style="width:150px;"/>
						<br>
						<button onClick="javascript:goDetail('테스트');" class="follow" id="following">팔로잉<span>3</span></button>
						<button onClick="javascript:goDetail('테스트');" class="follow">팔로워<span>5</span></button>
						<br>
						<textarea id="introduction">자기소개 부분</textarea>
					</div>
				</div>
					<!-- 팝업 창 -->
					    <div style="height:1000px;"> </div>
					
					    <!-- 팝업뜰때 배경 -->
					    <div id="mask"></div>
					
					    <!--Popup Start -->
					    <div id="layerbox" class="layerpop" style="width: 500px;height: 400px;overflow-y:scroll">
					        <article class="layerpop_area">
						        <div class="title"> OOO님의 팔로우한 쉐프</div>
						        <a href="javascript:popupClose();" class="layerpop_close"
						            id="layerbox_close"></a> <br>
						        <div class="followList">
						   	 		<img src="../images/user.png" style="width:70px"/>
						   	 		<span style="font-size:15px;">XXX 쉐프</span>
						   	 		<button class="delete">삭제</button>
						   	 		<hr>
						        </div>
						         <div class="followList">
						   	 		<img src="../images/user.png" style="width:70px"/>
						   	 		<span style="font-size:15px;">XXX 쉐프</span>
						   	 		<button class="delete">삭제</button>
						   	 		<hr>
						        </div>
						         <div class="followList">
						   	 		<img src="../images/user.png" style="width:70px"/>
						   	 		<span style="font-size:15px;">XXX 쉐프</span>
						   	 		<button class="delete">삭제</button>
						   	 		<hr>
						        </div>
						         <div class="followList">
						   	 		<img src="../images/user.png" style="width:70px"/>
						   	 		<span style="font-size:15px;">XXX 쉐프</span>
						   	 		<button class="delete">삭제</button>
						   	 		<hr>
						        </div>
					        </article>
					    </div>
					    <!--Popup End -->
					<!--드래그 할수 있는 기능을 사용하기 위해서 draggable();-->
				</div>
			</div>
		</div>
	</div>
<script>

    function wrapWindowByMask() {
        //화면의 높이와 너비를 구한다.
        var maskHeight = $(document).height(); 
        var maskWidth = $(window).width();

        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
        $('#mask').css({
            'width' : maskWidth,
            'height' : maskHeight
        });

        //애니메이션 효과
        //$('#mask').fadeIn(1000);      
        $('#mask').fadeTo("slow", 0.5);
    }

    function popupOpen() {
        $('.layerpop').css("position", "absolute");
        //영역 가운에데 레이어를 뛰우기 위해 위치 계산 
        $('.layerpop').css("top",(($(window).height() - $('.layerpop').outerHeight()) / 2) + $(window).scrollTop());
        $('.layerpop').css("left",(($(window).width() - $('.layerpop').outerWidth()) / 2) + $(window).scrollLeft());
        //$('.layerpop').draggable();
        $('#layerbox').show();
    }

    function popupClose() {
        $('#layerbox').hide();
        $('#mask').hide();
    }

    function goDetail() {

        /*팝업 오픈전 별도의 작업이 있을경우 구현*/ 

        popupOpen(); //레이어 팝업창 오픈 
        wrapWindowByMask(); //화면 마스크 효과 
    }

</script>

</body>
<c:import url="../common/footer.jsp"/>
</html>
