<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 등록 모달</title>
    <link rel="stylesheet" href="../css/ticket/marketplace_add.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        
    </style>
</head>
<body>
    <button id="openModal">등록하기</button> <!-- 티켓 등록 버튼 -->
    <div id="productModal" class="modal">
        <span class="close">&times;</span>
        <div class="modal-content">
            <h2>상품 등록</h2>
            <div class="modal-body">
                <div class="form-group">
                    <label>티켓 선택</label>
                    <select id="ticketSelect">
                        <option value="">티켓 선택</option>
                        <option value="1" data-date="2025-05-10T18:00" data-seat="VIP, A구역, 3열" data-quantity="2">VIP 티켓</option>
                        <option value="2" data-date="2025-05-11T19:00" data-seat="일반, B구역, 5열" data-quantity="4">일반 티켓</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>관람 일시</label>
                    <input type="datetime-local" id="eventDate">
                </div>
                <div class="form-group">
                    <label>좌석 정보</label>
                    <input type="text" id="seatInfo" placeholder="좌석 단계, 구역, 열 입력">
                </div>
                <div class="form-group">
                    <label>판매 가격</label>
                    <input type="number" id="totalQuantity" placeholder="전체 수량">
                    <input type="text" id="pricePerTicket" placeholder="장당 가격">
                </div>
                <div class="form-group">
                    <label>좌석 특이사항</label>
                    <input type="checkbox" id="special1"> 시제석
                    <input type="checkbox" id="special2"> 스탠딩
                </div>
                <div class="form-group">
                    <label>상품 사진</label>
                    <input type="file" id="productImage">
                </div>
                <div class="form-group">
                    <label>거래 방식</label>
                    <select id="tradeMethod">
                        <option>배송 거래</option>
                        <option>PIN 거래</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>티켓 보유 여부</label>
                    <input type="radio" name="ticketOwnership" value="보유"> 보유
                    <input type="radio" name="ticketOwnership" value="미보유"> 미보유
                </div>
                <div class="form-group">
                    <label>거래 설명</label>
                    <textarea id="tradeDescription" maxlength="3000"></textarea>
                    <div class="char-limit">/3000자</div>
                </div>
                <div class="form-group">
                    <label>패널티 결제 방법</label>
                    <select id="penaltyPayment">
                        <option>카드 결제</option>
                        <option>계좌 이체</option>
                    </select>
                </div>
                <div class="form-group">
                    <input type="checkbox" id="agreeTerms"> 패널티 약관에 동의합니다.
                </div>
            </div>
            <button id="saveProduct">등록</button>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $(".tradingTicket").click(function() {
                $("#productModal").fadeIn(100);
            });
            function resetModal() {
                $("#productModal input, #productModal select, #productModal textarea").val("");
                $("#productModal input[type=checkbox], #productModal input[type=radio]").prop("checked", false);
            }
            $(".close").click(function() {
                $("#productModal").fadeOut(100, function() {
                    resetModal();
                });
            });
            $("#ticketSelect").change(function() {
                var selectedOption = $(this).find(":selected");
                var date = selectedOption.data("date");
                var seat = selectedOption.data("seat");
                var quantity = selectedOption.data("quantity");
                $("#eventDate").val(date);
                $("#seatInfo").val(seat);
                $("#totalQuantity").val(quantity);
            });
        });
    </script>
</body>
</html>