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
    <link rel="stylesheet" href="../css/ticket/paymentPopUp.css">
    <script src="/socket.io/socket.io.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="../js/ticket/paymentPopUp.js"></script>
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
	    	
	    	let selectedSeatsPrice = ${seatsAmount}; // 선택된 좌석들의 총 가격
	    	let serviceFee = 2000; // 수수료
	        let deliveryFee = 3200; // 기본 배송료 (배송을 선택한 상태)
	        
	     	// 배송료와 금액을 초기화
	        $(".delivery-fee").text(deliveryFee.toLocaleString() + "원");
	        
	    	// 총 결제금액 계산
	        let totalAmount = selectedSeatsPrice + serviceFee + deliveryFee;
	        $(".total").text(totalAmount.toLocaleString() + "원");
	    	
	    	// hidden input에 배송료와 총 결제금액 저장
//             $("#hiddenDeliveryFee").val(deliveryFee);
//             $("#hiddenTotalAmount").val(totalAmount);
	        
	        
	        $("input[name='delivery']").change(function () {
	            deliveryFee = $(this).val() === "배송" ? 3200 : 0;

	            
                // 배송료 `td` 업데이트
	            $(".delivery-fee").text(deliveryFee.toLocaleString() + "원");

	            totalAmount = selectedSeatsPrice + serviceFee + deliveryFee;
	            
	            // 총 결제금액 업데이트
// 	            let serviceFee = 2000; // 예제에서 지정한 수수료
            	$(".total").text(totalAmount.toLocaleString() + "원");
            	
	        });
	    });
	</script>

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
	    
       <input type="hidden" id="hiddenDeliveryFee" value="0">
       <input type="hidden" id="hiddenTotalAmount" value="${seatsAmount + 2000}">
	    
	    <div class="seat-selection">
	        <h2>티켓수령방법</h2>
	        <div class="section delivery-info">
	            <div class="radio-box">
	                <label><input type="radio" name="delivery" value="현장수령"> 현장수령</label>
	                <label><input type="radio" name="delivery" value="배송" checked> 배송 (3,200원)</label>
	            </div>
	            <p class="info-text">2025년 06월 01일 일괄 배송되는 상품입니다.</p>
	        </div>
	
	        <h2>예매자 확인</h2>
	        <div class="section buyer-info">
	            <ul>
	                <li>이름: <input type="text" value="${memberDto.member_name}" disabled></li>
	                <li>생년월일: <input type="text" value="${fn:replace(memberDto.member_birth, '-', '')}" placeholder="(YYYYMMDD)" disabled></li>
	                <li>연락처: <input type="text" value="${memberDto.member_phone}"></li>
	                <li>이메일: <input type="text" value="${memberDto.member_email}"></li>
	            </ul>
	        </div>
	
	        <!-- address Dto 반영 -->
			<h2>배송자 정보</h2>
			<c:set var="defaultAddress" value="" />
				<c:forEach var="a" items="${adto}">
				    <c:if test="${a.address_isDefault}">
				        <c:set var="defaultAddress" value="${a}" />
				    </c:if>
				</c:forEach>
				
				<c:if test="${not empty defaultAddress}">
				    <div class="section delivery-info">
				        <div class="button-box">
				            <button>기본</button>
				            <button>${defaultAddress.address_receiverName}</button>
				        </div>
				        <p>${defaultAddress.address_address}</p> <!-- 기본 배송지 주소 -->
				        <p>${defaultAddress.address_receiverPhone}</p> <!-- 기본 배송지 연락처 -->
				        <p class="info-text">배송 받는 분의 연락처가 정확한 정보인지 입력해주세요.</p>
				    </div>
				</c:if>
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
						<!-- S석 2층 E열 3번 -->
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
	             
	                <td class="delivery-fee">0원</td>
	            </tr>
	            <tr class="total-row">
	                <th>총 결제금액</th>
	                <td class="total">0원</td>
	            </tr>
	        </table>
	        <button class="prevStepBtn">이전단계</button>
	        <button class="nextStepBtn">다음단계</button>
	    </div>
	</div>

</body>
</html>