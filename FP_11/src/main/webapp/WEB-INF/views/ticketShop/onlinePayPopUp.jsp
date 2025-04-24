<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스트리밍 티켓 주문창</title>
<link rel="stylesheet" href="../css/ticket/onlinePayPopUp.css">
 <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../js/ticket/onlinePayPopUp.js"></script>
</head>
<body>
<%-- 세션 확인용 (추후 삭제) --%>
<%-- 	<%= request.getSession().getAttribute("session_id") %>  --%>
	<script>
		var sessionId = "<%= request.getSession().getAttribute("session_id") %>";
		
	    if (!sessionId || sessionId === "null") {
	        alert("재 로그인 필요");
	        window.close(); // 현재 창 닫기
	    }
	    
	    $(document).ready(function() {
	        // saleConcertdto.concertPrice 값을 가져옴
	        var concertPrice = ${saleConcertDto.concertPrice}; // 템플릿 엔진에서 값 삽입되는 부분
	        var availablePoints = ${memberDto.member_mileage}; // 사용 가능한 마일리지

	        // 0.3% 계산
	        var rewardPoints = concertPrice * 0.003;

	     	// 소수점을 반올림하여 정수로 표시
	        rewardPoints = Math.round(rewardPoints);

	        // 사용 가능 리워드 부분에 값 삽입
	        $(".rewardPoints").text(availablePoints + " pt");
	        
	     	// 상품금액의 0.3%만큼의 포인트를 <option>에 삽입
	        $(".usePoints").html("<option value='0'>포인트사용 안함</option>");
	        $(".usePoints").append("<option value='" + rewardPoints + "'>" + rewardPoints + " pt</option>");
	        
	        
	     	// 지급 예정 리워드 계산 함수
	        function updatePendingRewards() {
	            var pendingRewards = concertPrice * 0.005; // 기본 지급 예정 리워드: 0.5%
	            pendingRewards = Math.round(pendingRewards);

	            // 사용자가 포인트를 사용하면 지급 예정 리워드를 0으로 설정
	            if ($(".usePoints").val() != "0") {
	                pendingRewards = 0;
	            }

	            // 지급 예정 리워드 업데이트
	            $(".pendingRewards").text(pendingRewards + " pt");
	        }
	        
	        
	     	// 총 결제 금액 계산 함수
	        function updateFinalPrice() {
	            var finalPrice = concertPrice; // 기본 결제 금액은 상품 금액

	            // 사용자가 선택한 리워드를 가져와서 결제 금액에 반영
	            var usedPoints = parseInt($(".usePoints").val());

	            // 포인트 사용 여부에 따라 결제 금액 계산
	            if (usedPoints > 0) {
	                finalPrice = concertPrice - usedPoints;
	                if (finalPrice < 0) finalPrice = 0; // 결제 금액이 0 미만이 되지 않도록 처리
	            }

	            // 최종 결제 금액 업데이트
	            $(".finalPrice").text("₩" + finalPrice.toLocaleString()); // 천 단위 구분
	        }

	        // 포인트 선택 변경 시 총 결제 금액과 지급 예정 리워드 업데이트
	        $(".usePoints").change(function() {
	            updateFinalPrice();
	            updatePendingRewards();
	        });

	        // 초기 페이지 로드 시 총 결제 금액과 지급 예정 리워드 갱신
	        updateFinalPrice();
	        updatePendingRewards();
	        
	        
	    });
	    
    
	</script>
	<div class="container">
        <h2 class="title">상품 결제</h2>
        <div class="product">
            <div class="product-image">
            	<img src="/images/ticket/${saleConcertDto.saleConcertImage}" alt="Product Image">
            </div>
            <div class="details">
                <h3>${concertDto.artistDto.artist_group_name} &lt; ${concertDto.concertName} &gt;
                 	<span class="saleConcertDesc">- ${saleConcertDto.saleConcertDesc}</span>
               	</h3>
            </div>
        </div>
        <div class="price-box">
        	<div class="price-row"><span>결제수단</span>
                <select class="choosePayment">
                    <option value="0">결제 수단 선택</option>
                    <option value="kakao">카카오페이</option>
                </select>
            </div>
            <div class="price-row"><span>상품금액</span><span class="concertPrice">₩${saleConcertDto.concertPrice}</span></div>
            <div class="price-row"><span>사용 가능 포인트</span><span class="rewardPoints">0 pt</span></div>
            <div class="price-row"><span>사용 할 포인트<span class="rewardDesc">·&nbsp; 적립금 일부만 사용가능</span></span>
                <select class="usePoints">
                    <%--  <option value="0">포인트사용 안함</option>
                    <option value="${memberDto.member_mileage}">0 pt</option> --%>
                </select>
            </div>
              
            <hr>
            <div class="price-row"><strong>총 결제 금액</strong><strong class="finalPrice">₩${saleConcertDto.concertPrice}</strong></div>
            <div class="price-row"><span>지급 예정 포인트</span><span class="pendingRewards">0 pt</span></div>
        </div>
        <button class="pay-btn">결제하기</button>
    </div>

</body>
</html>