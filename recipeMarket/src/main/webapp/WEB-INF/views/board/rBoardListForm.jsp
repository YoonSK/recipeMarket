<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   
.AllArea{
   background: lightgray;
   height: 1000px;
   padding-top: 20px;
}

.title{
   background: white;
    z-index: 999;
    margin: 20px;
    height: 100px;
    margin-top: 20px;
    position: relative;
}

/* #insertBtn{
   margin:10%;
} */
</style>
</head>
<body>
   <%@ include file="header.jsp" %>
   <form>
      <div class="AllArea" style="background: lightgray;height: 1000px;">
         <div class="title"  style="background: white;">
            <span  style="margin: 10%; vertical-align: middle; width:60%; font-size:30px; font-align:center;">
               	토크 전체의 글을 볼수 있습니다.
            </span>
            
            <span  style="float:right;width:30%;">
                <button style="font-size:30px; font-align:center" id="insertBtn" >등록하기</button>
            </span>
         </div>
      </div>
   </form>
</body>
</html>