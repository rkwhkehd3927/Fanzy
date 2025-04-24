<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
    <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
	<!-- 카카오 지도 API 스크립트 추가 (반드시 이 스크립트 추가) -->
	<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=7e7ee5e0fc8f76e7c81da65dd69f50eb&libraries=services"></script>
    <script type="text/javascript" src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript" src="../js/mypage.js"></script>
    <title>Global Fandom Platform - Fanzy</title>
    <link rel="stylesheet" href="/css/mypage.css">
</head>
<body>
    <header>
        <div id="logo">
            <a href="/"><img src="/images/index_login/logo.png" alt="Logo"></a>
        </div>
        <!-- nav_bar -->
        <nav>
            <ul>
            <c:if test="${session_id==null}">
                <li><button type="button" class="sign_in">Sign in</button></li>
            </c:if>
			<c:if test="${session_id!=null}">
                <li><a onclick="searchBtn()">
					    <i class="fa-solid fa-magnifying-glass"></i>
					    <div id="searchBox" style="display: none;">
					        <input style="position: absolute; top:-15px; right:20px;"  type="text" id="searchInput" placeholder="아티스트 검색" />
					        <div id="searchResults" style="display: none; position: absolute; top: 40px; left: -200px; background: white; border-radius: 10px; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); width: 200px; padding: 8px 15px;"></div>
					    </div>
					</a></li>
                <li><a onclick="openAlert()"><i style="font-size: 35px; position: relative; top: -5px;" class="fa-regular fa-envelope"></i></a></li>
                <li><a href="/mypage"><i class="fa-regular fa-user"></i></a></li>
                <li><a href="/user_setting"><i class="fa-solid fa-gear"></i></a></li>
                <li class="cart coin"><a><img src="/images/index_login/coin.png"></a></li>
                <li class="cart" style="position: relative; top:-1px;"><a onclick="cartBtn()"><i class="fa-solid fa-cart-shopping"></i></a></li>
            </c:if>
            <c:if test="${session_id==null}">
                <li class="cart coin"><a><img src="/images/index_login/coin.png"></a></li>
                <li class="cart" style="position: relative; top:4px;"><a onclick="cartBtn()"><i class="fa-solid fa-cart-shopping"></i></a></li>
            </c:if>
            </ul>
        </nav>
    </header>

    <!-- 개인정보 -->
    <section class="banner">
    	<div class="myname">
	        <div class="banner-item intro"><strong>${mdto.member_name}</strong>&nbsp;님</div>
	        <div class="banner-item email">${mdto.member_email}</div>
	        <button type="submit" class="logout">로그아웃</button>
    	</div>
    </section>

    <!-- 배너 아래 메인 부분, 연한 회색 배경 -->
    <main class="main-container">
        <div class="main-content">
            <div class="main-content">
            <div class="all_">
			    <!-- 왼쪽 사이드바 -->
			    <div class="sidebar">
			        <!-- 적립금/쿠폰 정보 -->
			        <div class="wallet">
			            <!-- 적립금 박스 -->
						<a href="/myCoupon"><div class="wallet-item coupon">
						    <div class="wallet-label"><strong>적립금</strong></div>
						   <div class="wallet-amount"><fmt:formatNumber value="${mdto.member_mileage}" pattern="#,###"/>원&nbsp;<i class="fa-solid fa-chevron-right" style="font-size: 16px; padding: 0;"></i></div>
						</div></a>
						<!-- 쿠폰 박스 -->
						<a href="/myCoupon"><div class="wallet-item reward-points">
						    <div class="wallet-label"><strong>맴버쉽</strong></div>
						    <div class="wallet-amount"><i class="fa-solid fa-chevron-right" style="font-size: 16px; padding: 0;"></i></div>
						</div></a>
			        </div>
					<hr style="border: 0.5px solid rgba(0, 0, 0, 0.05);">
			        <!-- 메뉴 리스트 -->
			        <div class="menu">
			            <div class="menu-item order">주문 내역</div>
			            <div class="menu-item return">취소 / 반품 / 교환 내역</div>
			            <div class="menu-item viewed">재입고 알람 내역</div>
			            <div class="menu-item review">1:1 문의 내역</div>
			        </div>
			    </div>
	
	
	            <!-- 회원 정보 -->
				<div class="user-details">
				    <h2>회원정보<div>
				    	<button	id="edit-btn" onclick="editInfo()">수정</button>
       	 				<button id="bye-btn" onclick="deactivateAccount()">탈퇴</button>
				    </div></h2>
				    <form name= "modifyForm" method="POST" action="/mypage2">
				        <div class="form-group">
				            <label>이름</label>
				            <input type="text" value="${mdto.member_name}" name="name" readonly>
				        </div>
				
				        <div class="form-group">
				            <label>아이디</label>
				            <input type="text" value="${mdto.member_id}" name="id" readonly>
				        </div>
				
				        <div class="form-group">
				            <label>비밀번호 변경</label>
				            <button type="button" onclick="modifyPw()">비밀번호 변경</button>
				        </div>
				
				        <div class="form-group">
				            <label>이메일</label>
				            <input type="email" value="${mdto.member_email}" name="email" readonly>
				        </div>
				
				        <div class="form-group">
						    <label>주소</label>
						    <input type="text" value="${mdto.member_address}" name="address" readonly id="address" />
						    <button type="button" id="find-address-btn" disabled>주소 찾기</button>
						</div>
				
				        <div class="form-group">
				            <label>휴대폰</label>
				            <input type="text" value="${mdto.member_phone}" name="phone" readonly>
				        </div>
				
				        <div class="form-group">
				            <label>생년월일</label>
				            <input type="date" value="${mdto.member_birth}" name="birth" readonly>
				        </div>
				    </form>
				</div>
				
