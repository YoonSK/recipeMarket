<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            width: 200px;
            height: 250px;
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
            background-color: rgba(246, 176, 134, 0.85);
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
            background-color: whitesmoke;
        }
        #search{
            width: 200px;
        }
    </style>
</head>
<body>
<div class="outer" style="display:flex; justify-content: center;">
    <div class="container" style="width: 1000px; margin: 0 auto; display: flex; flex-direction: column">
        <h1>레시피 검색</h1>
        <div class="content">
            <div class="option">
                <div class="mini_option">
                    <span class="option_name">분량</span>
                    <select>
                        <option selected="selected">1인</option>
                        <option>2인</option>
                        <option>2~3인</option>
                        <option>3~4인</option>
                    </select>
                </div>
                <div class="mini_option">
                    <span class="option_name">분류</span>
                    <select>
                        <option>반찬</option>
                        <option>메인 요리</option>
                        <option>국물류</option>
                        <option selected="selected">식사</option>
                        <option>간식/디저트</option>
                        <option>샐러드</option>
                        <option>음료</option>
                        <option>양념</option>
                        <option>기타</option>
                    </select>
                </div>
                <div class="mini_option">
                    <span class="option_name">시간</span>
                    <select>
                        <option>10분 이내</option>
                        <option>30분 이내</option>
                        <option>60분 이내</option>
                        <option>90분 이내</option>
                        <option>120분 이내</option>
                    </select>
                </div>
                <div class="mini_option">
                    <span class="option_name">난이도</span>
                    <select>
                        <option>쉬움</option>
                        <option>보통 이하</option>
                        <option>어려움 이하</option>
                    </select>
                </div>
            </div>
            <div class="option" style="display: block">
                <div style="display: flex">
                    <span class="option_name">재료</span>
                    <span>
                        <input type="text" id="addIngredient">
                        <span style="text-align: right; margin-left: 5px">
                            <button style="width: 25px; height: 25px; font-size: 12px; border-radius: 5px">+</button>
                        </span>
                        <span class="example">예: </span>
                        <span class="example">돼지고기,</span>
                        <span class="example">양파,</span>
                        <span class="example">토마토,</span>
                        <span class="example">...</span>
                    </span>
                </div>
                <div>
                    <button class="ingredient">감자</button>
                </div>
            </div>
            <div class="option" style="display: block">
                <div style="display: flex">
                    <span class="option_name">태그</span>
                    <span>
                        <input type="text" id="addTag">
                        <span style="text-align: right; margin-left: 5px">
                            <button style="width: 25px; height: 25px; font-size: 12px; border-radius: 5px">+</button>
                        </span>
                        <span class="example">예: </span>
                        <span class="example">비오는날,</span>
                        <span class="example">스트레스,</span>
                        <span class="example">매콤,</span>
                        <span class="example">...</span>
                    </span>
                </div>
                <div>
                    <button class="tag">단짠</button>
                </div>
            </div>
            <div class="option">
                <span class="option_name">검색</span>
                <div>
                    <input type="text" id="search">
                </div>
                <button type="submit" id="searchBtn" style="background-color: lightgrey; border-radius:10px;margin-left: 10px ">찾기</button>
            </div>
            <div class="option">
                <span class="option_name">정렬</span>
                <button type="button" style="background-color: rgba(254,44,19,0.51)">평점순</button>
                <button type="button"style="background-color: rgba(0,191,255,0.72) ">인기순</button>
                <button type="button"style="background-color: rgba(156,255,156,0.77)">최신순</button>
            </div>
        </div>
        <div class="content" style="display: flex; flex-direction: column">
            <div style="display: flex;">
                <div class="box">
                    <a href="">
                        <img width="200px" height="200px">
                        <label class="recipeName">레시피</label>
                    </a>
                </div>
                <div class="box">
                    <a href="">
                        <img width="200px" height="200px">
                        <label class="recipeName">레시피</label>
                    </a>
                </div>
                <div class="box" >
                    <a href="">
                        <img width="200px" height="200px">
                        <label class="recipeName">레시피</label>
                    </a>
                </div>
                <div class="box">
                    <a href="">
                        <img width="200px" height="200px">
                        <label class="recipeName">레시피</label>
                    </a>
                </div>
            </div>

            <div style="display: flex;">
                <div class="box">
                    <a href="">
                        <img width="200px" height="200px">
                        <label class="recipeName">레시피</label>
                    </a>
                </div>
                <div class="box">
                    <a href="">
                        <img width="200px" height="200px">
                        <label class="recipeName">레시피</label>
                    </a>
                </div>
                <div class="box" >
                    <a href="">
                        <img width="200px" height="200px">
                        <label class="recipeName">레시피</label>
                    </a>
                </div>
                <div class="box">
                    <a href="">
                        <img width="200px" height="200px">
                        <label class="recipeName">레시피</label>
                    </a>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>