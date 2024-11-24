<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>댓글 수정</title>
</head>
<body>
    <h3>댓글 수정</h3>
    <form action="/freeboard/reply/modify" method="post">
        <input type="hidden" name="idx" value="<%= request.getParameter("idx") %>">
        <textarea name="content" style="width: 100%; height: 100px;"><%= URLDecoder.decode(request.getParameter("content"), "UTF-8") %></textarea>
        <div style="margin-top: 10px; text-align: right;">
            <button type="button" onclick="window.close()">취소</button>
            <button type="submit">저장</button>
        </div>
    </form>
</body>
</html>
