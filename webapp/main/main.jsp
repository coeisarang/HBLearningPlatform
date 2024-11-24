<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		
		.body2 {        
		   width: 1200px; 
		   margin: 0 auto;
		}
		
		/* 메인 배너 스타일 */
		.main-banner {
		    position: relative;
		    max-width: 100%;
		    height: 700px;
		    margin: 20px auto;
		    overflow: hidden;
		    border-radius: 10px;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		}
		
		.main-banner img {
		    width: 100%;
		    height: 100%;
		    object-fit: cover;
		    position: absolute;
		    top: 0;
		    left: 0;
		    opacity: 0;
		    transition: opacity 1s ease-in-out;
		}
		
		.main-banner img.active {
		    opacity: 1;
		}
		
		/* 배너 내비게이션 (좌우 화살표) */
		.banner-nav {
		    position: absolute;
		    top: 50%;
		    width: 100%;
		    display: flex;
		    justify-content: space-between;
		    transform: translateY(-50%);
		}
		
		.banner-nav button {
		    background-color: rgba(0, 0, 0, 0.5);
		    border: none;
		    color: white;
		    font-size: 24px;
		    padding: 10px;
		    cursor: pointer;
		    transition: background-color 0.3s;
		}
		
		.banner-nav button:hover {
		    background-color: rgba(0, 0, 0, 0.8);
		}
		
		/* 배너 인디케이터 (하단 점) */
		.banner-dots {
		    position: absolute;
		    bottom: 20px;
		    width: 100%;
		    display: flex;
		    justify-content: center;
		    gap: 10px;
		}
		
		.banner-dots span {
		    width: 12px;
		    height: 12px;
		    background-color: white;
		    border-radius: 50%;
		    cursor: pointer;
		    transition: background-color 0.3s;
		}
		
		.banner-dots span.active {
		    background-color: #007bff;
		}
		
		/* 과목별 버튼 */
		.subject-buttons {
		    display: flex;
		    justify-content: center;
		    gap: 10px;
		    margin: 20px 0;
		}
		
		.subject-buttons button {
		    padding: 10px 20px;
		    background-color: #1e88e5;
		    color: white;
		    border: none;
		    border-radius: 5px;
		    width: 80px;
		    cursor: pointer;
		    transition: background-color 0.3s, transform 0.2s;
		}
		
		.subject-buttons button:hover {
		    background-color: #1565c0;
		    transform: scale(1.05);
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
		
		/* 사이드 배너 */
		.side-banner {
		    position: fixed;
		    top: 50%;
		    left: 20px;
		    transform: translateY(-50%);
		    display: flex;
		    flex-direction: column;
		    gap: 15px;
		    width: 230px;
		}
		
		.banner-item {
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    text-align: center;
		    padding: 15px;
		    border-radius: 10px;
		    cursor: pointer;
		    transition: transform 0.3s, box-shadow 0.3s;
		    margin-left: 100px;
		    width: 30px;
		}
		
		.banner-item img {
		    width: 150px;
		}
		
		.banner-item:hover {
		    transform: scale(1.05);
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
		
		/* 헤더 */
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
		
		/* 드롭다운 메뉴와 z-index */
		.navbar ul ul {
		    display: none;
		    position: absolute;
		    background-color: white;
		    padding: 10px 0;
		    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
		    border-radius: 5px;
		    z-index: 20;
		}
		
		/* 드롭다운 메뉴 활성화 */
		.navbar li:hover ul {
		    display: block;
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
	
    <div class="body2">
        <div class="main-banner" id="mainBanner">
            <img src="<%= request.getContextPath() %>/images/r1.png" class="active">
            <img src="<%= request.getContextPath() %>/images/mainbanner2.png">
            <img src="<%= request.getContextPath() %>/images/mainbanner4.png">
            <div class="banner-nav">
                <button id="prevBtn">&#9664;</button>
                <button id="nextBtn">&#9654;</button>
            </div>
            <div class="banner-dots" id="bannerDots"></div>
        </div>


        <div class="side-banner">
            <div class="banner-item"><img src="<%= request.getContextPath() %>/images/sidebanner1.png"></div>
            <div class="banner-item"><img src="<%= request.getContextPath() %>/images/sidebanner2.png"></div>
            <div class="banner-item "><img src="<%= request.getContextPath() %>/images/sidebanner3.png"></div>
            <div class="banner-item "><img src="<%= request.getContextPath() %>/images/sidebanner4.png"></div>
        </div>

    <!-- 과목별 버튼 -->
<!--     <div class="subject-buttons"> -->
<!--         <button onclick="filterSubject('all')">전체</button> -->
<!--         <button onclick="filterSubject('korean')">국어</button> -->
<!--         <button onclick="filterSubject('english')">영어</button> -->
<!--         <button onclick="filterSubject('math')">수학</button> -->
<!--         <button onclick="filterSubject('history')">한국사</button> -->
<!--     </div> -->

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

    <!-- 파이널 패키지 안내 -->
    <section class="final-package">
        <img src="<%= request.getContextPath() %>/images/mainlogo.png" alt="스마트해법 로고">
        <h2>The Last Chance</h2>
        <p>2024 스마트해법과 함께하세요!</p>
    </section>
    </div>
    

    <!-- 푸터 -->
    <footer class="footer">
        <p>&copy; 2024 스마트해법. All Rights Reserved.</p>
    </footer>
    
    </div>

    <script>
        const images = document.querySelectorAll('.main-banner img');
        const dotsContainer = document.getElementById('bannerDots');
        const prevBtn = document.getElementById('prevBtn');
        const nextBtn = document.getElementById('nextBtn');
        let currentIndex = 0;

        // 인디케이터(점) 생성
        images.forEach((_, index) => {
            const dot = document.createElement('span');
            dot.addEventListener('click', () => showSlide(index));
            dotsContainer.appendChild(dot);
        });

        const dots = document.querySelectorAll('.banner-dots span');
        updateDots();

        // 슬라이드 이동 함수
        function showSlide(index) {
            images[currentIndex].classList.remove('active');
            dots[currentIndex].classList.remove('active');
            currentIndex = (index + images.length) % images.length;
            images[currentIndex].classList.add('active');
            dots[currentIndex].classList.add('active');
        }

        function updateDots() {
            dots.forEach((dot, index) => {
                dot.classList.toggle('active', index === currentIndex);
            });
        }

        // 자동 슬라이드 기능
        function autoSlide() {
            showSlide(currentIndex + 1);
        }

        let slideInterval = setInterval(autoSlide, 3000);

        // 이전/다음 버튼 클릭 이벤트
        prevBtn.addEventListener('click', () => {
            clearInterval(slideInterval);
            showSlide(currentIndex - 1);
            slideInterval = setInterval(autoSlide, 3000);
        });

        nextBtn.addEventListener('click', () => {
            clearInterval(slideInterval);
            showSlide(currentIndex + 1);
            slideInterval = setInterval(autoSlide, 3000);
        });
    </script>
</body>
</html>
