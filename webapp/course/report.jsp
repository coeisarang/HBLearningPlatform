<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>성적확인 및 등록</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap"
	rel="stylesheet">

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
	margin-bottom: 15px;
	color: #333;
}

p {
	text-align: center;
	font-size: 14px;
	color: #777;
	margin-bottom: 30px;
	line-height: 1.6;
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
}

th, td {
	padding: 15px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #f7f8fa;
	font-weight: 700;
	color: #555;
}

td {
	font-size: 14px;
	color: #333;
}

.radio-container {
	display: flex;
	justify-content: center;
	align-items: center;
}

.radio-input {
	width: 20px;
	height: 20px;
	cursor: pointer;
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
		<!-- 사이드바 -->
		

		<!-- 성적확인 및 등록 섹션 -->
		<div class="content">
			<h1>성적확인</h1>

			<div class="table-container">
				<table>
					<thead>

						<tr>
							<th>학생 아이디</th>
							<th>성적입력</th>
							<th>입력</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${list }">
							<form action="/course/report" method="post">
								<tr>
									<td>${item.memberId }</td>
									<td>
										<select id="score" name="score">
											<option value="X" selected>선택</option>
											<option value="A" ${item.score eq 'A' ? 'selected' :''}>A</option>
											<option value="B" ${item.score eq 'B' ? 'selected' :''}>B</option>
											<option value="C" ${item.score eq 'C' ? 'selected' :''}>C</option>
											<option value="D" ${item.score eq 'D' ? 'selected' :''}>D</option>
											<option value="E" ${item.score eq 'E' ? 'selected' :''}>E</option>
											<option value="F" ${item.score eq 'F' ? 'selected' :''}>F</option>
										</select>
									</td>
									<td>
										<input type="hidden" value="${courseIdx }" name="idx"> 
										<input type="hidden" value="${item.memberId }" name="memberId">
										<button>등록</button>
									</td>
								</tr>
							</form>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
	</div>

</body>
</html>
