<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강좌 상세 페이지</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
    <style>
        /* 전역 스타일 초기화 */
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
            max-width: 1200px;
            margin: 20px auto;
            gap: 20px;
        }

        /* 사이드바 */
        .sidebar {
            width: 250px;
            background-color: #3d4a59;
            color: white;
            padding: 20px;
            border-radius: 8px;
        }

        .sidebar h2 {
            margin-bottom: 20px;
            font-size: 18px;
        }

        .sidebar ul {
            list-style: none;
        }

        .sidebar ul li {
            margin-bottom: 15px;
        }

        .sidebar ul li a {
            text-decoration: none;
            color: white;
            font-size: 14px;
        }

        /* 수강후기 컨테이너 */
        .container {
            flex: 1;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width : 1200px;
        }
        .container1 {
            flex: 1;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width : 100%;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
        }

        .header h2 {
            font-size: 24px;
            color: #333;
        }

        .rating {
            font-size: 24px;
            color: #007bff;
        }

        .meta-info {
            font-size: 14px;
            color: #666;
        }

        .content {
            margin-bottom: 20px;
            line-height: 1.6;
            font-size: 16px;
        }

        /* 신고 및 수정, 삭제 버튼 */
        .action-buttons {
            display: flex;
            gap: 10px;
        }

        .report-button {
            display: inline-block;
            padding: 6px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            text-decoration: none;
            color: #555;
            font-size: 14px;
            background-color: #f9f9f9;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }

        .report-button:hover {
            background-color: #e0e0e0;
            color: #333;
        }

        .report-button:active {
            background-color: #d6d6d6;
            color: #222;
        }

        /* 댓글 섹션 */
        .comment-section {
            margin-top: 30px;
            border-top: 1px solid #ddd;
            padding-top: 15px;
        }

        .comment-section h3 {
            margin-bottom: 10px;
            font-size: 18px;
        }

        .comment-box {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .comment-box textarea {
            width: 100%;
            height: 80px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            resize: none;
        }

        .comment-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .comment-footer span {
            font-size: 12px;
            color: #666;
        }

        .comment-footer input {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .comment-footer input:hover {
            background-color: #0056b3;
        }

        /* 댓글 */
        .comment-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-top: 10px;
            border-left: 4px solid #007bff;
            transition: transform 0.2s ease-in-out;
        }

        .comment-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        .author {
            font-weight: bold;
            color: #333;
            font-size: 18px;
        }

        .date {
            font-size: 14px;
            color: #888;
        }

        .comment-content {
            margin-top: 10px;
            line-height: 1.6;
            color: #555;
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
    <!-- 메인 컨테이너 -->
    <div class="main-container">
        <%@ include file="common/commonjsp.jsp" %>
        <div class="tabs">
                
                <div class="tab" onclick="location.href='/course/lesson?idx=${item.courseIdx}'">강의목차</div>
                <div class="tab" onclick="location.href='/course/notice?idx=${item.courseIdx}'">공지사항</div>
                <div class="tab" onclick="location.href='/course/qna?idx=${item.courseIdx}'">Q&A</div>
                <div class="tab active" onclick="location.href='/course/review?idx=${item.courseIdx}'">수강후기</div>
                <div class="tab" onclick="location.href='/course/archive?idx=${item.courseIdx}'">자료실</div>
            </div>

        <div class="container1">
            <div class="header">
                <div>
                    <span class="rating"><c:forEach begin="1" end="${item.score}">★</c:forEach></span>
                    <h2>${item.title }</h2>
                    <div class="meta-info">작성자: ${item.memberId } | 등록일: ${item.regDate} | 조회수: ${item.readCnt}</div>
                </div>
                <c:if test="${sessionMemberId == item.memberId }">
                <div class="action-buttons">
                    <a href="#" class="report-button">수정</a>
                    <a href="#" class="report-button">삭제</a>
                </div>
                </c:if>
            </div>

            <div class="content">
                강의가 많은 도움이 됩니다.
            </div>

            
        </div>
    </div>
</body>
</html>
