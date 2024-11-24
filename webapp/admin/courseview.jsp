<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
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
    text-align : center;
}

tbody td {
    padding: 10px;
    vertical-align: middle;
    white-space: nowrap; /* 텍스트 줄바꿈 방지 */
    overflow: hidden;    /* 넘치는 텍스트 숨기기 */
    text-overflow: ellipsis; /* 넘치는 텍스트를 '...' 처리 */
    max-width: 200px; /* 필요에 따라 컬럼 너비 조정 */
    text-align: left;
}

.thead th {
    border-bottom: 2px solid #ddd;
    padding: 10px;
    text-align: center;
    font-weight: bold;
}

.tbody td {
    padding: 10px;
    vertical-align: middle;
    white-space: nowrap; /* 텍스트 줄바꿈 방지 */
    overflow: hidden;    /* 넘치는 텍스트 숨기기 */
    text-overflow: ellipsis; /* 넘치는 텍스트를 '...' 처리 */
    max-width: 200px; /* 필요에 따라 컬럼 너비 조정 */
    text-align: center;
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

/*페이징 하는 영역 */
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
	margin-top : 8px;
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
.action-buttons button {
    padding: 8px 16px;
    border: none;
    border-radius: 4px;
    font-size: 14px;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.2s;
    color: white;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

/* 수정 버튼 */
.modify-button {
    background-color: #4CAF50; /* 녹색 */
}

.modify-button:hover {
    background-color: #45a049;
}

.modify-button:active {
    transform: scale(0.98); /* 클릭 시 약간 축소 */
}

/* 삭제 버튼 */
.delete-button {
    background-color: #f44336; /* 빨간색 */
}

.delete-button:hover {
    background-color: #e53935;
}

.delete-button:active {
    transform: scale(0.98); /* 클릭 시 약간 축소 */
}

/* 버튼 간 간격 조정 */
.action-buttons {
    display: flex;
    gap: 10px; /* 버튼 사이 간격 */
}


</style>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="adminlogindesignheader.jsp"%>
	<div class="body2">


		<div class="container">
			<!-- Sidebar -->
			<div class="sidebar">
				<div class="sidebar-header">
					<h2>강좌 관리</h2>
				</div>
			</div>

			<!-- Main Content -->
			<div class="main-content">
				<h1>${dto.teacherInfo.name } 선생님의 ${dto.title }</h1>
				<table class="tbody">
					<tr>
						<th>강좌번호</th>
						<th>학년</th>
						<th>과목</th>
						<th>회차설명</th>
						<th>가격</th>
						<th>등록일</th>
					</tr>
					<tr>
						<td>${dto.idx}</td>
						<td>${dto.school }${dto.grade }</td>
						<td>${dto.subject }</td>
						<td>${dto.detail}</td>
						<td>${dto.price }</td>
						<td>${dto.regDate }</td>
					</tr>
				</table>

				

				<table>
					<thead>
						<tr>
							<th>강의 회차</th>
							<th>제목</th>
							<th>설명</th>
							<th>영상 링크</th>
							<th>수정/삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="item" varStatus="loop">
							<tr>
								<td><span>${item.order}</span></td>
								<td>${item.title}</td>
								<td>${item.content}</td>
								<td>${item.videoPath }</td>
								<td>
    <div class="action-buttons">
        <button class="modify-button" 
            onclick="location.href='/admin/lesson/modify?idx=${item.idx}&courseIdx=${dto.idx}'">수정</button>
        
        <button class="delete-button" 
            onclick="location.href='/admin/lesson/delete?idx=${item.idx}&courseIdx=${dto.idx}'">삭제</button>
    </div>
</td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:set var="lastIndex" value="${fn:length(list)}" /> 
				<div class="search-filter">
					<button class="page-btn" onclick="location.href='/admin/lesson/regist?idx=${dto.idx }&lastOrder=${lastIndex + 1}'">강의 등록</button>
				</div>
				

			</div>
		</div>


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
