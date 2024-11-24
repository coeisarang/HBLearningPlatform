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

        .container {
            flex: 1;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
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

        .search-bar {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }

        .search-bar select, 
        .search-bar input {
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        .search-bar input {
            flex: 1;
            margin-left: 10px;
        }

        .search-bar button {
            background-color: white;
            border: none;
            cursor: pointer;
        }

        .search-bar button img {
            width: 20px;
            height: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, 
        td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
            font-size: 14px;
        }

        th {
            background-color: #f8f9fa;
            font-weight: 700;
        }

        .pagination {
            text-align: center;
            margin-top: 15px;
        }

        .pagination a {
            margin: 0 5px;
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }

        .pagination a.active {
            color: black;
        }

        .action-buttons {
            display: flex;
            gap: 10px;
            margin-top: 10px;
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
    </style>
</head>
<body>
    <!-- 상단 헤더 포함 -->
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
                
                <div class="tab" onclick="location.href='/course/lesson?idx=${param.idx}'">강의목차</div>
                <div class="tab" onclick="location.href='/course/notice?idx=${param.idx}'">공지사항</div>
                <div class="tab active" onclick="location.href='/course/qna?idx=${param.idx}'">Q&A</div>
                <div class="tab" onclick="location.href='/course/review?idx=${param.idx}'">수강후기</div>
                <div class="tab" onclick="location.href='/course/archive?idx=${param.idx}'">자료실</div>
          </div>
            
            <div class="container">
<!--     <div class="search-bar"> -->
<!--         <select> -->
<!--             <option>제목</option> -->
<!--             <option>작성자</option> -->
<!--         </select> -->
<!--         <input type="text" placeholder="검색어를 입력하세요."> -->
<!--         <button> -->
<!--             <img src="https://cdn-icons-png.flaticon.com/512/622/622669.png" alt="검색 아이콘"> -->
<!--         </button> -->
<!--     </div> -->

    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>구분</th>
                <th>제목</th>
                <th>답변</th>
            </tr>
        </thead>
        <tbody>
        
        <c:forEach items="${list}" var="item" varStatus="s">
        	<tr>
                <td>${s.count}</td>
                <td>QnA</td>
                <td><a href="/course/qna/view?idx=${item.idx}">${item.title}</a></td>
                <td>
                    <c:choose>
                        <c:when test="${item.status == 'Y'}">
                            <span class="status-complete">답변 완료</span>
                        </c:when>
                        <c:otherwise>
                            <span>답변 대기 중</span>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
    
    <c:if test="${sessionType eq 'p'}">
    <div class="action-buttons">
    	<a href="/course/qna/regist?idx=${param.idx}" class="report-button">등록</a>   
    </div>
</c:if>
    <%@ include file="/pageNo.jsp" %>
</div>


	</div>
        

</body>
</html>
