<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스마트해법 MyPage</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
		<link rel="stylesheet" type="text/css" href="/mypage/sidebar.css">
    <style>
        /* 전역 스타일 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Noto Sans', 'Roboto', sans-serif;
        }

        body {
            background-color: #f4f4f4;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        header {
		    background-color: white;
		    padding: 15px 30px;
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    border-bottom: 2px solid #ddd;
		    position: relative;
		    z-index: 10;
		}
        
      
        
        .content {
            flex: 1;
            padding: 20px;
        }

        .info-section {
            display: flex;
            gap: 20px;
            justify-content: center;
        }
         .info-section2 {
         
         	margin-top : 50px;
            display: flex;
            gap: 20px;
            justify-content: center;
       }

        .info-card {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 500px;
            padding: 20px;
            text-align: center;
            height : 500px;
        }

        .info-card h3 {
            font-size: 18px;
            font-weight: bold;
            display: flex;
            justify-content: space-between;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
            margin-bottom: 15px;
            color: #333;
        }

        .info-content {
            display: flex;
            justify-content: space-around;
            margin: 15px 0;
        }

        .info-item p {
            font-size: 14px;
            color: #666;
        }

        .info-item span {
            font-size: 24px;
            color: #007bff;
        }

        .info-button {
            margin-top: 10px;
            padding: 10px 15px;
            border: 1px solid #007bff;
            background-color: white;
            color: #007bff;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }

        .info-button:hover {
            background-color: #007bff;
            color: white;
        }

        .inquiry-card {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
            margin-top: 20px;
        }

        .tabs {
            display: flex;
            justify-content: space-around;
            margin-bottom: 10px;
        }

        .tab {
            background: none;
            border: none;
            font-size: 16px;
            cursor: pointer;
            color: #555;
            padding: 10px;
            border-bottom: 2px solid transparent;
            transition: color 0.3s, border-bottom 0.3s;
        }

        .tab.active {
            color: #007bff;
            border-bottom: 2px solid #007bff;
        }

        .tab:hover {
            color: #007bff;
        }

        .tab-content {
            font-size: 14px;
            color: #555;
            margin: 15px 0;
        }

        .inquiry-button {
            padding: 10px 20px;
            border: 1px solid #007bff;
            background-color: white;
            color: #007bff;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }

        .inquiry-button:hover {
            background-color: #007bff;
            color: white;
        }
        /* 전역 스타일 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Noto Sans', sans-serif;
        }

        body {
            background-color: #f4f4f4;
        }

        .container {
          	width: 100%;
            margin: 0 auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            height : auto ;
        }
        .container2 {
          	width: 100%;
            margin: 0 auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            height : 1300px ;
        }
         .container3 {
          	width: 100%;
            margin: 0 auto;
            margin-top:20px; 
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            height : auto ;
        }

        h1 {
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: 700;
            color: #2c3e50;
        }

        .tabs {
            display: flex;
            border-bottom: 2px solid #ddd;
        }

        .tab {
            flex: 1;
            text-align: center;
            padding: 10px 0;
            cursor: pointer;
            font-weight: 600;
            color: #666;
            border-bottom: 3px solid transparent;
            transition: color 0.3s, border-bottom 0.3s;
        }

        .tab.active {
            color: #007bff;
            border-bottom: 3px solid #007bff;
        }

        .filters {
            display: flex;
            justify-content: space-between;
            margin: 20px 0;
        }

        .filter-group {
            display: flex;
            gap: 10px;
        }

        .filter-group button {
            padding: 10px 20px;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 20px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }

        .filter-group button.active {
            background-color: #007bff;
            color: white;
            border-color: #007bff;
        }

        .teacher-selection {
            text-align: center;
            color: #666;
            font-size: 14px;
            margin-top: 10px;
        }

        .lecture-list-header {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
            padding-bottom: 10px;
            border-bottom: 1px solid #ddd;
            font-weight: 600;
            color: #666;
        }

        .lecture-empty {
            text-align: center;
            margin-top: 50px;
            color: #aaa;
        }

        .lecture-empty img {
            width: 80px;
            margin-bottom: 10px;
        }
        .list-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
            border-bottom: 1px solid #ddd;
        }

        .list-item:last-child {
            border-bottom: none;
        }

        .item-info {
            display: flex;
            flex-direction: column;
        }

        .item-info h3 {
            font-size: 18px;
            margin-bottom: 5px;
            font-weight: 600;
            color: #333;
        }

        .item-info span {
            font-size: 14px;
            color: #666;
        }

        
        /* 상태 표시 동그라미 */
        .status-indicator {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            border: 2px solid #007bff;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }

        .status-indicator.complete {
            background-color: #007bff;
            color: white;
        }

        .status-indicator::before {
            content: '✔'; /* 완료 상태의 체크 아이콘 */
            font-size: 16px;
            display: none;
        }

        .status-indicator.complete::before {
            display: block;
        }
        .faq-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .faq-header h1 {
            font-size: 20px;
            font-weight: bold;
            color: #333;
        }

        .faq-header .date {
            font-size: 14px;
            color: #666;
        }

        .faq-content {
            margin-bottom: 20px;
            line-height: 1.6;
            color: #333;
            font-size: 16px;
        }

        .faq-content p {
            margin-bottom: 10px;
        }

        .faq-content .important {
            font-weight: bold;
            margin-top: 20px;
        }

        .faq-content ul {
            list-style-type: disc;
            padding-left: 20px;
            margin-top: 10px;
        }

        .faq-content ul li {
            margin-bottom: 8px;
            color: #555;
        }



        .btn {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #0056b3;
        }
         h2 {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .textarea-group {
            margin-bottom: 20px;
        }

        textarea {
            width: 100%;
            height: 150px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
            resize: none;
            font-size: 16px;
        }

        .notice {
            font-size: 12px;
            color: #666;
            margin-bottom: 20px;
        }

        .button-container {
            text-align: right;
        }

        .submit-button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 20px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .submit-button:hover {
            background-color: #0056b3;
        }
        

        a {
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            transition: background-color 0.3s, color 0.3s;
        }
        /* 수정 버튼 */
        .edit-button {
            background-color: #a09f9f;
            color: white;
            border: 1px solid #a09f9f;
        }

        .edit-button:hover {
            background-color: white;
            color: #007bff;
        }

        /* 삭제 버튼 */
        .delete-button {
            background-color: #a09f9f;
            color: white;
            border: 1px solid #a09f9f;
        }

        .delete-button:hover {
            background-color: white;
            color: #007bff;
        }
        .lecture-list li a {
		    text-decoration: none;
		    color: #ccc;
		    font-size: 16px;
		    transition: color 0.3s;
		    white-space: nowrap; /* 줄바꿈 방지 */
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
    <c:otherwise>
        <%@ include file="/pluse/logoutdesignheader.jsp" %>
    </c:otherwise>
</c:choose>
    
    <div style="display: flex;">
    <%@ include file="/mypage/sidebar.jsp" %>
	<div class="container2">
  <h1>Q&A</h1>
    <div class="container">
    
	    <div class="faq-header">
	        <h1>${dto.title}</h1>
	        <span class="date">${dto.regDate}</span>
	    </div>
	    
	    <div class="faq-content">
	     	<p>${dto.content }</p><br><br><br>
	    </div>
	    
	    <div class="faq-content">
	   		<span>${asdf.fileName}</span>
	    </div>
	    
		</div>
		
		<div>
			<br>
			<h2>답변 내용</h2>
			<hr><br>
		</div>
		<!-- 여기는 답변 리스트 -->
		<c:forEach var="r" items="${rList}">
			<div class="container3">
				<h3>${r.memberId}</h3>
				<p>${r.regDate }</p>
				<div class="faq-content">
					<p>${r.content}</p>
				</div>
			</div>
		</c:forEach>
		<c:if test="${rList eq null || rList.size() == 0 }"> 답변 대기 </c:if>
		<!-- 여기는 답변 리스트 [끝] -->
		
		<c:if test="${sessionMemberId eq 'admin' }">
		<!-- 여기가 댓글 등록하는 곳 -->
		<form method="post" action="/mypage/qna/reply?idx=${dto.idx }">
			<div class="container">
				<p>답변 등록</p>
				<textarea name="content" id="content"></textarea>
				<input type="submit" value="등록">
			</div>
		</form>
		<!-- 여기가 댓글 등록하는 곳 [끝] -->
		</c:if>
 </div>


</div>
</body>
</html>
