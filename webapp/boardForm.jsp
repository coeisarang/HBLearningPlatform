<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
            <div class="inquiry-form">
                <h1>${boardname }</h1>
                <form action="${uri }" method="post" onsubmit="validateAgreement(event)" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="title">제목<span class="required">*</span></label>
                        <input type="text" id="title" name="title" placeholder="제목을 입력해주세요." required value="${item.title}">
                    </div>

                    <div class="form-group">
                        <label for="agreement">동의여부<span class="required">*</span></label>
                        <p class="agreement-text">
                            스마트 해법은 개인정보 관련 법령에 따라 사용자의 정보가 안전하게 보호되도록 관리합니다.
                            <br>아래 동의 항목을 읽고 확인해주세요.
                        </p>
                        <ul class="agreement-list">
                            <li>1) 수집 항목: 이름</li>
                            <li>2) 사용 목적: 서비스 운영 및 문의 응대</li>
                            <li>3) 보관 기간: 요청 처리 후 3개월</li>
                            <li>4) 정보 제공 동의가 필요합니다.</li>
                        </ul>
                        <div class="radio-group">
                            <label><input type="radio" name="agreement" value="yes" required> 예</label>
                            <label><input type="radio" name="agreement" value="no" required> 아니오</label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="content">내용<span class="required">*</span></label>
                        <textarea id="content" name="content" rows="6" placeholder="내용을 입력해주세요." required>${item.content }</textarea>
                    </div>

                    <div class="form-group">
        				<ul id="existing-files">
            			<c:forEach var="file" items="${files}" varStatus="s">
                			<li id="file${s.count }">
                				<input style="display:none;" type="checkbox" name="deleteFile" id="deleteFile${s.count}" value="${file.idx}" onchange="toggleDelete(${s.count})">
                				<span>${file.fileName}</span> <label style="display: inline;" for="deleteFile${s.count}">x</label>
                			</li>
            			</c:forEach>
        				</ul>
                    
                        <label for="file-upload">첨부파일</label>
                        <input type="file" id="file-upload" name="file-upload" multiple onchange="addNewFiles(event)">
                    </div>
                    
                    <div class="form-buttons">
                        <button type="button" class="cancel-btn">취소</button>
                        <button type="submit" class="submit-btn">등록</button>
                    </div>
                </form>
            </div>
            
            <script>
            
            function toggleDelete(no) {
                const liFile = document.getElementById('file'+no);
                liFile.style.display = 'none';
            }
            </script>