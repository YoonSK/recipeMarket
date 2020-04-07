<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   #userChating{
      text-align:right;
   }
</style>
</head>
<body>
   <div>
      <div class="chatting">
         <div class="topBar" style="height:20%; background-color:green; color:white; text-align:center">
         1:1문의 채팅
         </div>
         
         <div class="content" style="background:skyblue;">
         <table >
            <tr id="userChatting">
               <td colspan="2" style="text-align:right;">본인</td>
            </tr>
            <tr>
               <td>오후 5:26</td>
               <td style="font-size:20px; background:lightgray; color:balck; border-radius:10px;">안녕하세요.만나서 반갑습니다~~~~~~~</td>
            </tr>
         </table>
         <br>
         <br>
         
         
         <table id="adminChatting">
            <tr>
               <td colspan="2" style="text-align:left;">관리자</td>
            </tr>
            <tr>
               <td style="font-size:20px; background:white; color:balck; border-radius:10px;">안녕하세요 회원님 저도 만나서 반갑습니다.</td>
               <td>오후 5:26</td>
            </tr>
         </table>
         
         <br>
         <br>
         
         <table>
            <tr>
               <td colspan="2" style="text-align:right;">본인</td>
            </tr>
            <tr>
               <td>오후 5:26</td>
               <td style="font-size:20px; background:lightgray; color:balck; border-radius:10px;">혹시 등급에 따른 보상을 알수 있을까요?</td>
            </tr>
         </table>
         
         
         </div>
      </div>
   </div>
</body>
</html>