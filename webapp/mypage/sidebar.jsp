<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<div class="sidebar">
	<img src="<%= request.getContextPath() %>/images/user.png"
		alt="사용자 이미지">
	<h2>${sessionName }님</h2>

	<h3>작성글</h3>
	<ul class="lecture-list">
		<li><a href="/mypage/mypost">작성 게시글</a></li>
		<li><a href="/mypage/myreply">작성 댓글</a></li>
	</ul>

	<h3>결제내역</h3>
	<ul class="lecture-list">
		<li><a href="/mypage/paymentlist">결제 내역</a></li>
	</ul>

	<h3>QnA</h3>
	<ul class="lecture-list">
		<li><a href="/mypage/qna">1:1문의 내역(학습 QnA)</a></li>
		<li><a href="/mypage/qna/regist">고객센터 문의</a></li>
	</ul>

	<h3>장바구니</h3>
	<ul class="lecture-list">
		<li><a href="/mypage/cart">장바구니</a></li>
	</ul>

	<h3>개인정보 수정</h3>
	<ul class="lecture-list">
		<li><a href="/mypage/modify">회원 정보 수정</a></li>
		<li><a href="/mypage/delete">회원 탈퇴</a></li>
	</ul>
</div>
