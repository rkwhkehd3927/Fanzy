<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
   	<!-- 카카오 지도 API 스크립트 추가 (반드시 이 스크립트 추가) -->
	<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=7e7ee5e0fc8f76e7c81da65dd69f50eb&libraries=services"></script>
	<script type="text/javascript" src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <title>Global Fandom Platform - Fanzy</title>
    <link rel="stylesheet" href="/css/cart.css">
    <script>
    // 1. 로그아웃
    $(document).ready(function() {
        $(".logout").click(function() {
            location.href = "/logout"; 
        });
    });
    
    // 2. 검색창 토글
   window.onload = () => {
			document.getElementById('searchInput').addEventListener('keyup', searchArtist);
		    
		    // 🔥 NULL 체크 추가해서 오류 방지
		    const searchBtnElement = document.getElementById('searchBtn');
		    if (searchBtnElement) {
		        searchBtnElement.addEventListener('click', searchBtn);
		    }
		};
		
		const searchArtist = () => {
		    const query = document.getElementById('searchInput').value.trim();
		    const resultsBox = document.getElementById('searchResults');
		    const searchBox = document.getElementById('searchBox');
		
		    if (query.length === 0) {
		        resultsBox.style.display = 'none';
		        resultsBox.innerHTML = '';
		        return;
		    }
		
		    fetch('/search?query=' + encodeURIComponent(query))
		        .then(response => {
		            if (!response.ok) {
		                throw new Error('검색 요청 실패');
		            }
		            return response.json();
		        })
		        .then(data => {
		            if (!data || data.length === 0) {
		                resultsBox.innerHTML = '<p style="padding: 10px;">검색 결과가 없습니다.</p>';
		                resultsBox.style.display = 'block';
		                return;
		            }
		
		            resultsBox.innerHTML = data.map(artist => 
		            '<a href="/artist?artist_no=' + artist.no + '" class="search-result-link">' + // ✅ a 태그가 div 바깥으로 감싸도록 수정
		                '<div class="search-result-item">' +
		                    '<img src="/images/' + artist.imageUrl + '" alt="' + artist.name + '" class="search-result-img">' +
		                    '<span class="search-result-name">' + artist.name + '</span>' +
		                '</div>' +
		            '</a>'
		        	).join('');

		            resultsBox.style.display = 'block';
		        })
		        .catch(error => console.error('Error fetching search results:', error));
		};
		
		
		const searchBtn = () => {
		    const searchBox = document.getElementById('searchBox');
		    const searchIcon = document.querySelector('.fa-magnifying-glass');
		    const searchInput = document.getElementById('searchInput');
		    const searchLi = document.querySelector('nav ul li a'); // a 요소 선택

		    // 검색창과 검색 아이콘을 토글
		    if (searchBox.style.display === 'none' || searchBox.style.display === '') {
		        searchBox.style.display = 'block'; // 검색창을 보이게
		        searchIcon.style.visibility = 'hidden'; // 검색 아이콘 숨기기
		        searchIcon.style.opacity = '0'; // 아이콘을 완전히 투명하게 만듦
		        searchInput.focus(); // 검색창이 보일 때 포커스를 맞추기
		        searchLi.classList.add('no-hover'); // hover 비활성화
		    }
		};
		
		
		//CSS 추가 (필요하면 HTML의 <style> 태그 안에 넣어줘)
		const style = document.createElement('style');
		style.innerHTML = `
		    .search-result-item {
		        display: flex;
		        align-items: center;
		        padding: 5px;
		        cursor: pointer;
				margin-bottom: 5px;
		    }
		    .search-result-item:hover {
		        background-color: #f0f0f0;
		    	border-radius: 5px;
		    }
		    .search-result-link::before {
		        display: none !important;
		        content: none !important;
		    }
		    .search-result-img {
		        width: 30px;
		        height: 30px;
		        border-radius: 50%;
		        margin-right: 10px;
		    }
		    .search-result-name {
		        font-size: 14px;
		    }
		`;
		document.head.appendChild(style);
		
		document.addEventListener("click", (event) => {
		    const resultsBox = document.getElementById("searchResults");
		    const searchBox = document.getElementById("searchBox");
		    const searchInput = document.getElementById("searchInput");
		    const searchBtn = document.querySelector('nav ul li a'); // 검색 버튼
		    const searchIcon = document.querySelector(".fa-magnifying-glass");
		    const searchLi = document.querySelector('nav ul li a'); // hover 효과 복구용

		    if (
		        !resultsBox.contains(event.target) && 
		        !searchBox.contains(event.target) &&
		        event.target !== searchInput &&
		        event.target !== searchBtn && 
		        !searchBtn.contains(event.target) // 검색 버튼 클릭 예외 처리
		    ) {
		        resultsBox.style.display = "none";  
		        searchBox.style.display = "none";  
		        searchIcon.style.visibility = "visible";  
		        searchIcon.style.opacity = "1";  
		        searchLi.classList.remove('no-hover'); // hover 효과 복구
		    }
		}); // 2번 끝

	 
	 // 3. 장바구니 클릭시
	const cartBtn = () => {
	    const sessionId = '${session_id}';  
	
	    if (sessionId) {  // sessionId가 있으면
	        window.location.href = "/cart";
	    } else {
	        const isLogin = confirm("로그인이 필요합니다. 로그인하시겠습니까?");
	        if (isLogin) {
	            window.location.href = "/login"; // 로그인 페이지로 이동
	        }
	    }
	}; // 3번 종료
	
	// 4. 알림창 모달 열기
	// 프로그레스바 위치 및 너비 업데이트 함수
	function updateProgressBar(targetIndex) {
	    let totalTabs = $(".modal-link").length;  // 탭의 총 개수
	    let progressWidth = (1 / totalTabs) * 100;  // 각 탭의 너비 비율

	    // 프로그레스바의 왼쪽 위치를 인덱스를 기준으로 설정
	    let progressLeft = (targetIndex / totalTabs) * 100;

	    // progress2의 위치와 너비 설정
	    $(".progress2").css({
	        "left": progressLeft + "%",  // 실선의 위치
	        "width": progressWidth + "%"  // 실선의 너비
	    });
	}

	// 알림창 모달 열기
	const openAlert = () => {
	    $("#messageModal").show();

	    // 모달이 열릴 때 기본적으로 'all' 타겟을 보여주기
	    $(".notification-content").removeClass("active").hide();  // 모든 콘텐츠 숨기기
	    $("#all").addClass("active").show();  // 'all' 콘텐츠만 보여주기

	    // 'all' 탭 글자 색상 변경 (모달이 열릴 때)
	    $(".modal-link").css("color", "");  // 모든 탭 글자 색 초기화
	    $(".modal-link[data-target='all']").css("color", "#ff9a9e");  // 'all' 탭 글자 색상 변경

	    // 초기 핑크 실선 위치 설정 (전체 탭에 맞춰)
	    updateProgressBar(0);  // 'all' 탭이 첫 번째이므로 인덱스 0으로 설정
	};

	// 모달 닫기 (배경 클릭 시)
	$(document).ready(function () {
	    // 'messageModal' 외부를 클릭 시 모달을 닫는 코드
	    $("#messageModal").click(function (e) {
	        if ($(e.target).closest(".message-content").length === 0) {  // 클래스 이름 수정
	            $("#messageModal").hide();
	        }
	    });

	    // 탭 전환
	    $(".modal-link").click(function (e) {
	        e.preventDefault();
	        let target = $(this).data("target");

	        // 모든 탭의 색을 원래 상태로 되돌리기
	        $(".modal-link").css("color", "");  // 텍스트 색 원래 상태로 복원

	        // 클릭한 탭만 색상 변경 (ff9a9e)
	        $(this).css("color", "#ff9a9e");

	        // 콘텐츠 전환
	        $(".notification-content").removeClass("active").hide();
	        $("#" + target).addClass("active").show();

	        // 해당 탭에 대한 프로그레스바 위치 업데이트
	        let targetIndex = $(this).parent().index(); // 클릭된 탭의 인덱스 (0부터 시작)

	        // 해당 탭에 맞게 핑크 실선 위치 및 너비 업데이트
	        updateProgressBar(targetIndex);  // 클릭한 탭에 맞춰 업데이트
	    });
	}); // 4번 끝
	
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
    
    // 7. 알림창 ul 드래그
    document.addEventListener("DOMContentLoaded", function () {
        const artistListWrapper = document.querySelector(".artist-list-wrapper");  // ul을 감싸는 부모 요소
        const artistList = document.querySelector(".artist-list");  // ul 요소
        let isMouseDown = false;  // 마우스를 눌렀는지 여부
        let startX;  // 마우스 시작 위치
        let scrollLeft;  // 시작 시의 scrollLeft 값

        // 드래그 기능 설정
        const enableDrag = () => {
            // 마우스를 클릭했을 때 (드래그 시작)
            artistListWrapper.addEventListener("mousedown", (e) => {
                if (e.target.classList.contains("modal-link")) return;  // 링크 클릭 시 드래그 방지
                isMouseDown = true;
                startX = e.pageX - artistListWrapper.offsetLeft;  // 마우스 시작 위치
                scrollLeft = artistListWrapper.scrollLeft;  // 현재 스크롤 위치
                artistListWrapper.style.cursor = "grabbing";  // 드래그 중 커서 변경
            });

            // 마우스를 이동했을 때 (드래그 중)
            artistListWrapper.addEventListener("mousemove", (e) => {
                if (!isMouseDown) return;  // 마우스가 클릭되지 않았다면 이동하지 않음
                const moveX = e.pageX - artistListWrapper.offsetLeft - startX;  // 마우스 이동 거리
                artistListWrapper.scrollLeft = scrollLeft - moveX;  // 부모의 scrollLeft를 이동
            });

            // 마우스 버튼을 뗐을 때 (드래그 끝)
            artistListWrapper.addEventListener("mouseup", () => {
                isMouseDown = false;
                artistListWrapper.style.cursor = "grab";  // 커서 원래대로
            });

            // 마우스가 요소 밖으로 나갔을 때 (드래그 끝)
            artistListWrapper.addEventListener("mouseleave", () => {
                isMouseDown = false;
            });
        };

        // 탭 전환시 드래그 이벤트가 리셋되지 않도록 함
        $(".modal-link").click(function (e) {
            e.preventDefault();
            let target = $(this).data("target");

            // 모든 탭의 색을 원래 상태로 되돌리기
            $(".modal-link").css("color", "");  // 텍스트 색 원래 상태로 복원

            // 클릭한 탭만 색상 변경 (ff9a9e)
            $(this).css("color", "#ff9a9e");

            // 콘텐츠 전환
            $(".notification-content").removeClass("active").hide();
            $("#" + target).addClass("active").show();

            // 드래그 기능 다시 활성화
            enableDrag();

            // 해당 탭에 대한 프로그레스바 위치 업데이트
            let targetIndex = $(this).parent().index(); // 클릭된 탭의 인덱스 (0부터 시작)

            // 해당 탭에 맞게 핑크 실선 위치 및 너비 업데이트
            updateProgressBar(targetIndex);  // 클릭한 탭에 맞춰 업데이트
        });

        // 페이지 로드 시 드래그 활성화
        enableDrag();
    }); // 7번 끝
    
    </script>
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
	                <li class="cart coin"><a href="/smain"><img src="/images/index_login/coin.png"></a></li>
	                <li class="cart" style="position: relative; top:-1px;"><a onclick="cartBtn()"><i class="fa-solid fa-cart-shopping"></i></a></li>
	            </c:if>
	            <c:if test="${session_id==null}">
	                <li class="cart coin"><a href="/smain"><img src="/images/index_login/coin.png"></a></li>
	                <li class="cart" style="position: relative; top:4px;"><a onclick="cartBtn()"><i class="fa-solid fa-cart-shopping"></i></a></li>
	            </c:if>
	            </ul>
	        </nav>
    </header>
    <main class="main-container">
    <!-- 핑크배너 -->
    <section class="banner">
        <div class="banner-item">Fanzy Showcase &lt; Chase Our Hearts &gt;</div>
        <div class="banner-item">2025 Fanzy Con Festival</div>
    </section>

    <!-- 배송지 -->
    <section class="cart_all">
    	<div class="address">
    		<div style="margin: auto; width: 60%;">
	    		<p id="addressInput"><i class="fa-solid fa-location-dot"></i>${mdto.member_address}</p>
	    		<button type="button" id="addressBtn">배송지 변경</button>
    		</div>
    	</div>
    <!-- 장바구니 -->
