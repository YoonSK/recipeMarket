<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>레시피 수정</title>

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
        }
        select{
            min-width: 50px;
            min-height: 25px;
            background-color: whitesmoke;
            text-align: center;

        }
        .step{
            display: flex;
            width: 100%;
            background-color: #add1c3;
            margin-top: 7px;
        }
        .stepContentArea{
            background-color: #add1c3;
            border: none;
            resize: none;
            width: 100%;
            height: 95%;
            color: #002838;
            font-size: 18px;
        }
        .example{
            font-size: 10px;
        }
        .ingredient{
            margin: 2px 2px 2px 2px;
            padding: 3px 3px 3px 3px;
            border-radius: 10px;
            border: none;
            background-color: rgba(246, 188, 134, 0.36);
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
        #addIngredient, #addAmount, #addTag,#recipeTitle{
            width: 125px;
            background-color: whitesmoke;
        }
        
        .stepNo{min-width: 50px; text-align: center; font-size: 30px}
        .stepContent{min-width: 75%; padding: 10px 10px 10px 10px; }
        .stepThumb{width:150px; height:150px;}
        
    </style>
</head>
<body>
<c:import url="../common/header.jsp"/>
<div class="outer" style="display:flex; justify-content: center;">
    <div class="container" style="width: 1000px; margin: 0 auto; display: flex; flex-direction: column; ">
        <h1>레시피 수정</h1>
        <form action="update.rc?postNo=${recipe.postNo}" method="post" enctype="Multipart/form-data">
        <div class="content" style="display: flex; margin: 30px 10px 30px 10px">
            <div id = "mainImage" style="display: flex; flex-direction: column;">
                <div>
                    <img id="output" width="200px" height="200px" src="resources/upload/${imgList[0].changeName}"/>
                </div>
                <div>
                    <input type='file' accept='image/*' onchange='openFile(event)' id="imgInput" name="recipeImg">
                    <input type="hidden" id="imgPrev" name="recipeImgPrev" value="1">
                </div>
            </div>
            <div id="optionBox" style="padding-top: 30px">
                <div>
                    <span class="option_name">제목</span>
                    <input id="recipeTitle" type="text" name="title"  onkeydown="enterkey(event, 'title');" style="width: 90%" value="${recipe.title}">
                </div>
                <div class="option">
                    <div class="mini_option">
                        <span class="option_name">분량</span>
                        <c:choose>
                        	<c:when test="${recipe.serving == 1}">
                        		<c:set var="serving1" value='selected="selected"'/>
                        	</c:when>
                        	<c:when test="${recipe.serving == 2}">
                        		<c:set var="serving2" value='selected="selected"'/>
                        	</c:when>
                        	<c:when test="${recipe.serving == 3}">
                        		<c:set var="serving3" value='selected="selected"'/>
                        	</c:when>
                        	<c:when test="${recipe.serving == 4}">
                        		<c:set var="serving4" value='selected="selected"'/>
                        	</c:when>
                        </c:choose>
                        <select name="serving">
                            <option value="1" <c:out value="${serving1}"/>>1인</option>
                            <option value="2" <c:out value="${serving2}"/>>2인</option>
                            <option value="3" <c:out value="${serving3}"/>>3인</option>
                            <option value="4" <c:out value="${serving4}"/>>4인</option>
                        </select>
                    </div>
                    <div class="mini_option">
                        <span class="option_name">분류</span>
                        <c:choose>
                        	<c:when test="${recipe.category == 'sub'}">
                        		<c:set var="category1" value='selected="selected"'/>
                        	</c:when>
                        	<c:when test="${recipe.category == 'main'}">
                        		<c:set var="category2" value='selected="selected"'/>
                        	</c:when>
                        	<c:when test="${recipe.category == 'soup'}">
                        		<c:set var="category3" value='selected="selected"'/>
                        	</c:when>
                        	<c:when test="${recipe.category == 'meal'}">
                        		<c:set var="category4" value='selected="selected"'/>
                        	</c:when>
                        	<c:when test="${recipe.category == 'dessert'}">
                        		<c:set var="category5" value='selected="selected"'/>
                        	</c:when>
                        	<c:when test="${recipe.category == 'salad'}">
                        		<c:set var="category6" value='selected="selected"'/>
                        	</c:when>
                        	<c:when test="${recipe.category == 'drink'}">
                        		<c:set var="category7" value='selected="selected"'/>
                        	</c:when>
                        	<c:when test="${recipe.category == 'sauce'}">
                        		<c:set var="category8" value='selected="selected"'/>
                        	</c:when>
                        	<c:when test="${recipe.category == 'etc'}">
                        		<c:set var="category9" value='selected="selected"'/>
                        	</c:when>
                        </c:choose>
                        <select name="category">
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
                        	<c:when test="${recipe.reqTime == 10}">
                        		<c:set var="reqTime1" value='selected="selected"'/>
                        	</c:when>
                        	<c:when test="${recipe.reqTime == 30}">
                        		<c:set var="reqTime2" value='selected="selected"'/>
                        	</c:when>
                        	<c:when test="${recipe.reqTime == 60}">
                        		<c:set var="reqTime3" value='selected="selected"'/>
                        	</c:when>
                        	<c:when test="${recipe.reqTime == 90}">
                        		<c:set var="reqTime4" value='selected="selected"'/>
                        	</c:when>
                        	<c:when test="${recipe.reqTime == 120}">
                        		<c:set var="reqTime5" value='selected="selected"'/>
                        	</c:when>
                        </c:choose>
                        <select name="reqTime">
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
                        	<c:when test="${recipe.difficulty == 0}">
                        		<c:set var="difficulty1" value='selected="selected"'/>
                        	</c:when>
                        	<c:when test="${recipe.difficulty == 1}">
                        		<c:set var="difficulty2" value='selected="selected"'/>
                        	</c:when>
                        	<c:when test="${recipe.difficulty == 2}">
                        		<c:set var="difficulty3" value='selected="selected"'/>
                        	</c:when>
                        </c:choose>
                        <select name="diffyculty">
                            <option <c:out value="${difficulty1}"/> value="0">쉬움</option>
                            <option <c:out value="${difficulty2}"/> value="1">보통</option>
                            <option <c:out value="${difficulty3}"/> value="2">어려움</option>
                        </select>
                    </div>
                </div>
                <div class="option" style="display: block">
                    <div style="display: flex">
                        <span class="option_name">재료</span>
                        <span>
                            <input type="text" id="addIngredient" onkeydown="enterkey(event, 'ing');">
                            <span>양</span>
                            <input type="text" id="addAmount" onkeydown="enterkey(event, 'amt');">
                        </span>
                        <span style="text-align: right; margin-left: 5px">
                            <button type="button" id="addIngBtn" onclick="addIgBtn();" style="width: 25px; height: 25px; font-size: 12px; border-radius: 5px">+</button>
                        </span>
                    </div>
                    <div id="ingredientBox">

                    <c:set var="ingCount" value="0"/>
                    <c:forEach items="${ingredientList}" var="ing">
	                    	<c:set var="ingCount" value="${ingCount +1}"/>
		    				<button class="ingredient" id='ing<c:out value="${ing.name}"/>' value="ing<c:out value="${ingCount}"/>" type="button" 
		    				onclick="
		    				this.remove();
		    		      	document.getElementById(this.value).remove();
		    	      		document.getElementById(this.value + 'amt').remove();">
		    					<c:out value="${ing.name}"/>
		    					-
		    					<c:out value="${ing.amount}"/>
		    				</button>
	    					
	    					<input id='ing<c:out value="${ingCount}"/>' type="hidden" name="ingredient" value="${ing.name}"/>
	    					<input id='ing<c:out value="${ingCount}"/>amt' type="hidden" name="amount" value="${ing.amount}"/>
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
                            <span class="example">예: </span>
                            <span class="example">비오는날,</span>
                            <span class="example">스트레스,</span>
                            <span class="example">매콤,</span>
                            <span class="example">...</span>
                        </div>
                    </div>
                    <div id="tagBox">
                    
                    <c:set var="tagCount" value="0"/>
                    <c:forEach items="${tagList}" var="tag">
	                    	<c:set var="tagCount" value="${tagCount +1}"/>
		    				<button class="tag" id='tag<c:out value="${tag.tag}"/>' value="tag<c:out value="${tagCount}"/>" type="button" 
		    				onclick="
		    				this.remove();
		    		      	document.getElementById(this.value).remove();">
		    					<c:out value="${tag.tag}"/>
		    				</button>
	    					
	    					<input id='tag<c:out value="${tagCount}"/>' type="hidden" name="tag" value="${tag.tag}"/>
   					</c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <div class="content" id="stepContainer" style="display:flex;flex-direction: column; width: 100%; margin: 5px auto;">
        <c:set var="stpCount" value="0"/>
        <c:forEach items="${stepList}" var="step" varStatus="status">
            <c:set var="stpCount" value="${stpCount +1}"/>
        	<div class = "step" id = 'step<c:out value="${step.step}"/>'>
                <div class = "stepNo">
                    <c:out value="${step.step}"/>
                </div>
                <div class = "stepContent" >
                    <textarea class="stepContentArea" id="content<c:out value="${step.step}"/>" name = "stepContent"><c:out value="${step.content}"/></textarea>
                </div>
                <div class = "stepImage">
                    <img class="stepThumb" id="step_output<c:out value="${step.step}"/>" width="150px" height="150px" src="resources/upload/${imgList[status.index +1].changeName}"/>
                    <input type='file' accept='image/*' onchange="imagepreview(this);" id="step_imgInput<c:out value="${step.step}"/>" name="recipeImg">
                    <input type="hidden" id="step_imgPrev<c:out value="${step.step}"/>" name="recipeImgPrev" value="1">
                </div>
            </div>
        </c:forEach>
        
        </div>
        <div style="display: flex; justify-content: space-between">
        	<div>
        	</div>
	        <div>
	        	<button type="submit" id= "submitBtn" style="width: 100px; height: 40px; font-size: 18px; border-radius: 15px;
	        	background-color:lightgreen;">작성 완료</button>
	        </div>
	        <div style="text-align: right">
	        	<input type="text" id="stepCount" hidden="hidden" value = "2">	
	        	<button type="button" id= "addStepBtn" onclick="addStBtn();" style="width: 40px; height: 40px; font-size: 24px; border-radius: 5px">+</button>
	            <button type="button" id= "cutStepBtn" onclick="cutStBtn();" style="width: 40px; height: 40px; font-size: 24px; border-radius: 5px">-</button>
	        </div>
        </div>
        
        </form>
    </div>

