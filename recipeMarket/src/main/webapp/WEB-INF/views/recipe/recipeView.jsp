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
<c:import url="../common/header.jsp"/>
<div class="outer" style="display:flex; justify-content: center;">
    <div class="container" style="width: 1000px; margin: 0 auto; display: flex; flex-direction: column">
    <div style="display: block; justify-content: center;">
        <h1>레시피</h1>
        <div class="flex" id = "mainImage" style="justify-content: center">
            <img width="300px" height="300px" src="resources/upload/${imgList[0].changeName}"/>
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
                    <img width="50px"height="50px" src="resources/upload/${author.pName}">
                </div>
                <div>
                    <label>
                    ${author.nickName}
                    </label>
                </div>
            </div>
        </div>
        <div class="flex" style="height:50px; justify-content: center; align-items: center">
            <div style="font-size:30px; font-weight: 600;margin-right:10px;">
                ${recipe.rating}
            </div>
            <div>
            <c:set var="starImage" value="'star_full_on'"/>
           	<c:choose>
           		<c:when test = "${recipe.rating < 4.0}">
           			<c:set var ="starImage" value = "resources/images/star_min_on.png"/>
           		</c:when>
           		<c:when test = "${recipe.rating < 7.0}">
           			<c:set var ="starImage" value = "resources/images/star_half_on.png"/>
           		</c:when>
           		<c:when test = "${recipe.rating < 9.0}">
           			<c:set var ="starImage" value = "resources/images/star_max_on.png"/>
           		</c:when>
           		<c:when test = "${recipe.rating >= 9.0}">
           			<c:set var ="starImage" value = "resources/images/star_full_on.png"/>
           		</c:when>
           	</c:choose>
            	<img width="50" height="50" src="${starImage}">
            </div>
        </div>
        <div class="flex" style="justify-content: center; text-align: center">
            <div class="recipeInfo">
                <div>
                    <img width="50px" height="50px" src="resources/images/serving.png">
                </div>
                <div>
                    <label>${recipe.serving}인분</label>
                </div>
            </div>
            <div class="recipeInfo">
                <div>
                    <img width="50px" height="50px" src="resources/images/category.png">
                </div>
                <div>
                	<c:choose>
                		<c:when test = "${recipe.category eq 'sub'}">
                			<label>반찬</label>
                		</c:when>
                		<c:when test = "${recipe.category eq 'main'}">
                			<label>메인요리</label>
                		</c:when>
                		<c:when test = "${recipe.category eq 'soup'}">
                			<label>국물류</label>
                		</c:when>
                		<c:when test = "${recipe.category eq 'meal'}">
                			<label>식사</label>
                		</c:when>
                		<c:when test = "${recipe.category eq 'dessert'}">
                			<label>간식/디저트</label>
                		</c:when>
                		<c:when test = "${recipe.category eq 'salad'}">
                			<label>샐러드</label>
                		</c:when>
                		<c:when test = "${recipe.category eq 'drink'}">
                			<label>음료</label>
                		</c:when>
                		<c:when test = "${recipe.category eq 'sauce'}">
                			<label>양념</label>
                		</c:when>
                		<c:when test = "${recipe.category eq 'etc'}">
                			<label>기타</label>
                		</c:when>
                	</c:choose>
                </div>
            </div>
            <div class="recipeInfo">
                <div>
                    <img width="50px" height="50px" src="resources/images/timer.png">
                </div>
                <div>
                    <label>${recipe.reqTime}분 이내</label>
                </div>
            </div>
            <div class="recipeInfo">
                <div>
                    <img width="50px" height="50px" src="resources/images/difficulty.png">
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
        <div style="text-align: left; width: 70%; min-height: 70px; background-color: rgba(199,241,122,0.49); border-radius: 10px">
        	<c:forEach items="${ingredientList}" var="ing">
    			<button class="ingredient" type="button" onclick='location.href="searchProduct.rc?keyword=<c:out value="${ing.name}"/>"'>
    				<c:out value="${ing.name}"/>
    				-
    				<c:out value="${ing.amount}"/>
    			</button>
			</c:forEach>
        </div>
    </div>
    <div class="flex" style="justify-content: center; ">
        <div style="width: 5%">태그</div>
        <div style="text-align: left; width: 70%; min-height: 70px; background-color: rgba(199,241,122,0.49); border-radius: 10px">
        	<c:forEach items="${tagList}" var="Tag">
    			<button class="rtag" type="button" onclick='location.href="search.rc?tag=<c:out value="${Tag.tag}"/>"'>
    				<c:out value="${Tag.tag}"/>
    			</button>
			</c:forEach>
        
        </div>
    </div>
    <div class="flex" style="justify-content: center; flex-direction: column; width: 100%; margin: 5px auto;">
   		<c:forEach items="${stepList}" var="step" varStatus="status">
   		
        <div class="flex" class = "step" id = "step[<c:out value="${step.step}"/>]" style="width: 100%; background-color: #add1c3">
            <div style="width: 50px; text-align: center; font-size: 30px">
                <label>
    				<c:out value="${step.step}"/>
    			</label>
            </div>
            <div style="width: 80%" >
                <p><c:out value="${step.content}"/></p>
            </div>
            <div>
            <c:if test='${imgList[status.index +1].changeName ne "skip"}'>
                <img width="200px" height="200px" src="resources/upload/${imgList[status.index +1].changeName}"/>
            </c:if>

            </div>
        </div>
        
        </c:forEach>
       
    </div>

    <c:choose>
    	<c:when test="${loginUser.memberNo == recipe.memberNo}">
    <div class="flex" style="height: 30px; width: 100%">	
        <button class="reactBtn" type="submit" onclick='location.href="updateForm.rc?postNo=${recipe.postNo}";' style="width: 100px;
    border: none;
    border-radius: 5px;
    margin-left: 40%;
    background: lightgoldenrodyellow;">수정</button>
        <button class="reactBtn" type="submit" onclick='location.href="delete.rc?postNo=${recipe.postNo}";' style="width: 100px;
    border: none;
    border-radius: 5px;
    margin-left: 2%;
    background: orangered;
    color: white;">삭제</button>
    </div>
    	</c:when>
    	<c:when test="${loginUser.memberNo != null}">
	<div class="flex" style="height: 30px; width: 100%">
    	<button class="reactBtn" id="follow"  style="width:50%;" value="${author.nickName}" >구독하기</button>
        <%-- 
        <button class="reactBtn" type="submit" onclick='location.href="follow.rc?targetNo=${recipe.memberNo}";' style="width: 50%">구독</button>
        --%>
        <button class="reactBtn" type="submit" onclick='location.href="save.rc?postNo=${recipe.postNo}";' style="width: 50%">담아두기</button>
    </div>
    	</c:when>
    </c:choose>

    <div style="min-height: 60px">
        <c:forEach items="${replyList}" var="reply">
    		<div class="flex" style="min-height: 60px; border: 1px solid lightgray">
            	<div style="width: 142px;text-align: center">
                	<div>
                    	<div style="margin-top:5px">
                        	<img width="40px"height="40px" src="resources/upload/${reply.pName}">
                    	</div>
                    	<div>
                        	<label>
                        	<c:choose>
                			<c:when test="${loginUser.memberNo == reply.memberNo}">나</c:when>
                			<c:when test="${recipe.memberNo == reply.memberNo}">작성자</c:when>
                			<c:otherwise><c:out value="${reply.nickName}"/></c:otherwise>
                			</c:choose>
    						</label>
                    	</div>
                	</div>
                	<div style="color: #fd7e14">
                		<c:choose>
                			<c:when test="${recipe.memberNo == reply.memberNo}">
                			</c:when>
                			<c:otherwise>
	                			<c:forEach var="fullStar" begin="1" end="${reply.rating / 2}" step="1">
		                    	<span>★</span>
								</c:forEach>
		                		<c:if test="${reply.rating %2 == 1}">
		                    	<span>☆</span>
	                			</c:if>
                			</c:otherwise>
                		</c:choose>
                	</div>
            	</div>
            	<div style="display: block; min-height: 60px; width:100%; background-color: #e8e5da; padding: 8px">
                	<div style=" min-height: 50px; width: 75%; text-align: left">
    					<c:out value="${reply.content}"/>
    				</div>
                	<div style="text-align: right; font-size:12px;">
    					<c:out value="${reply.modifyDate}"/>
                	</div>
            	</div>
        	</div>
		</c:forEach>
		
        <form action='insertReply.rc' method="post" enctype="Multipart/form-data">
        <div class="flex" style="min-height: 150px;">
  		
            <div  style="width: 150px;">
                <div style="padding-left: 30px">
                    <p>댓글</p>
                </div>
                <div class="starbox" style="height: 40px;">
                <c:if test="${loginUser.memberNo != recipe.memberNo}">
                    <span>
                        <img class="star-left" id = "star1" onclick="ratingStar(1)" src="resources/images/star_left.png">
                    </span>
                    <span>
                        <img class="star-right" id = "star2" onclick="ratingStar(2)" src="resources/images/star_right.png">
                    </span>
                    <span>
                        <img class="star-left" id = "star3" onclick="ratingStar(3)" src="resources/images/star_left.png">
                    </span>
                    <span>
                        <img class="star-right" id = "star4" onclick="ratingStar(4)" src="resources/images/star_right.png">
                    </span>
                    <span>
                        <img class="star-left" id = "star5" onclick="ratingStar(5)" src="resources/images/star_left.png">
                    </span>
                    <span>
                        <img class="star-right" id = "star6" onclick="ratingStar(6)" src="resources/images/star_right.png">
                    </span>
                    <span>
                        <img class="star-left" id = "star7" onclick="ratingStar(7)" src="resources/images/star_left.png">
                    </span>
                    <span>
                        <img class="star-right" id = "star8" onclick="ratingStar(8)" src="resources/images/star_right.png">
                    </span>
                    <span>
                        <img class="star-left" id = "star9" onclick="ratingStar(9)" src="resources/images/star_left.png">
                    </span>
                    <span>
                        <img class="star-right" id = "star10" onclick="ratingStar(10)" src="resources/images/star_right.png">
                    </span>
                </c:if>
                </div>
                <input type="hidden" id="rate" name="rating" value="0"/>
            </div>
            <div style="width: 100%">
                <textarea name="content" style="min-height: 100px; min-width:98%; background-color: #e8e5da; border: antiquewhite"></textarea>
            </div>
            <div>
                <c:if test="${loginUser == null }">
                	<button type="button" onclick="login();" style="width: 80px;  height: 30px; border: none; border-radius: 5px;">등록</button>
		        </c:if>
                <c:if test="${loginUser != null }">
                	<button type="submit" style="width: 80px;  height: 30px; border: none; border-radius: 5px;">등록</button>
		        </c:if>
                <input type="hidden" name="postNo" value="${recipe.postNo}"/>
            </div>
            <script>
			   function login(){
				   alert('로그인을 해주세요.');
				   location.href="goLogin.me";
			   }
			    	
			</script>
        </div>
        </form>
    </div>
    </div>

