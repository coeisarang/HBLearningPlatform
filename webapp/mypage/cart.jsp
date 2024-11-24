<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 가입</title>
<!-- <link rel="stylesheet" href="styles.css"> -->
<style>
/* 전역 스타일 초기화 */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Arial', sans-serif;
}

body {
	background-color: white;
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

.header {
	background-color: white;
	padding: 15px 30px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	border-bottom: 2px solid #ddd;
}

.logo2 img {
	max-width: 120px;
}

.navbar {
	display: flex;
	gap: 20px;
}

.navbar a {
	text-decoration: none;
	color: #333;
	font-weight: bold;
	transition: color 0.3s;
}

.navbar a:hover {
	color: #0fbc8c;
}

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

.container {
	width: 1000px;
	height: auto;
	background-color: white;
	margin: auto;
	padding: 40px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
	font-size: 24px;
	margin-bottom: 10px;
	color: #333;
}

.product-header {
	display: flex;
	border-bottom: 2px solid #ddd;
	padding-bottom: 10px;
	margin-bottom: 20px;
}

.product-list {
	margin-bottom: 30px;
}

.product-item {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 15px 0;
	border-bottom: 1px solid #ddd;
}

.product-info {
	display: flex;
	align-items: center;
	gap: 15px;
}

.product-info input[type="checkbox"] {
	transform: scale(1.2);
}

.product-info .label {
	background-color: #ddd;
	color: #666;
	padding: 5px 10px;
	border-radius: 4px;
	font-size: 14px;
}

.product-title {
	font-size: 16px;
	font-weight: bold;
	margin-bottom: 5px;
}

.product-date {
	font-size: 12px;
	color: #888;
}

.product-price {
	font-size: 16px;
	color: #333;
}

.actions {
	display: flex;
	gap: 10px;
}

.actions button {
	padding: 10px 15px;
	border-radius: 4px;
	cursor: pointer;
	font-size: 14px;
	transition: background-color 0.3s;
}

.buy-button {
	background-color: #4a4e8e;
	color: white;
	border: none;
}

.buy-button:hover {
	background-color: #3a3e7e;
}

.delete-button {
	background-color: white;
	color: #333;
	border: 1px solid #ddd;
}

.delete-button:hover {
	background-color: #ddd;
}

.summary {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 15px 0;
	border-top: 2px solid #ddd;
	font-weight: bold;
	color: #333;
}

.summary .total-price {
	color: #e67e22;
	font-size: 18px;
}

.footer-buttons {
	display: flex;
	justify-content: space-between;
	gap: 10px;
	margin-top: 20px;
}

.footer-buttons button {
	flex: 1;
	padding: 15px;
	font-size: 16px;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.select-button {
	background-color: #007bff;
}

.select-button:hover {
	background-color: #0056b3;
}

.buy-all-button {
	background-color: #e67e22;
}

.buy-all-button:hover {
	background-color: #d35400;
}

.footer {
	background-color: #0044cc;
	color: white;
	text-align: center;
	padding: 15px 0;
	margin-top: auto;
}

.footer p {
	margin: 0;
	font-size: 14px;
}

.p {
	margin-left: 20px;
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



	<div class="container">
		<h1>장바구니</h1>

		<div class="product-header">
			<input type="checkbox">
			<p class="p">전체선택<p>
		</div>

		<form method="post" action="/payment">
		<div class="product-list">
			<c:forEach items="${list}" var="item">
				<div class="product-item">
					<div class="product-info">
						<input type="checkbox" name="idx" value="${item.courseInfo.idx }"> <span class="label">강좌</span>
						<div>
							<div class="product-title">${item.courseInfo.title }</div>
						</div>
					</div>
					<div class="product-price">${item.courseInfo.price}원</div>
					<div class="actions">
						<button class="buy-button" onclick="location.href='/payment?idx=${item.courseInfo.idx}'; return false" >구매하기</button>
						<button class="delete-button" onclick="location.href='/mypage/cart/delete?idx=${item.idx}';return false;">삭제</button>
					</div>
				</div>
			</c:forEach>

		
		</div>

		<div class="footer-buttons">
			<button class="select-button" >선택상품 구매</button>
		</div>
	</form>
	</div>


	<section class="final-package">
		<img src="<%=request.getContextPath()%>/images/mainlogo.png"
			alt="스마트해법 로고">
		<h2>The Last Chance</h2>
		<p>2024 스마트해법과 함께하세요!</p>
	</section>

	<footer class="footer">
		<p>&copy; 2024 스마트해법. All Rights Reserved.</p>
	</footer>


	<script>
    // 전체선택 체크박스
    const selectAllCheckbox = document.querySelector('.product-header input[type="checkbox"]');
    // 개별 상품 체크박스
    const productCheckboxes = document.querySelectorAll('.product-list input[type="checkbox"]');

    // 전체 선택 체크박스 클릭 시 실행
    selectAllCheckbox.addEventListener('change', function() {
        productCheckboxes.forEach(checkbox => {
            checkbox.checked = selectAllCheckbox.checked;
        });
    });

    // 개별 체크박스 클릭 시 전체선택 체크박스 상태 변경
    productCheckboxes.forEach(checkbox => {
        checkbox.addEventListener('change', function() {
            const allChecked = Array.from(productCheckboxes).every(checkbox => checkbox.checked);
            selectAllCheckbox.checked = allChecked;
        });
    });
    
</script>

</body>
</html>
