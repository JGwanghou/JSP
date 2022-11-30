<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글목록</title>
    <link rel="stylesheet" href="/Farmstory/board/css/board.css"/>
    <style>
        #board > .list > form {
            float: right;
            margin-bottom: -14px;
        }

        #board > .list > form > input[name=search]{
            width: 200px;
            height: 26px;
            text-indent: 6px;
            border: 1px solid #d7d7d7;
        }
        #board > .list > form > input[type=submit]{
            border: 1px solid #d7d7d7;
            background: #f2f2f2; 
            color: #111;
            padding: 6px;
        }
    </style>
</head>
<body>
    <div id="wrapper">
        <header>
            <h3>Board System v2.0</h3>
            <p>
                <span>홍길동</span>님 반갑습니다.
                <a href="./user/login.html">[로그아웃]</a>
            </p>
        </header>