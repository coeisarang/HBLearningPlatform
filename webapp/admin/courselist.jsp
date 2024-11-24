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
	margin-top : 10px;
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
	 white-space: nowrap; /* 텍스트 줄바꿈 방지 */
    overflow: hidden;    /* 넘치는 텍스트 숨기기 */
    text-overflow: ellipsis; /* 넘치는 텍스트를 '...' 처리 */
	
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
.input-group {
    display: flex;
    flex-wrap: wrap; /* 화면이 작아질 때 줄바꿈 허용 */
    gap: 15px; /* 각 요소 간의 간격 */
    justify-content: center; /* 중앙 정렬 */
    margin-top: 20px;
}

.input-group select,
.input-group input[type="text"],
.input-group input[type="submit"] {
    padding: 10px 15px;
    border: 1px solid #ddd;
    border-radius: 8px;
    font-size: 16px;
    outline: none;
    transition: all 0.3s ease;
    min-width: 150px; /* 각 셀렉트 박스의 최소 너비 설정 */
}

/* 호버 및 포커스 효과 */
.input-group select:hover,
.input-group input[type="text"]:hover,
.input-group input[type="submit"]:hover {
    border-color: #007bff;
    box-shadow: 0 0 8px rgba(0, 123, 255, 0.2);
}

/* 텍스트 입력 필드 */
.input-group input[type="text"] {
    flex: 1; /* 텍스트 입력 필드가 가능한 공간을 차지하도록 설정 */
    min-width: 250px;
}

/* 제출 버튼 스타일 */
.input-group input[type="submit"] {
    background-color: #007bff;
    color: white;
    cursor: pointer;
    font-weight: bold;
    transition: background-color 0.3s ease, transform 0.2s;
}

/* 버튼 호버 효과 */
.input-group input[type="submit"]:hover {
    background-color: #0056b3;
}

/* 클릭 시 살짝 축소 효과 */
.input-group input[type="submit"]:active {
    transform: scale(0.98);
}

/* 반응형 디자인 */
@media (max-width: 768px) {
    .input-group {
        flex-direction: column;
        align-items: stretch; /* 각 요소가 100% 너비로 확장 */
    }

    .input-group select,
    .input-group input[type="text"],
    .input-group input[type="submit"] {
        width: 100%; /* 작은 화면에서는 입력 요소를 가득 채움 */
    }
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
				<h1>강좌 관리</h1>

				<form method="get" name="search" id="search" action="/admin/course">

					

					<div class="input-group">
						<select id="school" name="school">
							<option selected disabled>학교구분</option>
							<option value="초">초등학교</option>
							<option value="중">중학교</option>
							<option value="고">고등학교</option>
						</select> 
						<select id="grade" name="grade">
							<option selected disabled>학년</option>
						</select> 
						<select id="subject" name="subject">
							<option selected disabled>과목</option>
							<option value="국어">국어</option>
							<option value="수학">수학</option>
							<option value="영어">영어</option>
							<option value="사회">사회</option>
							<option value="과학">과학</option>
							<option value="한국사">한국사</option>
						</select> 
						<select name="sort">
							<option selected disabled>정렬</option>
							<option value="school, grade">학년순</option>
							<option value="title">이름순</option>
							<option value="subject">과목순</option>
							<option value="regDate DESC">최신순</option>
					</select>
					
							<input type="text" placeholder="강좌 검색" name="keyword">
						
					<input type="submit" value="검색하기">
					</div>
				</form>

				<table>
					<thead>
						<tr>
							<th>강좌번호</th>
							<th>학년</th>
							<th>과목</th>
							<th>선생님</th>
							<th>제목</th>
							<th>회차설명</th>
							<th>등록일</th>
							<th>수정/삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="item" varStatus="loop">
							<tr>
								<td><span>${item.idx}</span></td>
								<td>${item.school}${item.grade}</td>
								<td>${item.subject }</td>
								<td>${item.teacherInfo.name }</td>
								<td><a href="/admin/course/view?idx=${item.idx }">${item.title}</a></td>
								<td>${item.detail}</td>
								<td>${item.regDate }</td>
								<td>
									<button onclick="location.href='/admin/course/modify?idx=${item.idx}'">수정</button>
									&nbsp;&nbsp;
									<button onclick="location.href='/admin/course/delete?idx=${item.idx}'">삭제</button>
									</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<%@ include file="/pageNo.jsp" %>
				<div class="search-filter">
					<button class="page-btn" onclick="location.href='/admin/course/regist'">등록</button>
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

	<script>
		// 각 학교별 학년 데이터
		const gradeOptions = {
			"초" : [ "1", "2", "3", "4", "5", "6" ],
			"중" : [ "1", "2", "3" ],
			"고" : [ "1", "2", "3" ]
		};

		// 학교 구분 셀렉트 박스
		const schoolSelect = document.getElementById('school');
		// 학년 셀렉트 박스
		const gradeSelect = document.getElementById('grade');

		// 학교 구분이 변경될 때 호출되는 함수
		schoolSelect.addEventListener('change', function() {
			const selectedSchool = schoolSelect.value; // 선택된 학교 구분 값
			const grades = gradeOptions[selectedSchool]; // 해당 학교 구분에 맞는 학년 배열

			// 학년 셀렉트 박스 초기화
			gradeSelect.innerHTML = '<option selected value="" disabled>학년</option>';

			// 선택된 학교 구분에 맞는 학년 옵션을 추가
			if (grades) {
				grades.forEach(function(grade) {
					const option = document.createElement('option');
					option.value = grade;
					option.textContent = grade;
					gradeSelect.appendChild(option);
				});
			}
		});
	</script>

</body>
</html>
