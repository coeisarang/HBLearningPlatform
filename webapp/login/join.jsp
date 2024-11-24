<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 가입</title>
<!--     <link rel="stylesheet" href="styles.css"> -->
    <style>
        /* 전역 스타일 초기화 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background-color: #e3f2fd;
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

        .container {
            width: 1000px;
            height : 900px;
            background-color: white;
            margin: auto;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            margin-bottom: 10px;
            border-bottom: 2px solid #ccc;
            padding-bottom: 5px;
        }

        .input-group {
            margin-bottom: 15px;
             padding: 8px;
            display: flex;
            align-items: center;
        }

        .input-group label {
            width: 120px;
            margin-right: 10px;
        }

        .input-group input,
        .input-group select {
            flex: 1;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .input-group button {
            margin-left: 10px;
            padding: 8px 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .input-group button:hover {
            background-color: #0056b3;
        }

        .gender-group {
            display: flex;
            align-items: center;
        }

        .gender-group input {
            margin: 0 5px;
        }

        .submit-btn {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .submit-btn:hover {
            background-color: #0056b3;
        }

        .footer {
            background-color: #0044cc;
            color: white;
            text-align: center;
            padding: 15px 0;
            margin-top: auto;
        }

        .footer p {
            margin: 0;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <%@ include file="/pluse/logoutdesignheader.jsp"  %>


    <div class="container">
        <form method="POST" action="/join" id="frmjoin">
            <h2>인증정보</h2>
            <div class="input-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name">
            </div>
            <div class="input-group">
                <label for="email">이메일 주소</label>
                <input type="email" id="email" name="email">
            </div>

            <h2>통합회원 필수 정보 입력</h2>
            <div class="input-group">
                <label for="userid">아이디</label>
                <input type="text" id="userid" name="userid" placeholder="영문, 숫자 6~15자">
            </div>
            
            <div class="input-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" placeholder="영문, 숫자 및 특수문자 포함 8~32자">
            </div>
            <div class="input-group">
                <label for="confirm-password">비밀번호 확인</label>
                <input type="password" id="confirm-password" name="confirm-password" placeholder="비밀번호를 한 번 더 입력하세요.">
            </div>
			<div class="input-group">
				<label for="birthdate">생년월일</label>
				<select id="year" name="year" onchange="updateMonths()">
					<option selected disabled>선택</option>
					
					<c:forEach begin="1950" end="2017" step="1" var="i">
                    <option value="${i}">${i}</option>
                    </c:forEach>
                    
				</select>
				<select id="month" name="month" onchange="updateDays()" disabled>
					<option value="" selected disabled>선택</option>
					<option value="01">1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select>
				<select id="day" name="day" disabled>
					<option value="" selected disabled>선택</option>
					<!-- 일은 자바스크립트로 동적으로 업데이트 -->
				</select>
			</div>

			<h2>선택 정보 입력</h2>
            <div class="input-group">
                <label for="phone">휴대전화번호</label>
                <input type="tel" id="phone" name="phone" placeholder="숫자만 입력">
            </div>
            <div class="input-group">
                <label for="grade">학년</label>
                <select id="grade1" name="grade1" onchange="updateGrade2()">
                	<option value="" selected disabled>선택</option>
                    <option value="초">초등학생</option>
                    <option value="중">중학생</option>
                    <option value="고">고등학생</option>
                </select>
                <select id="grade2" name="grade2">
                    <option value="" selected disabled>선택</option>
                </select>
            </div>
            <div class="input-group gender-group">
                <label>성별</label>
                <input type="radio" id="male" name="gender" value="M">
                <label for="male">남자</label>
                <input type="radio" id="female" name="gender" value="F">
                <label for="female">여자</label>
            </div>
            

            <button type="submit" id="btnsubmit" class="submit-btn">회원가입</button>
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
	
	
	
	
	const idinput = document.getElementById("userid");
	
	
	
	
	function updateGrade2() {
	    const grade1 = document.getElementById("grade1").value;
	    const grade2 = document.getElementById("grade2");
	    
	    // 기존 옵션 제거
	    grade2.innerHTML = "<option value='' selected disabled>선택</option>";

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
	
	
	
	
		function updateMonths() {
			const year = document.getElementById("year").value;
			const monthSelect = document.getElementById("month");

			// 월 선택 초기화
			monthSelect.selectedIndex = 0;
			updateDays(); // 일도 초기화

			if (year) {
				monthSelect.disabled = false; // 연도가 선택되면 월 선택 가능
			} else {
				monthSelect.disabled = true;
			}
		}

		function updateDays() {
			const year = document.getElementById("year").value;
			const month = document.getElementById("month").value;
			const daySelect = document.getElementById("day");
			
			daySelect.disabled = false;

			// 일 선택 초기화
			daySelect.innerHTML = '<option value="" selected disabled>선택</option>';

			if (year && month) {
				const daysInMonth = new Date(year, month, 0).getDate(); // 해당 월의 일수
				for (let day = 1; day <= daysInMonth; day++) {
					daySelect.innerHTML += '<option value="' +(day < 10 ? '0' + day : day)+'">'+day+'</option>';
				}
			}
		}
		
		let timeout=null;
		
		document.getElementById("userid").addEventListener('input', function() {
	        let id = this.value;
	        

	        // 5글자 미만일 때는 중복 검사 중지
	        if (id.length < 6) {
	            this.style.color="red";
	            return;
	        } else {
	            this.style.color="black";
	        }

	        // 이전의 서버 요청 대기 중인 타이머를 취소
	        clearTimeout(timeout);

	        // 입력 후 500ms 후에 중복 검사 시작 (디바운스 처리)
	        timeout = setTimeout(function() {
	            // 서버에 중복 체크 요청 (비동기 방식)
	            let xhr = new XMLHttpRequest();
	            xhr.open("POST", "/join/checkid", true);  // 비동기 요청
	            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	            xhr.onreadystatechange = function () {
	                if (xhr.readyState == 4 && xhr.status == 200) {
	                    if (xhr.responseText === "exist") {
	                    	idinput.style.color="red";
	                    } else {
	                    	idinput.style.color="black";
	                    }
	                }
	            };
	            xhr.send("idn=" + id);  // 서버로 입력한 idn 전송
	        }, 500);  // 500ms 지연 후 서버 요청 (디바운스)
	    });
		
		const frm = document.getElementById("frmjoin");
		document.getElementById("btnsubmit").addEventListener("click", e => {
			e.preventDefault();
			e.stopPropagation();
		    const name = document.getElementById("name").value.trim();
		    const email = document.getElementById("email").value.trim();
		    const userid = document.getElementById("userid").value.trim();
		    const password = document.getElementById("password").value.trim();
		    const confirmPassword = document.getElementById("confirm-password").value.trim();
		    const year = document.getElementById("year").value;
		    const month = document.getElementById("month").value;
		    const day = document.getElementById("day").value;

		    const namePattern = /^[a-zA-Z가-힣]{2,20}$/; // 2자 이상 20자 이하, 영어 또는 한글
		    if (!namePattern.test(name)) {
		        alert("이름은 2자 이상 20자 이하의 영어 또는 한글만 입력할 수 있습니다.");
		        return false;
		    }

		    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // 이메일 형식 정규 표현식
		    if (!emailPattern.test(email)) {
		        alert("유효한 이메일 주소를 입력하세요.");
		        return false;
		    }

		    const useridPattern = /^[a-zA-Z0-9]{6,20}$/; // 6~20자, 영어와 숫자 조합
		    if (!useridPattern.test(userid)) {
		        alert("아이디는 6자 이상 20자 이하의 영어와 숫자만 입력할 수 있습니다.");
		        return false;
		    } else if (idinput.style.color=='red') {
		    	alert("이미 존재하는 아이디 입니다.");
		    	document.getElementById("userid").focus();
	            return false;
	        }

		    const passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,20}$/; // 영어, 숫자, 특수문자 포함, 8~32자
		    if (!passwordPattern.test(password)) {
		        alert("비밀번호는 8~20자 이내의 영어, 숫자 및 특수문자가 포함되어야 합니다.");
		        return false;
		    }

		    if (confirmPassword !== password) {
		        alert("비밀번호 확인이 일치하지 않습니다.");
		        return false;
		    }

		    if (!year || !month || !day) {
		        alert("생년월일을 선택하세요.");
		        return false;
		    }
		    
		    const phone = document.getElementById("phone").value.trim();

		    // 휴대전화번호 유효성 검사
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
