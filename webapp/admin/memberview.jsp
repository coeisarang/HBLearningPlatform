<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
	margin: 0px auto;
}

.container {
	display: flex;
	max-width: 1200px;
	height: 1200px;
	margin: 0 auto;
	background-color: white;
	border-radius: 8px;
	overflow: hidden;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	margin-top: 20px;
}

.sidebar {
	width: 250px;
	background-color: #003366;
	color: white;
	padding: 20px;
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.sidebar-header {
	display: flex;
	align-items: center;
	gap: 10px;
}

.sidebar-header .logo {
	border-radius: 50%;
}

.menu {
	list-style: none;
	padding: 0;
}

.menu li {
	margin-bottom: 10px;
}

.menu a {
	color: white;
	text-decoration: none;
}

.ads img {
	width: 200px;
	margin-bottom: 10px;
	border-radius: 8px;
}

.main-content {
	flex: 1;
	padding: 20px;
}

h1 {
	font-size: 24px;
	margin-bottom: 20px;
}

.search-filter {
	display: flex;
	gap: 10px;
	margin-bottom: 10px;
}

.search-filter input {
	flex: 1;
	padding: 8px;
	border: 1px solid #ddd;
	border-radius: 4px;
}

.search-filter select, .search-filter button {
	padding: 8px;
	border: 1px solid #ddd;
	border-radius: 4px;
	background-color: white;
}

.summary {
	display: flex;
	justify-content: space-between;
	margin-bottom: 10px;
	font-size: 14px;
	color: #666;
}

.summary span {
	color: red;
}

table {
	width: 100%;
	border-collapse: collapse;
}

thead th {
	border-bottom: 2px solid #ddd;
	padding: 10px;
	text-align: left;
	font-weight: bold;
}

tbody tr {
	border-bottom: 1px solid #eee;
}

tbody td {
	padding: 10px;
	vertical-align: middle;
}

.tag {
	display: inline-block;
	background-color: black;
	color: white;
	padding: 2px 6px;
	border-radius: 4px;
	font-size: 12px;
}

.new-badge {
	background-color: red;
	color: white;
	font-size: 10px;
	padding: 2px 4px;
	border-radius: 4px;
	margin-left: 8px;
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

/*등록 양식 부분*/
.inquiry-form {
	width: 100%;
	background-color: white;
	padding: 40px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

h1 {
	margin-bottom: 20px;
	font-size: 24px;
	font-weight: bold;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	margin-bottom: 8px;
	font-weight: bold;
}

.required {
	color: red;
}

input[type="text"], input[type="email"], input[type="tel"], input[type="password"], input[type="date"], select, textarea {
	width: 100%;
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 14px;
}

textarea {
	resize: none;
}

.agreement-text {
	font-size: 14px;
	margin-bottom: 10px;
	color: #555;
}

.agreement-list {
	font-size: 14px;
	margin-bottom: 10px;
	padding-left: 20px;
}

.radio-group {
	display: flex;
	gap: 20px;
	margin-top: 10px;
}

input[type="radio"] {
	margin-right: 5px;
}

.file-hint {
	font-size: 12px;
	color: #888;
	margin-top: 5px;
}

.form-buttons {
	display: flex;
	justify-content: flex-end;
	gap: 10px;
}

button {
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	font-size: 14px;
	cursor: pointer;
}

.cancel-btn {
	background-color: #ccc;
	color: black;
}

.submit-btn {
	background-color: #007bff;
	color: white;
}

button:hover {
	opacity: 0.9;
}
</style>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="adminlogindesignheader.jsp"%>
	<div class="body2">

		<div class="container">
			<div class="sidebar">
				<div class="sidebar-header">
					<h2>회원 관리</h2>
				</div>
			</div>

			<div class="inquiry-form">
    <h1>회원 정보 수정</h1>
    <form action="/admin/member/modify" method="post" onsubmit="validateMemberForm(event)">
        
        <div class="form-group">
            <label for="memberId">회원 아이디</label>
            <input type="text" id="memberId" name="memberId" value="${item.memberId}" readonly>
        </div>
        
        <div class="form-group">
            <label for="pwd">비밀번호</label>
            <input type="password" id="pwd" name="pwd" value="${item.pwd}" required>
        </div>
        
        <div class="form-group">
            <label for="name">이름</label>
            <input type="text" id="name" name="name" value="${item.name}" required>
        </div>

        <div class="form-group">
            <label for="birthday">생년월일</label>
            <input type="date" id="birthday" name="birthday" value="${item.birthday}" required>
        </div>
        
        <div class="form-group">
            <label for="gender">성별</label>
            <input type="text" disabled value="기존 : ${item.gender }">
            <input type="radio" id="genderM" name="gender" value="M"> 남
            <input type="radio" id="genderF" name="gender" value="F"> 여
        </div>

        <div class="form-group">
            <label for="phone">전화번호</label>
            <input type="tel" id="phone" name="phone" value="${item.phone}" >
        </div>

        <div class="form-group">
            <label for="email">이메일</label>
            <input type="email" id="email" name="email" value="${item.email}" >
        </div>
        
        <div class="form-group">
            <label for="school">학교 (학생만 해당)</label>
            <input type="text" id="school" name="school" value="기존 : ${item.school}" disabled>
            <input type="radio" id="ele" name="school" value="초"> 초등학생
            <input type="radio" id="mid" name="school" value="중"> 중학생
            <input type="radio" id="high" name="school" value="고"> 고등학생
        </div>

        <div class="form-group">
            <label for="grade">학년 (학생만 해당)</label>
            <input type="text" id="grade" name="grade" value="${item.grade}" >
        </div>
        
        <div class="form-buttons">
            <button type="button" class="cancel-btn" onclick="location.href='/admin/member'; return false;">목록으로 돌아가기</button>
            <button type="submit" class="submit-btn">수정사항 저장</button>
        </div>
    </form>
</div>

		</div>


		<section class="final-package">
			<img src="<%=request.getContextPath()%>/images/mainlogo.png"
				alt="스마트해법 로고">
			<h2>The Last Chance</h2>
			<p>2024 스마트해법과 함께하세요!</p>
		</section>

	</div>
	<footer class="footer">
		<p>&copy; 2024 스마트해법. All Rights Reserved.</p>
	</footer>



<script>
function validateMemberForm(event) {
    event.preventDefault();
    const password = document.getElementById("pwd").value.trim();
    const name = document.getElementById("name").value.trim();
    let birthday = document.getElementById('birthday');
    let genderM = document.getElementById('genderM');
    let genderF = document.getElementById('genderF');
    let phone = document.getElementById('phone');
    let email = document.getElementById('email');
    let grade = document.getElementById('grade');

    // 비밀번호 검증 (비어 있으면 안됨)
   	const passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,32}$/; // 영어, 숫자, 특수문자 포함, 8~32자
    if (!passwordPattern.test(password)) {
        alert("비밀번호는 8~32자 이내의 영어, 숫자 및 특수문자가 포함되어야 합니다.");
        return false;
  	}

    const namePattern = /^[a-zA-Z가-힣]{2,20}$/; // 2자 이상 20자 이하, 영어 또는 한글
    if (!namePattern.test(name)) {
        alert("이름은 2자 이상 20자 이하의 영어 또는 한글만 입력할 수 있습니다.");
        return false;
    }

    // 생년월일 검증 (비어 있으면 안됨)
    if (birthday.value.trim() === '') {
      alert('생년월일을 입력해주세요.');
      birthday.focus();
      return;
    }

    // 성별 검증 (하나 선택되어야 함)
    if (!genderM.checked && !genderF.checked) {
      alert('성별을 선택해주세요.');
      genderM.focus();
      return;
    }

    // 전화번호 검증 (숫자만 허용, 10~11자리)
    if (phone.value.trim() !== '' && !/^\d{10,11}$/.test(phone.value.trim())) {
      alert('전화번호는 10~11자리의 숫자로 입력해주세요.');
      phone.focus();
      return;
    }

    // 학년 검증 (숫자만 허용)
    if (grade.value.trim() !== '' && !/^[1-6]+$/.test(grade.value.trim())) {
      alert('학년은 숫자로 입력해주세요.');
      grade.focus();
      return;
    }

    // 모든 검증 통과 시 폼 제출
    event.target.submit();
  }
</script>
</body>
</html>