<!-- 주문내역 -->
<div class="order-history">
    <h2>주문내역</h2>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <c:if test="${not empty orderItems}">
        <div class="order-history-container">
            <c:forEach var="orderItem" items="${orderItems}">
                <!-- 취소, 반품, 환불 상태는 제외하고 출력 -->
                <c:if test="${orderItem.order.order_status ne 'CANCELLED' and orderItem.order.order_status ne 'RETURNED' and orderItem.order.order_status ne 'REFUNDED'}">
                    <!-- 상단 헤더: 주문날짜와 주문상세 -->
                    <div class="order-header">
                        <div class="order-date">
                            <fmt:formatDate value="${orderItem.order.order_date}" pattern="yyyy.MM.dd" />
                        </div>
                        <a href="/OTP"><div class="order-detail-title">주문상세</div></a>
                    </div>
                    <!-- 주문 상품 정보 -->
                    <div class="order-item">
                        <img src="/images/shopimages/prods/${orderItem.shop.shop_image1}.jpg" alt="${orderItem.shop.shop_title}" class="product-image">
                        <div class="product-info">
                            <p>${orderItem.shop.shop_title}</p>
                            <span>${orderItem.shop.shop_content} / ${orderItem.orderItem_quantity}개</span>
                            <strong><fmt:formatNumber value="${orderItem.order.totalPrice}" pattern="#,###"/>원</strong>
                            <div class="actions">
                                <!-- 주문 상태 메시지 -->
                                <div class="status-container">
                                    <c:if test="${orderItem.order.order_status eq 'PENDING'}">
                                        <p class="status-btn pending">결제 대기</p>
                                    </c:if>
                                    <c:if test="${orderItem.order.order_status eq 'PAID'}">
                                        <p class="status-btn paid">결제 완료</p>
                                    </c:if>
                                    <c:if test="${orderItem.order.order_status eq 'PROCESSING'}">
                                        <p class="status-btn processing">상품 준비중</p>
                                    </c:if>
                                    <c:if test="${orderItem.order.order_status eq 'SHIPPING'}">
                                        <p class="status-btn shipping">배송 중</p>
                                    </c:if>
                                    <c:if test="${orderItem.order.order_status eq 'DELIVERED'}">
                                        <p class="status-btn delivered">배송 완료</p>
                                    </c:if>
                                    <c:if test="${orderItem.order.order_status eq 'FAILED'}">
                                        <p class="status-btn failed">결제 실패</p>
                                    </c:if>
                                </div>

                                <!-- 오른쪽: 액션 버튼 -->
                                <div class="buttons-container">
                                    <!-- 배송 조회 버튼: 배송 중인 경우에만 -->
                                    <c:if test="${orderItem.order.order_status eq 'SHIPPING'}">
                                        <button id="look">배송 조회</button>
                                    </c:if>

                                    <!-- 재구매 버튼: 배송 완료된 경우에만 -->
                                    <c:if test="${orderItem.order.order_status eq 'DELIVERED'}">
                                        <button id="onemore">재구매</button>
                                    </c:if>

                                    <!-- 주문취소 버튼: 결제 완료 또는 상품 준비중 상태일 때 노출 -->
                                    <c:if test="${orderItem.order.order_status eq 'PAID' or orderItem.order.order_status eq 'PROCESSING'}">
                                        <button id="xxx">주문취소</button>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </c:if>

    <c:if test="${empty orderItems}">
        <div class="recent-message">
            <p>주문내역이 없습니다.</p>
        </div>
    </c:if>