</div>
<c:import url="../common/footer.jsp"/>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
var ingNo = ${ingCount};

function addIgBtn(){
	var Name = document.getElementById( 'addIngredient' ).value;
  	var Amount = document.getElementById( 'addAmount' ).value;
  	
  	if (Name && Amount &&isNew('ing' + Name)){
  		ingNo += 1;
      	document.getElementById( 'addIngredient' ).value = '';
      	document.getElementById( 'addAmount' ).value = '';
  		
  		var Btn = document.createElement( 'button' );
      	Btn.setAttribute('class', 'ingredient');
      	Btn.setAttribute('id', 'ing' + Name);
      	Btn.setAttribute('value', 'ing' + ingNo);
      	Btn.setAttribute('type', 'button');
      	Btn.addEventListener('click', function(event) {
      		this.remove();
      		document.getElementById(this.value).remove();
      		document.getElementById(this.value + 'amt').remove();
      	})
          var BtnText = document.createTextNode( Name + ' - ' + Amount);
          Btn.appendChild( BtnText );
          
          var BtnVal = document.createElement( 'input' );
      	BtnVal.setAttribute('id', 'ing' + ingNo);
      	BtnVal.setAttribute('type', 'hidden');
      	BtnVal.setAttribute('name', 'ingredient');
      	BtnVal.setAttribute('value', Name);

      	var BtnVal2 = document.createElement( 'input' );
      	BtnVal2.setAttribute('id', 'ing' + ingNo + 'amt');
      	BtnVal2.setAttribute('type', 'hidden');
      	BtnVal2.setAttribute('name', 'amount');
      	BtnVal2.setAttribute('value', Amount);
      	
          Btn.style.background = randomColor();
          document.getElementById('ingredientBox').appendChild( Btn );
          document.getElementById('ingredientBox').appendChild( BtnVal );
          document.getElementById('ingredientBox').appendChild( BtnVal2 );
  	}
  	
}
   
