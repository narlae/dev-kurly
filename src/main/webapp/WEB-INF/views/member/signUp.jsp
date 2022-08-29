<%--
  Created by IntelliJ IDEA.
  User: iseon-u
  Date: 2022/08/10
  Time: 10:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set
        var="signInOut"
        value="${sessionScope.memberResponse==null ? '로그인' : '로그아웃'}"
/>
<c:set
        var="signInOutLink"
        value="${sessionScope.memberResponse==null ? '/members' : '/members/signout'}"
/>
<c:set
        var="name"
        value="${sessionScope.memberResponse==null ? '회원가입' : sessionScope.memberResponse.user_nm}"
/>
<c:set
        var="nameLink"
        value="${sessionScope.memberResponse==null ? '/members/signup' : '/mypage'}"
/>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DevKurly :: 회원가입</title>
    <link rel="stylesheet" type="text/css" href="/cart/reset.css">
    <link rel="stylesheet" type="text/css" href="/navigation.css">
    <link rel="stylesheet" type="text/css" href="/payment/payment.css">
    <link rel="stylesheet" type="text/css" href="/footer.css">
    <style>
        #whole_container {
            width: 100%;
            height: 100vh;
        }

        #content_body {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            padding: 0 200 0 200;
        }

        .content {
            width: 400px;
            border: 1px solid #8b00ff;
        }

        button {
            width: 200px;
            height: 100px;
        }

        /* input {
            width: 80%;
        } */
        a {
            text-decoration: none;
        }

        #search_first a {
            font-weight: 600;
        }

        .form-error {
            color: #e52528;
            font-size: 12px;
            padding-top: 5px;
            text-align: center;
        }

        .member-input {
            width: 450px;
            height: 45px;
            color: #808080;
            background-color: #FAFAFA;
            border: 1px solid rgb(221, 221, 221);
        }

        #member-submit {
             width: 100%;
             height: 50px;
             margin-top: 20px;
             border: none;
             border-radius: 2px;
             background-color: #5F0080;
             color: white;
         }
    </style>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>

