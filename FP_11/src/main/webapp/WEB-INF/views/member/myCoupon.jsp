<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
						<a href="/mypage"><div class="wallet-item coupon">
						    <div class="wallet-label"><strong>회원정보</strong></div>
						    <div class="wallet-amount"><i class="fa-solid fa-chevron-right" style="font-size: 16px; padding: 0;"></i></div>
						</div></a>
						<!-- 쿠폰 박스 -->
						<a><div class="wallet-item reward-points">
						    <div class="wallet-label"><strong>구독권</strong></div>
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
	
				<!-- 쿠폰 적립금 -->
				<div class="couponHere">
				<h2>쿠폰 / 적립금</h2>
					<div>
			            <h3>적립금</h3>
			        </div>
					<div id="point-list">
				        <p>${mdto.member_mileage}</p>
				    </div>
				</div>
				
				<!-- 구독권 -->
				<div class="subscribe">
				<h2>구독권</h2>
				</div>
				
				<!-- 주문내역 -->
				<div class="order-history">
				    <h2>주문내역</h2>
				    <div class="recent-message">
				        <p>주문내역이 없습니다.</p>
				    </div>
				</div>
				
				<!-- 취소/반품/교환 내역 -->
				<div class="return-exchange">
				    <h2>취소 / 반품 / 교환 내역</h2>
				    <div class="recent-message">
				        <p>취소 / 반품 / 교환 내역이 없습니다.</p>
				    </div>
				</div>
				
				<!-- 재입고 알람 내역 -->
				<div class="recently-viewed">
				    <h2>재입고 알람 내역</h2>
				</div>
				
				<!-- 1:1 문의 내역 -->
				<div class="my-reviews">
				    <h2>1:1 문의 내역</h2>
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
	    
	    document.addEventListener("DOMContentLoaded", function() {
            console.log("페이지 로드 완료!");

        //     const points = [
        //         { title: "출고지연으로 인한 적립금 보상", product: "[세트] 피그먼트 컷오프 후드 셋업 - 6COLOR", date: "2025.02.12", expire: "2025.03.13", amount: "+4,965원" },
        //         { title: "주문 적립", product: "오드 시그니처 스몰 백팩 - GRAY", date: "2025.02.13", expire: "2030.02.12", amount: "+1,046원" },
        //         { title: "주문 적립", product: "[세트] 피그먼트 컷오프 후드 셋업 - 6COLOR", date: "2025.02.20", expire: "2030.02.19", amount: "+2,085원" },
        //         { title: "주문 적립", product: "STRAPPY SKIRT PANTS [BLACK]", date: "2025.02.19", expire: "2030.02.18", amount: "+2,503원" },
        //         { title: "주문 적립", product: "베티봄 소프트 텍스처 크롭 블레로 가디건 (2 colors)", date: "2025.02.08", expire: "2030.02.07", amount: "+945원" },
        //         { title: "유효기간 만료", product: "", date: "2024.11.01", expire: "", amount: "-1,820원" },
        //         { title: "주문 적립", product: "Siberia Duck Stella Crop Padding WHITE", date: "2024.10.21", expire: "2029.10.20", amount: "+2,079원" }
        //     ];

        //     let currentIndex = 0;
        //     const itemsPerLoad = 5;
        //     const list = document.getElementById("point-list");
        //     const loadMoreButton = document.getElementById("load-more");

        //     function loadMorePoints() {
        //         console.log("더보기 버튼 클릭됨!");
                
        //         for (let i = 0; i < itemsPerLoad; i++) {
        //             if (currentIndex >= points.length) {
        //                 loadMoreButton.style.display = "none"; // 더 이상 항목 없으면 버튼 숨김
        //                 console.log("더 이상 불러올 항목 없음.");
        //                 return;
        //             }

        //             const point = points[currentIndex];

        //             // 데이터가 정상적으로 읽히는지 콘솔 확인
        //             console.log(`데이터 로드: ${point.title}, ${point.product}, ${point.date}, ${point.expire}, ${point.amount}`);
        //             console.log("points 배열:", points);
        //             console.log(`🔹 loadMorePoints() 실행됨! currentIndex: ${currentIndex}, points.length: ${points.length}`);


        //             const item = document.createElement("div");
        //             item.classList.add("point-item");
                    
        //             // 소멸 기한이 있는 경우와 없는 경우 처리
        //             let expireText = point.expire && point.expire.trim() !== "" 
        //                 ? `${point.expire} 소멸 예정` 
        //                 : "소멸 기한 없음";

        //             item.innerHTML = `
        //                 <div><strong>${point.title}</strong></div>
        //                 <div>${point.product || "-"}</div>
        //                 <div>적립: ${point.date} (${expireText})</div>
        //                 <div class="amount">${point.amount}</div>
        //             `;
        //             list.appendChild(item);
        //             currentIndex++;
        //         }
        //     }

        //     // **초기 5개 미리 로드**
        //     loadMorePoints();

        //     // **버튼 클릭 시 리스트 추가**
        //     loadMoreButton.addEventListener("click", loadMorePoints);
         });
	    </script>
</body>
</html>