<div class="notice-board">
    <h2>장바구니</h2>
    <div class="notice-item cart-container">
        <h2>Merch</h2>
        <c:set var="hasMerch" value="false"/>
        <c:forEach var="cart" items="${cartList}">
            <c:forEach var="item" items="${cart.parsedCartItems}">
                <c:if test="${item['shop_category'] ne '티켓' and item['shop_category'] ne null}">
                    <c:set var="hasMerch" value="true"/>
                </c:if>
            </c:forEach>
        </c:forEach>

        <c:choose>
            <c:when test="${hasMerch}">
                <c:set var="mergedItems" value="<%= new LinkedHashMap<String, Object>() %>" />

                <c:forEach var="cart" items="${cartList}">
                    <c:forEach var="item" items="${cart.parsedCartItems}">
                        <c:if test="${item['shop_category'] ne '티켓' and item['shop_category'] ne null}">
                            <c:set var="key" value="${item['shop_title']}"/>
                            <c:choose>
                                <c:when test="${mergedItems[key] != null}">
                                    <c:set target="${mergedItems[key]}" property="shop_quantity" 
                                        value="${mergedItems[key].shop_quantity + item['shop_quantity']}"/>
                                    <c:set target="${mergedItems[key]}" property="cartNos" 
                                        value="${mergedItems[key].cartNos},${cart.cart_no}"/>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="tempItem" value="${item}"/>
                                    <c:set target="${tempItem}" property="cartNos" value="${cart.cart_no}"/>
                                    <c:set target="${mergedItems}" property="${key}" value="${tempItem}"/>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                    </c:forEach>
                </c:forEach>

                <c:forEach var="entry" items="${mergedItems}">
                    <c:set var="item" value="${entry['value']}"/>
                    <div class="cart-item" data-cart-nos="${item.cartNos}" id="cart-${item.cartNos}">
                        <img src="/images/shopimages/prods/${item.shop_image1}.jpg" alt="${shop.shop_title}" alt="상품 이미지" class="cart-item-img">
                        <div class="cart-item-info">
                            <p class="cart-item-name">${item['shop_title']}</p>
                            <p class="cart-item-quantity">
                                <fmt:formatNumber value="${item['shop_quantity']}" pattern="#,###"/>개
                            </p>
                            <p class="cart-item-price">
                                <strong>
                                    <fmt:formatNumber value="${item['shop_price'] * item['shop_quantity']}" pattern="#,###"/>원
                                </strong>
                            </p>
                            <div class="cart-item-actions">
                                <button class="cart-item-btn edit">옵션 변경</button>
                                <button class="cart-item-btn delete" onclick="deleteCartItem(this)">삭제</button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <!-- 장바구니가 비었을 때 -->
                <p>장바구니에 담긴 상품이 없습니다.</p>
                <a href="/smain">
                    <button class="goShop" type="button">팬지샵(굿즈)으로 이동</button>
                </a>
            </c:otherwise>
        </c:choose>
    </div>

		
		    <c:set var="totalPrice" value="0"/>
		    <!-- 🛒 합산된 상품 기준으로 총 금액 계산 -->
			<c:forEach var="entry" items="${mergedItems}">
			    <c:set var="item" value="${entry['value']}"/>
			    <c:set var="totalPrice" value="${totalPrice + (item['shop_price'] * item['shop_quantity'])}"/>
			</c:forEach>
		
		    <!-- 🚛 배송비 계산: 상품이 없으면 0원, 7만 원 이상 무료, 그 외 3천 원 -->
			<c:set var="shippingCost" value="0"/>
			<c:if test="${totalPrice > 0 and totalPrice < 70000}">
			    <c:set var="shippingCost" value="3000"/>
			</c:if>
			
			<!-- 💰 최종 결제 금액 계산 -->
			<c:set var="finalPrice" value="${totalPrice + shippingCost}"/>
			
			<!-- 🎁 적립금 계산: 상품이 없으면 0원, 총 구매 금액의 5% -->
			<c:set var="rewardPoint" value="0"/>
			<c:if test="${totalPrice > 0}">
			    <c:set var="rewardPoint" value="${finalPrice * 0.01}"/>
			</c:if>
		
		    <div class="payment-summary">
		        <h3>구매 금액</h3>
		        <div class="payment-details">
		            <div class="row">
		                <span>상품 금액</span>
		                <span class="price"><fmt:formatNumber value="${totalPrice}" pattern="#,###"/>원</span>
		            </div>
		            <div class="row">
		                <span>할인 금액</span>
		                <span class="discount">- 0원</span>
		            </div>
		            <div class="row">
		                <span>배송비</span>
		                <span class="shipping-cost">
		                    <c:choose>
		                        <c:when test="${shippingCost == 0}">무료배송</c:when>
		                        <c:otherwise><fmt:formatNumber value="${shippingCost}" pattern="#,###"/>원</c:otherwise>
		                    </c:choose>
		                </span>
		            </div>
		            <hr>
		            <div class="row total">
		                <span><strong>총 구매 금액</strong></span>
		                <span class="final-price">
		                    <strong><fmt:formatNumber value="${finalPrice}" pattern="#,###"/>원</strong>
		                </span>
		            </div>
		            <div class="row reward">
		                <span>적립 혜택 예상</span>
		                <span class="reward-point">
		                    최대 <fmt:formatNumber value="${rewardPoint}" pattern="#,###"/>원
		                </span>
		            </div>
		            <form id="paymentForm" action="/sptwind" method="post">
					    <input type="hidden" name="sessionNickname" value="${session_nickname}">
					    <input type="hidden" name="selectedAddress" id="selectedAddressInput">
					</form>
					
					<button class="payment-btn">결제하기</button>
		        </div>
		    </div>


	        <div class="notice-item recent">
		    <h2>최근 본 상품</h2>
		
		    <!-- 최근 본 상품 목록 -->
			<div class="recent-items-container">
			    <c:choose>
			        <c:when test="${not empty recentViewedList}">
			            <c:forEach var="item" items="${recentViewedList}">
			                <a href="/sprodview?shopNo=${item.shop_no}">
			                    <div class="cart-item recentItem">
			                        <img src="/images/shopimages/prods/${item.shop_image1}.jpg" alt="${shop.shop_title}" alt="상품 이미지" class="cart-item-img">
			                        <div class="cart-item-info recentInfo">
			                            <p class="cart-item-name">${item.shop_title}</p>
			                            <p class="cart-item-price"><fmt:formatNumber value="${item.shop_price}" pattern="#,###"/>원</p>
			                        </div>
			                    </div>
			                </a>
			            </c:forEach>
			        </c:when>
			        <c:otherwise>
			            <!-- 최근 본 상품이 없을 때 -->
			            <div class="recent-message">
			                <p>최근 본 상품이 없습니다.</p>
			            </div>
			        </c:otherwise>
			    </c:choose>
			</div>



    </section>
    
    
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
		<div id="google_translate_element"></div>
		
		<!-- 배송지 목록 모달창 -->
		<div class="address-modal">
		    <div class="address-modal-content">
		        <!-- 닫기 버튼 -->
		        <span class="address-modal-close">&times;</span>
		
		        <!-- 모달 헤더 -->
		        <h2>배송지 정보</h2>
		
		        <!-- 검색창 -->
		        <div class="address-search">
		            <input type="text" placeholder="배송지 이름, 주소, 연락처로 검색하세요.">
		            <button class="search-btn"><i style="font-size:20px; margin:0; padding:0;" class="fa-solid fa-magnifying-glass"></i></button>
		        </div>
		
		        <!-- 배송지 추가 버튼 -->
		        <button class="add-address-btn">배송지 추가하기</button>
		
		        <!-- 배송지 목록 -->
		        <div class="address-list">
		            <c:forEach var="a" items="${adto}">
					    <div class="address-item">
					        <input type="radio" name="selectedAddress" value="${a.address_no}" ${a.address_isDefault ? 'checked' : ''}>
					        <div class="address-info">
					            <p class="receiver-name">
					                ${a.address_receiverName} 
					                <c:if test="${a.address_isDefault}">
					                    <span class="default-badge">기본 배송지</span>
					                </c:if>
					            </p>
					            <p class="address-detail">${a.address_address}</p>
					            <p class="phone-number">${a.address_receiverPhone}</p>
					        </div>
					        <div class="address-actions">
					            <button class="edit-btn">수정</button>
					            <button class="del-btn">삭제</button>
					        </div>
					    </div>
					</c:forEach>
				        <!-- 변경하기 버튼 -->
				        <button class="change-address-btn">변경하기</button>
				    </div>
				</div>
		
		
		<script>
		// 1. 배송지 변경
		document.addEventListener("DOMContentLoaded", function () {
		    const addressBtn = document.getElementById("addressBtn"); // 배송지 변경 버튼
		    const modal = document.querySelector(".address-modal"); // 모달창
		    const modalClose = document.querySelector(".address-modal-close"); // 모달 닫기 버튼
		    const changeBtn = document.querySelector(".change-address-btn"); // 변경하기 버튼
		    const addressInput = document.getElementById("addressInput"); // 현재 배송지 표시 부분

		    // 🚀 배송지 변경 버튼 클릭 → 모달 열기
		    addressBtn.addEventListener("click", function () {
		        console.log("🚀 모달 열기");
		        modal.style.display = "flex";
		    });

		    // 🚀 닫기 버튼 클릭 → 모달 닫기
		    modalClose.addEventListener("click", function () {
		        console.log("🚀 모달 닫기");
		        modal.style.display = "none";
		    });

		    // 🚀 모달 바깥 클릭 시 닫기
		    window.addEventListener("click", function (event) {
		        if (event.target === modal) {
		            modal.style.display = "none";
		        }
		    });

		    // 🚀 "변경하기" 버튼 클릭 → 선택한 배송지 적용
		    changeBtn.addEventListener("click", function () {
		        const selectedRadio = document.querySelector("input[name='selectedAddress']:checked"); // 선택된 배송지
		        
		        if (selectedRadio) {
		            const addressItem = selectedRadio.closest(".address-item"); // 선택된 주소의 부모 요소
		            const receiverName = addressItem.querySelector(".receiver-name").childNodes[0].nodeValue.trim(); // 받는 사람
		            const addressDetail = addressItem.querySelector(".address-detail").innerText.trim(); // 주소

		            // ✅ 디버깅용 콘솔 확인
		            console.log("🚀 선택된 배송지:", receiverName, addressDetail);

		            // 🚀 배송지 정보 업데이트
		            addressInput.innerHTML = '<i class="fa-solid fa-location-dot"></i> ' + addressDetail;

		            // 🚀 모달 닫기
		            modal.style.display = "none";
		        } else {
		            alert("변경할 배송지를 선택해주세요!");
		        }
		    });
		}); // 1번 끝
		
		// 2. 장바구니 삭제