<body>
<div id="whole_container">
    <div id="navigation">
        <div id="signup_signin_container">
            <div id="signup_signin">
                <a id="signup" href="${nameLink}">${name}</a>
                <div></div>
                <a id="signin" href="${signInOutLink}">${signInOut}</a>
                <div></div>
                <a id="cust">고객센터</a>
            </div>
        </div>
        <div id="search">
            <div id="search_first">
                <a href="/">
                    <img style="width:82px; height: 42px"
                         src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iODIiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCA4MiA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGwtcnVsZT0ibm9uemVybyIgZmlsbD0ibm9uZSI+CiAgICAgICAgPHBhdGggZD0iTTAgMGg4MnY0MkgweiIvPgogICAgICAgIDxwYXRoIGQ9Ik02Mi41Ljk2NWMxLjAyNi0uNTU3IDIuNDY2LS43MTggMy4zNTYuMTA3Ljg5LjgyNS42NzYgMi4wNDggMCAzLjk3MyAwIDAtMS41MDUgNC4wNjYtMy4wNTUgOC4yNjJsLS4zOTggMS4wOGMtMS40MTQgMy44My0yLjc2MiA3LjQ4Ny0yLjkyNyA3Ljk2My0xLjQ5OCA0LjI0NSAxLjk2NyA0LjEyMiA0LjAyNC0uMTUyIDEuMTU5LTIuMzk0IDIuNjQ0LTYuMzU3IDIuNjQ0LTYuMzU3LjUyNC0xLjU2My42ODItMi41MDQuMzU5LTIuODI4LS4xMDctLjExMy4wNDUtLjI1Mi4xOC0uMzIzIDIuMjY5LTEuMTQ5IDQuNjMtLjA3MiAzLjMzNiAzLjMxbC0uMDU0LjEzOGMtLjM4Ny45NzgtMi42OCA2LjczMy0yLjY4IDYuNzMzLS42NzYgMS42Ni0uNTk1IDMuMjM2LjQxOCAzLjIzNi42ODYtLjAwNCAxLjQ2LS4zODUgMi4zMDQtMS4wODggMS44MTgtMS41MDQgMy4yMjItNC4zMTIgMy43MjctNS40NTQuMjMtLjUwOCAxLjA4Ny0yLjQyIDEuNzY2LTQuMzYxLjIzNi0uNjY1LjM2OS0xLjM2LjM5NS0yLjA2NWEuNDQzLjQ0MyAwIDAgMSAuMTk0LS40NTkgMy41NzggMy41NzggMCAwIDEgMS42Ny0uNDIgMS44MDUgMS44MDUgMCAwIDEgMS40NjUuNzA1Yy40NDMuNTk4LjU2NiAxLjU3OS4xMDMgMi44MDgtLjEyLjMyLTMuNzc1IDkuOTU4LTMuNzc1IDkuOTU4di4wMjZjMi4wNDEtMS4yMjMgMy44Ny0xLjMxMyA0Ljk1My0uODU0bC0uMDAzLS4wMTNjMS40OTUuNjQ3IDEuOTkgMi40NC45MzggMy41NTktLjEwMy4xMS0uMzYyLjA4NC0uMzYyLS4wOS0uMDk0LTEuMjUzLTIuNTE3LTMuNDk1LTYuMTA5LTEuMDc1bC0uMTQ1LjM4NS0xLjA2OCAyLjgwOGMtMi42MiA3LjAxOC01LjQwMyAxMi4xMzYtOS40MTUgMTEtMi42ODgtLjc2LTIuMzc3LTQuNjA3LjUxNS03Ljc5YTU0LjkgNTQuOSAwIDAgMSA2LjQ5LTUuODk4Yy4wNjgtLjE4OC4xMy0uMzUuMTg4LS41MTEuMjc4LS43OC40OTEtMS40MzQuNzkyLTIuMjY1bC4xNTktLjUxOGMtLjE3OC4yLS40OTguNTczLS43MTIuODEyLS43MTIuOC0yLjQ5NCAyLjc1Ny01LjMyOSAyLjIwN2wtLjIzNC0uMDUyYy0yLjA1LS41MDgtMi42MDgtMS45ODYtMi42NTUtMy4yNzctMi4xNDIgMi42NTYtNC4zNTEgMy40MjYtNS44MDcgMy4zOS0xLjk0OC0uMDQ4LTMuMzc4LTEuNTE0LTIuNDI3LTQuMjkgMS4wNTgtMy4xMDYgNS41LTE1LjMzMiA2Ljc5NS0xOSAuNDg1LTEuNTguNjY2LTIuNTguMTg0LTIuOTc0LS4xMjMtLjEwMy4wNTItLjI2NS4yLS4zNDZ6bTguMzY0IDI4Ljc3OGMtMS4xMDMuODgtNS41MjYgNC41My02Ljc1MiA3LjQ0MS0uNTA1IDEuMTk3LS4zNzYgMi4xNDkuNDg4IDIuMjMzIDEuOTYuMTk0IDQuMDEyLTMuODE4IDYuMjI4LTkuNTEyek0xNi4wMjggNS4zNTJjLS4wODcuMzMyLTEuMzE5IDMuODYtMi43MDEgNy43NDlsLS4yMDkuNTg2LS4yMS41ODktLjIxNS42MDRjNC42OTEtMS4xMjMgMTMuMDY0LTYuNTcgMTQuMDM1LTEwLjA4NS4xMi0uMTYxLjI5LS4yMi41NjYtLjAzNS40OTUuMzMuNjg2IDEuMTU1LjQ5NSAxLjkxOC0uNzY0IDMuMDM4LTYuNDE2IDcuMzQxLTExLjM3OSA5LjU1NC42MTIgMS42MzcgMi42ODIgNi4yNjcgNC4yMDYgOS4xMTEgMS42NjMgMy4xMTkgMy40MiA0LjU3NSA2LjE0NyA0LjczNyAxLjQ2LjA4NSAzLjAxNC0uNDQ3IDMuODkzLTEuMjJsLjE0OC0uMTQtLjAxMy4wM2MuMTk0LS4yMDQuNTExLjA3Ny4zNjYuMzIzYTYuNSA2LjUgMCAwIDEtNC45OTIgMi44NjdjLTYuMzQ1LjQyNy04Ljc3NC0zLjg3LTEzLjMwNC0xNC40OTQtLjM2Ni4xMjYtLjgwOS4yODgtMS4yNTUuNDUtLjA3NS4xODctMi4wNyA1LjY0Mi0yLjEzIDUuODIzLS45NDQgMi44Ny0xLjAwNSA0LjQ0Mi0uMzU4IDQuODk1LjE0NS4wOS4wNzQuMzMzLS4xNzguNDE0LTIuNTI3Ljc5Ni00Ljg1My0uNjk2LTMuNTU5LTQuNDQyIDEuMTYxLTMuMzE2IDUuNjktMTYuMTggNi45MTQtMTkuNjI2LjQyNy0xLjI5NC4xOTctMi4xMjUtLjQ5Mi0yLjMwNkM4LjUwNiAxLjc4Ljg3NyA4Ljc0OSAxLjk3MSAxNS4xODRjLjE5IDEuMTIuOTggMS43NDcgMS4zNzggMS42NjNhLjEzMy4xMzMgMCAwIDEgLjE1Ni4xNTkgMS41MDggMS41MDggMCAwIDEtMS44NDUgMS4wMzJDLjQ5IDE3Ljc4Mi4xMDcgMTYuNTI3LjA0MyAxNS44OC0uNjAxIDkuMjIgNi4xNDggMS4yMyAxMi4zODkuNThjMi4zNzgtLjI1IDQuNjEuOTYgMy42NCA0Ljc3MnptMjQuMDQgOS45MTMtLjA2LjIwNy0yLjgzIDguMTZjLS4zMDQuODUtLjEgMS43MzcuNTAxIDEuOTAyIDEuNzU3LjQ4MiA0LjAyOC0yLjE0NSA1LjEzMS00LjczM2E2Ny43OTQgNjcuNzk0IDAgMCAwIDEuNDc2LTMuODE1Yy41ODItMS42NDMgMS4xMDYtMy4xODMuNzgzLTMuOTA4LS4wNzUtLjE2OC4wNDUtLjI1Ni4yMjMtLjM1LjUwNS0uMjU1IDIuMjI2LS44MjUgMy4xNDEuMDY4LjY5NS42NzQuNjA5IDEuNzcxLS4wMyAzLjQzN2wtLjA5Ni4yNDIuMjItLjI3M2MyLjcwMy0zLjMgNC43OTItNC4yOTIgNi41NjMtMy41OTdsLjE0Ny4wNjJjMi4zODEgMS4wNzQgMS4xNDYgNS4yMTUtMi4xMTYgNS40OC0uMi4wMTctLjM1Ni0uMTI2LS4xNTgtLjQwNy4zOTUtLjYwNS4zNTYtMS45MDktLjc5Ni0yLjAyMi0xLjE1Mi0uMTEzLTIuODMgMS4yMDctNC4wMzggMi44NDQtMS4wODQgMS40NS0yLjIgMy45MTEtMy4zMjIgNy4yNzMtLjI3Mi44MTgtLjE0MyAxLjAxMi0uMTEgMS4wNjdhLjEuMSAwIDAgMSAwIC4wOTRjLS4xNDMuMjcyLS45NjUuNTk2LTEuNzYuNTk2LTEuNjI1LS4wMDctMi4yOTEtLjk0NS0xLjk2Ny0yLjQzNy0xLjg0OCAxLjc2NC0zLjcxMSAyLjYxNC01LjM1NSAyLjQ2NmEyLjUyNCAyLjUyNCAwIDAgMS0yLjIzNi0zLjEwM2MtMS40MjYgMS44MDktMy41NDIgMy4yNjgtNS42OTcgMy4wNjctMi4xNTUtLjItMy41LTEuNjY2LTIuODAyLTQuNzg4LjU5LTIuNTk4IDEuNTkyLTUuMjkgMi4yMDctNy4wMjcuNTE0LTEuNDU2LjYxOC0yLjQwNy4yOTQtMi43NS0uMTAzLS4xMTQuMDU1LS4yNS4xOTQtLjMyNCAxLjY5LS44ODYgNC4zOTQtLjMxNCAzLjYzIDIuMDktLjgwMiAyLjUyNy0yLjI1NSA2LjQ5LTIuNTUgNy40LS43MzcgMi4yODctLjI5IDMuNTIzLjc1NSAzLjU4IDEuMDQ1LjA2IDIuNDMtLjk2IDMuNDItMi41MDMgMS43Ni0yLjUyNCAyLjU4MS01LjY4NSAzLjM3Ny03Ljg4Mi4yMDQtLjU2LjUyNy0xLjg2Ni4xODUtMi4zNTItLjA5MS0uMTIzLjA2Ny0uMjU4LjI3NS0uMzcyIDEuNTM3LS44NDkgNC4yODUtLjY0IDMuNDAyIDIuNjA4eiIgZmlsbD0iIzVGMDA4MCIvPgogICAgPC9nPgo8L3N2Zz4K"
                         alt="logo"/>
                </a>
                <a href="/">마켓컬리</a>
                <div></div>
                <a href="/">뷰티컬리</a>
            </div>
            <div id="input_container">
                <input placeholder="검색어를 입력해주세요"/>
                <img src="/cart/imgs/loupe.png" style="width: 20px; height: 20px"/>
            </div>
            <div id="icon_container">
                <img src="/cart/imgs/location.png"/>
                <img src="/cart/imgs/heart.png"/>
                <a href="/carts/"><img src="/cart/imgs/shopping-cart.png"/></a>
            </div>
        </div>
        <div id="menubar">
            <div id="category_container">
                <img src=""/>
                <p style="width: 80px;" id="show_category_button">카테고리</p>
            </div>
            <div id="menus">
                <a href="/product/newlist?sort=1&page=1&pageSize=12&order_sc=in_date">신상품</a>
                <a href="/product/newlist?sort=2&page=1&pageSize=12&order_sc=sales_rate">베스트</a>
                <a href="/product/newlist?sort=3&page=1&pageSize=12">알뜰쇼핑</a>
                <a href="/event/main">특가/혜택</a>
            </div>
            <div id="deli_info">
                <span id="purple_deli_info">샛별·낮</span>
                <span id="gray_deli_info">배송안내</span>
            </div>
        </div>
    </div>
    <div id="cat_wrapper">
        <div id="main_cat_container">
            <%--            <li class="cat main_cat">채소</li>--%>
        </div>
        <div id="sub_cat_container">
            <%--            <li class="cat sub_cat">채소</li>--%>
        </div>
    </div>
    <%--    header--%>
    <div id="content">
        <h2>회원가입</h2>
        <form id="form" action="/members/signup" method="post" autocomplete="off">
        <div id="container">
            <div id="product_list">
                <h4 class="product_type" style="padding-top: 0px;"></h4>
                <div class="products_container">
                    <div class="payment_row">
                        <span style="padding-top: 15px;">이메일<span style="color: orangered">*</span></span>
                        <span>
                            <input
                                    class="member-input"
                                    id="email"
                                    type="text"
                                    name="user_email"
                                    placeholder="이메일을 입력해주세요"
                            />
                            <div class="form-error" id="email-error" hidden><img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxMiIgdmlld0JveD0iMCAwIDEyIDEyIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0NCMTQwMCIgZmlsbC1ydWxlPSJub256ZXJvIiBkPSJNNiAwYzEuNjAzIDAgMy4xMS42MjQgNC4yNDMgMS43NTdDMTEuMzc2IDIuODkxIDEyIDQuMzk3IDEyIDZjMCAxLjYwMy0uNjI0IDMuMTEtMS43NTcgNC4yNDNDOS4xMDkgMTEuMzc2IDcuNjAzIDEyIDYgMTJjLTEuNjAzIDAtMy4xMS0uNjI0LTQuMjQzLTEuNzU3Qy42MjQgOS4xMDkgMCA3LjYwMyAwIDZjMC0xLjYwMy42MjQtMy4xMSAxLjc1Ny00LjI0M0MyLjg5MS42MjQgNC4zOTcgMCA2IDB6bTAgOC4yNWMtLjM0NSAwLS42MjUuMjgtLjYyNS42MjVzLjI4LjYyNS42MjUuNjI1LjYyNS0uMjguNjI1LS42MjVTNi4zNDUgOC4yNSA2IDguMjV6bS4wMTItNS43NWMtLjI3NiAwLS41LjIyNC0uNS41djRsLjAwNC4wNThjLjAyOS4yNDkuMjQuNDQyLjQ5Ni40NDIuMjc3IDAgLjUtLjIyNC41LS41VjNsLS4wMDMtLjA1OGMtLjAyOS0uMjQ5LS4yNC0uNDQyLS40OTctLjQ0MnoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MzczIC0yMjQ0KSB0cmFuc2xhdGUoNzM3MyAyMjQ0KSIvPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0ZGRiIgZmlsbC1vcGFjaXR5PSIwIiBkPSJNMCAxMkwxMiAxMiAxMiAwIDAgMHoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MzczIC0yMjQ0KSB0cmFuc2xhdGUoNzM3MyAyMjQ0KSIvPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"/> 이메일을 입력하세요.</div>
                        </span>
                    </div>
                    <div class="payment_row">
                        <span style="padding-top: 15px;">비밀번호<span style="color: orangered">*</span></span>
                        <span>
                            <input
                                    class="member-input"
                                    id="pwd"
                                    type="password"
                                    name="pwd"
                                    placeholder="비밀번호를 입력해주세요"
                            />
                            <div class="form-error" id="pwd-error" hidden><img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxMiIgdmlld0JveD0iMCAwIDEyIDEyIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0NCMTQwMCIgZmlsbC1ydWxlPSJub256ZXJvIiBkPSJNNiAwYzEuNjAzIDAgMy4xMS42MjQgNC4yNDMgMS43NTdDMTEuMzc2IDIuODkxIDEyIDQuMzk3IDEyIDZjMCAxLjYwMy0uNjI0IDMuMTEtMS43NTcgNC4yNDNDOS4xMDkgMTEuMzc2IDcuNjAzIDEyIDYgMTJjLTEuNjAzIDAtMy4xMS0uNjI0LTQuMjQzLTEuNzU3Qy42MjQgOS4xMDkgMCA3LjYwMyAwIDZjMC0xLjYwMy42MjQtMy4xMSAxLjc1Ny00LjI0M0MyLjg5MS42MjQgNC4zOTcgMCA2IDB6bTAgOC4yNWMtLjM0NSAwLS42MjUuMjgtLjYyNS42MjVzLjI4LjYyNS42MjUuNjI1LjYyNS0uMjguNjI1LS42MjVTNi4zNDUgOC4yNSA2IDguMjV6bS4wMTItNS43NWMtLjI3NiAwLS41LjIyNC0uNS41djRsLjAwNC4wNThjLjAyOS4yNDkuMjQuNDQyLjQ5Ni40NDIuMjc3IDAgLjUtLjIyNC41LS41VjNsLS4wMDMtLjA1OGMtLjAyOS0uMjQ5LS4yNC0uNDQyLS40OTctLjQ0MnoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MzczIC0yMjQ0KSB0cmFuc2xhdGUoNzM3MyAyMjQ0KSIvPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0ZGRiIgZmlsbC1vcGFjaXR5PSIwIiBkPSJNMCAxMkwxMiAxMiAxMiAwIDAgMHoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MzczIC0yMjQ0KSB0cmFuc2xhdGUoNzM3MyAyMjQ0KSIvPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"/> 영문/숫자/특수문자 2가지 이상 조합 (8~20자)</div>
                        </span>
                    </div>
                    <div class="payment_row">
                        <span style="padding-top: 15px;">비밀번호 확인<span style="color: orangered">*</span></span>
                        <span>
                            <input
                                    class="member-input"
                                    id="cpwd"
                                    type="password"
                                    name="cPassword"
                                    placeholder="비밀번호를 한번 더 입력해주세요"
                            />
                            <div class="form-error" id="cpwd-error" hidden><img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxMiIgdmlld0JveD0iMCAwIDEyIDEyIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0NCMTQwMCIgZmlsbC1ydWxlPSJub256ZXJvIiBkPSJNNiAwYzEuNjAzIDAgMy4xMS42MjQgNC4yNDMgMS43NTdDMTEuMzc2IDIuODkxIDEyIDQuMzk3IDEyIDZjMCAxLjYwMy0uNjI0IDMuMTEtMS43NTcgNC4yNDNDOS4xMDkgMTEuMzc2IDcuNjAzIDEyIDYgMTJjLTEuNjAzIDAtMy4xMS0uNjI0LTQuMjQzLTEuNzU3Qy42MjQgOS4xMDkgMCA3LjYwMyAwIDZjMC0xLjYwMy42MjQtMy4xMSAxLjc1Ny00LjI0M0MyLjg5MS42MjQgNC4zOTcgMCA2IDB6bTAgOC4yNWMtLjM0NSAwLS42MjUuMjgtLjYyNS42MjVzLjI4LjYyNS42MjUuNjI1LjYyNS0uMjguNjI1LS42MjVTNi4zNDUgOC4yNSA2IDguMjV6bS4wMTItNS43NWMtLjI3NiAwLS41LjIyNC0uNS41djRsLjAwNC4wNThjLjAyOS4yNDkuMjQuNDQyLjQ5Ni40NDIuMjc3IDAgLjUtLjIyNC41LS41VjNsLS4wMDMtLjA1OGMtLjAyOS0uMjQ5LS4yNC0uNDQyLS40OTctLjQ0MnoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MzczIC0yMjQ0KSB0cmFuc2xhdGUoNzM3MyAyMjQ0KSIvPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0ZGRiIgZmlsbC1vcGFjaXR5PSIwIiBkPSJNMCAxMkwxMiAxMiAxMiAwIDAgMHoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MzczIC0yMjQ0KSB0cmFuc2xhdGUoNzM3MyAyMjQ0KSIvPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"/> 확인을 위해 비밀번호를 다시 입력해주세요.</div>
                        </span>
                    </div>
                    <div class="payment_row">
                        <span style="padding-top: 15px;">이름<span style="color: orangered">*</span></span>
                        <span>
                            <input
                                    class="member-input"
                                    id="name"
                                    type="text"
                                    name="user_nm"
                                    placeholder="이름을 입력해 주세요"
                            />
                            <div class="form-error" id="name-error" hidden><img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxMiIgdmlld0JveD0iMCAwIDEyIDEyIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0NCMTQwMCIgZmlsbC1ydWxlPSJub256ZXJvIiBkPSJNNiAwYzEuNjAzIDAgMy4xMS42MjQgNC4yNDMgMS43NTdDMTEuMzc2IDIuODkxIDEyIDQuMzk3IDEyIDZjMCAxLjYwMy0uNjI0IDMuMTEtMS43NTcgNC4yNDNDOS4xMDkgMTEuMzc2IDcuNjAzIDEyIDYgMTJjLTEuNjAzIDAtMy4xMS0uNjI0LTQuMjQzLTEuNzU3Qy42MjQgOS4xMDkgMCA3LjYwMyAwIDZjMC0xLjYwMy42MjQtMy4xMSAxLjc1Ny00LjI0M0MyLjg5MS42MjQgNC4zOTcgMCA2IDB6bTAgOC4yNWMtLjM0NSAwLS42MjUuMjgtLjYyNS42MjVzLjI4LjYyNS42MjUuNjI1LjYyNS0uMjguNjI1LS42MjVTNi4zNDUgOC4yNSA2IDguMjV6bS4wMTItNS43NWMtLjI3NiAwLS41LjIyNC0uNS41djRsLjAwNC4wNThjLjAyOS4yNDkuMjQuNDQyLjQ5Ni40NDIuMjc3IDAgLjUtLjIyNC41LS41VjNsLS4wMDMtLjA1OGMtLjAyOS0uMjQ5LS4yNC0uNDQyLS40OTctLjQ0MnoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MzczIC0yMjQ0KSB0cmFuc2xhdGUoNzM3MyAyMjQ0KSIvPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0ZGRiIgZmlsbC1vcGFjaXR5PSIwIiBkPSJNMCAxMkwxMiAxMiAxMiAwIDAgMHoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MzczIC0yMjQ0KSB0cmFuc2xhdGUoNzM3MyAyMjQ0KSIvPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"/> 이름을 정확히 입력하세요.</div>
                        </span>
                    </div>
                    <div class="payment_row">
                        <span style="padding-top: 15px;">휴대폰 번호<span style="color: orangered">*</span></span>
                        <span>
                            <input
                                    class="member-input"
                                    id="telno"
                                    type="text"
                                    name="telno"
                                    placeholder="휴대폰 번호를 입력해주세요"
                            />
                            <div class="form-error" id="phone-error" hidden><img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxMiIgdmlld0JveD0iMCAwIDEyIDEyIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0NCMTQwMCIgZmlsbC1ydWxlPSJub256ZXJvIiBkPSJNNiAwYzEuNjAzIDAgMy4xMS42MjQgNC4yNDMgMS43NTdDMTEuMzc2IDIuODkxIDEyIDQuMzk3IDEyIDZjMCAxLjYwMy0uNjI0IDMuMTEtMS43NTcgNC4yNDNDOS4xMDkgMTEuMzc2IDcuNjAzIDEyIDYgMTJjLTEuNjAzIDAtMy4xMS0uNjI0LTQuMjQzLTEuNzU3Qy42MjQgOS4xMDkgMCA3LjYwMyAwIDZjMC0xLjYwMy42MjQtMy4xMSAxLjc1Ny00LjI0M0MyLjg5MS42MjQgNC4zOTcgMCA2IDB6bTAgOC4yNWMtLjM0NSAwLS42MjUuMjgtLjYyNS42MjVzLjI4LjYyNS42MjUuNjI1LjYyNS0uMjguNjI1LS42MjVTNi4zNDUgOC4yNSA2IDguMjV6bS4wMTItNS43NWMtLjI3NiAwLS41LjIyNC0uNS41djRsLjAwNC4wNThjLjAyOS4yNDkuMjQuNDQyLjQ5Ni40NDIuMjc3IDAgLjUtLjIyNC41LS41VjNsLS4wMDMtLjA1OGMtLjAyOS0uMjQ5LS4yNC0uNDQyLS40OTctLjQ0MnoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MzczIC0yMjQ0KSB0cmFuc2xhdGUoNzM3MyAyMjQ0KSIvPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0ZGRiIgZmlsbC1vcGFjaXR5PSIwIiBkPSJNMCAxMkwxMiAxMiAxMiAwIDAgMHoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MzczIC0yMjQ0KSB0cmFuc2xhdGUoNzM3MyAyMjQ0KSIvPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"/> 휴대폰 번호를 정확하게 입력하세요.</div>
                        </span>
                    </div>
                    <div class="payment_row">
                        <span style="padding-top: 15px;">추천인 이메일</span>
                        <span>
                            <input
                                    class="member-input"
                                    id="rcmdr_email"
                                    type="text"
                                    name="rcmdr_email"
                                    placeholder="추천인 이메일을 입력해주세요."
                            />
                            <div class="form-error" id="rcmdr-email-error" hidden><img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxMiIgdmlld0JveD0iMCAwIDEyIDEyIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0NCMTQwMCIgZmlsbC1ydWxlPSJub256ZXJvIiBkPSJNNiAwYzEuNjAzIDAgMy4xMS42MjQgNC4yNDMgMS43NTdDMTEuMzc2IDIuODkxIDEyIDQuMzk3IDEyIDZjMCAxLjYwMy0uNjI0IDMuMTEtMS43NTcgNC4yNDNDOS4xMDkgMTEuMzc2IDcuNjAzIDEyIDYgMTJjLTEuNjAzIDAtMy4xMS0uNjI0LTQuMjQzLTEuNzU3Qy42MjQgOS4xMDkgMCA3LjYwMyAwIDZjMC0xLjYwMy42MjQtMy4xMSAxLjc1Ny00LjI0M0MyLjg5MS42MjQgNC4zOTcgMCA2IDB6bTAgOC4yNWMtLjM0NSAwLS42MjUuMjgtLjYyNS42MjVzLjI4LjYyNS42MjUuNjI1LjYyNS0uMjguNjI1LS42MjVTNi4zNDUgOC4yNSA2IDguMjV6bS4wMTItNS43NWMtLjI3NiAwLS41LjIyNC0uNS41djRsLjAwNC4wNThjLjAyOS4yNDkuMjQuNDQyLjQ5Ni40NDIuMjc3IDAgLjUtLjIyNC41LS41VjNsLS4wMDMtLjA1OGMtLjAyOS0uMjQ5LS4yNC0uNDQyLS40OTctLjQ0MnoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MzczIC0yMjQ0KSB0cmFuc2xhdGUoNzM3MyAyMjQ0KSIvPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0ZGRiIgZmlsbC1vcGFjaXR5PSIwIiBkPSJNMCAxMkwxMiAxMiAxMiAwIDAgMHoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MzczIC0yMjQ0KSB0cmFuc2xhdGUoNzM3MyAyMjQ0KSIvPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"/> 이메일을 입력하세요.</div>
                        </span>
                    </div>
                </div>
                <h4 class="product_type"></h4>
                <div class="products_container">
                    <div class="payment_row">
                        <span style="padding-top: 15px;">이용약관동의<span style="color: orangered">*</span></span>
                        <span style="padding-top: 15px; padding-left: 400px;">전체 동의합니다.</span>
                        <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTE3Ni4wMDAwMDAsIC0xMDkwLjAwMDAwMCkgdHJhbnNsYXRlKDEwMC4wMDAwMDAsIDkzNi4wMDAwMDApIHRyYW5zbGF0ZSg2MC4wMDAwMDAsIDE0Mi4wMDAwMDApIHRyYW5zbGF0ZSgxNi4wMDAwMDAsIDEyLjAwMDAwMCkiPgogICAgICAgICAgICAgICAgICAgICAgICA8Y2lyY2xlIGN4PSIxMiIgY3k9IjEyIiByPSIxMiIgZmlsbD0iIzVGMDA4MCIvPgogICAgICAgICAgICAgICAgICAgICAgICA8cGF0aCBzdHJva2U9IiNGRkYiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjUiIGQ9Ik03IDEyLjY2N0wxMC4zODUgMTYgMTggOC41Ii8+CiAgICAgICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K" class="checked" id="all-checked" style="padding-top: 10px;" hidden/><img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgc3Ryb2tlPSIjREREIj4KICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICA8Zz4KICAgICAgICAgICAgICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtNjY5LjAwMDAwMCwgLTEwOTAuMDAwMDAwKSB0cmFuc2xhdGUoMTAwLjAwMDAwMCwgOTM2LjAwMDAwMCkgdHJhbnNsYXRlKDU1My4wMDAwMDAsIDE0Mi4wMDAwMDApIHRyYW5zbGF0ZSgxNi4wMDAwMDAsIDEyLjAwMDAwMCkiPgogICAgICAgICAgICAgICAgICAgICAgICA8Y2lyY2xlIGN4PSIxMiIgY3k9IjEyIiByPSIxMS41Ii8+CiAgICAgICAgICAgICAgICAgICAgICAgIDxwYXRoIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjUiIGQ9Ik03IDEyLjY2N0wxMC4zODUgMTYgMTggOC41Ii8+CiAgICAgICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K" class="unchecked" id="all-unchecked" style="padding-top: 10px;"/>
                    </div>
                    <div class="payment_row">
                        <span></span>
                        <span style="padding-top: 15px; padding-left: 460px;">이용약관 동의 (필수)</span>
                        <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTE3Ni4wMDAwMDAsIC0xMDkwLjAwMDAwMCkgdHJhbnNsYXRlKDEwMC4wMDAwMDAsIDkzNi4wMDAwMDApIHRyYW5zbGF0ZSg2MC4wMDAwMDAsIDE0Mi4wMDAwMDApIHRyYW5zbGF0ZSgxNi4wMDAwMDAsIDEyLjAwMDAwMCkiPgogICAgICAgICAgICAgICAgICAgICAgICA8Y2lyY2xlIGN4PSIxMiIgY3k9IjEyIiByPSIxMiIgZmlsbD0iIzVGMDA4MCIvPgogICAgICAgICAgICAgICAgICAgICAgICA8cGF0aCBzdHJva2U9IiNGRkYiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjUiIGQ9Ik03IDEyLjY2N0wxMC4zODUgMTYgMTggOC41Ii8+CiAgICAgICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K" class="checked" id="required-checked" style="padding-top: 10px;" hidden/><img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgc3Ryb2tlPSIjREREIj4KICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICA8Zz4KICAgICAgICAgICAgICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtNjY5LjAwMDAwMCwgLTEwOTAuMDAwMDAwKSB0cmFuc2xhdGUoMTAwLjAwMDAwMCwgOTM2LjAwMDAwMCkgdHJhbnNsYXRlKDU1My4wMDAwMDAsIDE0Mi4wMDAwMDApIHRyYW5zbGF0ZSgxNi4wMDAwMDAsIDEyLjAwMDAwMCkiPgogICAgICAgICAgICAgICAgICAgICAgICA8Y2lyY2xlIGN4PSIxMiIgY3k9IjEyIiByPSIxMS41Ii8+CiAgICAgICAgICAgICAgICAgICAgICAgIDxwYXRoIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjUiIGQ9Ik03IDEyLjY2N0wxMC4zODUgMTYgMTggOC41Ii8+CiAgICAgICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K" class="unchecked" id="required-unchecked" style="padding-top: 10px;"/>
                    </div>
                    <div class="payment_row">
                        <span></span>
                        <span style="padding-top: 15px; padding-left: 400px;">개인정보 수집 이용 동의 (선택)</span>
                        <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTE3Ni4wMDAwMDAsIC0xMDkwLjAwMDAwMCkgdHJhbnNsYXRlKDEwMC4wMDAwMDAsIDkzNi4wMDAwMDApIHRyYW5zbGF0ZSg2MC4wMDAwMDAsIDE0Mi4wMDAwMDApIHRyYW5zbGF0ZSgxNi4wMDAwMDAsIDEyLjAwMDAwMCkiPgogICAgICAgICAgICAgICAgICAgICAgICA8Y2lyY2xlIGN4PSIxMiIgY3k9IjEyIiByPSIxMiIgZmlsbD0iIzVGMDA4MCIvPgogICAgICAgICAgICAgICAgICAgICAgICA8cGF0aCBzdHJva2U9IiNGRkYiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjUiIGQ9Ik03IDEyLjY2N0wxMC4zODUgMTYgMTggOC41Ii8+CiAgICAgICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K" class="checked" id="selected-checked" style="padding-top: 10px;" hidden/><img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgc3Ryb2tlPSIjREREIj4KICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICA8Zz4KICAgICAgICAgICAgICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtNjY5LjAwMDAwMCwgLTEwOTAuMDAwMDAwKSB0cmFuc2xhdGUoMTAwLjAwMDAwMCwgOTM2LjAwMDAwMCkgdHJhbnNsYXRlKDU1My4wMDAwMDAsIDE0Mi4wMDAwMDApIHRyYW5zbGF0ZSgxNi4wMDAwMDAsIDEyLjAwMDAwMCkiPgogICAgICAgICAgICAgICAgICAgICAgICA8Y2lyY2xlIGN4PSIxMiIgY3k9IjEyIiByPSIxMS41Ii8+CiAgICAgICAgICAgICAgICAgICAgICAgIDxwYXRoIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjUiIGQ9Ik03IDEyLjY2N0wxMC4zODUgMTYgMTggOC41Ii8+CiAgICAgICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K" class="unchecked" id="selected-unchecked" style="padding-top: 10px;"/>
                        <input type="checkbox" id="terms" name="prvc_arge" value="1" hidden>
                    </div>
                    <div class="form-error" id="required-error" hidden><img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxMiIgdmlld0JveD0iMCAwIDEyIDEyIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0NCMTQwMCIgZmlsbC1ydWxlPSJub256ZXJvIiBkPSJNNiAwYzEuNjAzIDAgMy4xMS42MjQgNC4yNDMgMS43NTdDMTEuMzc2IDIuODkxIDEyIDQuMzk3IDEyIDZjMCAxLjYwMy0uNjI0IDMuMTEtMS43NTcgNC4yNDNDOS4xMDkgMTEuMzc2IDcuNjAzIDEyIDYgMTJjLTEuNjAzIDAtMy4xMS0uNjI0LTQuMjQzLTEuNzU3Qy42MjQgOS4xMDkgMCA3LjYwMyAwIDZjMC0xLjYwMy42MjQtMy4xMSAxLjc1Ny00LjI0M0MyLjg5MS42MjQgNC4zOTcgMCA2IDB6bTAgOC4yNWMtLjM0NSAwLS42MjUuMjgtLjYyNS42MjVzLjI4LjYyNS42MjUuNjI1LjYyNS0uMjguNjI1LS42MjVTNi4zNDUgOC4yNSA2IDguMjV6bS4wMTItNS43NWMtLjI3NiAwLS41LjIyNC0uNS41djRsLjAwNC4wNThjLjAyOS4yNDkuMjQuNDQyLjQ5Ni40NDIuMjc3IDAgLjUtLjIyNC41LS41VjNsLS4wMDMtLjA1OGMtLjAyOS0uMjQ5LS4yNC0uNDQyLS40OTctLjQ0MnoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MzczIC0yMjQ0KSB0cmFuc2xhdGUoNzM3MyAyMjQ0KSIvPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0ZGRiIgZmlsbC1vcGFjaXR5PSIwIiBkPSJNMCAxMkwxMiAxMiAxMiAwIDAgMHoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MzczIC0yMjQ0KSB0cmFuc2xhdGUoNzM3MyAyMjQ0KSIvPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"/> 필수 항목에 동의해주세요</div>
                    <div id="member-submit"
                         style="cursor: pointer; font-weight: 500; font-size: 16px; text-align: center; line-height: 50px; margin-top: 30px;">
                        가입하기
                    </div>
                </div>
            </div>
        </div>
        </form>
    </div>
    <footer>
        <img src="/logo.svg" alt="logo">
        <div id="member_container">
            <a href="https://github.com/dr94406">
                <p class="mem_row"><img src="/githubLogo.png">김형민</p>
            </a>
            <a href="https://github.com/PGRRR">
                <p class="mem_row"><img src="/githubLogo.png">이선우</p>
            </a>
            <a href="https://github.com/Riiver-J">
                <p class="mem_row"><img src="/githubLogo.png">정여경</p>
            </a>
            <a href="https://github.com/narlae">
                <p class="mem_row"><img src="/githubLogo.png">김영준</p>
            </a>
            <a href="https://github.com/xpmxf4">
                <p class="mem_row"><img src="/githubLogo.png">박채훈</p>
            </a>
            <a href="https://github.com/didqksrla">
                <p class="mem_row"><img src="/githubLogo.png">김경빈</p>
            </a>
        </div>
    </footer>
