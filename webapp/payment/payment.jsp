<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구매 페이지</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
    <style>
        /* 기본 스타일 초기화 */
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

        .header {
            background-color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 2px solid #ddd;
        }

        .container {
            width: 800px;
            margin: 40px auto;
            background-color: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }

        .product-header {
            display: flex;
            align-items: center;
            border-bottom: 2px solid #ddd;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        .product-header input {
            transform: scale(1.2);
        }

        .product-list {
            margin-bottom: 20px;
        }

        .product-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
        }

        .product-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .product-title {
            font-size: 16px;
            font-weight: bold;
        }

        .product-price {
            font-size: 16px;
            color: #333;
        }

        .summary {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
            border-top: 2px solid #ddd;
            font-weight: bold;
        }

        .total-price {
            color: #e67e22;
            font-size: 18px;
        }

        .footer-buttons {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .footer-buttons input {
            padding: 15px 30px;
            font-size: 16px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .footer-buttons input:hover {
            background-color: #0056b3;
        }

        .final-package {
            text-align: center;
            margin: 40px 20px;
        }

        .final-package img {
            width: 100%;
            height: auto;
            border-radius: 8px;
        }

        .final-package h2 {
            margin-top: 10px;
            color: #0fbc8c;
        }

        .footer {
            background-color: #0044cc;
            color: white;
            text-align: center;
            padding: 15px 0;
            margin-top: auto;
        }

        .footer p {
            font-size: 14px;
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

    <form method="post" name="buy" action="/payment/paymentProcess">
        <div class="container">
            <h1>구매하기</h1>

            <div class="product-header">
                <input type="checkbox">
                <p>전체선택</p>
            </div>

            <div class="product-list">
                <c:forEach var="c" items="${cList}">
                    <div class="product-item">
                        <div class="product-info">
                            <input type="checkbox" name="data" value="${c.idx}/${c.price}" data-price="${c.price}" class="product-checkbox">
                            <div class="product-title">${c.title}</div>
                        </div>
                        <div class="product-price">${c.price}원</div>
                    </div>
                </c:forEach>
            </div>

            <div class="summary">
                <span>총 주문금액:</span>
                <span class="total-price">0원</span>
            </div>

            <div class="footer-buttons">
                <input type="submit" value="구매">
            </div>
        </div>
    </form>

    <section class="final-package">
        <img src="<%= request.getContextPath() %>/images/mainlogo.png" alt="스마트해법 로고">
        <h2>The Last Chance</h2>
        <p>2024 스마트해법과 함께하세요!</p>
    </section>

    <footer class="footer">
        <p>&copy; 2024 스마트해법. All Rights Reserved.</p>
    </footer>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const checkboxes = document.querySelectorAll('.product-checkbox');
            const totalPriceElement = document.querySelector('.total-price');

            function updateTotalPrice() {
                let totalPrice = 0;
                checkboxes.forEach(checkbox => {
                    if (checkbox.checked) {
                        const price = parseFloat(checkbox.getAttribute('data-price')) || 0;
                        totalPrice += price;
                    }
                });
                totalPriceElement.textContent = totalPrice.toLocaleString() + '원';
            }

            checkboxes.forEach(checkbox => {
                checkbox.addEventListener('change', updateTotalPrice);
            });

            const selectAllCheckbox = document.querySelector('.product-header input');
            selectAllCheckbox.addEventListener('change', function () {
                checkboxes.forEach(checkbox => {
                    checkbox.checked = selectAllCheckbox.checked;
                });
                updateTotalPrice();
            });

            checkboxes.forEach(checkbox => {
                checkbox.addEventListener('change', function () {
                    const allChecked = Array.from(checkboxes).every(cb => cb.checked);
                    selectAllCheckbox.checked = allChecked;
                });
            });

            updateTotalPrice();
        });
    </script>
</body>
</html>
