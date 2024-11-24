<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스마트해법 MyPage</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<!--     <link rel="stylesheet" href="styles.css"> -->

    <style>
        /* Global Styles */
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

        .header {
		    background-color: white;
		    padding: 15px 30px;
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    border-bottom: 2px solid #ddd;
		    position: relative;
		    z-index: 10;
		}

        .main-container {
            display: flex;
            min-height: calc(100vh - 60px);
            width: 1500px;
            margin: 0 auto;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            background-color: #3d4a59;
            color: white;
            padding: 20px;
            height: 1200px;
        }

        .sidebar img {
            width: 180px;
            margin-bottom: 20px;
        }

        .sidebar h2, .sidebar h3 {
            margin-bottom: 15px;
        }

        .sidebar h3 {
            font-size: 18px;
            font-weight: bold;
        }

        .lecture-list {
            list-style: none;
            margin-bottom: 20px;
        }

        .lecture-list li {
            margin-bottom: 8px;
        }

        .lecture-list li a {
            text-decoration: none;
            color: #ccc;
            font-size: 16px;
            transition: color 0.3s;
        }

        .lecture-list li a:hover {
            color: #0fbc8c;
        }

        /* Content Styles */
        .content {
            flex: 1;
            padding: 20px;
            width: 1200px;
        }

        .info-section {
            display: flex;
            gap: 20px;
            justify-content: center;
        }

        .info-card {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 500px;
            padding: 20px;
            text-align: center;
            height: 300px;
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

        .inquiry-button {
            margin-top: 10px;
            padding: 10px 15px;
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

        .info-section2 {
            display: flex;
            justify-content: center;
            margin-top: 50px;
        }

        .info-section2 img {
            width: 1200px;
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

    </style>
    <link rel="stylesheet" type="text/css" href="/mypage/sidebar.css">
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


    <div class="main-container">
        <%@ include file="/mypage/sidebar.jsp" %>

        <div class="content">
            <div class="info-section">
                <div class="info-card">
                    <h3><a href="/mycourse">나의 강의실 &rsaquo;</a></h3>
                    <div class="info-content">
                        <div class="info-item">
                            <p>수강중인 강좌</p>
                            <span>${countmap.c1}</span>
                        </div>
                        <div class="info-item">
                            <p>수강종료 강좌</p>
                            <span>${countmap.c2}</span>
                        </div>
                    </div>
                </div>

                <div class="info-card">
                    <h3><a href="/mypage/paymentlist">나의 주문정보 &rsaquo;</a></h3>
                    <div class="info-content">
                        <div class="info-item">
                            <p>주문/배송</p>
                            <span>${countmap.pay}</span>
                        </div>
                        <div class="info-item">
                            <p>장바구니</p>
                            <span>${countmap.cart}</span>
                        </div>
                        <div class="info-item">
                            <p>취소/환불</p>
                            <span>${countmap.refund}</span>
                        </div>
                    </div>
                </div>

                <div class="info-card">
                    <h3><a href="/mypage/qna">나의 문의현황</h3>
                    <div class="info-content">
                        <div class="info-item">
                            <p>답변 대기</p>
                            <span>${countmap.q}</span>
                        </div>
                        <div class="info-item">
                            <p>답변 완료</p>
                            <span>${countmap.a}</span>
                        </div>
                    </div>
                    <button onclick="location.href='/mypage/qna'" class="inquiry-button">학습 Q&A 바로가기</button>
                </div>
            </div>

            <div class="info-section2">
                <img src="<%= request.getContextPath() %>/images/banner1.png" alt="사용자 이미지">
            </div>
            
            <!-- 파이널 패키지 안내 -->
		    <section class="final-package">
		        <img src="<%= request.getContextPath() %>/images/mainlogo.png" alt="스마트해법 로고">
		        <h2>The Last Chance</h2>
		        <p>2024 스마트해법과 함께하세요!</p>
		    </section>
        </div>
    </div>
</body>
</html>
