<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강좌 상세 페이지</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
    <style>
        /* 전역 스타일 초기화 */
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

        /* 메인 컨테이너 */
        .main-container {
            display: flex;
            flex: 1;
            max-width: 1200px;
            margin: 20px auto;
            gap: 20px; /* 사이드바와 컨테이너 간의 간격 */
        }

        /* 사이드바 스타일 */
        .sidebar {
            width: 250px;
            background-color: #3d4a59;
            color: white;
            padding: 20px;
            border-radius: 8px;
            height: auto;
        }

        .sidebar h2 {
            margin-bottom: 20px;
            font-size: 18px;
        }

        .sidebar ul {
            list-style: none;
        }

        .sidebar ul li {
            margin-bottom: 15px;
        }

        .sidebar ul li a {
            text-decoration: none;
            color: white;
            font-size: 14px;
        }

        /* 강좌 상세 컨테이너 */
        .container {
            flex: 1;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .course-header {
            display: flex;
            padding: 20px;
            align-items: center;
            border-bottom: 1px solid #ddd;
        }

        .course-header img {
            width: 120px;
            height: auto;
            border-radius: 8px;
            margin-right: 20px;
        }

        .course-info h2 {
            font-size: 22px;
            color: #333;
            margin-bottom: 8px;
        }

        .tags {
            display: flex;
            gap: 10px;
            margin-bottom: 10px;
        }

        .tag {
            background-color: #007bff;
            color: white;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
        }

        .buttons {
            margin-top: 10px;
        }

        .buttons button {
            padding: 10px 20px;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            font-size: 14px;
            margin-right: 10px;
            transition: background-color 0.3s;
        }

        .btn-blue {
            background-color: #007bff;
            color: white;
        }

        .btn-blue:hover {
            background-color: #0056b3;
        }

        .btn-grey {
            background-color: #6c757d;
            color: white;
        }

        .btn-grey:hover {
            background-color: #5a6268;
        }

        .progress-container {
            display: flex;
            justify-content: space-between;
            padding: 20px;
            background-color: #f8f9fa;
        }

        .progress-circle {
            width: 80px;
            height: 80px;
            background-color: #007bff;
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
        }

        .tabs {
            display: flex;
            justify-content: space-around;
            border-bottom: 2px solid #ddd;
            margin-top: 20px;
        }

        .tab {
            padding: 10px 0;
            flex: 1;
            text-align: center;
            cursor: pointer;
            font-weight: 700;
            color: #666;
            border-bottom: 3px solid transparent;
            transition: color 0.3s, border-bottom 0.3s;
        }

        .tab.active {
            color: #007bff;
            border-bottom: 3px solid #007bff;
        }

        .tab-content {
            padding: 20px;
        }

        .footer-banner {
            text-align: center;
            margin-top: 30px;
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
        }

        .footer-banner img {
            max-width: 100%;
            height: auto;
        }
    </style>
</head>
<body>
    <!-- 상단 헤더 포함 -->

    <!-- 메인 컨테이너 -->
    <div class="main-container">
        <!-- 사이드바 -->
        <%@ include file="/sidebar.jsp" %>

        <!-- 강좌 상세 컨테이너 -->
        <div class="container">
            <div class="course-header">
                <img src="<%= request.getContextPath() %>/images/teacher3.png" alt="강사 이미지">
                <div class="course-info">
                    <div class="tags">
                        <span class="tag">${courseInfo.teacherInfo.subject}</span>
                        <span class="tag">${courseInfo.teacherInfo.name }</span>
                    </div>
                    <h2>${courseInfo.title}</h2>
                </div>
            </div>

            <div class="progress-container">
                <div class="progress">    
                    <div class="meta-item">
                        <span>수강 기간</span>
                        <strong>24.10.23~24.10.23</strong>
                    </div>
                    <div class="meta-item">
                        <span>학습 진도율</span>
                        <strong>0%</strong>
                    </div>
                </div>
            </div>
