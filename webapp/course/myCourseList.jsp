<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>수강 중인 강좌</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap"
	rel="stylesheet">

<style>
/* 전역 스타일 */
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

.container {
	display: flex;
	flex: 1;
}

.sidebar {
	width: 250px;
	background-color: #3d4a59;
	color: white;
	padding: 20px;
	min-height: 100vh;
}

.sidebar h2 {
	font-size: 18px;
	margin-bottom: 20px;
	border-bottom: 1px solid rgba(255, 255, 255, 0.2);
	padding-bottom: 10px;
}

.sidebar ul {
	list-style: none;
	padding: 0;
}

.sidebar ul li {
	margin-bottom: 15px;
}

.sidebar ul li a {
	text-decoration: none;
	color: #ccc;
	font-size: 14px;
	transition: color 0.3s;
}

.sidebar ul li a:hover {
	color: #0fbc8c;
}

.content {
	flex: 1;
	padding: 40px;
}

h1 {
	font-size: 28px;
	margin-bottom: 15px;
	color: #333;
}

.notice {
	background-color: #f8f9fa;
	border-left: 5px solid #007bff;
	padding: 15px;
	margin-bottom: 30px;
	color: #333;
	font-size: 14px;
	border-radius: 4px;
}

.filters {
	display: flex;
	justify-content: space-between;
	margin-bottom: 25px;
}

.filter-group select, .filter-group button {
	padding: 10px 15px;
	margin-left: 5px;
	font-size: 14px;
	cursor: pointer;
	border: 1px solid #ddd;
	border-radius: 4px;
	transition: background-color 0.3s;
}

.filter-group button:hover, .filter-group select:hover {
	background-color: #f0f0f0;
}

.course-card {
	display: flex;
	border: 1px solid #ddd;
	border-radius: 8px;
	padding: 20px;
	gap: 20px;
	margin-bottom: 20px;
	background-color: white;
	align-items: center;
	transition: box-shadow 0.3s;
}

.course-card:hover {
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.course-card img {
	width: 80px;
	height: 80px;
	border-radius: 50%;
}

.course-info {
	flex: 1;
}

.course-info h3 {
	font-size: 18px;
	margin-bottom: 8px;
	color: #333;
}

.course-info p {
	font-size: 14px;
	color: #666;
}

.buttons {
	display: flex;
	gap: 10px;
}

.buttons button {
	padding: 10px 15px;
	border-radius: 4px;
	border: none;
	cursor: pointer;
	font-size: 14px;
	transition: background-color 0.3s;
}

.blue-button {
	background-color: #007bff;
	color: white;
}

.blue-button:hover {
	background-color: #0056b3;
}

.grey-button {
	background-color: #6c757d;
	color: white;
}

.grey-button:hover {
	background-color: #5a6268;
}

.pagination {
	text-align: center;
	margin-top: 20px;
}

.pagination a {
	margin: 0 8px;
	text-decoration: none;
	color: #007bff;
	font-size: 14px;
	transition: color 0.3s;
}

.pagination a:hover {
	color: #0056b3;
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
	
	<c:if test="${sessionType eq 'p' }">
		<div class="sidebar">
			<h2>나의 학습방</h2>
			<ul>
				<li><a href="/mycourse">나의 강의실</a></li>
<!-- 				<li><a href="/mypage/mypost">내가 쓴 글</a></li> -->
<!-- 				<li><a href="/mypage/myreply">내가 단 댓글</a></li> -->
				<li><a href="/mycourse/report">성적표</a></li>
			</ul>
		</div>
	</c:if>
		<div class="content">
			<c:choose>
				<c:when test="${sessionType eq 'p' }">
					<h1>수강중인 강좌</h1>
					<div class="notice">${sessionName } 회원님의 현재 학습 중인 강좌를 확인할 수
				있습니다.</div>
					
				</c:when>
				<c:when test="${sessionType eq 't' }">
					<h1>내 강좌</h1>
					<div class="notice">${sessionName } 선생님의 강좌를 확인할 수
				있습니다.</div>
				</c:when>
			</c:choose>
			


			<c:forEach var="c" items="${list}">
				<div class="course-card">
					<div class="course-info">
						<h3>${c.courseInfo.title}</h3>
						<p>${c.courseInfo.subject}| ${c.courseInfo.teacherInfo.name} | ${c.status}</p>
					</div>
					<div class="buttons">
						<button class="grey-button"
							onclick="location.href='/course/lesson?idx=${c.courseInfo.idx}'">강의실 입장</button>
					</div>
				</div>
			</c:forEach>


			<%@ include file="/pageNo.jsp" %>
		</div>
	</div>

</body>
</html>