// 2. 장바구니 삭제
// 2. 장바구니 삭제
$(document).on("click", ".cart-item-btn.delete", function () {
    let $cartItem = $(this).closest(".cart-item");
    // "cart-" 제거 후 남은 문자열 (예: "19,20" 또는 단일 "942")
    let cartNosStr = $cartItem.attr("id").replace("cart-", "");
    console.log("cartNos 값 확인:", cartNosStr);
    
    if (!cartNosStr) {
        alert("삭제할 상품의 번호를 찾을 수 없습니다.");
        return;
    }
    
    // 콤마 구분 문자열을 배열로 변환 후 정수 변환
    let cartNos = cartNosStr.split(",").map(num => parseInt(num, 10));
    if (cartNos.length === 0 || cartNos.some(isNaN)) {
        alert("삭제할 상품의 번호를 찾을 수 없습니다.");
        return;
    }
    
    // 삭제할 상품의 가격 추출 (숫자만)
    let itemPrice = parseInt($cartItem.find(".cart-item-price strong").text().replace(/[^0-9]/g, ""), 10) || 0;
    console.log("삭제되는 상품 가격:", itemPrice);
    
    if (confirm("상품을 삭제하시겠습니까?")) {
        if (cartNos.length === 1) {
            // 단일 삭제: cartNo를 단일 값으로 전송
            $.ajax({
                url: "/delete",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify({ cartNo: cartNos[0] }),
                dataType: "json",
                success: function (data) {
                    if (data.success) {
                        $cartItem.remove();
                        updatePaymentSummary(-itemPrice);
                        let countAll = $(".cart-container .cart-item").length;
                        if (countAll === 0) {
                            $(".cart-container").html(`
                                <h2>Merch</h2>
                                <p>장바구니에 담긴 상품이 없습니다.</p>
                                <a href="/smain">
                                    <button class="goShop" type="button">팬지샵(굿즈)으로 이동</button>
                                </a>
                            `);
                        }
                    } else {
                        alert("삭제에 실패했습니다. 다시 시도해주세요.");
                    }
                },
                error: function (xhr, status, error) {
                    console.error("서버 오류:", xhr.responseText);
                    alert("서버 오류가 발생했습니다.");
                }
            });
        } else {
            // 여러 개 삭제: 각 cartNo에 대해 개별 AJAX 요청 수행
            let deleteCount = 0;
            let totalRequests = cartNos.length;
            let hasError = false;
            
            cartNos.forEach(function(cartNo) {
                $.ajax({
                    url: "/delete",
                    type: "POST",
                    contentType: "application/json",
                    data: JSON.stringify({ cartNo: cartNo }),
                    dataType: "json",
                    success: function (data) {
                        if (data.success) {
                            deleteCount++;
                            // 모든 요청이 성공했을 때 처리
                            if (deleteCount === totalRequests && !hasError) {
                                $cartItem.remove();
                                updatePaymentSummary(-itemPrice);
                                let countAll = $(".cart-container .cart-item").length;
                                if (countAll === 0) {
                                    $(".cart-container").html(`
                                        <h2>Merch</h2>
                                        <p>장바구니에 담긴 상품이 없습니다.</p>
                                        <a href="/smain">
                                            <button class="goShop" type="button">팬지샵(굿즈)으로 이동</button>
                                        </a>
                                    `);
                                }
                            }
                        } else {
                            hasError = true;
                            alert("삭제에 실패했습니다. 다시 시도해주세요.");
                        }
                    },
                    error: function (xhr, status, error) {
                        hasError = true;
                        console.error("서버 오류:", xhr.responseText);
                        alert("서버 오류가 발생했습니다.");
                    }
                });
            });
        }
    }
});

 // 2번 끝

		// 3. 구매 금액 업데이트 함수
		function updatePaymentSummary(priceChange) {
		    let totalPrice = parseInt($(".price").text().replace(/[^0-9]/g, ""), 10) || 0;
		    console.log("현재 총 가격:", totalPrice); // ⭐ 확인용 로그 추가

		    let newTotalPrice = totalPrice + priceChange;
		    console.log("업데이트된 총 가격:", newTotalPrice); // ⭐ 확인용 로그 추가

		    // 🚛 배송비 계산 (7만 원 이상 무료, 그 외 3천 원, 상품 없으면 0원)
		    let shippingCost = 0;
		    if (newTotalPrice > 0 && newTotalPrice < 70000) {
		        shippingCost = 3000;
		    }

		    // 💰 최종 결제 금액
		    let finalPrice = newTotalPrice + shippingCost;
		    console.log("업데이트된 최종 결제 금액:", finalPrice); // ⭐ 확인용 로그 추가

		    // 🎁 적립금 계산 (총 구매 금액의 5%)
		    let rewardPoint = newTotalPrice > 0 ? Math.floor(finalPrice * 0.05) : 0;
		    console.log("업데이트된 적립금:", rewardPoint); // ⭐ 확인용 로그 추가

		    // 🔄 화면 업데이트 (강제 적용)
		    $(".price").text(newTotalPrice.toLocaleString() + "원");
		    $(".shipping-cost").text(shippingCost === 0 ? "무료배송" : shippingCost.toLocaleString() + "원");
		    $(".final-price strong").text(finalPrice.toLocaleString() + "원");
		    $(".reward-point").text("최대 " + rewardPoint.toLocaleString() + "원");

		    console.log("💰 구매 금액 업데이트 완료!");
		}


		// 4. 결제하기 이동
		$(".payment-btn").click(function () {
		    const selectedAddress = $("input[name='selectedAddress']:checked").val();
		    
		    if (!selectedAddress) {
		        alert("🚨 배송지를 선택해주세요!");
		        return;
		    }
		
		    console.log("📦 선택한 배송지 ID:", selectedAddress);
		    console.log("👤 세션 닉네임:", '${session_nickname}');
		
		    // 폼에 선택한 배송지 값 넣고 제출
		    $("#selectedAddressInput").val(selectedAddress);
		    $("#paymentForm").submit();  // ✅ /sptwind로 이동
		}); // 4번 끝
	</script>
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
		    <p>© <strong>FANZY COMPANY Inc.</strong> Ver 2.32.6</p>
		</div>	
	    </footer>
	</body>
	</html>