<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스마트해법</title>
    <style>
        /* Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background-color: #e3f2fd;  /* Light blue background */
            color: #333;
            line-height: 1.6;
        }

        .body2 {
            max-width: 1200px;
            margin: 20px auto;
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

        /* Sidebar */
        .sidebar {
            width: 250px;
            background-color: #003366;
            color: white;
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 20px;
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

        /* Main Content */
        .main-content {
            width: 100%;
		    background-color: white;
		    padding: 40px;
		    border-radius: 8px;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 24px;
            margin-bottom: 15px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
            
        }


        .meta-info {
            font-size: 14px;
            color: #666;
        }

        .content {
            margin-bottom: 20px;
            font-size: 16px;
            line-height: 1.6;
        }

        .action-buttons {
            display: flex;
            gap: 10px;
        }
        .action-buttons2 {
            display: flex;
            gap: 10px;
            margin-top : 15px; 
            justify-content: flex-end;
        }

        .report-button {
            padding: 6px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: #f9f9f9;
            color: #555;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .report-button:hover {
            background-color: #e0e0e0;
            color: #333;
        }

        /* Comment Section */
        
         /* 댓글 섹션 */
        .comment-section {

            margin-top: 30px;
            border-top: 1px solid #ddd;
            padding-top: 15px;
 
        }

        .comment-section h3 {
            margin-bottom: 10px;
            font-size: 18px;
        }

        .comment-box {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .comment-box textarea {
            width: 100%;
            height: 80px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            resize: none;
        }

        .comment-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .comment-footer span {
            font-size: 12px;
            color: #666;
        }

        .comment-footer input {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .comment-footer input:hover {
            background-color: #0056b3;
        }


        .comment-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 10px;
        }

        .comment-footer input {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .comment-footer input:hover {
            background-color: #0056b3;
        }

        .comment-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-top: 20px;
            border-left: 4px solid #007bff;
        }

		.comment-container2 {
	            background-color: white;
	            border-radius: 8px;
	            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	            padding: 20px;
	            margin-top: 10px;
	        }
        .comment-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        .author {
            font-weight: bold;
            font-size: 18px;
        }

        .date {
            font-size: 14px;
            color: #888;
        }

        .comment-content {
            margin-top: 10px;
            line-height: 1.6;
            color: #555;
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
        
    </style>
</head>
<body>

     <%@ include file="adminlogindesignheader.jsp" %>

    <div class="body2">
     
        
        <div class="container">
            <div class="sidebar">
                <h2>알림방</h2>
                <ul class="menu">
                    <li><a href="#">자료실</a></li>
                    <li><a href="#">공지사항</a></li>
                    <li><a href="#">자유게시판</a></li>
                </ul>
            </div>

            <div class="main-content">
            
            <div class="comment-container2">
                <div class="header">
                    <div>
                        <h2>작성한 자유게시판</h2>
                        <div class="meta-info">작성자: 김정 | 등록일: 24.10.20 | 조회수: 26</div>
                    </div>
                    <div class="action-buttons">
                        <a href="#" class="report-button">수정</a>
                        <a href="#" class="report-button">삭제</a>
                    </div>
                </div>

                <div class="content">
                    강의가 많은 도움이 됩니다.
                </div>
            </div>
                
                

                <div class="comment-section">
	                <h3>댓글 0개</h3>
	                <div class="comment-box">
	                    <form>
	                        <textarea placeholder="댓글을 입력하세요..."></textarea>
	                        <div class="comment-footer">
	                            <input type="submit" value="댓글 달기" />
	                        </div>
	                    </form>
	                </div>
	            </div>


                <div class="comment-container">
                    <div class="comment-header">
                        <span class="author">자신의 아이디</span>
                        <span class="date">24.10.09</span>
                    </div>
                    <div class="comment-content">
                        입력한 내용
                    </div>
                    <div class="action-buttons2">
	                        <a href="#" class="report-button">수정</a>
	                        <a href="#" class="report-button">삭제</a>
                    </div>
                </div>
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