</div>
<c:import url="../common/footer.jsp"/>
</body>
<script>
    function ratingStar(no) {
        document.getElementById('rate').value = no;
        var img = document.getElementById('star' + no);
        img.src= "resources/images/star_left_on.png";
        for (let i = 1; i <= no; i++){
            if ( i%2 == 1){
                document.getElementById('star' + i).src = "resources/images/star_left_on.png";
            }
            else{
                document.getElementById('star' + i).src = "resources/images/star_right_on.png";
            }
        }
        for (let j = 10; j > no; j--){
            if ( j%2 == 1){
                document.getElementById('star' + j).src = "resources/images/star_left.png";
            }
            else{
                document.getElementById('star' + j).src = "resources/images/star_right.png";
            }
        }
    }
    /* 팔로우 */
   	$(document).on('click', '#follow', function(){
				var targetNo = ${ loginUser.memberNo };
				var memberNo = ${ author.memberNo};
				var nickName = $(this).val();
				console.log("memberNo : "+ memberNo);
				console.log("targetNo : " + targetNo);
	    		$.ajax({
					url:'insertFollow.me',
					data:{targetNo:targetNo, memberNo:memberNo},
					type:'post',
					success:function(data){
						console.log(data);
						if(data == "success"){	
							alert("["+ nickName +"]"+ "님을 팔로우 했습니다.");
							window.location.reload();
						}
					}
				}); 
	    	});
</script>
</html>