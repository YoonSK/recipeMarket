<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>레시피 검색</title>

    <style>
        a{
            color: #0b2e13;
            text-decoration: none;
        }
        .option{
            display: flex;
            margin-top: 10px;
        }
        .mini_option{
            margin-right: 20px;
        }
        .option_name{
           margin-right: 10px;
		    font-size: 20px;
		    vertical-align: baseline;
        }
        select{
           text-align: center;
		    border: 1px solid #d9d9d9;
		    height: 30px;
		    border-radius: 5px;
		    font-size: 15px;
        }
        .box{
            display: flex;
            flex-direction: column;
            text-align: center;
            width: 150px;
            min-height: 200px;
            margin: 15px 15px auto;
        }
        .example{
           font-size: 15px;
    vertical-align: baseline;
        }
        .ingredient{
            margin: 2px 2px 2px 2px;
            padding: 3px 3px 3px 3px;
            border-radius: 10px;
            border: none;
            background-color: aliceblue;
        }
        .tag{
            margin: 2px 2px 2px 2px;
            padding: 3px 3px 3px 3px;
            border-radius: 10px;
            border: none;
            background-color: aliceblue;
        }
        button{
            border: none;
        }
        #addIngredient, #addTag, #search{
            width: 150px;
		    border: 1px solid #d9d9d9;
		    height: 30px;
		    border-radius: 5px;
		    vertical-align: baseline;
        }
        #search{
            width: 200px;
        }
        .linkerBtn{
            margin: 2px 2px 2px 2px;
            margin-left:auto;
            padding: 3px 3px 3px 3px;
            border-radius: 5px;
        }
        #writeBtn{
            border: none;
		    background-color: #add1c3;
		    color: white;
		    height: 40px;
		    width: 100px;
        }
        .linkerBtn:hover{background: white; color:black; border:1px solid #add1c3}
        #listBtn{
            border: none;
		    background-color: #adc1d3;
		    color: white;
		    height: 40px;
		    width: 100px;
        }s
        #listBtn{
            border: 1px solid darkblue;
            background-color: lightblue;
        }
        
        #sortBtnRate,#sortBtnHit,#sortBtnNew{
        	height: 30px;
		    float: left;
		    list-style: none;
		    background-color: #add1c3;
		    color: white;
		    cursor: pointer;
		}
		
		input:focus{outline: none;}
		button{outline: none;}
		
     /* 기간별 조회 */
   	#sortBtnRate:hover{background-color: white; color: black; border:1px solid #add1c3; cursor: pointer;}
    #sortBtnHit:hover{background-color: white; color: black; border:1px solid #add1c3; cursor: pointer;}
    #sortBtnNew:hover{background-color: white; color: black; border:1px solid #add1c3; cursor: pointer;}

    </style>
