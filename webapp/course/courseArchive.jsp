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

        /* 메인 컨테이너 */
        .main-container {
            display: flex;
            flex: 1;
            max-width: 1200px;
            margin: 20px auto;
            gap: 20px; /* 사이드바와 컨테이너 간의 간격 */
        }

        /* 사이드바 스타일 */
        .sidebar {
            width: 250px;
            background-color: #3d4a59;
            color: white;
            padding: 20px;
            border-radius: 8px;
            height: auto;
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

        /* 강좌 상세 컨테이너 */
        .container {
            flex: 1;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .course-header {
            display: flex;
            padding: 20px;
            align-items: center;
            border-bottom: 1px solid #ddd;
        }

        .course-header img {
            width: 120px;
            height: auto;
            border-radius: 8px;
            margin-right: 20px;
        }

        .course-info h2 {
            font-size: 22px;
            color: #333;
            margin-bottom: 8px;
        }

        .tags {
            display: flex;
            gap: 10px;
            margin-bottom: 10px;
        }

        .tag {
            background-color: #007bff;
            color: white;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
        }

        .buttons {
            margin-top: 10px;
        }

        .buttons button {
            padding: 10px 20px;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            font-size: 14px;
            margin-right: 10px;
            transition: background-color 0.3s;
        }

        .btn-blue {
            background-color: #007bff;
            color: white;
        }

        .btn-blue:hover {
            background-color: #0056b3;
        }

        .btn-grey {
            background-color: #6c757d;
            color: white;
        }

        .btn-grey:hover {
            background-color: #5a6268;
        }

        .progress-container {
            display: flex;
            justify-content: space-between;
            padding: 20px;
            background-color: #f8f9fa;
        }

        .progress-circle {
            width: 80px;
            height: 80px;
            background-color: #007bff;
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
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

        .tab-content {
            padding: 20px;
        }

        .footer-banner {
            text-align: center;
            margin-top: 30px;
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
        }

        .footer-banner img {
            max-width: 100%;
            height: auto;
        }
        h3 {
            font-size: 18px;
            margin-bottom: 10px;
            color: #333;
            border-bottom: 2px solid #007bff;
            display: inline-block;
            padding-bottom: 5px;
        }

        .section {
            margin-bottom: 20px;
        }

        .section ul {
            list-style-type: disc;
            margin-left: 20px;
            margin-top: 10px;
        }

        .section ul li {
            margin-bottom: 8px;
            line-height: 1.6;
        }

        .highlight {
            color: #007bff;
            font-weight: bold;
        }

        .section ul li span {
            color: #333;
        }

        .heart {
            color: red;
            margin-left: 5px;
        }

        .title {
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }
        .search-bar {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .search-bar select,
        .search-bar input {
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-right: 10px;
            font-size: 14px;
        }

        .search-bar input {
            flex: 1;
        }

        .search-bar button {
            background-color: white;
            border: 1px solid #ddd;
            padding: 8px 12px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .search-bar button:hover {
            background-color: #007bff;
            color: white;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f8f9fa;
            font-weight: bold;
        }

        .icon {
            width: 18px;
            height: 18px;
            background-image: url('https://cdn-icons-png.flaticon.com/512/159/159604.png');
            background-size: cover;
            display: inline-block;
            margin-left: 5px;
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
                <div class="tab" onclick="location.href='/course/lesson?idx=${param.idx}'">강의목차</div>
                <div class="tab" onclick="location.href='/course/notice?idx=${param.idx}'">공지사항</div>
                <div class="tab" onclick="location.href='/course/qna?idx=${param.idx}'">Q&A</div>
                <div class="tab" onclick="location.href='/course/review?idx=${param.idx}'">수강후기</div>
                <div class="tab active" onclick="location.href='/course/archive?idx=${param.idx}'">자료실</div>
          </div>

            
            <div class="container">

    <p>게시글 ${count }개</p>

    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>구분</th>
                <th>제목</th>
                <th>등록일</th>
                <th>조회수</th>
            </tr>
        </thead>
        <tbody>
        
        <c:forEach items="${list}" var="item" varStatus="s">
        	<tr>
                <td>${s.count }</td>
                <td>강의자료</td>
                <td><a href="/course/archive/view?idx=${item.idx}">${item.title}</a></td>
                <td>${item.regDate }</td>
                <td>${item.readCnt }</td>
            </tr>
        
        </c:forEach>
        
        </tbody>
    </table>
    <c:if test="${sessionMemberId eq courseInfo.teacherId }">
		<div class="action-buttons">
    	<a href="/teacher/archive/regist?idx=${param.idx }" class="report-button">등록</a>   
    </div>
    </c:if>

    <%@ include file="/pageNo.jsp" %>
    
    <div class="footer-banner">
                <img src="<%= request.getContextPath() %>/images/banner3.png" alt="배너 이미지">
                <p>무료체험 학습을 통해 스마트해법수학을 체험하실 수 있습니다.</p>
            </div>
      </div>
	</div>
</div>
        

</body>
</html>
