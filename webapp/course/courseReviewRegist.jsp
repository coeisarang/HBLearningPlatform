<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>수강 후기</title>
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

        .star-rating {
            display: flex;
            gap: 5px;
            cursor: pointer;
        }

        .star {
            font-size: 40px;
            color: #ddd;
            transition: color 0.3s;
        }

        .star.selected {
            color: #ffc107;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group input, 
        .editor {
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

        .cancel-button, 
        .save-button {
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }

        .cancel-button {
            background-color: #ddd;
            color: #333;
        }

        .save-button {
            background-color: #007bff;
            color: white;
            border: none;
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
		<%@ include file="common/commonjsp.jsp"%>
		<div class="tabs">                
                <div class="tab" onclick="location.href='/course/lesson?idx=${param.idx}'">강의목차</div>
                <div class="tab" onclick="location.href='/course/notice?idx=${param.idx}'">공지사항</div>
                <div class="tab" onclick="location.href='/course/qna?idx=${param.idx}'">Q&A</div>
                <div class="tab active" onclick="location.href='/course/review?idx=${param.idx}'">수강후기</div>
                <div class="tab" onclick="location.href='/course/archive?idx=${param.idx}'">자료실</div>
           </div>
		<div class="container">
			<h1>수강후기</h1>
			<form method="POST" name="ReviewRegistfrm" action="/course/review/regist">
				<div class="star-rating">
					<span class="star" data-value="1">&#9733;</span> 
					<span class="star" data-value="2">&#9733;</span> 
					<span class="star" data-value="3">&#9733;</span>
					<span class="star" data-value="4">&#9733;</span> 
					<span class="star" data-value="5">&#9733;</span>
				</div>
				<div class="result">별점을 선택해주세요.</div>
				
				<!-- Hidden input to store selected rating -->
				<input type="hidden" name="score" id="rating" value="">

				<div class="form-group">
					<label for="title">제목</label> 
					<input type="text" id="title" name="title" placeholder="제목을 입력해주세요" required>
				</div>

				<div class="form-group">
					<label for="editor">내용</label>
					<textarea id="content" class="editor" name="content" placeholder="내용을 입력해주세요..." required></textarea>
				</div>

				<div class="buttons">
					<a href="/course/review?idx=${param.idx}" class="cancel-button" >취소</a> 
					<input type="submit" class="save-button" value="등록">
				</div>
				<input type="hidden" name="idx" value="${idx }">
			</form>
		</div>
	</div>

	<script>
        document.addEventListener('DOMContentLoaded', function() {
            const stars = document.querySelectorAll('.star');
            const result = document.querySelector('.result');
            let selectedRating = 0;

            stars.forEach((star) => {
                star.addEventListener('click', function() {
                    selectedRating = parseInt(star.getAttribute('data-value'));
                    updateStars(selectedRating);
                    updateResultText(selectedRating); // 별점 선택 시 result 영역 업데이트
                    document.getElementById('rating').value = selectedRating; // 선택한 별점 hidden input에 설정
                });

                star.addEventListener('mouseover', function() {
                    const hoverValue = parseInt(star.getAttribute('data-value'));
                    updateStars(hoverValue);
                });

                star.addEventListener('mouseout', function() {
                    updateStars(selectedRating);
                });
            });

            function updateStars(rating) {
                stars.forEach((star, index) => {
                    if (index < rating) {
                        star.classList.add('selected');
                    } else {
                        star.classList.remove('selected');
                    }
                });
            }

            function updateResultText(rating) {
                if (rating > 0) {
                    result.textContent = "선택한 별점: "+selectedRating+"개";
                } else {
                    result.textContent = '별점을 선택해주세요.';
                }
            }

            function handleCancel() {
                if (confirm('정말로 취소하시겠습니까?')) {
                    document.querySelector('form').reset();
                    selectedRating = 0; // 별점 초기화
                    updateStars(0);
                    updateResultText(0); // 결과 텍스트 초기화
                }
            }
            
            window.handleCancel = handleCancel; // handleCancel을 전역으로 노출하여 onclick 이벤트에서 사용 가능하도록 함
        });
    </script>
</body>
</html>
