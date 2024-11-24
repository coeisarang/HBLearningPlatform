<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
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
	background-color: #e3f2fd; /* 하늘색 배경 */
	color: #333;
	line-height: 1.6;
}

.body2 {
	width: 1200px;
	margin: 0px auto;
}

.container {
	display: flex;
	max-width: 1200px;
	height: 1200px;
	margin: 0 auto;
	background-color: white;
	border-radius: 8px;
	overflow: hidden;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	margin-top: 20px;
}

.sidebar {
	width: 250px;
	background-color: #003366;
	color: white;
	padding: 20px;
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.sidebar-header {
	display: flex;
	align-items: center;
	gap: 10px;
}

.sidebar-header .logo {
	border-radius: 50%;
}

.menu {
	list-style: none;
	padding: 0;
}

.menu li {
	margin-bottom: 10px;
}

.menu a {
	color: white;
	text-decoration: none;
}

.ads img {
	width: 200px;
	margin-bottom: 10px;
	border-radius: 8px;
}

.main-content {
	width: 100%;
	background-color: white;
	padding: 40px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

h1 {
	font-size: 24px;
	margin-bottom: 20px;
}

.search-filter {
	display: flex;
	gap: 10px;
	margin-bottom: 10px;
}

.search-filter input {
	flex: 1;
	padding: 8px;
	border: 1px solid #ddd;
	border-radius: 4px;
}

.search-filter select, .search-filter button {
	padding: 8px;
	border: 1px solid #ddd;
	border-radius: 4px;
	background-color: white;
}

.summary {
	display: flex;
	justify-content: space-between;
	margin-bottom: 10px;
	font-size: 14px;
	color: #666;
}

.summary span {
	color: red;
}

table {
	width: 100%;
	border-collapse: collapse;
}

thead th {
	border-bottom: 2px solid #ddd;
	padding: 10px;
	text-align: left;
	font-weight: bold;
}

tbody tr {
	border-bottom: 1px solid #eee;
}

tbody td {
	padding: 10px;
	vertical-align: middle;
}

.tag {
	display: inline-block;
	background-color: black;
	color: white;
	padding: 2px 6px;
	border-radius: 4px;
	font-size: 12px;
}

.new-badge {
	background-color: red;
	color: white;
	font-size: 10px;
	padding: 2px 4px;
	border-radius: 4px;
	margin-left: 8px;
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

/* 푸터 */
.footer {
	background-color: #0044cc;
	color: white;
	text-align: center;
	padding: 15px 0;
	margin-top: 20px;
	width: 100%;
}

.footer p {
	margin: 0;
	font-size: 14px;
}

.pagination {
	display: flex;
	align-items: center;
	justify-content: center; /* Center-aligns horizontally */
	gap: 5px;
	margin-top: 15px;
}

.page-btn {
	border: 1px solid #ddd;
	background-color: white;
	color: #333;
	padding: 5px 10px;
	border-radius: 4px;
	cursor: pointer;
	font-size: 14px;
}

.page-btn.active {
	background-color: #007bff;
	color: white;
}

.page-btn:hover {
	background-color: #f1f1f1;
}

.page-btn:disabled {
	cursor: not-allowed;
	opacity: 0.5;
}


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

header {
	background-color: white;
	padding: 15px 30px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	border-bottom: 2px solid #ddd;
	position: relative;
	z-index: 10;
}

.container2 {
	width: 80%;
	/*             margin: 30px auto; */
	background-color: white;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
	margin-bottom: 20px;
	font-size: 24px;
	font-weight: 700;
	color: #2c3e50;
}

.button-container {
	display: flex;
	justify-content: space-between;
	margin-bottom: 15px;
}

.search-container {
	display: flex;
	gap: 5px;
}

.search-text {
	font-size: 16px;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	width: 250px;
}

.search-icon {
	width: 40px;
	height: 40px;
	background-image:
		url('https://cdn-icons-png.flaticon.com/512/622/622669.png');
	background-size: cover;
	border: none;
	cursor: pointer;
}

.edit-button {
	padding: 10px 20px;
	background-color: #a09f9f;
	color: white;
	border: none;
	border-radius: 8px;
	font-size: 14px;
	cursor: pointer;
	transition: background-color 0.3s, color 0.3s;
}

.edit-button:hover {
	background-color: white;
	color: #007bff;
	border: 1px solid #007bff;
}

.lecture-list-header {
	display: flex;
	justify-content: space-between;
	margin: 20px 0px;
	border-bottom: 1px solid #ddd;
	padding-bottom: 10px;
	font-weight: 600;
	color: #666;
}

.list-item {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 15px 0;
	border-bottom: 1px solid #ddd;
}

.list-item:last-child {
	border-bottom: none;
}

.item-info h3 {
	font-size: 18px;
	margin-bottom: 5px;
	font-weight: 600;
	color: #333;
}

.item-info span {
	font-size: 14px;
	color: #666;
}

.status-indicator {
	width: 30px;
	height: 30px;
	border-radius: 50%;
	border: 2px solid #007bff;
	display: flex;
	align-items: center;
	justify-content: center;
	cursor: pointer;
	transition: background-color 0.3s, color 0.3s;
}

.status-indicator.complete {
	background-color: #007bff;
	color: white;
}

.status-indicator::before {
	content: '✔';
	font-size: 16px;
	display: none;
}

.status-indicator.complete::before {
	display: block;
}

.lecture-empty {
	text-align: center;
	margin-top: 50px;
	color: #aaa;
}

.lecture-empty img {
	width: 80px;
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="adminlogindesignheader.jsp"%>
	<div class="body2">


		<div class="container">
			<div class="sidebar">
				<div class="sidebar-header">
					<h2>회원문의</h2>
				</div>
			</div>
			<!-- 리스트 -->
			<div class="main-content">
			<h2>회원문의</h2>
			<c:forEach var="p" items="${list}">
				<hr>
				<div class="list-item">
					<div class="item-info">
						<h3>
							<a href="/admin/qna/view?idx=${p.idx }">${p.title}</a>
						</h3>
						<span>작성자: ${p.memberId}</span> <span>등록일: ${p.regDate}</span>
					</div>
					<div class="status-action">
						<c:choose>
							<c:when test="${p.status == 'Y'}">
								<span class="status-complete">답변 완료</span>
							</c:when>
							<c:otherwise>
								<span>답변 대기 중</span>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<hr>
			</c:forEach>
			


			<!-- QnA 글이 없을 시 -->
			<c:if test="${empty list}">
				<div class="lecture-empty">
					<img src="https://cdn-icons-png.flaticon.com/512/83/83562.png"
						alt="QnA 없음 아이콘">
					<p>작성된 QnA가 없습니다.</p>
				</div>
			</c:if>
		</div>
		</div>

		<%@ include file="/pageNo.jsp"%>

		<!-- 파이널 패키지 안내 -->
		<section class="final-package">
			<img src="<%=request.getContextPath()%>/images/mainlogo.png"
				alt="스마트해법 로고">
			<h2>The Last Chance</h2>
			<p>2024 스마트해법과 함께하세요!</p>
		</section>
	</div>


	<!-- 푸터 -->
	<footer class="footer">
		<p>&copy; 2024 스마트해법. All Rights Reserved.</p>
	</footer>


</body>
</html>
