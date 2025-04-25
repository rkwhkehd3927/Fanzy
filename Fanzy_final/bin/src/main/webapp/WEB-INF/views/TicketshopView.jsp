<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>티켓 상세 정보</title>
    <link rel="stylesheet" href="../css/ticketshopView.css">
    <link rel="stylesheet" href="../css/ticketshopView_modal.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
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
    </script>
</head>
<body>

	<header>
        <div class="header-left">
            <a href="/"><div class="logo"></div></a>
<!--             <div class="artist-name">유우리 (YUURI)</div> -->
        </div>
        <div class="user-options">
            <span>장바구니</span>
            <span>마이페이지</span>
            <span>로그인</span>
            <span>고객센터</span>
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
            <h2>${tdto.ticketTitle }</h2>
            <h3>${tdto.ticketContent }</h3>
 
            <p class="highlight">${tdto.ticketType }</p>
            <p class="use_from gray-text"><strong>사용 가능일</strong>${tdto.ticketValidFrom}</p>
            <p class="use_from gray-text"><strong>사용 종료일</strong>${tdto.ticketValidTo}</p>
            <p class="item_number gray-text"><strong>상품번호</strong> 5543-9417-5036</p>
        </div>
        <div class="purchase-info">
            <p><strong>장당 가격</strong> <span>₩ ${tdto.ticketPrice}</span></p>
            <hr style="border: none; border-top: 1px solid #ddd; margin: 5px 0;">
            <p><strong>구매 수량</strong> <span>1장</span></p>
            <hr style="border: none; border-top: 1px solid #ddd; margin: 5px 0;">
            <p><strong>총 가격</strong> <span>₩ ${tdto.ticketPrice}</span></p>
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
			        <p><strong>티켓 정보:</strong> <span id="seatInfo">${tdto.ticketContent }</span></p>
			        <p><strong>사용가능일:</strong> <span id="useDate">${tdto.ticketValidFrom}</span></p>
			        <p><strong>상품 번호:</strong> <span id="itemNumber">5543-9417-5036</span></p>
		        </div>
		        <div class="form-group">
			        <h3>거래 방식 선택</h3>
			        <label><input type="radio" name="trade" value="e-ticket" checked> e-ticket 거래</label>
			        <label><input type="radio" name="trade" value="delivery"> 배송 거래</label>
		        </div>
		        <div class="form-group">
			        <h3>장당 가격</h3>
			        <p>₩ ${tdto.ticketPrice}</p>
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
	        	<button id="payButton"  onclick="startPayment()">결제하기</button>
	        </div>
	    </div>
	</div>
 <script>
        // JSP에서 모델로 전달된 값 (tdto 객체의 값)을 JavaScript로 전달
        const name = '${tdto.ticketTitle}';  // JSP에서 ticketTitle 값을 JavaScript 변수에 할당
        const totalPrice = ${tdto.ticketPrice};  // JSP에서 ticketPrice 값을 JavaScript 변수에 할당

        console.log("상품명:", name);  // 확인용
        console.log("결제 금액:", totalPrice);  // 확인용

        // 결제 시작 함수
        function startPayment() {
        // 상품명과 결제 금액을 JavaScript 변수로 받아옴
        const name = '${tdto.ticketTitle}';  // JSP에서 동적으로 전달된 값
        const totalPrice = ${tdto.ticketPrice};  // JSP에서 동적으로 전달된 값
        
        // 유효성 검사
        if (!name || totalPrice <= 0) {
            alert('상품명 또는 결제 금액이 유효하지 않습니다.');
            return;
        }

        // 결제 준비 요청
        fetch('/pay/torderPay', {  // 새로운 경로로 변경
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                name: name,
                totalPrice: totalPrice,
            })
        })
        .then(response => response.json())  // 서버 응답 처리
        .then(data => {
            const tid = data.tid;  // 결제 고유번호
            const pgToken = data.pgToken;  // 결제 승인 토큰

            // 카카오페이 결제 요청
            Kakao.init('YOUR_KAKAO_APP_KEY');  // 카카오 API 키 (필수)

            Kakao.Pay.request({
                tid: tid,
                pgToken: pgToken,
                successCallback: function(response) {
                    window.location.href = "/pay/completed?pg_token=" + response.pgToken;
                },
                failCallback: function(error) {
                    alert('결제에 실패했습니다. 다시 시도해주세요.');
                }
            });
        })
        .catch(error => {
            alert('결제 준비 중 오류가 발생했습니다. 다시 시도해주세요.');
        });
    }
    </script>
    
</body>
</html>