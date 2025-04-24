<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<!--     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
    <title>티켓 양도 거래</title>
    <link rel="stylesheet" href="../css/ticketshop.css">
    <link rel="stylesheet" href="../css/ticketshop_modal.css">
 <!--    <script src="../js/marketplace.js"></script>-->
    
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
			<span>
			    <!-- loginChk가 1일 경우 로그아웃, 0일 경우 로그인 -->
			    <c:if test="${param.loginChk == 1}">
			        <a href="/logout">로그아웃</a>
			    </c:if>
			    <c:if test="${param.loginChk != 1}">
			        <a href="/login">로그인</a>
			    </c:if>
			</span>
            <span>고객센터</span>
        </div>
    </header>
    
    <section class="main-container">
    	<!-- 핑크배너 -->
	    <section class="banner">
	        <div class="banner-item">Fanzy Showcase &lt; Chase Our Hearts &gt;</div>
	        <div class="banner-item">2025 Fanzy Con Festival</div>
	    </section>
	    <nav class="menu">
	        <ul>
	            <li><a href="/ticketShop/ticketMain">콘서트</a></li>
	<!--             <li><a href="/ticketShop/ticketMain?tab=live">라이브</a></li> -->
	            <li><a href="/ticketShop/marketplace">티켓거래</a></li>
	        </ul>
	    </nav>
		<section class="reservation-container">
			    <!-- Sidebar (좌측) -->
			    <aside class="sidebar">
			        <h2>에스파</h2>
			        <select>
			            <option>전체상품보기</option>
			            <option>사용날짜</option>
			            <option>구매수량</option>
			            <option>검색 선택</option>
			        </select>
			        <div class="filter-group">
					    <h3>사용날짜</h3>
					    <select>
					        <option>전체</option>
					    </select>
					</div>
					<div class="filter-group">
					    <h3>구매수량</h3>
					    <select>
					        <option>1장</option>
					        <option>2장</option>
					    </select>
					</div>
		
			        <label>
				        <input type="checkbox" id="discounted" onchange="" />
				        정가이하
			        </label>
			        <div class="coupon-banner">
					    <img src="/images/coupon.png" alt="쿠폰 이벤트">
					    <p>2300원 할인 쿠폰</p>
					</div>
			    </aside>
	
			    <!-- 상품 리스트 (우측) -->
			    <section class="ticket-list">
				    <c:forEach var="tdto" items="${tlist}">
				        <div class="ticket-item" data-ticket-no="${tdto.ticketNo}">
				            <div class="ticket-info">
				                <span class="ticket-date">${tdto.ticketDate }</span>
				                <span class="ticket-seat">${tdto.ticketContent }</span>
				                <span class="ticket-price">${tdto.ticketPrice}원</span>
				            </div>
				            <button class="btn-select">선택하기</button>
				        </div>
				    </c:forEach>
			    </section>
	    
		    <section class="payment">
		    	<button class="tradingTicket">티켓 판매 등록</button>
				<div class="payment-method">
				    <h2>결제방법</h2>
				    <div class="payment-options">
				        <label><input type="radio" name="payment" value="card"> 카드결제</label>
				        <label><input type="radio" name="payment" value="kakao"> 카카오페이</label>
				        <label><input type="radio" name="payment" value="naver"> 네이버페이</label>
				    </div>
				</div>
			</section>
		</section> <!-- reservation container -->
		
		<div id="productModal" class="tradingModal">
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
<!-- 	                    <div class="checkbox-group"> -->
		                    <label><input type="checkbox" id="special1"> 시제석</label>
		                    <label><input type="checkbox" id="special2"> 스탠딩</label>
<!-- 	                    </div> -->
	                </div>
	                <div class="form-group">
	                    <label>상품 사진</label>
	                    <input type="file" id="productImage">
	                </div>
	                <div class="form-group">
	                    <label>거래 방식</label>
	                    <input type="radio" id="tradeMethod1"> 배송 거래
	                    <input type="radio" id="tradeMethod2"> e-ticket 거래
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
	                    <input type="radio" id="penaltyPayment1"> 카드 결제
                    	<input type="radio" id="penaltyPayment2"> 계좌 이체
	                </div>
	                <div class="form-group">
	                    <input type="checkbox" id="agreeTerms"> 패널티 약관에 동의합니다.
	                </div>
	            	<button id="saveProduct">등록</button>
	            </div>
	        </div> <!-- modal-content -->
	    </div> <!-- productModal -->
	    <script>
		    const ticketInfoDivs = document.querySelectorAll('.ticket-item');
	
		    ticketInfoDivs.forEach(function(ticketDiv) {
		        ticketDiv.addEventListener('click', function() {
		            // 클릭한 div에서 ticketNo를 가져오기
		            const ticketNo = ticketDiv.getAttribute('data-ticket-no');
		            
		            // 해당 티켓 상세 페이지로 이동
		            window.location.href = '/TicketshopView?tno=' + ticketNo;
		        });
		    });
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
	            
	            $("#saveProduct").click(function(){
	            	alert("판매 등록 완료");
	            });
	        });
	    </script>
	
	
 
    </section>
    
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
	</body>
	</html>