<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스마트해법</title>
<style>
        /* 기본 스타일 초기화 */
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
          
            width: 1500px;
            margin: 0px auto;
            background-color : white;
        }

        .container {
            width: 80%;
            margin: 20px auto;
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        /* 강사 정보 영역 */
        .teacher-info {
            display: flex;
            margin-top : 20px;
            width: 50%;
            gap: 20px;
            align-items: center;
        }

        .teacher-photo img {
            width: 230px;
            height: auto;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .teacher-details h2 {
            color: #007bff;
            font-size: 24px;
        }

        .teacher-details h1 {
            font-size: 32px;
            margin-bottom: 10px;
        }

        .menu-links a {
            margin-right: 10px;
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }

        .menu-links a:hover {
            text-decoration: underline;
        }

        .quote {
            margin-top: 10px;
            font-size: 18px;
            line-height: 1.5;
        }

        .quote strong {
            color: #007bff;
            font-size: 22px;
        }

        /* 우측 배너 및 평점 */
        .right-section {
            width: 40%;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .banner img {
        	margin-top : 100px;
            width: 500px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .ratings p {
            font-size: 18px;
            margin: 5px 0;
        }

        .ratings strong {
            color: #007bff;
        }

        /* BEST 강좌 및 새 소식 */
        .content-section {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
            width: 100%;
        }

        .best-courses, .teacher-news {
            width: 48%;
        }

        .best-courses h3, .teacher-news h3 {
            margin-bottom: 10px;
            font-size: 20px;
            border-bottom: 2px solid #007bff;
            padding-bottom: 5px;
        }
        
        .best-courses img, .teacher-news img {
            width: 23px;
            margin-right : 7px;
        }
        
        .review-section img {
            width: 23px;
            margin-right : 7px;
        }

        .best-courses ul, .teacher-news ul {
            list-style: none;
            padding: 0;
        }

        .best-courses li, .teacher-news li {
            margin-bottom: 5px;
            font-size: 16px;
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
        }

        .footer p {
            margin: 0;
            font-size: 14px;
        }
        /* 수강평 섹션 */
.review-section {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

.review-section h2 {
    margin-bottom: 20px;
    font-size: 24px;
    border-bottom: 2px solid #007bff;
    display: inline-block;
    padding-bottom: 5px;
}

/* 수강평 카드 컨테이너 */
.reviews-container {
    display: flex;
    gap: 20px;
    flex-wrap: wrap;
    justify-content: space-between;
}

/* 수강평 카드 */
.review-card {
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 15px;
    width: calc(25% - 20px);
    display: flex;
    flex-direction: column;
    gap: 10px;
}

/* BEST 배지 */
.badge {
    background-color: #ff5252;
    color: white;
    font-weight: bold;
    padding: 5px;
    border-radius: 4px;
    text-align: center;
    width: 50px;
}

/* 별점 스타일 */
.stars {
    color: #ffd700;
    font-size: 18px;
}

/* 반응형 디자인 */
@media (max-width: 768px) {
    .review-card {
        width: calc(50% - 20px);
    }
}

@media (max-width: 480px) {
    .review-card {
        width: 100%;
    }
}

/* 강좌 아이템 */
.lecture-list h2 {
            margin: 20px 0;
            font-size: 24px;
            border-bottom: 2px solid #007bff;
            display: inline-block;
        }

.lecture-item {
    display: flex;
    align-items: center;
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 15px;
    margin-bottom: 20px;
    gap: 20px;
}
.lecture-item img{
	width : 150px;
	height : 150px;

}

.teacher-photo {
    width: 230px;
    height: auto;
    border-radius: 50%;
    object-fit: cover;
    box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
}

.lecture-details {
    flex: 1;
}

.tags {
    color: #007bff;
    font-size: 14px;
    margin-bottom: 5px;
}

.rating {
    font-size: 14px;
    margin-bottom: 10px;
}

.badge {
    display: inline-block;
    background-color: #ff5252;
    color: white;
    padding: 2px 8px;
    border-radius: 4px;
    font-weight: bold;
    margin-bottom: 5px;
}

h3 {
    font-size: 18px;
    margin-bottom: 5px;
}

.lecture-options {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-top: 10px;
}

select {
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.price {
    font-weight: bold;
    color: #007bff;
    margin-left: auto;
}

/* 액션 버튼 */
.action-buttons {
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.ot-button, .apply-button {
    padding: 8px 12px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-weight: bold;
}

.ot-button {
    background-color: white;
    border: 1px solid #007bff;
    color: #007bff;
}

.ot-button:hover {
    background-color: #007bff;
    color: white;
}

.apply-button {
    background-color: white;
    border: 1px solid #ff5252;
    color: #ff5252;
}

.apply-button:hover {
    background-color: #ff5252;
    color: white;
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

    <div class="body2">
        <div class="container">
            <div class="teacher-info">
                <div class="teacher-photo">
                    <img src="<%= request.getContextPath() %>/uploads/teacher/${teacherInfo.teacherId }_profile.png" alt="${teacherInfo.name } 선생님">
                </div>
                <div class="teacher-details">
                    <h2>${teacherInfo.subject}</h2>
                    <h1>${teacherInfo.name} 선생님</h1>
                    <p class="quote">${teacherInfo.description}</p>
                </div>
            </div>

            <div class="banner">
                <img src="<%= request.getContextPath() %>/images/banner7.png" alt="강의 소개">
            </div>

            <div class="content-section">
                <div class="best-courses">
                    <h3>공지사항</h3>
                    <ul>
                        <c:forEach items="${noticeList}" var="item">
                            <li><a href="/course/notice/view?idx=${item.idx}">${item.title}</a> | ${item.regDate}</li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="teacher-news">
                    <h3>QnA</h3>
                    <ul>
                        <c:forEach items="${qnaList}" var="item">
                            <li><a href="/course/qna/view?idx=${item.idx}">${item.title}</a> | ${item.status eq 'N' ? '답변 대기' : '답변 완료'} | ${item.regDate}</li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>

        <div class="review-section">
            <h2>수강평</h2>
            <div class="reviews-container">
                <c:forEach items="${reviewList}" var="item">
                    <div class="review-card">
                        <div class="badge">BEST</div>
                        <div class="stars">★★★★★ ${item.score}</div>
                        <p><a href="/course/review/view?idx=${item.idx}"><b>${item.title}</b></a></p>
                        <p>${item.content}</p>
                    </div>
                </c:forEach>
            </div>
        </div>
        
        <c:forEach items="${courseList }" var="item">
		<div class="lecture-item">
            <img src="<%= request.getContextPath() %>/images/gupteacher3.png" alt="서지은 선생님" class="teacher-photo">
            <div class="lecture-details">

                <h3>${item.title }</h3>
                <p>${item.detail}</p>
            </div>
            <div class="action-buttons">
                <a href="/course/cart?idx=${item.idx }" class="ot-button">장바구니</a>
                <a href="/payment?idx=${item.idx }" class="apply-button">수강신청</a>
            </div>
        </div>
		</c:forEach>

        <section class="final-package">
            <img src="<%= request.getContextPath() %>/images/mainlogo.png" alt="스마트해법 로고">
            <h2>The Last Chance</h2>
            <p>2024 스마트해법과 함께하세요!</p>
        </section>
    </div>

    <footer class="footer">
        <p>&copy; 2024 스마트해법. All Rights Reserved.</p>
    </footer>
</body>
</html>
