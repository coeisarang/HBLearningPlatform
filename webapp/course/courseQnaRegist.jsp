<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>수강 후기</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
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
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

         .main-container {
            display: flex;
            flex: 1;
            width: 1500px;
            margin: 20px auto;
            gap: 20px;
        }

         .container {
            flex: 1;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        h1 {
            font-size: 24px;
            margin-bottom: 20px;
            border-bottom: 2px solid #007bff;
            padding-bottom: 5px;
        }

       

        .form-group {
            margin-bottom: 15px;
        }

        .form-group input, .editor {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .cancel-button {
            background-color: #ddd;
            color: #333;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }

        .save-button {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border-radius: 4px;
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


    <div class="main-container">
        <%@ include file="common/commonjsp.jsp" %>
          <div class="tabs">
                
                <div class="tab" onclick="location.href='/course/lesson?idx=${param.idx}'">강의목차</div>
                <div class="tab" onclick="location.href='/course/notice?idx=${param.idx}'">공지사항</div>
                <div class="tab active" onclick="location.href='/course/qna?idx=${param.idx}'">Q&A</div>
                <div class="tab" onclick="location.href='/course/review?idx=${param.idx}'">수강후기</div>
                <div class="tab" onclick="location.href='/course/archive?idx=${param.idx}'">자료실</div>
          </div>
        
        <div class="container">
            <h1>QnA</h1>
            <form method="POST" name="ReviewRegistfrm" enctype="multipart/form-data" >             

                <div class="form-group">
                    <label for="title">제목*</label>
                    <input type="text" id="title" name="title" placeholder="제목을 입력해주세요" required>
                </div>

                <div class="form-group">
                    <label for="editor">내용*</label>
                    <textarea id="content" class="editor" name="content"  placeholder="내용을 입력해주세요..." required></textarea>
                </div>
				
                <div class="buttons">
                    <a href="/course/qna?idx=${param.idx}" class="cancel-button">취소</a>
                    <input type="hidden" name="idx" value="${idx }">
                    <input type="submit" class="save-button" value="등록">
                </div>
            </form>
        </div>
    </div>

</body>
</html>
