<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>티켓 상세 정보</title>
    <link rel="stylesheet" href="../css/ticket/marketplaceView.css">
    <link rel="stylesheet" href="../css/ticket/marketplaceView_modal.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   
     <script>
        $(document).ready(function () {
        	let modal = $('#orderModal');
            let closeBtn = $('.close');
            let buyBtn = $('.buy-btn');
            
            $('#tabs .tab-menu div').click(function () {
                let index = $(this).index();
                $('#tabs .tab-content').removeClass('active');
                $('#tabs .tab-menu div').removeClass('active');
                $('#tabs .tab-content').eq(index).addClass('active');
                $('#tabs .tab-menu div').eq(index).addClass('active');
            });
            
            // 모달
            buyBtn.click(function() {
                modal.show();
            });
            
            closeBtn.click(function() {
                modal.hide();
            });
            
            $(window).click(function(event) {
                if ($(event.target).is(modal)) {
                    modal.hide();
                }
            });
            
            $('#quantity').on('input', function() {
                let pricePerTicket = 550000;
                let quantity = $(this).val();
                let totalPrice = pricePerTicket * quantity;
                $('#totalPrice').text('₩' + totalPrice.toLocaleString());
            });
        });
        
     // 1. 장바구니 클릭시
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
		}; // 1번 종료
		
	 // 2. 마이페이지 클릭시
		const mypage = () => {
		    const sessionId = '${session_id}';  
		
		    if (sessionId) {  // sessionId가 있으면
		        window.location.href = "/mypage";
		    } else {
		        const isLogin = confirm("로그인이 필요합니다. 로그인하시겠습니까?");
		        if (isLogin) {
		            window.location.href = "/login"; // 로그인 페이지로 이동
		        }
		    }
		}; // 2번 종료
    </script>
</head>
<body>

	<header>
        <div class="header-left">
            <a href="/"><div class="logo"></div></a>
            <!-- 
            <div class="artist-name">유우리 (YUURI)</div> -->
        </div>
        <div class="user-options">
            <a style="cursor: pointer;" onclick="cartBtn()"><span>장바구니</span></a>
            <a style="cursor: pointer;" onclick="mypage()"><span>마이페이지</span></a>
            <c:if test="${memberId == null }">
				<a href="/login"><span>로그인</span></a>
			</c:if>
            <c:if test="${memberId != null }">
				<a href="/logout"><span>로그아웃</span></a>
			</c:if>	
            <a><span>고객센터</span></a>
        </div>
    </header>
    <nav class="menu">
        <ul>
            <li><a href="/ticketShop/ticketMain">콘서트</a></li>
<!--             <li><a href="/ticketShop/ticketMain?tab=live">라이브</a></li> -->
            <li><a href="/ticketShop/marketplace">티켓거래</a></li>
        </ul>
    </nav>
    <div class="container">
        <div class="ticket-info">
            <p>콘서트 > 지드래곤 (G-DRAGON) > 지드래곤 2025 - 고양 (3월)</p>
            <h2>N10구역 12열</h2>
            <div class="seat-info">
                <ul>
                    <li>3층 (3F)</li>
                    <li>A</li>
                    <li>42</li>
                </ul>
            </div>
            <p class="highlight">여성명의</p>
            <p class="use_from gray-text"><strong>사용일</strong> 03.29 18:30</p>
            <p class="item_number gray-text"><strong>상품번호</strong> 5543-9417-5036</p>
        </div>
        <div class="purchase-info">
            <p><strong>장당 가격</strong> <span>₩550,000</span></p>
            <hr style="border: none; border-top: 1px solid #ddd; margin: 5px 0;">
            <p><strong>구매 수량</strong> <span>1장</span></p>
            <hr style="border: none; border-top: 1px solid #ddd; margin: 5px 0;">
            <p><strong>총 가격</strong> <span>₩550,000</span></p>
            <div class="trade-method">
                <p><strong>거래방식 선택</strong></p>
                <label>
                    <input type="checkbox"> 배송거래
                </label>
            </div>
            <button class="buy-btn">구매하기</button>
        </div>
    </div>
  	<div id="tabs" class="tabs">
        <div class="tab-menu">
            <div class="active">상품 상세 정보</div>
            <div>상품 결제/수령 안내</div>
            <div>취소/환불 안내</div>
        </div>
        <div class="tab-content active">상품 상세 정보 내용</div>
        <div class="tab-content">상품 결제/수령 안내 내용</div>
        <div class="tab-content">취소/환불 안내 내용</div>
    </div>
    
    <!-- 구매 모달 -->
    <div id="orderModal" class="orderModal">
        <span class="close">&times;</span>
	    <div class="modal-content">
	    	<h2>결제하기</h2>
	    	<div class="modal-body">
	    	
	    		<div class="form-group">
			        <h3>주문 상품 정보</h3>
			        <p><strong>좌석 정보:</strong> <span id="seatInfo">1층 A1 | 지정석</span></p>
			        <p><strong>사용가능일:</strong> <span id="useDate">03.29 18:30</span></p>
			        <p><strong>상품 번호:</strong> <span id="itemNumber">5543-9417-5036</span></p>
		        </div>
		        <div class="form-group">
			        <h3>거래 방식 선택</h3>
			        <label><input type="radio" name="trade" value="e-ticket" checked> e-ticket 거래</label>
			        <label><input type="radio" name="trade" value="delivery"> 배송 거래</label>
		        </div>
		        <div class="form-group">
			        <h3>장당 가격</h3>
			        <p>₩550,000</p>
		        </div>
		        <div class="form-group">
			        <h3>구매 수량</h3>
			        <input type="number" id="quantity" value="1" min="1">
		        </div>
		        <div class="form-group">
			        <h3>결제 수단</h3>
			        <label><input type="radio" name="payment" value="card" checked> 카드 결제</label>
			        <label><input type="radio" name="payment" value="general"> 일반 결제</label>
		        </div>
		        <div class="form-group">
			        <h3>총 가격</h3>
			        <p id="totalPrice">₩550,000</p>
	        	</div>
	        	<div class="form-group">
                    <input type="checkbox" id="agreeTerms"> 결제 약관에 동의합니다.
                </div>
	        	<button id="payButton">결제하기</button>
	        </div>
	    </div>
	</div>
	    
    
</body>
</html>