</div>
				
				<!-- 취소/반품/교환 내역 -->
<div class="return-exchange">
    <h2>취소 / 반품 / 교환 내역</h2>
    <c:if test="${not empty orderItems}">
        <c:forEach var="orderItem" items="${orderItems}">
            <!-- 취소 / 반품 / 환불 상태인 경우에만 출력 -->
            <c:if test="${orderItem.order.order_status eq 'CANCELLED' or orderItem.order.order_status eq 'RETURNED' or orderItem.order.order_status eq 'REFUNDED'}">
                <div class="order-item">
                    <!-- 주문 상품 정보 -->
                    <img src="/images/shopimages/prods/${orderItem.shop.shop_image1}.jpg" alt="${orderItem.shop.shop_title}" class="product-image">
                    <div class="product-info">
                        <p>${orderItem.shop.shop_title}</p>
                        <span>${orderItem.shop.shop_content} / ${orderItem.orderItem_quantity}개</span>
                        <strong><fmt:formatNumber value="${orderItem.order.totalPrice}" pattern="#,###"/>원</strong>
                        <div class="status-container">
                            <c:choose>
                                <c:when test="${orderItem.order.order_status eq 'CANCELLED'}"><p class="status-btn cancelled">주문 취소됨</p></c:when>
                                <c:when test="${orderItem.order.order_status eq 'RETURNED'}"><p class="status-btn returned">반품 완료</p></c:when>
                                <c:when test="${orderItem.order.order_status eq 'refunded'}"><p class="status-btn cancelled">환불 완료</p></c:when>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </c:if>
    <c:if test="${empty orderItems}">
        <div class="recent-message">
            <p>취소 / 반품 / 교환 내역이 없습니다.</p>
        </div>
    </c:if>