</head>
<body>
<c:import url="../common/header.jsp"/>
<div class="outer" style="display:flex; justify-content: center;">
    <div class="container" style="width: 1080px; margin: 0 auto; display: flex; flex-direction: column">
        <h1>레시피 검색</h1>
        <form action="search.rc" method="post">
        <div class="content">
            <div class="option">
                <div class="mini_option">
                    <span class="option_name">분량</span>
                    <c:choose>
                    	<c:when test="${searchCon.serving == 0}">
                    		<c:set var="serving0" value='selected="selected"'/>
                    	</c:when>
                    	<c:when test="${searchCon.serving == 1}">
                    		<c:set var="serving1" value='selected="selected"'/>
                    	</c:when>
                    	<c:when test="${searchCon.serving == 2}">
                    		<c:set var="serving2" value='selected="selected"'/>
                    	</c:when>
                    	<c:when test="${searchCon.serving == 3}">
                    		<c:set var="serving3" value='selected="selected"'/>
                    	</c:when>
                    	<c:when test="${searchCon.serving == 4}">
                    		<c:set var="serving4" value='selected="selected"'/>
                    	</c:when>
                    </c:choose>
                    <select name="serving">
                        <option value="0" <c:out value="${serving0}"/>>무관</option>
                        <option value="1" <c:out value="${serving1}"/>>1인</option>
                        <option value="2" <c:out value="${serving2}"/>>2인</option>
                        <option value="3" <c:out value="${serving3}"/>>3인</option>
                        <option value="4" <c:out value="${serving4}"/>>4인</option>
                    </select>
                </div>
                <div class="mini_option">
                    <span class="option_name">분류</span>
                        <c:choose>
                        	<c:when test="${searchCon.category == 'none'}">
                        		<c:set var="category0" value='selected="selected"'/>
                        	</c:when>
                        	<c:when test="${searchCon.category == 'sub'}">
                        		<c:set var="category1" value='selected="selected"'/>
                        	</c:when>
                        	<c:when test="${searchCon.category == 'main'}">
                        		<c:set var="category2" value='selected="selected"'/>
                        	</c:when>
                        	<c:when test="${searchCon.category == 'soup'}">
                        		<c:set var="category3" value='selected="selected"'/>
                        	</c:when>
                        	<c:when test="${searchCon.category == 'meal'}">
                        		<c:set var="category4" value='selected="selected"'/>
                        	</c:when>
                        	<c:when test="${searchCon.category == 'dessert'}">
                        		<c:set var="category5" value='selected="selected"'/>
                        	</c:when>
                        	<c:when test="${searchCon.category == 'salad'}">
                        		<c:set var="category6" value='selected="selected"'/>
                        	</c:when>
                        	<c:when test="${searchCon.category == 'drink'}">
                        		<c:set var="category7" value='selected="selected"'/>
                        	</c:when>
                        	<c:when test="${searchCon.category == 'sauce'}">
                        		<c:set var="category8" value='selected="selected"'/>
                        	</c:when>
                        	<c:when test="${searchCon.category == 'etc'}">
                        		<c:set var="category9" value='selected="selected"'/>
                        	</c:when>
                        </c:choose>
                    <select name="category">
                        <option <c:out value="${category0}"/> value="none">무관</option>
                        <option <c:out value="${category1}"/> value="sub">반찬</option>
                        <option <c:out value="${category2}"/> value="main">메인 요리</option>
                        <option <c:out value="${category3}"/> value="soup">국물류</option>
                        <option <c:out value="${category4}"/> value="meal">식사</option>
                        <option <c:out value="${category5}"/> value="dessert">간식/디저트</option>
                        <option <c:out value="${category6}"/> value="salad">샐러드</option>
                        <option <c:out value="${category7}"/> value="drink">음료</option>
                        <option <c:out value="${category8}"/> value="sauce">양념</option>
                        <option <c:out value="${category9}"/> value="etc">기타</option>
                    </select>
                </div>
                <div class="mini_option">
                    <span class="option_name">시간</span>
                    <c:choose>
	                   	<c:when test="${searchCon.reqTime == 0}">
	                   		<c:set var="reqTime0" value='selected="selected"'/>
	                   	</c:when>
	                   	<c:when test="${searchCon.reqTime == 10}">
	                   		<c:set var="reqTime1" value='selected="selected"'/>
	                   	</c:when>
	                   	<c:when test="${searchCon.reqTime == 30}">
	                   		<c:set var="reqTime2" value='selected="selected"'/>
	                   	</c:when>
	                   	<c:when test="${searchCon.reqTime == 60}">
	                   		<c:set var="reqTime3" value='selected="selected"'/>
	                   	</c:when>
	                   	<c:when test="${searchCon.reqTime == 90}">
	                   		<c:set var="reqTime4" value='selected="selected"'/>
	                   	</c:when>
	                   	<c:when test="${searchCon.reqTime == 120}">
	                   		<c:set var="reqTime5" value='selected="selected"'/>
	                   	</c:when>
                    </c:choose>
                    <select name="reqTime">
                        <option <c:out value="${reqTime0}"/> value="0">무관</option>
                        <option <c:out value="${reqTime1}"/> value="10">10분</option>
                        <option <c:out value="${reqTime2}"/> value="30">30분</option>
                        <option <c:out value="${reqTime3}"/> value="60">60분</option>
                        <option <c:out value="${reqTime4}"/> value="90">90분</option>
                        <option <c:out value="${reqTime5}"/> value="120">120분</option>
                    </select>
                </div>
                <div class="mini_option">
                    <span class="option_name">난이도</span>
                    <c:choose>
                    	<c:when test="${searchCon.difficulty == null}">
                    		<c:set var="difficulty3" value='selected="selected"'/>
                    	</c:when>
                    	<c:when test="${searchCon.difficulty == 2}">
                    		<c:set var="difficulty3" value='selected="selected"'/>
                    	</c:when>
                    	<c:when test="${searchCon.difficulty == 1}">
                    		<c:set var="difficulty2" value='selected="selected"'/>
                    	</c:when>
                    	<c:when test="${searchCon.difficulty == 0}">
                    		<c:set var="difficulty1" value='selected="selected"'/>
                    	</c:when>
                    </c:choose>
                    <select name="difficulty">
                        <option <c:out value="${difficulty3}"/> value="2">어려움 이하</option>
                        <option <c:out value="${difficulty2}"/> value="1">보통 이하</option>
                        <option <c:out value="${difficulty1}"/> value="0">쉬움 이하</option>
                    </select>
                </div>
            </div>
            <div class="option" style="display: block">
                <div style="display: flex">
                        <span class="option_name">재료</span>
                        <div>
	                        <span>
	                        	<input type="text" id="addIngredient" onkeydown="enterkey(event, 'ing');">
	                        </span>
	                        <span style="text-align: right; margin-left: 5px">
	                            <button type="button" id="addIngBtn" onclick="addIgBtn();" style="width: 25px; height: 25px; font-size: 12px; border-radius: 5px">+</button>
	                        </span>
	                        <span class="example">인기 재료: </span>
	                        <c:forEach items="${frqIngs}" var="fing">
	                        <span class="example"><c:out value="${fing.name}"/>,</span>
	                        </c:forEach>
	                        <span class="example">...</span>
	                        
                        </div>
                    </div>
                    <div id="ingredientBox">
                    <c:set var="ingCount" value="0"/>
                    <c:forEach items="${searchCon.ingredientList}" var="ing">
	                    	<c:set var="ingCount" value="${ingCount +1}"/>
		    				<button class="ingredient" id='ing<c:out value="${ing}"/>' value="ing<c:out value="${ingCount}"/>" type="button" 
		    				onclick="
		    				this.remove();
		    		      	document.getElementById(this.value).remove();">
		    					<c:out value="${ing}"/>
		    				</button>
	    					
	    					<input id='ing<c:out value="${ingCount}"/>' type="hidden" name="ingredient" value="${ing}"/>
   					</c:forEach>
                    </div>
            </div>
            <div class="option" style="display: block">
                <div style="display: flex">
                        <span class="option_name">태그</span>
                        <div>
                            <input type="text" id="addTag" onkeydown="enterkey(event, 'tag');">
                            <span style="text-align: right; margin-left: 5px">
                                <button type="button" id="addTagBtn" onclick="addTgBtn();" style="width: 25px; height: 25px; font-size: 12px; border-radius: 5px">+</button>
                            </span>
                            <span class="example">인기 태그: </span>
	                        <c:forEach items="${frqTags}" var="ftag">
	                        <span class="example"><c:out value="${ftag.tag}"/>,</span>
	                        </c:forEach>
                            <span class="example">...</span>
                        </div>
                    </div>
                    <div id="tagBox">
                    <c:set var="tagCount" value="0"/>
                    <c:forEach items="${searchCon.tagList}" var="tag">
	                    	<c:set var="tagCount" value="${tagCount +1}"/>
		    				<button class="tag" id='tag<c:out value="${tag}"/>' value="tag<c:out value="${tagCount}"/>" type="button" 
		    				onclick="
		    				this.remove();
		    		      	document.getElementById(this.value).remove();">
		    					<c:out value="${tag}"/>
		    				</button>
	    					
	    					<input id='tag<c:out value="${tagCount}"/>' type="hidden" name="tag" value="${tag}"/>
   					</c:forEach>
                    
                    </div>
            </div>
            <div class="option" >
                <span class="option_name">검색</span>
                <div>
                    <input type="text" id="search" name="keyword" value="${searchCon.keyword}">
                </div>
                <button type="submit" id="searchBtn" style="background-color: #d9d9d9; border-radius:5px;margin-left: 10px;width: 50px; height: 35px; color: white;  font-size: 15px; ">검색</button>
            
            
	            <div class="linkerBox" style="display: flex; margin-left :40%">
	            	<c:if test="${loginUser != null }">
			            <a href="insertForm.rc">
			                <button class="linkerBtn" id="writeBtn" type="button">레시피 작성</button>
			            </a>
			            <a href="list.rc">
			                <button class="linkerBtn" id="listBtn" type="button">나의 레시피</button>
			            </a>
			            <a href="savedList.rc">
			                <button class="linkerBtn" id="listBtn" type="button">저장한 레시피</button>
			            </a>
			         </c:if>
			         <c:if test="${loginUser == null }">
			            <button class="linkerBtn" onclick="login();" id="writeBtn" type="button">레시피 작성</button>
			            <button class="linkerBtn" onclick="login();" id="listBtn" type="button">나의 레시피</button>
			            <button class="linkerBtn" onclick="login();" id="listBtn" type="button">저장한 레시피</button>
			         </c:if>
			         <%--<a href="searchOuterRecipes.rc">
			                <button class="linkerBtn" id="listBtn" type="button">레시피 들여오기</button>
			            </a> --%>   
			       		
			            
			    </div>
			    
			    <script>
			   function login(){
				   alert('로그인을 해주세요.');
				   location.href="goLogin.me";
			   }
			    	
			    </script>
            </div>
            <div class="option">
                <span class="option_name">정렬</span>
                <button type="button" id="sortBtnRate" onclick="setSorter(1)" >평점순</button>
                <button type="button" id="sortBtnHit" onclick="setSorter(2)" >조회순</button>
                <button type="button" id="sortBtnNew" onclick="setSorter(3)">최신순</button>
                <input type="hidden" id = "sorter" name="sorter" value="POST_NO"/>
                <input type="hidden" id = "csorter" name="csorter" value="RATE"/>
            </div>
        </div>
        </form>
        
        <div class="content" style="display: flex; flex-wrap : wrap;">
			
			<c:forEach items="${rlist}" var="recipe" varStatus="status">
				<div class="box">
	        		<a href="detail.rc?postNo=${recipe.postNo}">
	            	<img width="150px" height="150px" src="resources/upload/<c:out value="${recipe.thumb}"/>">
	       			<label class="recipeName"><c:out value="${recipe.title}"/></label>
	    			</a>
				</div>
			</c:forEach>
			
        </div>
    </div>
