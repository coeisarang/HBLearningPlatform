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
           width : 1200px; 
           margin: 0px auto;
        }
        
        .container {
		    display: flex;
		    max-width: 1200px;
		    height : 1200px;
		    margin: 0 auto;
		    background-color: white;
		    border-radius: 8px;
		    overflow: hidden;
		    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
		    margin-top : 20px;
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
		
		input[type="text"],
		input[type="email"],
		select,
		textarea {
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
    <%@ include file="adminlogindesignheader.jsp" %>
    <div class="body2">

        <div class="container">
            <div class="sidebar">
                <div class="sidebar-header">
                    <h2>강의 관리</h2>
                </div>
            </div>

            <div class="inquiry-form">
                <h1>강좌 수정</h1>
                <form action="/admin/course/modify?idx=${item.idx }" method="post" onsubmit="validateAgreement(event)">
                
                	 <div class="form-group">
                        <label for="title">강좌 제목<span class="required">*</span></label>
                        <input type="text" id="title" name="title" placeholder="강좌 제목" value="${item.title }" required>
                    </div>
                	
                    <div class="form-group">
                        <label for="teacherId">선생님 아이디<span class="required">*</span></label>
                        <input type="text" id="teacherId" name="teacherId" placeholder="선생님 아이디" value="${item.teacherId }" required>
                    </div>                   

                    <div class="form-group">
                        <label for="price">가격<span class="required">*</span></label>
                        <input type="text" id="price" name="price" placeholder="가격" value="${item.price }" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="detail">강좌설명<span class="required">*</span></label>
                        <input type="text" id="detail" name="detail" placeholder="강좌 설명" value="${item.detail }" required>
                    </div>
                    
                    <div class="form-group">
                    		<label for="school">학교/학년/과목<span class="required">*</span></label>
												<select id="school" name="school">
													<option selected disabled>학교구분</option>
													<option value="초">초등학교</option>
													<option value="중">중학교</option>
													<option value="고">고등학교</option>
												</select> 
												<select id="grade" name="grade">
													<option selected disabled>학년</option>
												</select> 
												<select id="subject" name="subject">
													<option selected disabled>과목</option>
													<option value="국어">국어</option>
													<option value="수학">수학</option>
													<option value="영어">영어</option>
													<option value="사회">사회</option>
													<option value="과학">과학</option>
													<option value="한국사">한국사</option>
												</select> 
										</div>

                    <div class="form-buttons">
                        <button type="button" class="cancel-btn" onclick="location.href='/admin/course'">취소</button>
                        <button type="submit" class="submit-btn">등록</button>
                    </div>
                </form>
            </div>
        </div>
    

    <section class="final-package">
        <img src="<%= request.getContextPath() %>/images/mainlogo.png" alt="스마트해법 로고">
        <h2>The Last Chance</h2>
        <p>2024 스마트해법과 함께하세요!</p>
    </section>

</div>
    <footer class="footer">
        <p>&copy; 2024 스마트해법. All Rights Reserved.</p>
    </footer>
    
    <!-- 정보 제공 동의에 다른 등록 가능 여부 -->
    <script>
    function validateAgreement(event) {
	    event.preventDefault();
	    let title = document.getElementById('title');
	    let teacherId = document.getElementById('teacherId');
	    let price = document.getElementById('price');
	    let detail = document.getElementById('detail');
	    let school = document.getElementById('school');
	    let grade = document.getElementById('grade');
	    let subject = document.getElementById('subject');

	    // 제목 검증
	    if (title.value.trim() === '') {
	      alert('강좌 제목을 입력해주세요.');
	      title.focus();
	      return;
	    }

	    // 선생님 아이디 검증
	    if (teacherId.value.trim() === '') {
	      alert('선생님 아이디를 입력해주세요.');
	      teacherId.focus();
	      return;
	    }

	    // 가격 검증 (양의 정수만 허용)
	    let priceValue = parseInt(price.value.trim(), 10);
	    if (isNaN(priceValue) || priceValue <= 0) {
	      alert('가격은 양의 정수로 입력해주세요.');
	      price.focus();
	      return;
	    }
	    if (priceValue > 2147483647) { // int형의 최대값
	        alert('가격은 2,147,483,647 이하의 값으로 입력해주세요.');
	        price.focus();
	        return;
	     }
	    // 강좌설명 검증
	    if (detail.value.trim() === '') {
	      alert('강좌 설명을 입력해주세요.');
	      detail.focus();
	      return;
	    }

	    // 학교/학년/과목 선택 검증
	    if (school.selectedIndex === 0) {
	      alert('학교를 선택해주세요.');
	      school.focus();
	      return;
	    }
	    if (grade.selectedIndex === 0) {
	      alert('학년을 선택해주세요.');
	      grade.focus();
	      return;
	    }
	    if (subject.selectedIndex === 0) {
	      alert('과목을 선택해주세요.');
	      subject.focus();
	      return;
	    }

	    // 모든 검증 통과 시 폼 제출
	    event.target.submit();
	  }
		// 각 학교별 학년 데이터
		const gradeOptions = {
			"초" : [ "1", "2", "3", "4", "5", "6" ],
			"중" : [ "1", "2", "3" ],
			"고" : [ "1", "2", "3" ]
		};

		// 학교 구분 셀렉트 박스
		const schoolSelect = document.getElementById('school');
		// 학년 셀렉트 박스
		const gradeSelect = document.getElementById('grade');

		// 학교 구분이 변경될 때 호출되는 함수
		schoolSelect.addEventListener('change', function() {
			const selectedSchool = schoolSelect.value; // 선택된 학교 구분 값
			const grades = gradeOptions[selectedSchool]; // 해당 학교 구분에 맞는 학년 배열

			// 학년 셀렉트 박스 초기화
			gradeSelect.innerHTML = '<option selected>학년</option>';

			// 선택된 학교 구분에 맞는 학년 옵션을 추가
			if (grades) {
				grades.forEach(function(grade) {
					const option = document.createElement('option');
					option.value = grade;
					option.textContent = grade;
					gradeSelect.appendChild(option);
				});
			}
		});
        
        
        
    </script>


</body>
</html>
