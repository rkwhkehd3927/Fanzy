<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <title>좌석 선택 및 결제</title>
    <link rel="stylesheet" href="../css/ticket/paymentPopUp2.css">
    <script src="/socket.io/socket.io.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="../js/ticket/paymentPopUp2.js"></script>
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
	    
		$(document).ready(function () {
			
			// URL 파라미터에서 delivery 값을 가져오기 (배송 방법: 1 = 배송, 0 = 현장수령)
	        let delivery = new URLSearchParams(window.location.search).get("delivery");

	        // 좌석 가격과 수수료를 직접 더해서 총 금액 계산
	        let selectedSeatsPrice = ${seatsAmount}; // 선택된 좌석들의 총 가격
	        let serviceFee = 2000; // 수수료
	        let deliveryFee = (delivery === "1") ? 3200 : 0; // 배송 선택 시 3200원, 아니면 0원

	        // 총 결제 금액 계산
	        let totalAmount = selectedSeatsPrice + serviceFee + deliveryFee;

	        // 값 화면에 표시
	        $(".delivery-fee").text(deliveryFee.toLocaleString() + "원");
	        $(".total").text(totalAmount.toLocaleString() + "원");
			
		
		    // 결제 금액 수정 방지
		    $(".total").prop("readonly", true); // total 값 수정 방지
		
		});
	</script>
	
<div class="header">
    <select class="date-select">
        <c:forEach var="schedule" items="${schedules}">
	        <option value="${schedule.scheduleNo}"
	        	<c:if test="${schedule.scheduleNo == selectedScheduleNo}">selected</c:if>>
	            ${schedule.scheduleDate} ${schedule.scheduleStartTime}
	        </option>
	    </c:forEach>
    </select>
    <div class="logo"></div> <!-- 로고 이미지 -->
</div>
<div class="popup" data-id="${saleConcertDto.saleConcertNo}">

	<input type="hidden" id="hiddenDeliveryFee" value="${deliveryFee}">
	<input type="hidden" id="hiddenTotalAmount" value="${totalAmount}">


    <div class="payment-method">
        <h2>결제방식 선택</h2>
        <div class="method-list">
            <label><input type="radio" name="payment"> 신용카드</label>
            <label><input type="radio" name="payment"> KB Pay</label>
            <label><input type="radio" name="payment" checked> 카카오페이</label>
            <label><input type="radio" name="payment"> 무통장입금</label>
            <label><input type="radio" name="payment"> PAYCO</label>
            <label><input type="radio" name="payment"> 공연예매권</label>
        </div>
        <div class="point-info">
            <h3>사용가능한 포인트</h3>
            <ul>
                <li>마이신한포인트 <button>포인트조회</button></li>
                <li>씨티포인트 <button>포인트조회</button></li>
                <li>삼성포인트 <button>포인트조회</button></li>
                <li>외환 YES포인트 <button>포인트조회</button></li>
            </ul>
        </div>
    </div>

    <div class="payment-input">
        <h2>결제수단 입력</h2>
        <div class="card-info">
            <label><input type="radio" name="card" value="general" checked> 일반신용카드</label>
            <select style="margin: 0; margin-bottom: 10px;">
			    <option>카드종류를 선택하세요</option>
			    <option>하나카드 (1만원 청구할인)</option>
			    <option>인터파크롯데카드 (5% 청구할인)</option>
			    <option>NOL 카드 (10% 적립)</option>
			</select>

            <label><input type="radio" name="card" value="hana"> 하나컬쳐카드</label>
            <label><input type="radio" name="card" value="inter"> 인터파크롯데카드</label>
            <label><input type="radio" name="card" value="nol"> NOL 카드</label>
        </div>
        <div class="promotion-banner">
            <img src="../images/banner.png" alt="할인 배너">
        </div>
    </div>

    <div class="sidebar">
        <div class="ticket-info">
            <p>${concertDto.concertName}</p>
		    <p>${fn:substring(concertDto.concertStartDatetime, 0, 10)} ~ ${fn:substring(concertDto.concertEndDatetime, 0, 10)}</p>
		    <p>${concertDto.location}</p>
		    <p>${concertDto.concertAvailAge}세 이상 관람 가능</p>
		    <p>관람시간 : ${concertDto.concertDuration}분</p>
        </div>
        <h2>MY예매정보</h2>
        <table class="my-table">
            <tr>
                <th>일시</th>
                 <td>
                	${concertScheduleDto.scheduleDate} (${fn:substring(concertScheduleDto.scheduleStartTime, 0, 5)})
                </td>
            </tr>
            <tr>
                <th>선택좌석</th>
                <td>
               <!-- S석 2층 E구역 3열 10번 --> 
           			<c:forEach var="seat" items="${seats}">
			            <span class="seat-price" data-price="${seat.seatPrice}" data-seatNo="${seat.seatNo}"> 
			                ${seat.seatLevel} ${seat.seatRow}구역 ${seat.seatCol}열 ${seat.seatNo}번
			            </span><br/>
			        </c:forEach>
                </td>
            </tr>
            <tr>
                <th>티켓금액</th>
                <td class="ticket-price">${seatsAmount}원</td>
            </tr>
            <tr>
                <th>수수료</th>
                <td>2,000원</td>
            </tr>
            <tr>
                <th>배송료</th>
                <td class="delivery-fee">${hiddenDeliveryFee}원</td>
            </tr>
            <tr class="total-row">
                <th>총 결제금액</th>
                <td class="total">${hiddenTotalAmount}원</td>
            </tr>
        </table>
        <button class="prevStepBtn">이전단계</button>
        <button class="nextStepPayBtn">결제하기</button>
    </div>
</div>
</body>
</html>