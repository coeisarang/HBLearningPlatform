<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강좌 상세 페이지</title>
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
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .main-container {
            display: flex;
            flex: 1;
            width: 1500px;
            margin: 20px auto;
            gap: 20px;
        }

        .sidebar {
            width: 250px;
            background-color: #3d4a59;
            color: white;
            padding: 20px;
            border-radius: 8px;
        }

        .container {
            flex: 1;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .lecture-item {
            display: flex;
            align-items: center;
            border-bottom: 1px solid #ddd;
            padding: 15px 0;
        }

        .lecture-info {
            flex: 1; /* 남은 공간을 차지 */
        }

        .lecture-info h3 {
            font-size: 16px;
            margin-bottom: 5px;
            font-weight: 700;
            color: #333;
        }

        .lecture-info p {
            font-size: 14px;
            color: #777;
        }

        .button-group {
            display: flex;
            gap: 10px;
            margin-left: auto; /* 버튼 그룹을 오른쪽으로 정렬 */
        }

        .button-group a {
            text-decoration: none;
            color: #007bff;
            border: 1px solid #007bff;
            border-radius: 4px;
            padding: 5px 10px;
            transition: background-color 0.3s, color 0.3s;
        }

        .button-group a:hover {
            background-color: #007bff;
            color: white;
        }

        .status-button2 {
            width: 70px;
            height: 70px;
            border: 2px solid #878888;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #878888;
            font-size: 14px;
            font-weight: bold;
            text-align: center;
            margin-left: 10px;
        }

        .status-button {
            width: 70px;
            height: 70px;
            border: 2px solid #007bff;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #007bff;
            font-size: 14px;
            font-weight: bold;
            text-align: center;
            margin-left: 10px;
            transition: background-color 0.3s, color 0.3s;
        }

        .status-button:hover {
            background-color: #007bff;
            color: white;
        }

        .tabs {
            display: flex;
            justify-content: space-around;
            border-bottom: 2px solid #ddd;
            margin-top: 20px;
        }

        .tab {
            padding: 10px 0;
            flex: 1;
            text-align: center;
            cursor: pointer;
            font-weight: 700;
            color: #666;
            border-bottom: 3px solid transparent;
            transition: color 0.3s, border-bottom 0.3s;
        }

        .tab.active {
            color: #007bff;
            border-bottom: 3px solid #007bff;
        }

        .lecture-list {
            margin-top: 20px;
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

	<div class="main-container">
        <%@ include file="common/commonjsp.jsp" %>

        <div class="tabs">
            
            <div class="tab active" onclick="location.href='/course/lesson?idx=${param.idx}'">강의목차</div>
            <div class="tab" onclick="location.href='/course/notice?idx=${param.idx}'">공지사항</div>
            <div class="tab" onclick="location.href='/course/qna?idx=${param.idx}'">Q&A</div>
            <div class="tab" onclick="location.href='/course/review?idx=${param.idx}'">수강후기</div>
            <div class="tab" onclick="location.href='/course/archive?idx=${param.idx}'">자료실</div>
        </div>

        <div class="container">
            <h2>강의 목록</h2>
            <div class="lecture-list">
                <c:forEach var="item" items="${list}">
                    <div class="lecture-item">
                        <div class="lecture-info">
                            <h3>${item.order}강 - ${item.title}</h3>
                        </div>
                        <div class="button-group">
                            <a href="/course/lesson/view?idx=${item.idx}">학습하기</a>
                        </div>
 
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>
