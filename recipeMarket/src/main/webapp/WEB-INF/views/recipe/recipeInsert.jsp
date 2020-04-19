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
            min-width: 50px;
            min-height: 25px;
            background-color: whitesmoke;
            text-align: center;

        }
        .step{
            display: flex;
            width: 100%;
            background-color: #add1c3;
        }
        .stepContent{
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
        #addIngredient, #addmeasure, #addTag,#recipeTitle{
            width: 150px;
            background-color: whitesmoke;
        }
    </style>

</head>
<body>
<div class="outer" style="display:flex; justify-content: center;">
    <div class="container" style="width: 1000px; margin: 0 auto; display: flex; flex-direction: column; ">
        <h1>레시피 등록</h1>
        <form action="insert.rc" method="post" enctype="Multipart/form-data">
        <div class="content" style="display: flex; margin: 30px 10px 30px 10px">
            <div id = "mainImage" style="display: flex; flex-direction: column;">
                <div>
                    <img width="200px" height="200px"/>
                </div>
                <div>
                    <input type="file">
                </div>
            </div>
            <div id="optionBox" style="padding-top: 30px">
                <div>
                    <span class="option_name">제목</span>
                    <input id="recipeTitle" type="text" style="width: 90%">
                </div>
                <div class="option">
                    <div class="mini_option">
                        <span class="option_name">분량</span>
                        <select>
                            <option value="" selected="selected">1인</option>
                            <option value="">2인</option>
                            <option value="">3인</option>
                            <option value="">4인</option>
                        </select>
                    </div>
                    <div class="mini_option">
                        <span class="option_name">분류</span>
                        <select>
                            <option value="">반찬</option>
                            <option value="">메인 요리</option>
                            <option value="">국물류</option>
                            <option value="" selected="selected">식사</option>
                            <option value="">간식/디저트</option>
                            <option value="">샐러드</option>
                            <option value="">음료</option>
                            <option value="">양념</option>
                            <option value="">기타</option>
                        </select>
                    </div>
                    <div class="mini_option">
                        <span class="option_name">시간</span>
                        <select>
                            <option value="">10분</option>
                            <option value="">30분</option>
                            <option value="">60분</option>
                            <option value="">90분</option>
                            <option value="">120분</option>
                        </select>
                    </div>
                    <div class="mini_option">
                        <span class="option_name">난이도</span>
                        <select>
                            <option value="">쉬움</option>
                            <option value="">보통</option>
                            <option value="">어려움</option>
                        </select>
                    </div>
                </div>
                <div class="option" style="display: block">
                    <div style="display: flex">
                        <span class="option_name">재료</span>
                        <span>
                            <input type="text" id="addIngredient">
                            <span>양</span>
                            <input type="text" id="addmeasure">
                        </span>
                        <span style="text-align: right; margin-left: 5px">
                            <button style="width: 25px; height: 25px; font-size: 12px; border-radius: 5px">+</button>
                        </span>
                    </div>
                    <div>
                        <button class="ingredient">돼지고기 100g</button>
                    </div>
                </div>
                <div class="option" style="display: block">
                    <div style="display: flex">
                        <span class="option_name">태그</span>
                        <div>
                            <input type="text" id="addTag">
                            <span style="text-align: right; margin-left: 5px">
                                <button style="width: 25px; height: 25px; font-size: 12px; border-radius: 5px">+</button>
                            </span>
                            <span class="example">예: </span>
                            <span class="example">비오는날,</span>
                            <span class="example">스트레스,</span>
                            <span class="example">매콤,</span>
                            <span class="example">...</span>
                        </div>
                    </div>
                    <div>
                        <button class="tag">단짠</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="content" id="stepContainer" style="display:flex;flex-direction: column; width: 100%; margin: 5px auto;">
            <div class = "step" id = "step[1]">
                <div style="min-width: 50px; text-align: center; font-size: 30px">
                    <label>1</label>
                </div>
                <div style="min-width: 75%; padding: 10px 10px 10px 10px;" >
                    <textarea class="stepContent" id="content[]">돼지 고기를 믹서기에 갈아 파인애플을 곁들여 드세요</textarea>
                </div>
                <div>
                    <img width="150px" height="150px"/>
                    <input type="file">
                </div>
            </div>
            <div style="text-align: right">
                <button style="width: 40px; height: 40px; font-size: 24px; border-radius: 5px">+</button>
            </div>
           	
        </div>
        </form>
    </div>
</div>
</body>
<script>
	function addStep(){
			
	}
</script>
</html>