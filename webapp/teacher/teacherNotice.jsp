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
        /* 전역 스타일 초기화 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background-color: #e3f2fd; /* 하늘색 배경 */
            color: #333;
            line-height: 1.6;
        }

        .body2 {
            width: 1500px;
            margin: 0 auto;
        }

        .qa-container {
            max-width: 1200px;
            margin: 30px auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .teacher-header {
            display: flex;
            align-items: center;
            gap: 20px;
            margin-bottom: 20px;
        }

        .teacher-header img {
            width: 100px;
            border-radius: 50%;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .teacher-info h1 {
            margin: 10px 0;
            font-size: 24px;
            color: #007bff;
        }

        .profile-button {
            display: inline-block;
            margin-top: 5px;
            padding: 8px 12px;
            border: 1px solid #007bff;
            color: #007bff;
            text-decoration: none;
            border-radius: 4px;
        }

        .profile-button:hover {
            background-color: #007bff;
            color: white;
        }

        /* Q&A 테이블 스타일 */
        .qa-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        .qa-table th, .qa-table td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        .qa-table th {
            background-color: #f1f1f1;
            font-weight: bold;
        }

        .qa-table tbody tr:hover {
            background-color: #f9f9f9;
        }

        .new-icon {
            background-color: #ff5252;
            color: white;
            font-size: 12px;
            padding: 2px 4px;
            border-radius: 4px;
            margin-left: 5px;
        }

        /* 페이지네이션 스타일 */
        .pagination {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }

        .pagination a {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            text-decoration: none;
            color: #007bff;
        }

        .pagination a:hover {
            background-color: #007bff;
            color: white;
        }

        /* 파이널 패키지 안내 */
        .final-package {
            text-align: center;
            padding: 20px;
            background-color: white;
            margin: 40px 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .final-package img {
            width: 100%;
            height: auto;
        }

        .final-package h2 {
            margin-top: 10px;
            color: #0fbc8c;
        }

        /* 푸터 스타일 */
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
	<div class="body2">
        <div class="qa-container">
            <!-- 강사 소개 -->
            <div class="teacher-header">
                <img src="<%= request.getContextPath() %>/uploads/teacher/${teacherInfo.teacherId }_profile.png" alt="${teacherInfo.name } 선생님">
                <div class="teacher-info">
                    <p>국어 학습의 자신감은 <strong>국어 중심지에서!</strong></p>
                    <h1>서지은 선생님</h1>
                    <a href="teacherView.jsp" class="profile-button">프로필</a>
                </div>
            </div>

            <!-- Q&A 섹션 -->
            <h2>공지사항</h2>
            <p>총 <strong>6887</strong>건의 게시글이 있습니다.</p>

            <table class="qa-table">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>등록일</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="item" varStatus="s">
                        <tr>
                            <td>${s.count}</td>
                            <td>${item.title}<span class="new-icon">N</span></td>
                            <td>${teacherInfo.name}</td>
                            <td>${item.regDate}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- 페이지네이션 -->
            <div class="pagination">
                <a href="#">이전 페이지</a>
                <a href="#">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
                <a href="#">다음 페이지</a>
            </div>
        </div>

        <!-- 파이널 패키지 안내 -->
        <section class="final-package">
            <img src="<%= request.getContextPath() %>/images/mainlogo.png" alt="스마트해법 로고">
            <h2>The Last Chance</h2>
            <p>2024 스마트해법과 함께하세요!</p>
        </section>
    </div>

    <footer class="footer">
        <p>&copy; 2024 스마트해법. All Rights Reserved.</p>
    </footer>

    <script>
        function filterSubject(subject) {
            const cards = document.querySelectorAll('.subject-card');
            cards.forEach(card => {
                card.style.display = subject === 'all' || card.classList.contains(subject) ? 'block' : 'none';
            });
        }
    </script>
</body>
</html>
