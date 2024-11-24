<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
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
		
		
        .meta-info {
            font-size: 14px;
            color: #666;
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
            <div class="sidebar">
                <div class="sidebar-header">
                    <h2>알림방</h2>
                </div>
                <ul class="menu">
                    <li><a href="/notice">공지사항</a></li>
                    <li><a href="/archive">자료실</a></li>                    
                    <li><a href="/freeboard">자유게시판</a></li>
                </ul>
            </div>

            <div class="inquiry-form">
                <h1>${boardname } 수정</h1>
                <div class="meta-info">작성자: 김정</div>
                <form action="#" method="post" onsubmit="validateAgreement(event)">
                    <div class="form-group">
                        <label for="title">제목<span class="required">*</span></label>
                        <input type="text" id="title" name="title" placeholder="제목을 입력해주세요." value=" 가져온 제목" required>
                    </div>

                    <div class="form-group">
                        <label for="content">내용<span class="required">*</span></label>
                        <textarea id="content" name="content" rows="6" placeholder="문의내용을 입력해주세요." required>이전 글</textarea>
                    </div>

                    <div class="form-group">
                        <label for="file-upload">첨부파일</label>
                        <input type="file" id="file-upload" name="file-upload">
                    </div>

                    <div class="form-buttons">
                        <button type="button" class="cancel-btn">취소</button>
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
    


</body>
</html>