</div>
				
				<!-- 재입고 알람 내역 -->
				<div class="recently-viewed">
				    <h2>재입고 알람 내역</h2>
				    <div class="recent-message">
				        <p>재입고 알람 내역이 없습니다.</p>
				    </div>
				</div>
				
				<!-- 1:1 문의 내역 -->
				<div class="my-reviews">
				    <h2>1:1 문의 내역</h2>
				    <div class="recent-message">
				        <p>1:1 문의 내역이 없습니다.</p>
				    </div>
				</div>

			</div>
        </div>

        
	    <!-- 추천 아티스트 -->
        <c:if test="${session_id!=null}">
        <a><div class="fixed-heart">
		    <img src="/images/index_login/heart.png" alt="Heart" />
		</div></a>
		</c:if>
		
		<!-- 알림 모달창 -->
			<div id="messageModal" class="modal" style="display: none;">
			    <div class="message-content">
			        <div class="message-header">
			            <span class="modal-title">알림</span>
			        </div>
			        <div class="message-body">
		                <div class="artist-list-wrapper">
		                    <ul class="artist-list">
		                        <li><a href="#" class="modal-link" data-target="all">전체</a></li>
		                    		<c:forEach var="n" items="${nlist}">
		                        		<li><a class="modal-link" data-target="${n.artistDto.artist_group_name}">${n.artistDto.artist_group_name}</a></li>
		                        	</c:forEach>
		                        <li><a href="#" class="modal-link" data-target="shop">Shop</a></li>
		                    </ul>
		                </div>
						<!-- 진행 상태 표시 (회색 실선과 핑크 실선) -->
			            <div class="progress-bar2">
			                <div class="progress2"></div>
			            </div>
			            <!-- 각 탭에 대한 알림 내용 -->
			            <div class="notification-content" id="all">
			                전체 알림 내용...
			            </div>
			            <c:forEach var="n" items="${nlist}">
				            <div class="notification-content" id=${n.artistDto.artist_group_name} style="display: none;">
				                ${n.artistDto.artist_group_name} 알림 내용...
				            </div>
			            </c:forEach>
			            <div class="notification-content" id="shop" style="display: none;">
			                Shop 알림 내용...
			            </div>
			        </div>
			    </div>
			</div>
		
		<!-- 비밀번호 변경 모달 -->
		<div id="passwordModal" class="password-modal" style="display: none;">
		    <div class="password-modal-content">
		        <div class="password-modal-header">
		            <span class="password-close" onclick="closePasswordModal()">&times;</span>
		            <h2>비밀번호 변경</h2>
		        </div>
		        <div class="password-modal-body">
		            <!-- 폼 태그 사용 -->
		            <form id="passwordForm" method="POST" action="/mypage">
		                <div class="form-group">
		                    <input type="hidden" name="id" value="${session_id}">
		                    <label for="currentPassword">현재 비밀번호</label>
		                    <input type="password" id="currentPassword" name="currentPassword" placeholder="현재 비밀번호를 입력하세요" required>
		                </div>
		                <div class="form-group">
		                    <label for="newPassword">새로운 비밀번호</label>
		                    <input type="password" id="newPassword" name="newPassword" placeholder="새로운 비밀번호를 입력하세요" required>
		                    <div id="passwordConditions" class="conditions">
		                        <ul>
		                            <li id="condition1" class="condition">8~20자</li>
		                            <li id="condition2" class="condition">영문 1글자 이상</li>
		                            <li id="condition3" class="condition">1글자 이상 숫자</li>
		                            <li id="condition4" class="condition">1글자 이상 특수문자</li>
		                        </ul>
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label for="confirmPassword">새로운 비밀번호 확인</label>
		                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="새로운 비밀번호를 확인하세요" required>
		                </div>
		                <div class="password-modal-footer">
		                    <button type="button" class="modifypw cancel" onclick="closePasswordModal()">취소</button>
		                    <button type="button" class="modifypw ok" id="submitBtn" disabled>확인</button>
		                </div>
		            </form>
		        </div>
		    </div>
		</div>
		<div id="google_translate_element"></div>
    </main>
    <!-- 푸터 -->
	<footer>
	        <div class="footer-links">
	        <a href="#">이용약관</a>    
	        <a href="#">서비스운영정책</a>    
	        <a href="#">유료서비스 이용약관</a>    
	        <a href="#">청소년 보호 정책</a>    
	        <a href="#"><strong>개인정보처리방침</strong></a>    
	        <a href="#">쿠키정책</a>    
	        <a href="#">쿠키 설정</a>    
	        <a href="#">입점 신청</a>    
	        <a href="#">고객센터</a>
	    </div>
	    <div class="footer-info">
		    <p>
		        상호 &nbsp;<strong>Weverse Company Inc.</strong>
		        <span class="footer-gap">|</span>
		        대표자 &nbsp;<strong>임민영</strong>
		        <span class="footer-gap">|</span>
		        전화번호 &nbsp;<strong>1544-0790</strong>
		        <span class="footer-gap">|</span>
		        FAX &nbsp;<strong>+82)-2-2144-9399</strong>
		        <span class="footer-gap">|</span>
		        주소 &nbsp;<strong> 서울 금천구 동작대로 132, 한라원앤원타워 3층</strong>
		        <span class="footer-gap">|</span>
		        사업자등록번호 &nbsp;<strong>119-86-20319</strong>
		        <span class="footer-gap">|</span>
		        <a href="#">사업자 정보 확인</a>
		    </p>
		    <p>
		        통신판매업 신고번호 &nbsp;<strong>2022-성남분당A-0557호</strong>
		        <span class="footer-gap">|</span>
		        호스팅 서비스 사업자 &nbsp;<strong>Amazon Web Services, Inc., Naver Cloud</strong>
		    </p>
		    <p>© <strong>WEVERSE COMPANY Inc.</strong> Ver 2.32.6</p>
		</div>	
	    </footer>
	    
	    <script>
	 	// 1. 수정버튼 클릭 시
	    function editInfo() {
	        // modifyForm 안에 있는 input 필드 가져오기
	        const form = document.forms["modifyForm"];
	        const inputs = form.querySelectorAll('input');  // 모든 input 요소 선택
	        
	        // 이름, 아이디, 생년월일을 제외한 모든 input의 readonly 해제
	        inputs.forEach(input => {
	            if (input.name === "id" || input.name === "name" || input.name === "birth" || input.name === "email") {
	                input.readOnly = true; // 이름, 아이디, 생일, 이메일은 readonly 유지
	            } else {
	                input.readOnly = false; // 나머지 필드는 readonly 해제
	            }
	        });
	        
	        // 커서 모양 변경: readonly 해제된 입력 필드는 입력 가능하게 커서 모양 변경
	        inputs.forEach(input => {
	            if (input.readOnly) {
	                input.style.cursor = 'not-allowed'; // readonly는 커서 금지
	            } else {
	                input.style.cursor = 'text'; // readonly가 해제된 필드는 커서 입력 모양
	            }
	        });

	        // 수정 버튼을 저장 버튼으로 변경
	        const editBtn = document.getElementById("edit-btn");
	        if (editBtn.textContent === "수정") {
	            editBtn.textContent = "저장";
	            document.getElementById('find-address-btn').disabled = false;
	        } else {
	            form.submit();
	        }
	        
	        // 탈퇴 버튼을 취소 버튼으로 변경
	        const byeBtn = document.getElementById("bye-btn");
	        if (byeBtn.textContent === "탈퇴") {
	            byeBtn.textContent = "취소";
	            byeBtn.setAttribute("onclick", "cancelDeactivation()");
	        }
	    }
	 
	 	// 탈퇴 취소 함수
	    function cancelDeactivation() {
	        // 폼 내용 초기화 (취소 시 원래 값으로 돌아가도록)
	        document.forms["modifyForm"].reset();  // 폼 내용 초기화
	        
	        // 입력 필드들을 모두 readonly 상태로 되돌리기
	        const inputs = document.forms["modifyForm"].querySelectorAll('input');
	        inputs.forEach(input => {
	            input.readOnly = true;  // 모든 input 필드를 readonly 상태로 설정
	            input.style.cursor = 'not-allowed';  // readonly일 때 커서 금지
	        });
	        
	        // 버튼 텍스트도 다시 "수정"과 "탈퇴"로 복구
	        const editBtn = document.getElementById("edit-btn");
	        editBtn.textContent = "수정";
	        
	        const byeBtn = document.getElementById("bye-btn");
	        byeBtn.textContent = "탈퇴";
	        byeBtn.setAttribute("onclick", "deactivateAccount()");
	        
	        document.getElementById('find-address-btn').disabled = true;
	    } // 1번 끝
	    
	    // 2. 비밀번호 모달창
	    function modifyPw() {
	        document.querySelector('.password-modal').style.display = 'flex';  // 모달 열기
	        document.body.style.overflow = 'hidden';  // 페이지 스크롤을 잠금
	    }

	    function closePasswordModal() {
	        document.querySelector('.password-modal').style.display = 'none';  // 모달 닫기
	        document.body.style.overflow = '';  // 페이지 스크롤을 원래대로 복구
	        
	        // 비밀번호 입력 필드 초기화
	        newPassword.value = '';  // 비밀번호 필드 값 지우기
	        confirmPassword.value = '';  // 새 비밀번호 확인 필드 값 지우기
	        currentPassword.value = '';  // 현재 비밀번호 필드 값 지우기
	        
	        // 조건 표시 초기화 (조건이 모두 빨간색으로 되도록)
	        conditions.forEach(condition => {
	            condition.classList.remove('valid');
	            condition.classList.add('invalid');
	        });

	        // 버튼 비활성화 (초기 상태로)
	        submitBtn.disabled = true;
	    }

	    // 비밀번호 조건 체크
	    const newPassword = document.getElementById('newPassword');
	    const confirmPassword = document.getElementById('confirmPassword');
	    const currentPassword = document.getElementById('currentPassword');
	    const conditions = document.querySelectorAll('.condition');
	    const submitBtn = document.getElementById('submitBtn'); // 버튼 요소 선택

	    // 가상의 현재 비밀번호 (예시 값)
	    // 실제로는 서버에서 가져오는 값이나 세션에서 가져오는 값이여야 함.
	    const currentPasswordValue = "${mdto.member_pw}";

	    // ⚠️ 요소가 정상적으로 선택됐는지 확인 후 이벤트 리스너 추가
	    if (newPassword && confirmPassword && currentPassword) {
	        newPassword.addEventListener('input', validatePassword);
	        confirmPassword.addEventListener('input', validateConfirmPassword);
	        currentPassword.addEventListener('input', validateCurrentPassword);
	    } else {
	        console.error("❌ 필수 요소를 찾을 수 없습니다.");
	    }

	    function validatePassword() {
	        const password = newPassword.value;

	        // 각 조건 검사
	        const condition1 = password.length >= 8 && password.length <= 20;
	        const condition2 = /[a-zA-Z]/.test(password);
	        const condition3 = /\d/.test(password);
	        const condition4 = /[!@#$%^&*(),.?":{}|<>]/.test(password);

	        // 조건을 체크하고 색상 변경
	        updateConditionStatus(0, condition1);
	        updateConditionStatus(1, condition2);
	        updateConditionStatus(2, condition3);
	        updateConditionStatus(3, condition4);

	        // 모든 조건이 만족하면 확인 버튼 활성화
	        const allConditionsMet = condition1 && condition2 && condition3 && condition4;
	        
	        // 버튼 상태를 실시간으로 업데이트
	        submitBtn.disabled = !allConditionsMet;  // 버튼 활성화/비활성화
	    }

	    function validateConfirmPassword() {
	        const password = newPassword.value;
	        const confirmPasswordValue = confirmPassword.value;

	        // 새 비밀번호와 새 비밀번호 확인이 일치하는지 실시간으로 확인하지 않음
	    }

	    function validateCurrentPassword() {
	        const currentPasswordValue = currentPassword.value;

	        // 현재 비밀번호가 올바른지 실시간으로 확인하지 않음
	    }

	    // 제출 버튼 클릭 시 비밀번호 검증
	    submitBtn.addEventListener('click', function(e) {
	        e.preventDefault();  // 폼이 제출되는 것을 막음 (필요하면 서버로 전송을 원할 때 이 부분을 조정)

	        // 1. 현재 비밀번호가 맞는지 확인
	        if (currentPassword.value !== currentPasswordValue) {
	            alert("현재 비밀번호와 일치하지 않습니다.");
	            return;  // 일치하지 않으면 더 이상 진행하지 않음
	        }

	        // 2. 새 비밀번호와 새 비밀번호 확인이 일치하는지 확인
	        if (newPassword.value !== confirmPassword.value) {
	            alert("새 비밀번호와 일치하지 않습니다.");
	            return;  // 일치하지 않으면 더 이상 진행하지 않음
	        }

	        // 3. 여기까지 왔으면 비밀번호가 모두 맞고 일치함
	        document.getElementById('passwordForm').submit();
	        alert("비밀번호 변경이 완료되었습니다.");
	    });

	    // 조건 상태 업데이트 (조건 충족 시 초록색, 미충족 시 빨간색)
	    function updateConditionStatus(index, isValid) {
	        if (isValid) {
	            conditions[index].classList.add('valid');
	            conditions[index].classList.remove('invalid');
	        } else {
	            conditions[index].classList.add('invalid');
	            conditions[index].classList.remove('valid');
	        }
	    }
	    // 2번 끝
	    
		// 3. 카카오 우편찾기 서비스
		document.getElementById('find-address-btn').addEventListener('click', function() {
		    // 카카오 우편번호 서비스 API 사용
		    new daum.Postcode({
		        oncomplete: function(data) {
		            // 선택된 주소를 input에 입력
		            document.getElementById("address").value = data.address; // 주소값을 input에 넣어줌
		        }
		    }).open(); // 우편번호 검색 팝업 열기
		}); // 3번 끝
		
		// 6. 번역
	    function googleTranslateElementInit() {
	        new google.translate.TranslateElement({
	            pageLanguage: 'ko',
	            includedLanguages: 'en,ko,zh,ja,fr,de,es,it,pt,ru',
	            layout: google.translate.TranslateElement.InlineLayout.SIMPLE
	        }, 'google_translate_element');
	    }

	    // 쿠키에서 번역 언어 가져오는 함수
	    function getTranslateCookie() {
	        let matches = document.cookie.match(/(^| )googtrans=([^;]+)/);
	        return matches ? decodeURIComponent(matches[2]) : null;
	    }

	    // 저장된 번역 언어 강제 적용
	    function applySavedTranslation() {
	        let savedLang = getTranslateCookie();
	        if (!savedLang) return;

	        let langCode = savedLang.split('/')[2]; // "/auto/ko" → "ko"

	        let checkExist = setInterval(function () {
	            let selectBox = document.querySelector('.goog-te-combo');
	            if (selectBox) {
	                clearInterval(checkExist);
	                selectBox.value = langCode;
	                selectBox.dispatchEvent(new Event('change')); // 번역 실행
	                console.log("번역 적용됨:", langCode);
	            }
	        }, 500);
	    }

	    // 페이지 로드 시 번역 유지
	    window.addEventListener("load", function () {
	        googleTranslateElementInit(); // 구글 번역 위젯 초기화
	        setTimeout(function () {
	            let banner = document.querySelector(".goog-te-banner-frame");
	            if (banner) {
	                banner.style.display = "none";
	            }
	            document.body.style.top = "0px"; // 혹시 top margin이 생기면 제거
	        }, 800); // 번역 적용될 시간 고려
	    }); // 6번 끝
	    </script>
</body>
</html>
