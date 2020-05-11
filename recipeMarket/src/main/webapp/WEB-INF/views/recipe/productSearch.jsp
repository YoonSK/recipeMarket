<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
            ba
        }
        select{
            min-width: 50px;
            min-height: 25px;
            background-color: whitesmoke;
            text-align: center;

        }
        .box{
            display: flex;
            flex-direction: column;
            text-align: center;
            width: 150px;
            height: 200px;
            margin: 15px 15px auto;
        }
        .example{
            font-size: 10px;
        }
        .ingredient{
            margin: 2px 2px 2px 2px;
            padding: 3px 3px 3px 3px;
            border-radius: 10px;
            border: none;
            background-color: aliceblue;
        }
        button{
            border: none;
        }
        #addIngredient, #search{
            width: 150px;
		    border: 1px solid #d9d9d9;
		    height: 30px;
		    border-radius: 5px;
		    vertical-align: whitesmoke;
        }
        #search{
            width: 200px;
        }
        .linkerBtn{
            margin: 2px 2px 2px 2px;
            padding: 3px 3px 3px 3px;
            border-radius: 5px;
        }
        #writeBtn{
            border: 1px solid darkgreen;
            background-color: lightgreen;
        }
        #myListBtn{
            border: 1px solid darkblue;
            background-color: lightblue;
        }
    </style>

<meta charset="UTF-8">
<title>상품 조회</title>
</head>
<body>
<c:import url="../common/header.jsp"/>
<div class="outer" style="display:flex; justify-content: center;">
    <div class="container" style="width: 1000px; margin: 0 auto; display: flex; flex-direction: column; ">
        <h1>상품 조회</h1>
        <form>
        <div class="content" style="display: flex; flex-direction: column;">
        	<div class="option">
        		<span class="option_name">분류</span>
                    <c:choose>
                    	<c:when test="${searchCon.category == '무관'}">
                    		<c:set var="category0" value='selected="selected"'/>
                    	</c:when>
                    	<c:when test="${searchCon.category == '곡류'}">
                    		<c:set var="category1" value='selected="selected"'/>
                    	</c:when>
                    	<c:when test="${searchCon.category == '과일류'}">
                    		<c:set var="category2" value='selected="selected"'/>
                    	</c:when>
                    	<c:when test="${searchCon.category == '채소류'}">
                    		<c:set var="category3" value='selected="selected"'/>
                    	</c:when>
                    	<c:when test="${searchCon.category == '어류'}">
                    		<c:set var="category4" value='selected="selected"'/>
                    	</c:when>
                    	<c:when test="${searchCon.category == '육류'}">
                    		<c:set var="category5" value='selected="selected"'/>
                    	</c:when>
                    	<c:when test="${searchCon.category == '음료'}">
                    		<c:set var="category6" value='selected="selected"'/>
                    	</c:when>
                    	<c:when test="${searchCon.category == '기타'}">
                    		<c:set var="category7" value='selected="selected"'/>
                    	</c:when>
                    </c:choose>
                    <select name="category">
                        <option <c:out value="${category0}"/> value="전체">전체</option>
                        <option <c:out value="${category1}"/> value="곡류">곡류</option>
                        <option <c:out value="${category2}"/> value="과일류">과일류</option>
                        <option <c:out value="${category3}"/> value="채소류">채소류</option>
                        <option <c:out value="${category4}"/> value="어류">어류</option>
                        <option <c:out value="${category5}"/> value="육류">육류</option>
                        <option <c:out value="${category6}"/> value="음료">음료</option>
                        <option <c:out value="${category7}"/> value="기타">기타</option>
                    </select>
        	</div>
        	<div class="option" style="display: block">
                <div style="display: flex">
                        <span class="option_name">추가 검색</span>
                        <div>
	                        <span>
	                        	<input type="text" id="addIngredient" onkeydown="enterkey(event, 'ing');">
	                        </span>
	                        <span style="text-align: right; margin-left: 5px">
	                            <button type="button" id="addIngBtn" onclick="addIgBtn();" style="width: 25px; height: 25px; font-size: 12px; border-radius: 5px">+</button>
	                        </span>
                        </div>
                  </div>
             </div>
             <div class="option" style="display: block">
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
	        <div class="option">
	        	<span class="option_name">검색</span>
                <div>
                    <input type="text" id="search" name="keyword" value="${searchCon.keyword}">
                </div>
                <button type="submit" id="searchBtn" style="background-color: lightgrey; border-radius:10px;margin-left: 10px ">찾기</button>
	        </div>
        </div>
        </form>
        <div class="content" style="display: flex; flex-wrap : wrap;">
        <c:forEach items="${productList}" var="product" varStatus="status">
				<div class="box">
	        		<a href="detail.by?productNo=${product.productNo}">
	            	<img width="150px" height="150px" src="resources/upload/${product.phName}">
	       			<label class="recipeName"><c:out value="${product.name}"/></label>
	    			</a>
	       			<label class="recipeName"><c:out value="${product.price}"/>원</label>
				</div>
		</c:forEach>
		</div>
    </div>
</div>
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
    bgColor = "aliceblue";
	return bgColor;
}

</script>
</html>