</div>
<c:import url="../common/footer.jsp"/>
</body>
<script>

var ingNo = ${ingCount};
function addIgBtn(){
	var Name = document.getElementById( 'addIngredient' ).value;
	
	if (Name&&isNew('ing' + Name)){
		ingNo += 1;
    	document.getElementById( 'addIngredient' ).value = '';
		
		var Btn = document.createElement( 'button' );
    	Btn.setAttribute('class', 'ingredient');
    	Btn.setAttribute('id', 'ing' + Name);
    	Btn.setAttribute('value', 'ing' + ingNo);
    	Btn.setAttribute('type', 'button');
    	Btn.addEventListener('click', function(event) {
    		this.remove();
    		document.getElementById(this.value).remove();
    	})
        var BtnText = document.createTextNode( Name );
        Btn.appendChild( BtnText );
        
        var BtnVal = document.createElement( 'input' );
    	BtnVal.setAttribute('id', 'ing' + ingNo);
    	BtnVal.setAttribute('type', 'hidden');
    	BtnVal.setAttribute('name', 'ingredient');
    	BtnVal.setAttribute('value', Name);
    	
        Btn.style.background = randomColor();
        document.getElementById('ingredientBox').appendChild( Btn );
        document.getElementById('ingredientBox').appendChild( BtnVal );
	}
	
}

