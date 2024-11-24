<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            height: 400px;
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
             width: 100%;
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
        /* 전역 스타일 초기화 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

       	.login-container {
            width: 800px;
            height:600px;
           	font-size :25px;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
         .body2 {
             background-color: #e3f2fd;
            display: flex;
            justify-content: center;
            align-items: center;
            height : 700px;
            position: relative;
            width: 800px;
            margin: 0px auto;
        }

        .toggle-group {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .toggle-group label {
            display: flex;
            align-items: center;
            gap: 5px;
            margin: 0 10px;
            cursor: pointer;
            font-weight: bold;
            color: #666;
        }

        input[type="radio"] {
            display: none;
        }

        input[type="radio"]:checked + label {
            color: #1e88e5;
        }

        .login-input {
            width: 100%;
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size:20px;
        }

        .login-options {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
            font-size: 12px;
            color: #666;
            font-size:20px;
        }

        .login-options a {
            color: #1e88e5;
            text-decoration: none;
            font-size:20px;
        }

        .login-button {
            width: 100%;
            padding: 12px;
            background-color: #1e88e5;
            color: white;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
            font-size:20px;
        }

        .login-button:hover {
            background-color: #1565c0;
        }

        .signup-link {
            margin-top: 15px;
            font-size: 12px;
            color: #666;
            font-size:20px;
        }

        .signup-link a {
            color: #1e88e5;
            text-decoration: none;
        }

    </style>
</head>
<body>
    <!-- 헤더 -->
   
    <%@ include file="/pluse/logoutdesignheader.jsp"  %>
    
     <div class="body2">
     <Form action="/login" method="post">
    <div class="login-container">

        <!-- 아이디와 비밀번호 입력 -->
        <input type="text" class="login-input" placeholder="아이디" required name="userId">
        <input type="password" class="login-input" placeholder="비밀번호" required name="password">

        <!-- 옵션과 링크 -->
        <div class="login-options">
            <label><input type="checkbox" name="loginSave"> 아이디 저장</label>
        </div>

        <!-- 로그인 버튼 -->
        <button class="login-button">로그인</button>


        <!-- 회원가입 링크 -->
        <div class="signup-link">
            아직 스마트 해법 회원이 아니신가요? <a href="/join">회원가입</a>
        </div>
    </div>
    </Form>
    </div>
 
   
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
