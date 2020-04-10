<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* 로고 */
    div.nav h1{margin: 0 30px 0 0; display: inline-block; vertical-align: top; margin-left: 150px;}
    /* 네비 상단 */
    div.menubar_top {margin: 0 auto; padding: 16px 0 0 176px; height: 60px;}
    ul.nav_mem {display: inline-block; padding: 16px 0 0 50px; vertical-align: top; position: relative; left: 150px;}
    ul.nav_mem li{list-style: none; padding: 0 3px; display: inline-block;}
    ul.nav_mem li a:link {text-decoration: none; color: grey;}
    #topSearch{height: 75px;}
    /* 메뉴바*/
    div.menubar{margin-top: 10px; margin-bottom: 10px; height: 50px; background-color: #fee0a1;}
    div.menubar ul{margin: 0 auto; padding: 9px 30px 0; text-align: center;}
    div.menubar ul li{list-style: none; padding: 0; width: 1%; display: table-cell;}
    div.menubar ul li a:link {text-decoration: none; color: white; font-weight: 800; font-size: 20px;}
    div.menubar ul li a:hover {color: #76a693;}
    /* 검색창 */
    input {outline: none;}
    input[type=search] {-webkit-appearance: textfield; -webkit-box-sizing: content-box; font-family: inherit; font-size: 100%;}
    input::-webkit-search-decoration,
    input::-webkit-search-cancel-button {display: none;}
    input[type=search] {background: #ffff url(https://static.tumblr.com/ftv85bp/MIXmud4tx/search-icon.png) no-repeat 9px center;
        border: solid 1px #add1c3; padding: 9px 10px 9px 32px; width: 150px; -webkit-border-radius: 10em; -moz-border-radius: 10em;
        border-radius: 10em; -webkit-transition: all .5s; -moz-transition: all .5s; transition: all .5s; margin-top: 20px; margin-left: 100px;}
    input[type=search]:focus {width: 200px; background-color: #fff; border-color: #377a71; -webkit-box-shadow: 0 0 5px rgba(109,207,246,.5); -moz-box-shadow: 0 0 5px rgba(109,207,246,.5); box-shadow: 0 0 5px rgba(109,207,246,.5);}
    input:-moz-placeholder {color: #999;}
    input::-webkit-input-placeholder {color: #999;}

    /* 푸터 */
    footer{position:fixed; left:0px; bottom:0px; height: 64px; font-size: 11px; width:100%; background:grey; color: white; text-align: center;}
</style>
<link rel="stylesheet" type="text/css" href="css/shopdetail.css">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script> 
</head>
<body>
<header>
    <div class="nav">
        <div class="nav_top">
        <form id="topSearch">
            <h1>
                <a href="#"><img src="images/logo.png" width="150"></a>
            </h1>
            <input type="search" placeholder="검색">
            <ul class="nav_mem">
                <li><a href="#">로그인</a></li>
                <li><a href="#">회원가입</a></li>
            </ul>
        </form>
        </div>
        <div class="menubar">
            <ul class="menubar_name">
                <li>
                    <a href="#">홈</a>
                </li>
                <li>
                    <a href="#">레시피</a>
                </li>
                <li>
                    <a href="#">스토어</a>
                </li>
                <li>
                    <a href="#">자유게시판</a>
                </li>
                <li>
                    <a href="#">쉐프 소개</a>
                </li>                                                               
            </ul>               
        </div>
    </div>
    <div class="s_category">
        <p class="s_category_tit"><a href="/shop/index.html"><img src="https://recipe1.ezmember.co.kr/img/store/cate_tit.png"></a></p>
        <ul>
            <li><a href="#">신선식품</a></li>
            <li><a href="#">간편식</a></li>
            <li><a href="#">가공식품</a></li>
        </ul>
    </div>
    </header>
    <div class="content_box">
        <div class="s_view">
            <div class="s_view_pic">
                <img src="images/selmon.jpg" width="550"/>
            </div>
            <div class="s_view_info">
                <h1>
                    <p>상품명</p>
                </h1>
                <div class="price_box">
                    <p>가격</p>
                </div>
                <div class="option_total">
                    <table class="option">
                        <tr>
                            <td>상품명</td>
                            <form name="form">
                            <td>
                                <input type='text' name='count' value='1' size='3' readonly>
                            </td>
                            <td>
                                <a href='#' onclick='javascript_:change(1);'>▲</a><br>
                                <a href='#' onclick='javascript_:change(-1);'>▼</a>
                            </td>
                            </form>
                            <td>가격</td>
                        </tr>
                    </table>
                    <div class="end_price">
                        합계금액
                        <span class="total_price">
                            0000원
                        </span>
                    </div>
                </div>
                <div class="btn_choice">
                    <div>
                        <button type="button" id="cartBtn" class="addcart">장바구니</button>
                        <button type="button" id="cartBtn" class="addcart">바로구매</button>
                    </div>
                </div>
            </div>
            <div class="s_list_ea">
                <b>상품 리뷰</b>
            </div>
            <div class="review table">
                <table class="table">
                    <tr>
                        <td>아이디</td>
                        <td>★★★★★</td>
                        <td>내용</td>
                    </tr>
                    <tr>
                        <td>아이디</td>
                        <td>★★★★★</td>
                        <td>내용</td>
                    </tr>
                    <tr>
                        <td>아이디</td>
                        <td>★★★★★</td>
                        <td>내용</td>
                    </tr>
                </table>
            </div>
            <div class="other">
                <b>관련 상품</b>
            </div>
            <div class="s_list">
                <ul class="goods_list_unity">
                <li>
                    <div class="unity_pic">
                        <a href="#"><img src="images/selmon.jpg"></a>
                    </div>
                    <div class="unity_cont">
                    <p class="cont_tit line2"><a href="#">연어</a></p>
                    <div class="price_box">
                    <strong class="price">10,900<small>원</small></strong>
                    </div>
                    </div>
                </li>
                <li>
                    <div class="unity_pic">
                        <a href="#"><img src="https://recipe1.ezmember.co.kr/cache/data/goods/19/06/23/1000001657/1000001657_detail_072.PNG"></a>
                    </div>
                    <div class="unity_cont">
                    <p class="cont_tit line2"><a href="#">에어프라이어 칼집 약단밤, 손으로 까먹는 생밤 1kg</a></p>
                    <div class="price_box">
                    <strong class="price">10,900<small>원</small></strong>
                    </div>
                    </div>
                </li>
                <li>
                    <div class="unity_pic">
                        <a href="#"><img src="https://recipe1.ezmember.co.kr/cache/data/goods/19/06/23/1000001657/1000001657_detail_072.PNG"></a>
                    </div>
                    <div class="unity_cont">
                    <p class="cont_tit line2"><a href="#">에어프라이어 칼집 약단밤, 손으로 까먹는 생밤 1kg</a></p>
                    <div class="price_box">
                    <strong class="price">10,900<small>원</small></strong>
                    </div>
                    </div>
                </li>
                <li>
                    <div class="unity_pic">
                        <a href="#"><img src="https://recipe1.ezmember.co.kr/cache/data/goods/19/06/23/1000001657/1000001657_detail_072.PNG"></a>
                    </div>
                    <div class="unity_cont">
                    <p class="cont_tit line2"><a href="#">에어프라이어 칼집 약단밤, 손으로 까먹는 생밤 1kg</a></p>
                    <div class="price_box">
                    <strong class="price">10,900<small>원</small></strong>
                    </div>
                    </div>
                </li>
                <li>
                    <div class="unity_pic">
                        <a href="#"><img src="https://recipe1.ezmember.co.kr/cache/data/goods/19/06/23/1000001657/1000001657_detail_072.PNG"></a>
                    </div>
                    <div class="unity_cont">
                    <p class="cont_tit line2"><a href="#">에어프라이어 칼집 약단밤, 손으로 까먹는 생밤 1kg</a></p>
                    <div class="price_box">
                    <strong class="price">10,900<small>원</small></strong>
                    </div>
                    </div>
                </li>
                </ul>
            </div>
        </div>
        
    </div>
    <footer>
        대표이사  박신우 |  사업자 121-34-345671  | TEL 02)2032-4356<br>
        본사 ) 서울특별시 강남구 역삼로 테헤란로 14길 6<br>
        E-MAIL recipeMarket@recipteMarket.com<br>
        Copyright © 1998-2019 Recipe Market Service All Right Reserved  <br>                                     
    </footer>
    
    <script type="text/javascript">
        function change(num) {
        var x  = document.form;
        var y = Number(x.count.value) + num;
        if(y < 1) y = 1;
        x.count.value = y;
        }
    </script>
</body>
</html>