</div>
<script>
    /**
     * 카테고리
     */
    let wrapper = $("#cat_wrapper");
    let show_category_button = $("#show_category_button");
    let main_cat_container = $("#main_cat_container");
    let sub_cat_container = $("#sub_cat_container");
    let sub_cat = $(".sub_cat");

    show_category_button.hover(() => {
        main_cat_container.show();
    })

    wrapper.mouseleave(() => {
        main_cat_container.hide();
        sub_cat_container.hide();
    })

    sub_cat_container.mouseleave(() => {
        sub_cat_container.hide();
    })

    let catToLi = function (res) {
        let tmp = '';

        res.forEach(el => {
            tmp += '<a href="/product/newlist?cd_name_num=' + el.cd_name_num + '&page=1&pageSize=12&order_sc=in_date&asc=sel_price%20ASC"<li class="cat main_cat">' + el.cd_name + '</li></a>'
        })

        return tmp;
    }

    let categories = null;

    $(document).ready(function () {

        $.ajax({
            type: 'GET',       // 요청 메서드
            url: '/product/categories',  // 요청 URI
            success: function (res) {
                categories = res;

                $.each(res, (el) => {
                    $("#main_cat_container").append('<a href="/product/newlist?cd_type_name=' + el + '&page=1&pageSize=12&order_sc=in_date&asc=sel_price%20ASC"<li class="cat main_cat">' + el + '</li></a>');
                })
            },
            error: function (result) {
                alert("쿠폰 불러오기 실패");
            }, // 에러가 발생했을 때, 호출될 함수
            complete: function () {
                $(".main_cat").mouseenter((e) => {
                    sub_cat_container.show();
                    sub_cat_container.html(catToLi(categories[e.currentTarget.innerText]));
                })
            }
        })
    });
