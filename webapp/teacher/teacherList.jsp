<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스마트해법</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background-image: url(<%= request.getContextPath() %>/images/background.jpeg);
            color: #333;
            line-height: 1.6;
        }

        .body2 {
            background-color: white;
            width: 1500px;
            margin: 0 auto;
        }

        .body2 img {
            width: 100%;
        }

        .container {
            width: 1100px;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .teacher-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
        }

        .teacher-card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
        }

        .teacher-card img {
            width: 100%;
            border-radius: 2%;
            margin-bottom: 15px;
        }

        .teacher-card h4 {
            margin: 10px 0;
            font-size: 1.2em;
        }

        .teacher-card p {
            color: #666;
            margin: 5px 0 15px;
        }

        .buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #a09f9f;
        }

        @media (max-width: 768px) {
            .teacher-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 480px) {
            .teacher-grid {
                grid-template-columns: 1fr;
            }
        }

        .tab-menu {
            width: 100%;
            border-bottom: 1px solid #ddd;
            margin-top: 20px;
        }

        .tabs {
            display: flex;
            justify-content: center;
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .tabs li {
            flex: 1;
            text-align: center;
            border-right: 1px solid #ddd;
        }

        .tabs li:last-child {
            border-right: none;
        }

        .tabs a {
            display: block;
            padding: 15px 0;
            text-decoration: none;
            color: #888;
            font-size: 16px;
        }

        .tabs .active a {
            font-weight: bold;
            color: black;
            border-bottom: 2px solid black;
        }

        .tabs a:hover {
            background-color: #f1f1f1;
        }

        .footer {
            background-color: #0044cc;
            color: white;
            text-align: center;
            padding: 15px 0;
            margin-top: 20px;
        }

        .footer p {
            margin: 0;
            font-size: 14px;
        }

        html {
            scroll-behavior: smooth;
        }

        .scroll-top-button {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: #888787;
            color: white;
            border: none;
            font-size: 24px;
            text-align: center;
            line-height: 50px;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s, transform 0.3s;
        }

        .scroll-top-button:hover {
            background-color: #0056b3;
            transform: scale(1.1);
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
    <div class="body2" id="main">
        <img src="<%= request.getContextPath() %>/images/banner4.png" alt="이미지">
        
        <div class="tab-menu">
            <ul class="tabs">
                <li ${param.subject eq null ? 'class="active"' : '' } ><a href="/teacher">전체</a></li>
                <li ${param.subject eq '국어' ? 'class="active"' : '' }><a href="/teacher?subject=국어">국어</a></li>
                <li ${param.subject eq '수학' ? 'class="active"' : '' }><a href="/teacher?subject=수학">수학</a></li>
                <li ${param.subject eq '영어' ? 'class="active"' : '' }><a href="/teacher?subject=영어">영어</a></li>
                <li ${param.subject eq '과학' ? 'class="active"' : '' }><a href="/teacher?subject=과학">과학</a></li>
                <li ${param.subject eq '사회' ? 'class="active"' : '' }><a href="/teacher?subject=사회">사회</a></li>
                <li ${param.subject eq '한국사' ? 'class="active"' : '' }><a href="/teacher?subject=한국사">한국사</a></li>
            </ul>
        </div>

        <a href="#main" class="scroll-top-button" onclick="scrollToTop(event)">▲</a>

        <div class="container">
            <h1>${param.subject != null ? param.subject : "전체"}</h1>
            <div class="teacher-grid">
                <c:forEach items="${list}" var="item">
                    <div class="teacher-card">
                    		<div style="width:210px; height:283px;">
												  <img src="<%= request.getContextPath() %>/uploads/teacher/${item.teacherId}_profile.png" alt="${item.name}" style="width:100%; height:100%; object-fit:cover;">
												</div>
                        <h4>${item.description}</h4>
                        <p>${item.name} 선생님</p>
                        <div class="buttons">
                            <button onclick="location.href='/teacher/view?id=${item.teacherId}'">프로필</button>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <footer class="footer">
        <p>&copy; 2024 스마트해법. All Rights Reserved.</p>
    </footer>

    <script>
        function scrollToTop(event) {
            event.preventDefault();
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }
    </script>
</body>
</html>