var tagNo = ${tagCount};
function addTgBtn(){
 	var Name = document.getElementById( 'addTag' ).value;
	if (Name &&isNew('tag' + Name)){
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
		case 'title': document.getElementById('content1').focus(); break;
		case 'tag': addTgBtn();break;
		case 'ing': document.getElementById('addAmount').focus();break;
		case 'amt': addIgBtn();document.getElementById('addIngredient').focus();break;
		}
	}
}

function isNew(id){
	if ( document.getElementById(id)){ return false;}
	else return true;
}

function randomColor(){
    var x = Math.floor(Math.random() * 192 + 64);
    var y = Math.floor(Math.random() * 192 + 64);
    var z = Math.floor(Math.random() * 192 + 64);
    var bgColor = "rgb(" + x + "," + y + "," + z + ")";
    bgColor = "aliceblue";
	return bgColor;
}

var count = ${stpCount};
   
function addStBtn(){
	count += 1;
  		var Step = document.createElement( 'div' );
  			Step.setAttribute('class', 'step');
  			Step.setAttribute('id', 'step' + count);
  			var StepNo = document.createElement( 'div' );
  				StepNo.innerHTML = '' + count;
  	   			StepNo.setAttribute('class', 'stepNo');
  	   			StepNo.setAttribute('id', 'stepNo' + count);
  		 		Step.appendChild(StepNo);
  		 	var StepContent = document.createElement( 'div' );
  	   			StepContent.setAttribute('class', 'stepContent');
  	   		 	var StepContentArea = document.createElement( 'textarea' );
  	   			StepContentArea.setAttribute('class', 'stepContentArea');
  	   			StepContentArea.setAttribute('id', 'content' + count);
  	   			StepContentArea.setAttribute('name', 'stepContent');
  		 		StepContent.appendChild(StepContentArea);
  		 		Step.appendChild(StepContent);
  	   		var StepImage = document.createElement( 'div' );
   			StepImage.setAttribute('class', 'stepImage');
   			StepImage.setAttribute('id', 'stepImage' + count);
   			var StepImageThumb = document.createElement( 'img' );
   				StepImageThumb.setAttribute('class', 'stepThumb');
   				StepImageThumb.setAttribute('id', 'step_output' + count);
   		 		StepImage.appendChild(StepImageThumb);
	   		var StepImageInput = document.createElement( 'input' );
  					StepImageInput.setAttribute('id', 'step_imgInput' + count);
  					StepImageInput.setAttribute('type', 'file');
  					StepImageInput.setAttribute('accept', 'image/*');
  					StepImageInput.setAttribute('onchange', 'imagepreview(this)');
  					StepImageInput.setAttribute('name', 'recipeImg');
   		 		StepImage.appendChild(StepImageInput);
   		 	Step.appendChild(StepImage);
   		
  	   		document.getElementById('stepContainer').appendChild(Step);
  			document.getElementById('addStepBtn').blur()
  			document.getElementById("content" + count).focus()
}

function cutStBtn(){
	document.getElementById('step' + count).remove();
	count -= 1;
	document.getElementById('cutStepBtn').blur()
}

var openFile = function(event) {
	imgPrev = document.getElementById('imgPrev');
	imgPrev.value = 0;
   	var input = event.target;
  		var reader = new FileReader();
   	reader.onload = function(){
   		var dataURL = reader.result;
   		var output = document.getElementById('output');
   		output.src = dataURL;
   		};
reader.readAsDataURL(input.files[0]);
 	};
 	
var step_openFile = function(event, count) {
	step_imgPrev = document.getElementById('step_imgPrev' + count);
	step_imgPrev.value = 0;
   	var input = event.target;
  		var reader = new FileReader();
   	reader.onload = function(){
   		var dataURL = reader.result;
   		var step_output = document.getElementById('step_output' + count);
   		step_output.src = dataURL;
   		};
	reader.readAsDataURL(input.files[0]);
 	};
 	
function imagepreview(input){
   if(input.files && input.files[0]){
       var filerd = new FileReader();
       filerd.onload=function(e){
           $('#step_output' + $(input).attr('id').slice(-1)).attr('src', e.target.result);
       };
       filerd.readAsDataURL(input.files[0]);
   }
 }

</script>
</html>