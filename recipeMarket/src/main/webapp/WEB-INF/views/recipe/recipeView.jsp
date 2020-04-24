<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>레시피 상세 조회</title>
    <style>
        .flex{
            display: flex;
            margin : 5px 5px auto;
        }
        textarea{
            resize: none;
        }
        .recipeInfo {
            margin: 5px 5% auto;
        }
        .star-right, .star-left{
            margin: 0px 0px auto;
            cursor: pointer;
        }
        span{
            margin: 0px -3px auto;
        }
        .ingredient, .rtag{
            margin: 5px 5px auto;
            padding: 5px 5px 5px 5px;
            border: none;
            background-color: #e8e5da;
            border-radius: 10px;
        }
    </style>
</head>
<body>
<div class="outer" style="display:flex; justify-content: center;">
    <div class="container" style="width: 1000px; margin: 0 auto; display: flex; flex-direction: column">
    <div style="display: block; justify-content: center;">
        <h1>레시피</h1>
        <div class="flex" id = "mainImage" style="justify-content: center">
            <img width="300px" height="300px"/>
        </div>
        <div class="flex" style="justify-content: center">
            <div style="font-size: 30px">
                <label>${recipe.title}</label>
            </div>
            <div style="display: flex; align-items: center; margin: 5px 5px 5px 15px">
                <label>by</label>
            </div>
            <div style="margin-left: 10px; text-align: center">
                <div>
                    <img width="50px"height="50px">
                </div>
                <div>
                    <label>
                        만렙주부
                    </label>
                </div>
            </div>
        </div>
        <div class="flex" style="justify-content: center">
            <div>
                4.5 별점
            </div>
        </div>
        <div class="flex" style="justify-content: center; text-align: center">
            <div class="recipeInfo">
                <div>
                    <img width="50px" height="50px">
                </div>
                <div>
                    <label>${recipe.serving}인분</label>
                </div>
            </div>
            <div class="recipeInfo">
                <div>
                    <img width="50px" height="50px">
                </div>
                <div>
                    <label>${recipe.reqTime}분 이내</label>
                </div>
            </div>
            <div class="recipeInfo">
                <div>
                    <img width="50px" height="50px">
                </div>
                <div>
                	<c:choose>
                		<c:when test = "${recipe.difficulty eq '0'}">
                			<label>쉬움</label>
                		</c:when>
                		<c:when test = "${recipe.difficulty eq '1'}">
                			<label>보통</label>
                		</c:when>
                		<c:when test = "${recipe.difficulty eq '2'}">
                			<label>어려움</label>
                		</c:when>
                	</c:choose>
                </div>
            </div>
        </div>
    </div>
    <div class="flex" style="justify-content: center; ">
        <div style="width: 5%">재료</div>
        <div style="text-align: left; width: 70%; height: 100px; background-color: rgba(199,241,122,0.49); border-radius: 10px">
        	<c:forEach items="${ingredientList}" var="ing">
    			<button class="ingredient">
    				<c:out value="${ing.name}"/>
    				-
    				<c:out value="${ing.amount}"/>
    			</button>
			</c:forEach>
        </div>
    </div>
    <div class="flex" style="justify-content: center; ">
        <div style="width: 5%">태그</div>
        <div style="text-align: left; width: 70%; height: 100px; background-color: rgba(199,241,122,0.49); border-radius: 10px">
        	<c:forEach items="${tagList}" var="Tag">
    			<button class="rtag">
    				<c:out value="${Tag.tag}"/>
    			</button>
			</c:forEach>
        
        </div>
    </div>
    <div class="flex" style="justify-content: center; flex-direction: column; width: 100%; margin: 5px auto;">
   		<c:forEach items="${stepList}" var="step">
   		
        <div class="flex" class = "step" id = "step[1]" style="width: 100%; background-color: #add1c3">
            <div style="width: 50px; text-align: center; font-size: 30px">
                <label>
    				<c:out value="${step.step}"/>
    			</label>
            </div>
            <div style="width: 80%" >
                <p><c:out value="${step.content}"/></p>
            </div>
            <div>
                <img width="300px" height="300px"/>
            </div>
        </div>
        
        </c:forEach>
       
    </div>

    <div class="flex" style="height: 30px; width: 100%">
        <button style="width: 50%">구독</button>
        <button style="width: 50%">담아두기</button>
    </div>

    <div style="min-height: 60px">
        <div class="flex" style="min-height: 60px; ">
            <div style="width: 142px;text-align: center">
                <div>
                    <div>
                        <img width="50px"height="50px" src="">
                    </div>
                    <div>
                        <label>요리킹 조리킹</label>
                    </div>
                </div>
                <div style="color: #fd7e14">
                    <span>★</span>
                    <span>★</span>
                    <span>★</span>
                    <span>★</span>
                    <span>★</span>
                </div>
            </div>
            <div style="display: block; min-height: 60px; width:100%; background-color: #e8e5da; padding: 8px">
                <div style=" min-height: 60px; width: 75%; text-align: left">
                    댓글 블라블라블라
                </div>
                <div style="text-align: right;">
                    2020-03-03 7:45:22
                </div>
            </div>
        </div>
        <form>
        
        <div class="flex" style="min-height: 150px;">
        
            <div  style="width: 150px;">
                <div style="padding-left: 30px">
                    <p>후기</p>
                </div>
                <div class="starbox" style="height: 40px;">
                    <span>
                        <img class="star-left" id = "star1" onclick="rating(1)" src="star_left.png">
                    </span>
                    <span>
                        <img class="star-right" id = "star2" onclick="rating(2)" src="star_right.png">
                    </span>
                    <span>
                        <img class="star-left" id = "star3" onclick="rating(3)" src="star_left.png">
                    </span>
                    <span>
                        <img class="star-right" id = "star4" onclick="rating(4)" src="star_right.png">
                    </span>
                    <span>
                        <img class="star-left" id = "star5" onclick="rating(5)" src="star_left.png">
                    </span>
                    <span>
                        <img class="star-right" id = "star6" onclick="rating(6)" src="star_right.png">
                    </span>
                    <span>
                        <img class="star-left" id = "star7" onclick="rating(7)" src="star_left.png">
                    </span>
                    <span>
                        <img class="star-right" id = "star8" onclick="rating(8)" src="star_right.png">
                    </span>
                    <span>
                        <img class="star-left" id = "star9" onclick="rating(9)" src="star_left.png">
                    </span>
                    <span>
                        <img class="star-right" id = "star10" onclick="rating(10)" src="star_right.png">
                    </span>
                </div>
            </div>
            <div style="width: 100%">
                <textarea style="min-height: 100px; min-width:98%; background-color: #e8e5da; border: antiquewhite"></textarea>
            </div>
            <div>
                <button style="min-height: 100px">작성 완료</button>
            </div>
        </div>
        </form>
    </div>
    </div>
</div>
</body>
<script>
    function rating(no) {
        let num = parseInt(no);
        let img = document.getElementById('star' + String(num));
        img.src= "star_left_on.png";
        for (let i = 1; i <= num; i++){
            if ( i%2 == 1){
                document.getElementById('star' + String(i)).src = "star_left_on.png";
            }
            else{
                document.getElementById('star' + String(i)).src = "star_right_on.png";
            }
        }
        for (let j = 10; j > num; j--){
            if ( j%2 == 1){
                document.getElementById('star' + String(j)).src = "star_left.png";
            }
            else{
                document.getElementById('star' + String(j)).src = "star_right.png";
            }
        }
    }
</script>
</html>