var tagNo = ${tagCount};
function addTgBtn(){
 	var Name = document.getElementById( 'addTag' ).value;
	if (Name&&isNew('tag' + Name)){
		tagNo += 1;
    	document.getElementById( 'addTag' ).value = ''; //입력칸 초기화
    	var Btn = document.createElement( 'button' );
    	Btn.setAttribute('class', 'tag');
    	Btn.setAttribute('id', 'tag' + Name);
    	Btn.setAttribute('value', 'tag' + tagNo);
    	Btn.setAttribute('type', 'button');
    	Btn.addEventListener('click', function(event) {
    		this.remove();
    		document.getElementById(this.value).remove();
    	})
        var BtnText = document.createTextNode( Name );
        Btn.appendChild( BtnText );
        
        var BtnVal = document.createElement( 'input' );
    	BtnVal.setAttribute('id', 'tag' + tagNo);
    	BtnVal.setAttribute('type', 'hidden');
    	BtnVal.setAttribute('name', 'tag');
    	BtnVal.setAttribute('value', Name);
        
        Btn.style.background = randomColor();
        document.getElementById('tagBox').appendChild( Btn );
        document.getElementById('tagBox').appendChild( BtnVal );
	}
	
}

function enterkey(event, key) {
	if (event.keyCode == 13){
		event.preventDefault();
		switch (key){
		case 'tag': addTgBtn();break;
		case 'ing': addIgBtn();break;
		}
	}
}

function isNew(id){
	if ( document.getElementById(id)){ return false;}
	else return true;
}

function randomColor(){
    var x = Math.floor(Math.random() * 160 + 96);
    var y = Math.floor(Math.random() * 160 + 96);
    var z = Math.floor(Math.random() * 160 + 96);
    var bgColor = "rgb(" + x + "," + y + "," + z + ")";
	return bgColor;
}

function setSorter(sort){
	document.getElementById("sortBtnRate").style.border = "1.5px solid #add1c3";
	document.getElementById("sortBtnHit").style.border = "1.5px solid #add1c3";
	document.getElementById("sortBtnNew").style.border = "1.5px solid #add1c3";
	if (sort == 1){
		document.getElementById("sortBtnRate").style.border = "1.5px solid gray";
		document.getElementById("sorter").value = "RATE";
	}
	else if (sort == 2){
		document.getElementById("sortBtnHit").style.border = "1.5px solid gray";
		document.getElementById("sorter").value = "HIT";
	}else if (sort == 3){
		document.getElementById("sortBtnNew").style.border = "1.5px solid gray";
		document.getElementById("sorter").value = "POST_NO";
	} 
}

</script>
</html>