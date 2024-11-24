<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스마트해법 MyPage</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/mypage/sidebar.css">
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

        .container2 {
            width: 100%;
           	height : 1500px;
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
            text-align: center;
        }

        .container {
            width: 100%;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            height: auto;
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }

        input[type="text"], textarea {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        textarea {
            height: 150px;
            resize: none;
            font-size: 16px;
        }

        .file-upload p {
            font-size: 12px;
            color: #666;
            margin-top: 5px;
        }

        .notice {
            font-size: 12px;
            color: #666;
            margin: 10px 0 20px;
        }

        .input {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .input:hover {
            background-color: #0056b3;
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
    <c:otherwise>
        <%@ include file="/pluse/logoutdesignheader.jsp" %>
    </c:otherwise>
</c:choose>

    <div style="display: flex;">
        <%@ include file="/mypage/sidebar.jsp" %>

        <div class="container2" style="flex: 1;">
            <h1>QnA 등록</h1>
            <div class="container">
                <form action="/mypage/qna/regist" method="post">
                    <label for="title">제목</label>
                    <input type="text" id="title" name="title" placeholder="제목을 입력해 주세요.">

                    <label for="content">질문 내용</label>
                    <textarea id="content" name="content" placeholder="질문 내용을 입력해 주세요."></textarea>

                    <p class="notice">[게시물 작성 시 유의 사항] 산업안전보건법에 따라 8대 근로자 보호조치에 의거하여 폭언, 욕설 등이 포함된 내용은 상태가 제한될 수 있습니다.</p>

                    <input class="input" type="submit" value="등록">
                </form>
            </div>
        </div>
    </div>
</body>
</html>
