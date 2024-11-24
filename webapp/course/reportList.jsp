<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>성적확인 및 등록</title>
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

        /* 성적확인 섹션 */
        .content {
            flex: 1;
            padding: 40px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 1500px;
        }

        h1 {
            font-size: 28px;
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        .table-container {
            margin-top: 20px;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
        }

        thead tr {
            background-color: #007bff;
            color: white;
        }

        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
            font-size: 16px;
        }

        th {
            font-weight: 700;
            color: #fff;
        }

        tbody tr:hover {
            background-color: #f1f1f1;
        }

        select {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        /* 추가적인 스타일 */
        select:focus {
            outline: 2px solid #007bff;
            outline-offset: 2px;
        }
    </style>

    <script>
        function saveGrade() {
            document.getElementById("report.jsp").submit();
        }
    </script>
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
                <li><a href="/mycourse">나의 강의실</a></li>
<!--                 <li><a href="#">내가 쓴 글</a></li> -->
<!--                 <li><a href="#">내가 단 댓글</a></li> -->
                <li><a href="/mycourse/report">성적표</a></li>
            </ul>
        </div>

        <!-- 성적확인 및 등록 섹션 -->
        <div class="content">
            <h1>성적확인</h1>

            <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>강좌</th>
                                <th>성적</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="item">
                        	<tr>
                                <td>${item.classInfo.title }</td>
                                <td>${item.score }</td>
                            </tr>
                        </c:forEach>
                            
                        </tbody>
                    </table>
            </div>
        </div>
    </div>

</body>
</html>
