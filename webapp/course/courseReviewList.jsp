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
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
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

        .toggle {
            display: flex;
            align-items: center;
        }

        .toggle span {
            margin-right: 5px;
        }

        .toggle button {
            background-color: #ddd;
            border: none;
            border-radius: 15px;
            width: 40px;
            height: 20px;
            position: relative;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .toggle button::before {
            content: '';
            position: absolute;
            width: 16px;
            height: 16px;
            border-radius: 50%;
            background-color: white;
            top: 2px;
            left: 2px;
            transition: 0.3s;
        }

        .toggle.on button {
            background-color: #007bff;
        }

        .toggle.on button::before {
            left: 22px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
            font-size: 14px;
        }

        th {
            background-color: #f8f9fa;
            font-weight: bold;
        }

        .badge {
            background-color: #ffcc00;
            color: white;
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 12px;
            margin-right: 5px;
        }

        .stars {
            color: #ffc107;
        }

        .status-tag {
            background-color: #007bff;
            color: white;
            border-radius: 15px;
            padding: 5px 8px;
            font-size: 12px;
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
        /* 신고 및 수정, 삭제 버튼 */
        .action-buttons {
            display: flex;
            gap: 10px;
            margin-top : 10px;
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
    
        <!-- 사이드바 -->
        <div class="main-container">
        <%@ include file="common/commonjsp.jsp" %>
        	<div class="tabs">
                
                <div class="tab" onclick="location.href='/course/lesson?idx=${param.idx}'">강의목차</div>
                <div class="tab" onclick="location.href='/course/notice?idx=${param.idx}'">공지사항</div>
                <div class="tab" onclick="location.href='/course/qna?idx=${param.idx}'">Q&A</div>
                <div class="tab active" onclick="location.href='/course/review?idx=${param.idx}'">수강후기</div>
                <div class="tab" onclick="location.href='/course/archive?idx=${param.idx}'">자료실</div>
           </div>
            
            <div class="container">
<!--     <div class="search-bar"> -->
<!--         <select> -->
<!--             <option>제목</option> -->
<!--             <option>작성자</option> -->
<!--         </select> -->
<!--         <input type="text" placeholder="검색어를 입력하세요."> -->
<!--     </div> -->

    <table>
        <thead>
            <tr>
                
                <th>평가</th>
                <th>제목</th>
                <th>작성자</th>
                <th>등록일</th>
                <th>조회수</th>
            </tr>
        </thead>
        <tbody>
        <!-- 별 개수는 DB 에서 맏아서 정해주세용 -->
        <c:forEach items="${list}" var="item">
        	<tr>
                <td class="stars"><c:forEach begin="1" end="${item.score}">★</c:forEach></td>
                <td><a href="/course/review/view?idx=${item.idx}">${item.title}</a></td>
                <td>${item.memberId}</td>
                <td>${item.regDate}</td>
                <td>${item.readCnt}</td>
            </tr>
        </c:forEach>
<!--             <tr> -->
<!--                 <td class="stars">★★★★★</td> -->
<!--                 <td>쌤 따라 수능까지 쫄래쫄래</td> -->
<!--                 <td>양*서</td> -->
<!--                 <td>24.09.27</td> -->
<!--                 <td>481</td> -->
<!--             </tr> -->

        </tbody>
    </table>
    
    <c:if test="${sessionType eq 'p' }">
    
    <div class="action-buttons">
    	<a href="/course/review/regist?idx=${param.idx}" class="report-button">등록</a>   
    </div>
	</c:if>
    <%@ include file="/pageNo.jsp" %>
</div>

            <div class="footer-banner">
                <img src="<%= request.getContextPath() %>/images/banner3.png" alt="배너 이미지">
                <p>무료체험 학습을 통해 스마트해법수학을 체험하실 수 있습니다.</p>
            </div>
      </div>
	</div>
</div>
        

</body>
</html>
