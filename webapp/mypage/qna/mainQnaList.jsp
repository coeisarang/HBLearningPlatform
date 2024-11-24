<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스마트해법 MyPage</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
    <style>

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

        .container2 {
            width: 80%;
/*             margin: 30px auto; */
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

        .button-container {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }

        .search-container {
            display: flex;
            gap: 5px;
        }

        .search-text {
            font-size: 16px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            width: 250px;
        }

        .search-icon {
            width: 40px;
            height: 40px;
            background-image: url('https://cdn-icons-png.flaticon.com/512/622/622669.png');
            background-size: cover;
            border: none;
            cursor: pointer;
        }

        .edit-button {
            padding: 10px 20px;
            background-color: #a09f9f;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }

        .edit-button:hover {
            background-color: white;
            color: #007bff;
            border: 1px solid #007bff;
        }

        .lecture-list-header {
            display: flex;
            justify-content: space-between;
            margin: 20px 0;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
            font-weight: 600;
            color: #666;
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
            content: '✔';
            font-size: 16px;
            display: none;
        }

        .status-indicator.complete::before {
            display: block;
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
    <c:otherwise>
        <%@ include file="/pluse/logoutdesignheader.jsp" %>
    </c:otherwise>
</c:choose>
    <div style="display: flex;">
    <%@ include file="/mypage/sidebar.jsp" %>

    <div class="container2" style="flex:1;">
    <h1>나의 QnA 목록</h1>

		<div class="button-container">
        <form class="search-container">
            <input type="text" name="search" class="search-text" placeholder="검색어를 입력하세요" />
            <button type="submit" class="search-icon"></button>
        </form>
        <a href="/mypage/qna/regist" class="edit-button">등록</a>
    </div>
    
    <div class="lecture-list-header">
        <span>QnA 수 ${fn:length(pList)}</span>  <!-- QnA 글 수를 표시 -->
        <div class="sort-options">
            <span>최근 등록순</span>
        </div>
    </div>

    <div class="container">
        <!-- 리스트 -->
        <c:forEach var="p" items="${pList}">
            <hr>
            <div class="list-item">
                <div class="item-info">
                    <h3><a href="/mypage/qna/view?idx=${p.idx }">${p.title}</a></h3>
                    <span>작성자: ${p.memberId}</span>
                    <span>등록일: ${p.regDate}</span>
                </div>
                <div class="status-action">
                    <c:choose>
                        <c:when test="${p.status == 'Y'}">
                            <span class="status-complete">답변 완료</span>
                        </c:when>
                        <c:otherwise>
                            <span>답변 대기 중</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <hr>
        </c:forEach>
        
				
        <!-- QnA 글이 없을 시 -->
        <c:if test="${empty pList}">
            <div class="lecture-empty">
                <img src="https://cdn-icons-png.flaticon.com/512/83/83562.png" alt="QnA 없음 아이콘">
                <p>작성된 QnA가 없습니다.</p>
            </div>
        </c:if>
    </div>
</div>
</div>
</body>
</html>
