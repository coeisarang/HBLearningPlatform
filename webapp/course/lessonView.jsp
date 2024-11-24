<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이맥 캐스트</title>
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
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            width: 800px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        h1 {
            font-size: 24px;
            padding: 20px;
            border-bottom: 1px solid #ddd;
        }

        .video-wrapper {
            position: relative;
            width: 100%;
            height: 450px;
            background-color: black;
        }

        .video-wrapper video {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .play-button {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 60px;
            height: 60px;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
        }

        .play-button::before {
            content: '▶';
            font-size: 24px;
            color: black;
        }

        .course-info {
            padding: 20px;
            line-height: 1.6;
            border-bottom: 1px solid #ddd;
        }

        .course-info p {
            margin-bottom: 5px;
        }

        .course-info a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }

        .course-info a:hover {
            text-decoration: underline;
        }

        .course-meta {
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            font-size: 14px;
            color: #666;
        }

        .course-meta span {
            margin-right: 15px;
        }

        .share-button {
            display: flex;
            align-items: center;
            cursor: pointer;
        }

        .share-button::before {
            content: '🔗';
            margin-right: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>${dto.title }</h1>

        <div class="video-wrapper">
            <video src="${dto.videoPath }" controls></video>
        </div>

        <div class="course-info">
            <p>${dto.subject} ${dto.teacherName }</p>
        </div>

    </div>
</body>
</html>
