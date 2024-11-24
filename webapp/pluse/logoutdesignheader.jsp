<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.header {
            background-color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 2px solid #ddd;
        }
        .logo2 img {
            max-width: 120px;
        }
        .navbar {
            display: flex;
            gap: 20px;
        }

        .navbar a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
            transition: color 0.3s;
        }

        .navbar a:hover {
            color: #0fbc8c;
        }
        .final-package {
            text-align: center;
            padding: 20px;
            background-color: white; /* 연한 하늘색 배경 */
            margin: 40px 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .final-package img {
            width:100%;
           
            height : auto
        }

        .final-package h2 {
            margin-top: 10px;
            color: #0fbc8c;
        }
        /* 전역 스타일 초기화 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }
        
</style>


    <header class="header">
        <div class="logo2" onclick="location.href='/main'" style="cursor:pointer;">
            <img src="<%= request.getContextPath() %>/images/smart.png" alt="스마트해법 로고">
        </div>
        <nav class="navbar">
           <a href="/archive">자료실</a>
            <a href="/course">강의</a>
            <a href="/freeboard">자유게시판</a>
            <a href="/notice">공지사항</a>
            <a href="/teacher">선생님</a>
            <a href="/login">로그인</a>
            <a href="/join">회원가입</a>
            <a href="#" style="color: green;">2026 19PASS</a>
        </nav>
    </header>


