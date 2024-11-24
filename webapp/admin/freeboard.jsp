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
			width: 100%;
		    background-color: white;
		    padding: 40px;
		    border-radius: 8px;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
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
        
        
        
         /*페이징 하는 영역 */
        .pagination {
		    display: flex;
		    align-items: center;
		    justify-content: center; /* Center-aligns horizontally */
		    gap: 5px;
		    margin-top: 15px;
		}
		
		.page-btn {
		    border: 1px solid #ddd;
		    background-color: white;
		    color: #333;
		    padding: 5px 10px;
		    border-radius: 4px;
		    cursor: pointer;
		    font-size: 14px;
		}
		
		.page-btn.active {
		    background-color: #007bff;
		    color: white;
		}
		
		.page-btn:hover {
		    background-color: #f1f1f1;
		}
		
		.page-btn:disabled {
		    cursor: not-allowed;
		    opacity: 0.5;
		}



    </style>
</head>
<body>
    <!-- 헤더 -->
 <%@ include file="adminlogindesignheader.jsp" %>
	<div class="body2">
	

 	<div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="sidebar-header">
                <h2>알림방</h2>
            </div>
            <ul class="menu">
                <li><a href="#">자료실</a></li>
                <li><a href="#">공지사항</a></li>
                <li><a href="#">자유게시판</a></li>
            </ul>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <h1>자유게시판</h1>
            <div class="search-filter">
                <input type="text" placeholder="검색어를 입력하세요.">
                <button class="page-btn">검색</button>
                <button class="page-btn">등록</button>
            </div>

            <div class="summary">
                <p>총 게시물 <span>4,454개</span></p>
            </div>

            <table>
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>등록일</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><span class="tag">공지</span></td>
                        <td>2025학년도 대학수학능력시험 답안지 전문 </td>
                        <td>24.10.24</td>
                        <td>1,616</td>
                    </tr>
                    <tr>
                        <td>4454</td>
                        <td>2024년 EBS 고교강의 만족도 조사 (~10/31까지)</td>
                        <td>24.10.20</td>
                        <td>2,437</td>
                    </tr>
                </tbody>
            </table>
            <%@include file="/pageNo.jsp" %>
            <div class="pagination">
		        <button class="page-btn">&laquo;</button>
		        <button class="page-btn">&lsaquo;</button>
		        
		        <button class="page-btn">6</button>
		        <button class="page-btn">7</button>
		        <button class="page-btn">8</button>
		        <button class="page-btn">9</button>
		        <button class="page-btn">10</button>
		        
		        <button class="page-btn">&rsaquo;</button>
		        <button class="page-btn">&raquo;</button>
		    </div>
            
        </div>
    </div>


    <!-- 파이널 패키지 안내 -->
    <section class="final-package">
        <img src="<%= request.getContextPath() %>/images/mainlogo.png" alt="스마트해법 로고">
        <h2>The Last Chance</h2>
        <p>2024 스마트해법과 함께하세요!</p>
    </section>
    </div>
    

    <!-- 푸터 -->
    <footer class="footer">
        <p>&copy; 2024 스마트해법. All Rights Reserved.</p>
    </footer>
    


</body>
</html>
