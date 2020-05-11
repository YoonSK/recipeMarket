<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>레시피 등록</title>

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
                background-color: white;
			    text-align: center;
			    border-radius: 5px;
			    height: 30px;
			    font-size: 15px;
				outline: none;
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
            font-size: 15px;
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
           background-color: white;
		    border: 1px solid #d9d9d9;
		    border-radius: 5px;
		    height: 30px;
        }
        
        .stepNo{min-width: 50px; text-align: center; font-size: 30px}
        .stepContent{min-width: 75%; padding: 10px 10px 10px 10px; }
        .stepThumb{width:150px; height:150px;}
        
        input{outline:none;}
    </style>
</head>
<body>
<c:import url="../common/header.jsp"/>
<div class="outer" style="display:flex; justify-content: center;min-height: 800px;">
    <div class="container" style="width: 1000px; margin: 0 auto; display: flex; flex-direction: column; ">
        <h1>레시피 등록</h1>
        <form action="insert.rc" method="post" enctype="Multipart/form-data">
        <input type="number" id="pNo" name="pNo"><button type="button" onclick="importer();">만개의 레시피 들여오기</button>
        <script>
        function importer(){
        		var pNo = document.getElementById("pNo").value;
				location.href="importRecipe.rc?pNo=" + pNo;
			   }
        </script>
			   
        <div class="content" style="display: flex; margin: 30px 10px 30px 10px">
            <div id = "mainImage" style="display: flex; flex-direction: column;">
                <div>
                    <img id="output" width="200px" height="200px"/>
                </div>
                <div>
                    <input type='file' accept='image/*' onchange='openFile(event)' id="imgInput" name="recipeImg" required>
                </div>
            </div>
            <div id="optionBox" style="padding-top: 30px">
                <div>
                    <span class="option_name">제목</span>
                    <input id="recipeTitle" type="text" name="title"  onkeydown="enterkey(event, 'title');" style="width: 90%" required>
                </div>
                <div class="option">
                    <div class="mini_option">
                        <span class="option_name">분량</span>
                        <select name="serving">
                            <option value="1" selected="selected">1인</option>
                            <option value="2">2인</option>
                            <option value="3">3인</option>
                            <option value="4">4인</option>
                        </select>
                    </div>
                    <div class="mini_option">
                        <span class="option_name">분류</span>
                        <select name="category">
                            <option value="sub">반찬</option>
                            <option value="main">메인 요리</option>
                            <option value="soup">국물류</option>
                            <option value="meal" selected="selected">식사</option>
                            <option value="dessert">간식/디저트</option>
                            <option value="salad">샐러드</option>
                            <option value="drink">음료</option>
                            <option value="sauce">양념</option>
                            <option value="etc">기타</option>
                        </select>
                    </div>
                    <div class="mini_option">
                        <span class="option_name">시간</span>
                        <select name="reqTime">
                            <option value="10">10분</option>
                            <option value="30">30분</option>
                            <option value="60">60분</option>
                            <option value="90">90분</option>
                            <option value="120">120분</option>
                        </select>
                    </div>
                    <div class="mini_option">
                        <span class="option_name">난이도</span>
                        <select name="diffyculty">
                            <option value="0">쉬움</option>
                            <option value="1">보통</option>
                            <option value="2">어려움</option>
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
                    </div>
                </div>
            </div>
        </div>
        <div class="content" id="stepContainer" style="display:flex;flex-direction: column; width: 100%; margin: 5px auto;">
            <div class = "step" id = "step1">
                <div class = "stepNo">
                    1
                </div>
                <div class = "stepContent" >
                    <textarea class="stepContentArea" id="content1" name = "stepContent"></textarea>
                </div>
                <div class = "stepImage">
                    <img class="stepThumb" id="step_output1" width="150px" height="150px"/>
                    <input type='file' accept='image/*' onchange="imagepreview(this);" id="step_imgInput1" name="recipeImg" required>
                </div>
            </div>
        </div>
        <div style="display: flex; justify-content: space-between">
        	<div>
        	</div>
	        <div>
	        	<button type="submit" id= "submitBtn" style="width: 100px; height: 40px; font-size: 18px; border-radius: 5px; background-color:orangered;color:white;">작성 완료</button>
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
var ingNo = 0;
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
   
var tagNo = 0;
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

var count = 1;
   
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