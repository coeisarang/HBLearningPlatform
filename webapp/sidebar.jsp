<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
        <!--전체메뉴//-->
        <div id="mySidenav" class="sidenav" >
            <!--전체메뉴 해더//-->
            <div class="navHeader">
                <span class="closebtn"><a href="javascript:void(0)" onclick="closeNav()">전체메뉴 닫기</a></span>
                <h2>T SPOON</h2>
                <span class="setBtn"><a href="#none" onclick="alert('환경설정 APP');return false;">환경설정</a></span>
            </div>
            <!--//전체메뉴 해더-->
            <!--전체메뉴 컨텐츠//-->
            <div class="navContent">
                <!--미 로그인 시//-->
                <!-- 로그인 상태//-->
                <c:if test="${empty user_id}" var="logout" >
                <div class="userStatus_02">
                    <p class="photo"><img src="../resource/cdndata.milkt.co.kr/ele/tspoon/Images/common/img_profile_noimg.png" alt="" /></p>
                    <button class="btnLogin" id="btnLogin" onclick="location.href='/tspoon/login/login.do';">로그인</button>

                </div>
                </c:if>
                <!--//미 로그인 시-->
                <c:if test="${not empty user_id}" var="login_ok" >
                
                <div class="userStatus">
                    <p class="photo"><img src="../resource/cdndata.milkt.co.kr/ele/tspoon/Images/common/img_profile_tmp.png" alt="내 프로필 이미지" /></p>
                    <p class="name">${dto.memberId}</p>
                    
                    <button class="btnLogOut" id="btnLogOut" onclick="location.href='/tspoon/login/logout.do';">로그아웃</button>
                </div>
                 
                <div class="menuStyle_01 nochild"><!--nochild 자녀 미등록시 해당 클래스 추가하여 자녀등록 버튼만 활성화-->
					<ul>
						<li class="menu_message"><a href="/tspoon/message/receivelist.do">쪽지<span>+99</span></a></li>
						<li class="menu_board" ><a href="/tspoon/qna/ovorequest.do">1:1<br>게시판</a></li>
						<li class="menu_child"><a href="#">자녀<br>관리</a></li>
						<li class="menu_propose"><a href="#">부모마음<br>제안</a></li>
						<li class="menu_pay"><a href="#">결제<br>정보</a></li>
						<li class="menu_deliver"><a href="#">전용교재<br>배송정보</a></li>
					</ul>
				</div>
                </c:if>
                
                <div class="menuStyle_02">
                    <h3>T알쓸신잡</h3>
                    <ul>
                        <li class="ico_edu"><a href="#" target="_self">교육정보</a></li>
                        <!--<li class="ico_aud"><a href="" target="_self">오디오북</a></li>-->
                        <li class="ico_info"><a href="#" target="_self">밀크T정보</a></li>
                        <li class="ico_che"><a href="#" target="_self">메디컬 콘서트</a></li>
                        <li class="ico_food"><a href="#" target="_self">학교급식</a></li>
                        <li class="ico_shop"><a href="#" target="_self">쇼핑몰</a></li>
                        <li class="ico_note"><a href="#" target="_self">학교알림장</a></li>
                        <li class="ico_map"><a href="#" target="_self">학원추천</a></li>
                    </ul>
                </div>
                
                
                <c:if test="${not empty user_id}" var="login_ok2" >
                <div class="menuStyle_02 nochild">
                    <h3>학습리포트</h3>
                    <ul>
                        <li class="ico_day"><a>출석현황</a></li>
                        <li class="ico_sc"><a>학습계획표</a></li>
                        <li class="ico_progress"><a>학습현황</a></li>
                        <li class="ico_jindo"><a>진도조정요청</a></li>
                    </ul>
                </div>
                </c:if>
                
                <div class="menuStyle_03">
                    <h3>T플레이</h3>
                    <ul>
                        <li class="ico_tv"><a href="#" target="_self"><span>밀크TV</span></a></li>
                        <li class="ico_game"><a href="#" target="_self"><span>밀크T게임</span></a></li>
                        <li class="ico_ai"><a href="#" target="_self"><span>AI 평가</span></a></li>
                    </ul>
                </div>
            </div>
       </div>