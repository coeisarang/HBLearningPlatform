<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
          
            width: 1300px;
            margin: 0px auto;
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

        /* 네비게이션 메뉴 */
        .navbar {
            display: flex;
            gap: 50px;
        }

       .navbar {
		    display: flex;
            justify-content: flex-end; /* 오른쪽 정렬 */
            gap: 20px; /* 항목 간 간격 설정 */
		}
		
		.navbar a {
		    text-decoration: none;
            color: #333;
            font-weight: bold;
            transition: color 0.3s;
            padding: 10px 15px; /* 패딩 추가로 클릭 영역 확대 */
		    
		}
		
		.navbar a:hover {
		    color: #0fbc8c;
		}

        .navbar ul {
            list-style: none;
            position: relative;
        }

        .navbar li {
            position: relative;
            display: inline-block;
            
        }

        .navbar ul ul {
            display: none;
            position: absolute;
            background-color: white;
            padding: 10px 0;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }

        .navbar li:hover ul {
            display: block;
            
        }

        .navbar ul ul li {
            width: 180px;
            padding: 5px 0;
            text-align: center;                     
        }
</style>
</head>
<body>
    <header class="header">
        <div class="logo2" onclick="location.href='/admin/main';" style="cursor:pointer;">
            <img src="<%= request.getContextPath() %>/images/smart.png" alt="스마트해법 로고">
        </div>
        <nav class="navbar">
            <ul>
             	<li>
                	<a href="/notice">알림방</a>
                	<ul>
                		<li><a href="/archive">자료실</a></li>
                        <li><a href="/notice">공지 사항</a></li>                               
                        <li><a href="/freeboard">자유 게시판</a></li>
                    </ul>                	
                </li>
                <li><a href="/admin/qna">회원 문의</a></li>
                <li><a href="/admin/course">강좌 관리</a></li>
                <li><a href="/admin/teacher">선생님 관리</a></li>
                <li><a href="/admin/member">회원 관리</a></li>
                <li><a href="/logout">로그아웃</a></li>
                <li><a href="#" style="color: green;">2026 19PASS</a></li>
            </ul>
        </nav>
    </header>

</body>
</html>