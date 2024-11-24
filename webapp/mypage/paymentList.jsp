<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>스마트해법 MyPage</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&family=Roboto:wght@400;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="styles.css">

<style>
/* 전역 스타일 */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Noto Sans', 'Roboto', sans-serif;
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

.content {
	flex: 1;
	padding: 20px;
}

.info-section {
	display: flex;
	gap: 20px;
	justify-content: center;
}

.info-section2 {
	margin-top: 50px;
	display: flex;
	gap: 20px;
	justify-content: center;
}

.info-card {
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	width: 500px;
	padding: 20px;
	text-align: center;
	height: 500px;
}

.info-card h3 {
	font-size: 18px;
	font-weight: bold;
	display: flex;
	justify-content: space-between;
	border-bottom: 1px solid #ddd;
	padding-bottom: 10px;
	margin-bottom: 15px;
	color: #333;
}

.info-content {
	display: flex;
	justify-content: space-around;
	margin: 15px 0;
}

.info-item p {
	font-size: 14px;
	color: #666;
}

.info-item span {
	font-size: 24px;
	color: #007bff;
}

.info-button {
	margin-top: 10px;
	padding: 10px 15px;
	border: 1px solid #007bff;
	background-color: white;
	color: #007bff;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s, color 0.3s;
}

.info-button:hover {
	background-color: #007bff;
	color: white;
}

.inquiry-card {
	background-color: white;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 20px;
	text-align: center;
	margin-top: 20px;
}

.tabs {
	display: flex;
	justify-content: space-around;
	margin-bottom: 10px;
}

.tab {
	background: none;
	border: none;
	font-size: 16px;
	cursor: pointer;
	color: #555;
	padding: 10px;
	border-bottom: 2px solid transparent;
	transition: color 0.3s, border-bottom 0.3s;
}

.tab.active {
	color: #007bff;
	border-bottom: 2px solid #007bff;
}

.tab:hover {
	color: #007bff;
}

.tab-content {
	font-size: 14px;
	color: #555;
	margin: 15px 0;
}

.inquiry-button {
	padding: 10px 20px;
	border: 1px solid #007bff;
	background-color: white;
	color: #007bff;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s, color 0.3s;
}

.inquiry-button:hover {
	background-color: #007bff;
	color: white;
}
/* 전역 스타일 */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Noto Sans', sans-serif;
}

body {
	background-color: #f4f4f4;
}

.container {
	width: 100%;
	margin: 0 auto;
	background-color: white;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.container2 {
	width: 100%;
	margin: 0 auto;
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

.tabs {
	display: flex;
	border-bottom: 2px solid #ddd;
}

.tab {
	flex: 1;
	text-align: center;
	padding: 10px 0;
	cursor: pointer;
	font-weight: 600;
	color: #666;
	border-bottom: 3px solid transparent;
	transition: color 0.3s, border-bottom 0.3s;
}

.tab.active {
	color: #007bff;
	border-bottom: 3px solid #007bff;
}

.filters {
	display: flex;
	justify-content: space-between;
	margin: 20px 0;
}

.filter-group {
	display: flex;
	gap: 10px;
}

.filter-group button {
	padding: 10px 20px;
	background-color: white;
	border: 1px solid #ddd;
	border-radius: 20px;
	cursor: pointer;
	transition: background-color 0.3s, color 0.3s;
}

.filter-group button.active {
	background-color: #007bff;
	color: white;
	border-color: #007bff;
}

.teacher-selection {
	text-align: center;
	color: #666;
	font-size: 14px;
	margin-top: 10px;
}

.lecture-list-header {
	display: flex;
	justify-content: space-between;
	margin-top: 30px;
	padding-bottom: 10px;
	border-bottom: 1px solid #ddd;
	font-weight: 600;
	color: #666;
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

.item-info {
	display: flex;
	flex-direction: column;
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

/* 상태 표시 동그라미 */
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
	content: '✔'; /* 완료 상태의 체크 아이콘 */
	font-size: 16px;
	display: none;
}

.status-indicator.complete::before {
	display: block;
}
</style>
<link rel="stylesheet" type="text/css" href="sidebar.css">
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


	<!-- 메인 레이아웃을 flex 컨테이너로 설정 -->
	<div style="display: flex;">
		<!-- 왼쪽 사이드바 -->
		<%@ include file="sidebar.jsp"%>

		<!-- 오른쪽 메인 컨텐츠 -->
		<div class="container2" style="flex: 1;">
			<h1>결제 내역</h1>
			<div class="lecture-list-header">
				<span>결제 내역 수 ${fn:length(pList)}</span>
				<!-- 결제 내역 수를 표시합니다 -->
				<div class="sort-options">
					<span>최근 결제순</span>
				</div>
			</div>

			<div class="container">
				<!-- 리스트 -->
				<c:forEach var="p" items="${pList}">
					<hr>
					<div class="list-item">
						<div class="item-info">
							<h3>${p.courseName}</h3>
							<span>선생님: ${p.teacherName}</span> <span>학년: ${p.grade} |
								과목: ${p.subject}</span> <span>정가: ${p.price}원 | 결제금액:
								${p.amount}원 | 할인금액: ${p.price - p.amount}원</span> <span>결제날짜:
								${p.payDate} | 환불날짜: ${p.refundDate}</span>
						</div>
						<div class="status-action">
							<c:choose>
								<c:when test="${p.status == '결제 완료(환불 가능)'}">
									<button class="refund-button" onclick="location.href='/mypage/paymentlist/refund?idx=${p.idx}'">환불하기</button>
								</c:when>
								<c:otherwise>
									<span>${p.status}</span>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<hr>
				</c:forEach>

				<!-- 결제 내역이 없을 시 -->
				<c:if test="${empty pList}">
					<div class="lecture-empty">
						<img src="https://cdn-icons-png.flaticon.com/512/83/83562.png"
							alt="결제 내역 없음 아이콘">
						<p>결제 내역이 없습니다.</p>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>

</html>
