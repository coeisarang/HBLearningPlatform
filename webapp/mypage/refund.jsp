<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결재 강의 환불 안내</title>
    <link rel="stylesheet" href="styles.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
        }

        .section {
            margin-bottom: 20px;
        }

        .row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        label {
            margin-right: 10px;
            font-size: 18px;
        }

        input[type="text"], textarea {
            width: 100%;
            margin-top: 5px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        textarea {
            height: 150px;
            resize: none;
        }

        input[type="checkbox"], input[type="radio"] {
            margin-right: 8px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        p {
            margin: 5px 0;
        }

        small {
            display: block;
            margin: -8px 0 10px;
            color: gray;
        }

    </style>
    <link rel="stylesheet" type="text/css" href="sidebar.css">
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

    <!-- 메인 레이아웃을 flex 컨테이너로 설정 -->
    <div style="display: flex;">
        <!-- 왼쪽 사이드바 -->
        <%@ include file="sidebar.jsp" %>

        <!-- 오른쪽 메인 컨텐츠 -->
        <div class="container" style="flex: 1; margin-left: 20px;">
            <form method="POST" name="refundfrm">
                <h1>환불 신청</h1>

                <div class="section">
                    <div class="row">
                        <label for="lecture-name">강의 이름:</label>
                        <input type="text" id="lecture-name" name="lecture-name" placeholder="강의 이름을 입력해주세요">
                    </div>
                </div>

                <div class="section">
                    <h2>환불 사유</h2>
                    <label><input type="checkbox" name="reason" value="변심"> 단순 변심</label>
                    <label><input type="checkbox" name="reason" value="내용 불만족"> 원하던 내용의 강의가 아님</label>
                    <label><input type="checkbox" name="reason" value="기타"> 기타</label>
                    <input type="text" name="other-reason" placeholder="기타 사유 입력">
                </div>

                <div class="section">
                    <h2>환불 상세 사유</h2>
                    <textarea name="detailed-reason" placeholder="상세한 사유를 입력해주세요"></textarea>
                </div>

                <div class="section">
                    <h2>환불 방식 선택</h2>
                    <label><input type="radio" name="refund-method" value="card"> 신용카드</label>
                    <label><input type="radio" name="refund-method" value="bank"> 계좌 이체</label>
                    <input type="text" name="bank-info" placeholder="은행명 / 계좌번호 입력">
                    <label><input type="radio" name="refund-method" value="escrow"> 에스크로 실시간 계좌이체</label>
                    <label><input type="radio" name="refund-method" value="point"> 포인트 전환</label>
                </div>

                <div class="section">
                    <h2>반품 안내</h2>
                    <p>스마트 해법 : 1588-1255</p>
                    <p>강의의 20% 이상 수강 시 환불 처리가 어려울 수 있습니다.</p>
                    <p>기타 문의사항은 고객센터로 연락 부탁드립니다.</p>
                    <p><strong>고객센터:</strong> 070-2345-6789</p>
                    <p><strong>상담 가능 시간:</strong> 09:00-18:00 (12:00-13:00 점심시간)</p>
                </div>

                <input type="submit" value="환불 신청">
            </form>
        </div>
    </div>
</body>

</html>
