<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.sidebar {
            width: 250px;
            background-color: #3d4a59;
            color: white;
            padding: 20px;
            min-height: 100vh;
        }

        .sidebar h2 {
            font-size: 18px;
            margin-bottom: 20px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            padding-bottom: 10px;
            color: #ccc;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            margin-bottom: 15px;
        }

        .sidebar ul li a {
            text-decoration: none;
            color: #ccc;
            font-size: 14px;
            transition: color 0.3s;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 5px;
        }

        .sidebar ul li a:hover {
            color: #0fbc8c;
        }
</style>
</head>
<body>

		<div class="sidebar">
            <h2>나의 학습방</h2>
            <ul>
                <li><a href="/mycourse">나의 강의실</a></li>
<!--                 <li><a href="/mypage/mypost">내가 쓴 글</a></li> -->
<!--                 <li><a href="/mypage/myreply">내가 단 댓글</a></li> -->
<!--                 <li><a href="#">성적표</a></li> -->
            </ul>
        </div>

</body>
</html>