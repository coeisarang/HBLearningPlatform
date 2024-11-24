<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
        

        /* 헤더 스타일 */
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

        /* 메인 배너 스타일 */
        .main-banner {
            position: relative;
            max-width: 100%;
            height: 700px;
            width: 700px
            margin: 20px auto;
            overflow: hidden;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .main-banner img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* 과목 카드 섹션 */
        .subject-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin: 40px 20px;
        }

        .subject-card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .subject-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
        }

        .subject-card img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin-bottom: 10px;
        }

        .subject-card p {
            margin-top: 10px;
        }

        /* 파이널 패키지 안내 */
        .final-package {
            text-align: center;
            padding: 20px;
            background-color: white; /* 연한 하늘색 배경 */
            margin: 40px 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .final-package img {
            width:100%;
           
            height : auto
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
        }

        .footer p {
            margin: 0;
            font-size: 14px;
        }

        /* 반응형 디자인 */
        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                gap: 10px;
                text-align: center;
            }

            .header {
                flex-direction: column;
                align-items: center;
                gap: 10px;
            }

            .main-banner {
                height: 300px;
            }
        }
       /* 과목별 버튼 스타일 */
    .subject-buttons {
        display: flex;
        justify-content: center;
        gap: 10px;
        margin: 20px 0;
    }

    .subject-buttons button {
        padding: 10px 20px;
        background-color: #1e88e5; /* 파란색 */
        color: white;
        border: none;
        border-radius: 5px;
        width: 80px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.2s;
    }

    .subject-buttons button:hover {
        background-color: #1565c0; /* 진한 파란색 */
        transform: scale(1.05); /* 호버 시 약간 확대 */
    }

    /* 과목 카드 섹션 */
    .subject-cards {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 20px;
        margin: 20px;
    }

    .subject-card {
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        padding: 20px;
        text-align: center;
        transition: transform 0.3s, box-shadow 0.3s;
    }

    .subject-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
    }

    .subject-card img {
        width: 80px;
        height: 80px;
        border-radius: 50%;
        margin-bottom: 10px;
    	
    	}
    </style>
</head>
<body>
    <!-- 헤더 -->
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

	<!-- 메인 배너 -->
    <div class="main-banner">
        <img src="<%= request.getContextPath() %>/images/r1.png" alt="메인 배너">
    </div>
<!--     <div class="subject-buttons"> -->
<!--     <button onclick="filterSubject('all')">전체</button> -->
<!--     <button onclick="filterSubject('korean')">국어</button> -->
<!--     <button onclick="filterSubject('english')">영어</button> -->
<!--     <button onclick="filterSubject('math')">수학</button> -->
<!--     <button onclick="filterSubject('history')">한국사</button> -->
<!-- </div> -->

<!-- 과목 카드 섹션 -->
<section class="subject-cards">
    <div class="subject-card korean">
        <img src="<%= request.getContextPath() %>/images/teacher1.png" alt="강사 이미지">
        <p>국어 - 김승리</p>
        <p>김승리의 마지막 역작</p>
    </div>
    <div class="subject-card english">
        <img src="<%= request.getContextPath() %>/images/teacher2.png" alt="강사 이미지">
        <p>영어 - 이명학</p>
        <p>이제는 골든 타임</p>
    </div>
    <div class="subject-card math">
        <img src="<%= request.getContextPath() %>/images/teacher3.png" alt="강사 이미지">
        <p>수학 - 한석원</p>
        <p>필연의 길을 따라 집요하게!</p>
    </div>
    <div class="subject-card history">
        <img src="<%= request.getContextPath() %>/images/teacher4.png" alt="강사 이미지">
        <p>한국사 - 연미정</p>
        <p>최종 병기 완성!</p>
    </div>
</section>
    </section>

    <!-- 파이널 패키지 안내 -->
    <section class="final-package">
        <img src="<%= request.getContextPath() %>/images/mainlogo.png" alt="스마트해법 로고">
        <h2>The Last Chance</h2>
        <p>2024 스마트해법과 함께하세요!</p>
    </section>

    <!-- 푸터 -->
    <footer class="footer">
        <p>&copy; 2024 스마트해법. All Rights Reserved.</p>
    </footer>
    
    <script>
    // 과목 필터링 함수
    function filterSubject(subject) {
        const cards = document.querySelectorAll('.subject-card');
        cards.forEach(card => {
            if (subject === 'all' || card.classList.contains(subject)) {
                card.style.display = 'block'; // 해당 과목 표시
            } else {
                card.style.display = 'none'; // 해당 과목 숨김
            }
        });
    }
</script>
</body>
</html>
