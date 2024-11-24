<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스마트해법</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">

    <style>
        /* 전역 스타일 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Noto Sans', 'Arial', sans-serif;
        }

        body {
            background-color: #e3f2fd;
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

        .container {
            background-color: white;
            width: 600px;
            margin: 50px auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
            font-weight: 700;
            font-size: 24px;
        }

        .form-group {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 15px;
        }

        .form-group label {
            width: 150px;
            font-weight: 600;
            color: #333;
        }

        .form-group input[type="text"],
        .form-group input[type="email"],
        .form-group input[type="password"],
        .form-group select {
            flex: 1;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-left: 10px;
        }

        .warning {
            color: red;
            font-size: 12px;
            margin-top: 5px;
        }

        .submit-button {
            width: 100%;
            padding: 15px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .submit-button:hover {
            background-color: #0056b3;
        }

        .footer {
            background-color: #0044cc;
            color: white;
            text-align: center;
            padding: 15px 0;
            margin-top: auto;
        }

        .final-package {
            text-align: center;
            background-color: white;
            padding: 20px;
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


<div class="container">
    <h1>회원정보 수정</h1>
    <form method="POST" action="/mypage/modify" id="frmmodify">
        <div class="form-group">
            <label>아이디</label>
            <span>${item.memberId}</span>
        </div>

        <div class="form-group">
            <label>이름</label>
            <span>${item.name}</span>
        </div>

        <div class="form-group">
            <label>생년월일</label>
            <span>${item.birthday}</span>
        </div>
        <div class="form-group">
            <label>비밀번호</label>
            <input type="password" id="password" name="password" value="">
        </div>
        <div class="form-group">
            <label>비밀번호 확인</label>
            <input type="password" id="password2" name="password2" value="">
        </div>

        <div class="form-group">
            <label>이메일</label>
            <input type="email" id="email" name="email" value="${item.email}">
        </div>

        <div class="form-group">
            <label>휴대폰</label>
            <input type="text" id="phone" name="phone" placeholder="휴대폰번호" value="${item.phone }">
        </div>

        <div class="form-group">
                <label for="grade">학년</label>
                <select id="grade1" name="grade1" onchange="updateGrade2()">
                	<option value="${item.school}">선택</option>
                    <option value="초">초등학생</option>
                    <option value="중">중학생</option>
                    <option value="고">고등학생</option>
                </select>
                <select id="grade2" name="grade2">
                    <option value="${item.grade}">선택</option>
                </select>
        </div>
        <div class="form-group">
                <label>성별</label>
                <input type="radio" id="male" name="gender" value="M" ${item.gender eq 'M' ? 'checked' :'' }>
                <label for="male">남자</label>
                <input type="radio" id="female" name="gender" value="F" ${item.gender eq 'F' ? 'checked' :'' }>
                <label for="female">여자</label>
        </div>

        <input type="submit" id="btnsubmit" class="submit-button" value="수정하기"/>
    </form>
</div>

<section class="final-package">
    <img src="<%= request.getContextPath() %>/images/mainlogo.png" alt="스마트해법 로고">
    <h2>The Last Chance</h2>
    <p>2024 스마트해법과 함께하세요!</p>
</section>

<footer class="footer">
    <p>&copy; 2024 스마트해법. All Rights Reserved.</p>
</footer>

<script>
function updateGrade2() {
    const grade1 = document.getElementById("grade1").value;
    const grade2 = document.getElementById("grade2");
    
    // 기존 옵션 제거
    grade2.innerHTML = "<option value='${item.grade}'>선택</option>";

    let options = [];

    if (grade1 === "초") {
        options = [
            { value: "1", text: "1학년" },
            { value: "2", text: "2학년" },
            { value: "3", text: "3학년" },
            { value: "4", text: "4학년" },
            { value: "5", text: "5학년" },
            { value: "6", text: "6학년" }
        ];
    } else if (grade1 === "중") {
        options = [
            { value: "1", text: "1학년" },
            { value: "2", text: "2학년" },
            { value: "3", text: "3학년" }
        ];
    } else if (grade1 === "고") {
        options = [
            { value: "1", text: "1학년" },
            { value: "2", text: "2학년" },
            { value: "3", text: "3학년" }
        ];
    }

    // 새 옵션 추가
    options.forEach(option => {
        const newOption = document.createElement("option");
        newOption.value = option.value;
        newOption.text = option.text;
        grade2.add(newOption);
    });
}



    function filterSubject(subject) {
        const cards = document.querySelectorAll('.subject-card');
        cards.forEach(card => {
            card.style.display = (subject === 'all' || card.classList.contains(subject)) ? 'block' : 'none';
        });
    }
    
    const frm = document.getElementById("frmmodify");
	document.getElementById("btnsubmit").addEventListener("click", e => {
		e.preventDefault();
		e.stopPropagation();

	    const email = document.getElementById("email").value.trim();
	    const password = document.getElementById("password").value.trim();
	    const confirmPassword = document.getElementById("password2").value.trim();

	    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // 이메일 형식 정규 표현식
	    
	    if (email.length > 0 && !emailPattern.test(email)) {
	        alert("유효한 이메일 주소를 입력하세요.");
	        return false;
	    }

	    const passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,20}$/; // 영어, 숫자, 특수문자 포함, 8~32자
	    
	    if(password.length > 0) {
		    if (!passwordPattern.test(password)) {
		        alert("비밀번호는 8~20자 이내의 영어, 숫자 및 특수문자가 포함되어야 합니다.");
		        return false;
		    }
	
		    if (confirmPassword !== password) {
		        alert("비밀번호 확인이 일치하지 않습니다.");
		        return false;
		    }
	    }
	    else {
	    	document.getElementById("password").value="${item.pwd}"
	    }
	    
	    const phonePattern = /^\d{11}$/; // 11자리 숫자만 허용

	    if (phone.length > 0 && !phonePattern.test(phone)) {
	        alert("휴대전화번호는 11자리 숫자만 입력할 수 있습니다.");
	        return false;
	    }
	    
	    frm.submit();
	});
</script>

</body>
</html>
