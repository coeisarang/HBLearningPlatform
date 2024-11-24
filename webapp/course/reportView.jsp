<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>성적확인 및 등록</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Noto Sans', sans-serif;
        }

        body {
            background-color: #f4f4f4;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .container {
            display: flex;
            max-width: 1200px;
            margin: 20px auto;
            gap: 20px;
            flex: 1;
        }

        /* 사이드바 스타일 */
        .sidebar {
            width: 250px;
            background-color: #3d4a59;
            color: white;
            padding: 20px;
            border-radius: 8px;
        }

        .sidebar h2 {
            font-size: 18px;
            margin-bottom: 20px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            padding-bottom: 10px;
        }

        .sidebar ul {
            list-style: none;
        }

        .sidebar ul li {
            margin-bottom: 15px;
        }

        .sidebar ul li a {
            text-decoration: none;
            color: #ccc;
            transition: color 0.3s;
        }

        .sidebar ul li a:hover {
            color: #0fbc8c;
        }

        /* 상세 정보 스타일 */
        .content {
            flex: 1;
            background-color: white;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 10px;
            margin-bottom: 20px;
        }

        .grid-item {
            background-color: #f7f8fa;
            padding: 15px;
            border-radius: 4px;
            font-size: 14px;
            color: #333;
        }

        .section-title {
            font-weight: bold;
            color: #007bff;
            text-align: center;
            margin-top: 20px;
            margin-bottom: 10px;
        }

        .score-grid {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 10px;
            text-align: center;
        }

        .score-item {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: #f9f9f9;
            font-size: 12px;
            color: #555;
        }

        .note-section {
            margin-top: 10px;
            background-color: #e9ecef;
            border-radius: 4px;
            padding: 10px;
            font-size: 12px;
            color: #333;
        }

        .button-group {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        }

        .btn-delete {
            background-color: #dc3545;
            color: white;
        }

        .btn-close {
            background-color: #6c757d;
            color: white;
        }

        .btn:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>

<c:choose>
    <c:when test="${sessionType eq 'p' }">
        <%@ include file="/pluse/logindesignheader.jsp" %>
    </c:when>
    <c:when test="${sessionType eq 't' }">
        <%@ include file="/teacher/teachermainheader.jsp" %>
    </c:when>
    <c:when test="${sessionType eq 'a' }">
        <%@ include file="/admin/adminlogindesignheader.jsp" %>
    </c:when>
    <c:otherwise>
        <%@ include file="/pluse/logoutdesignheader.jsp" %>
    </c:otherwise>
</c:choose>

    <div class="container">
        <!-- 사이드바 -->
        <div class="sidebar">
            <h2>나의 학습방</h2>
            <ul>
                <li><a href="#">나의 강의실</a></li>
                <li><a href="#">내가 쓴 글</a></li>
                <li><a href="#">내가 단 댓글</a></li>
                <li><a href="#">성적표</a></li>
            </ul> 
        </div>

        <!-- 상세 정보 -->
        <div class="content">
            <h1>성적 상세정보</h1>

            <div class="grid">
                <div class="grid-item">검증상태<br><strong>유효(조회성공)</strong></div>
                <div class="grid-item">사전 등록일<br><strong>2024/07/15</strong></div>
                <div class="grid-item">시험구분<br><strong>영어</strong></div>
                <div class="grid-item">시험종류<br><strong>OPIC</strong></div>
                <div class="grid-item">수험번호(등록번호)<br><strong>*******</strong></div>
                <div class="grid-item">인증기간<br><strong>2029/12/31</strong></div>
                <div class="grid-item">어학시험일<br><strong>2024/07/06</strong></div>
                <div class="grid-item">점수(총점)<br><strong>AL</strong></div>
            </div>

            <div class="section-title">항목별 상세점수</div>

            <div class="score-grid">
                <div class="score-item">듣기(청해)<br>-</div>
                <div class="score-item">읽기(독해)<br>-</div>
                <div class="score-item">쓰기<br>-</div>
                <div class="score-item">말하기<br>-</div>
                <div class="score-item">번역<br>-</div>



            <div class="button-group">
                <button class="btn btn-close">닫기</button>
            </div>
        </div>
    </div>

</body>
</html>