</script>
<script>
    $('#member-submit').click(function () {
        if ($('#required-checked').prop('hidden') === false) {
            $('#form').submit();
        } else {
            $('#required-error').prop('hidden', false);
            alert('필수 약관에 동의해주세요.');
        }
    });

    $('#email').change(function () {
        $('#email-error').prop('hidden', false);
    });
    $('#pwd').change(function () {
        $('#pwd-error').prop('hidden', false);
    });
    $('#cpwd').change(function () {
        $('#cpwd-error').prop('hidden', false);
    });
    $('#name').change(function () {
        $('#name-error').prop('hidden', false);
    });
    $('#telno').change(function () {
        $('#phone-error').prop('hidden', false);
    });
    $('#rcmdr_email').change(function () {
        $('#rcmdr-email-error').prop('hidden', false);
    });

    $('#all-checked').click(function () {
        $('.checked').prop('hidden', true);
        $('.unchecked').prop('hidden', false);
        $('#terms').prop('checked', false);
    });
    $('#all-unchecked').click(function () {
        $('.checked').prop('hidden', false);
        $('.unchecked').prop('hidden', true);
        $('#terms').prop('checked', true);
    });
    $('#required-checked').click(function () {
        $(this).prop('hidden', true);
        $('#required-unchecked').prop('hidden', false);
    });
    $('#required-unchecked').click(function () {
        $(this).prop('hidden', true);
        $('#required-checked').prop('hidden', false);
    });
    $('#selected-checked').click(function () {
        $(this).prop('hidden', true);
        $('#selected-unchecked').prop('hidden', false);
    });
    $('#selected-unchecked').click(function () {
        $(this).prop('hidden', true);
        $('#selected-checked').prop('hidden', false);
    });

</script>
</body>
</html>