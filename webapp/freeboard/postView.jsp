<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
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
	background-color: #e3f2fd; /* Light blue background */
	color: #333;
	line-height: 1.6;
}

.body2 {
	max-width: 1200px;
	margin: 20px auto;
}

.container {
	display: flex;
	min-height: 800px;
	max-width: 1200px;
	margin: 0 auto;
	background-color: white;
	border-radius: 8px;
	overflow: hidden;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	margin-top: 20px;
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
	margin-top: 15px;
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
				<h2>알림방</h2>
				<ul class="menu">
					<li><a href="/archive">자료실</a></li>
					<li><a href="/notice">공지사항</a></li>
					<li><a href="/freeboard">자유게시판</a></li>
				</ul>
			</div>

			<div class="main-content">

				<div class="comment-container2">
					<div class="header">
						<div>
							<h2>${item.title }</h2>
							<div class="meta-info">작성자: ${item.memberId } | 등록일:
								${item.regDate } | 조회수: ${item.readCnt }</div>
						</div>
						<c:if test="${sessionMemberId eq item.memberId || sessionMemberId eq 'admin'}">
							<div class="action-buttons">
								<a href="/${first}/modify?idx=${item.idx}" class="report-button">수정</a>
								<a href="/${first}/delete?idx=${item.idx}" class="report-button">삭제</a>
							</div>
						</c:if>
					</div>
					<div class="file-list">
			        <c:forEach items="${filelist}" var="file">
			            <div class="file-item">
			            	<a href="/file/download?idx=${file.idx}">${file.fileName }</a>
			                <span>${file.fileSize }</span>
			            </div>
			        </c:forEach>
			        <c:if test="${filelist ne null }">
			        <hr>
			        </c:if>
			        </div>
					<div class="content">${item.content }</div>
				</div>



				<c:if test="${first eq 'freeboard'}">
				<div class="comment-section">
					<h3>댓글 ${replyCnt }개</h3>
					<div class="comment-box">
						<form action="/freeboard/reply/regist" method="post">
							<textarea placeholder="댓글을 입력하세요..." name=content></textarea>
							<div class="comment-footer">
								<input type="hidden" value="${item.idx }" name="idx"> <input type="submit"
									value="댓글 달기" />
							</div>
						</form>
					</div>
				</div>

				<c:forEach var="rItem" items="${list}">
				    <div class="comment-container" data-idx="${rItem.idx}">
				        <div class="comment-header">
				            <span class="author">${rItem.memberId}</span> <span class="date">${rItem.regDate}</span>
				        </div>
				        <div class="comment-content" id="content">${rItem.content}</div>
				        <c:if test="${sessionMemberId eq rItem.memberId}">
				            <div class="action-buttons2">
				                <button class="report-button" onclick="openEditPopup(${rItem.idx}, '${rItem.content}')">수정</button>
				                <a href="/freeboard/reply/delete?idx=${rItem.idx }&pIdx=${item.idx}" class="report-button" >삭제</a>
				            </div>
				        </c:if>
				    </div>
				</c:forEach>
				
				</c:if>
			</div>
		</div>


		<section class="final-package">
			<img src="<%= request.getContextPath() %>/images/mainlogo.png"
				alt="스마트해법 로고">
			<h2>The Last Chance</h2>
			<p>2024 스마트해법과 함께하세요!</p>

		</section>

	</div>
	<footer class="footer">
		<p>&copy; 2024 스마트해법. All Rights Reserved.</p>
	</footer>



<script>
    function openEditPopup(idx, content) {
        // 팝업창 크기 설정
        const popupWidth = 400;
        const popupHeight = 300;

        // 브라우저 화면 크기 가져오기
        const screenWidth = window.screen.width;
        const screenHeight = window.screen.height;

        // 팝업창 위치 계산 (가운데에 띄우기)
        const left = (screenWidth - popupWidth) / 2;
        const top = (screenHeight - popupHeight) / 2;

        // JSP 파일을 팝업으로 띄우기 (idx와 content를 쿼리 파라미터로 전달)
        window.open(
            'editComment.jsp?idx=' + idx + '&content=' + encodeURIComponent(content),
            'editPopup',
            'width=' + popupWidth + ',height=' + popupHeight + ',top=' + top + ',left=' + left
        );
    }
</script>





</body>
</html>
