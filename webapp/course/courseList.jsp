<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>강좌 추천 페이지</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f8f8f8;
}

.login-section img {
	width: 100%;
}

.search-container {
	margin-top: 30px;
	display: flex;
	justify-content: center;
}

.search-bar {
	display: flex;
	align-items: center;
	background-color: white;
	border-radius: 50px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
	padding: 10px 20px;
	width: 60%;
}

.search-bar input {
	flex: 1;
	border: none;
	outline: none;
	font-size: 16px;
	margin: 0 10px;
}

/* 분류 버튼 */
.input-group {
	margin: 30px 0;
	display: flex;
	gap: 15px;
	justify-content: center;
}

.input-group select, .input-group input[type="submit"] {
	padding: 10px 15px;
	border: 2px solid #ddd;
	border-radius: 8px;
	font-size: 16px;
	outline: none;
	transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

/* Hover and Focus Effects */
.input-group select:hover, .input-group input[type="submit"]:hover {
	border-color: #0fbc8c;
	box-shadow: 0 0 8px rgba(15, 188, 140, 0.3);
}

.input-group select:focus {
	border-color: #007BFF;
	box-shadow: 0 0 10px rgba(0, 123, 255, 0.4);
}

/* Styling for the submit button */
.input-group input[type="submit"] {
	background-color: #4CAF50;
	color: white;
	font-weight: bold;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.input-group input[type="submit"]:hover {
	background-color: #45a049;
}

/* Mobile-friendly adjustments */
@media ( max-width : 768px) {
	.input-group {
		flex-direction: column;
		gap: 10px;
	}
	.input-group select, .input-group input[type="submit"] {
		width: 100%;
	}
}

.content {
	display: flex;
	justify-content: space-around;
	padding: 20px;
}

.courses {
	width: 1000px;
}

.course-list {
	list-style: none;
	padding: 0;
	width: 90%;
}

.course-list li {
	background-color: white;
	margin: 5px 0;
	padding: 10px;
	border-radius: 5px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.course-actions {
	display: flex;
	gap: 10px;
}

.cart-button, .enroll-button {
	text-decoration: none;
	font-size: 16px;
	font-weight: 600;
	padding: 6px 12px;
	border-radius: 8px;
	display: inline-flex;
	align-items: center;
	gap: 5px;
}

.cart-button {
	color: #4CAF50;
}

.enroll-button {
	color: #007BFF;
}

a img {
	width: 28px;
	height: 28px;
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

	<section class="login-section">
		<img src="<%= request.getContextPath() %>/images/banner2.png"
			alt="banner">
	</section>

	<form method="get" name="search" id="search" action="/course">
		<div class="search-container">
			<div class="search-bar">
				<input type="text" placeholder="강좌 검색" name="keyword">
				<div class="icons-right">
					<span class="lens-icon">&#128269;&#65039;</span>
				</div>
			</div>
		</div>

		<div class="input-group">
			<select id="school" name="school" >
				<option selected disabled>학교구분</option>
				<option value="초">초등학교</option>
				<option value="중">중학교</option>
				<option value="고">고등학교</option>
			</select> <select id="grade" name="grade">
				<option selected disabled>학년</option>
			</select> <select id="subject" name="subject">
				<option selected disabled>과목</option>
				<option value="국어">국어</option>
				<option value="수학">수학</option>
				<option value="영어">영어</option>
				<option value="사회">사회</option>
				<option value="과학">과학</option>
				<option value="한국사">한국사</option>
			</select> <input type="submit" value="검색하기">
		</div>
	</form>

	<main class="content">
		<div class="courses">
			<h2>전체 강좌</h2>
			<ul class="course-list">
				<c:forEach var="c" items="${cList}" varStatus="loop">
					<li><a href="/course/notice?idx=${c.idx}"> <span>${loop.count}
								|| ${c.school}${c.grade} || ${c.subject} ||
								${c.teacherInfo.name} 선생님 - ${c.title}</span>
					</a>
						<div class="course-actions">
							<a href="/course/cart?idx=${c.idx}" class="cart-button"> <img
								src="<%= request.getContextPath() %>/images/cart.png" alt="장바구니">장바구니
								추가
							</a> <a href="/payment?idx=${c.idx}" class="enroll-button"> <img
								src="<%= request.getContextPath() %>/images/buy.png" alt="수강신청">수강신청
							</a>
						</div></li>
				</c:forEach>
			</ul>
			<%@ include file="/pageNo.jsp"%>
		</div>
	</main>

	<%@ include file="/pluse/footer.jsp"%>

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

		document.getElementById('school').addEventListener('click', function() {
			const selectedSchool = schoolSelect.value; // 선택된 학교 구분 값
			const grades = gradeOptions[selectedSchool]; // 해당 학교 구분에 맞는 학년 배열

			// 학년 셀렉트 박스 초기화
			gradeSelect.innerHTML = '<option selected value="" disabled>학년</option>';

			console.log(schoolSelect.value);
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
