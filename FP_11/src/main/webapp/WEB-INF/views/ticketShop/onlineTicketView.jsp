<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온라인 티켓 예매</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"/>
    <link rel="stylesheet" href="../css/ticket/offlineTicketView.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <script src="../js/ticket/onlineTicketView.js"></script>
    <script>
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
    <section>
        <div class="ticket-container" data-id="${saleConcertDto.saleConcertNo}">
            <div class="ticket-image">
                <img src="/images/ticket/${saleConcertDto.saleConcertImage}" alt="Product Image">
            </div>
            <div class="ticket-info">
                <span class="sold-out">
					<c:choose>
				        <c:when test="${saleConcertDto.saleStartDate <= today}">
				            판매중
				        </c:when>
				        <c:otherwise>
				            오픈전
				        </c:otherwise>
				    </c:choose>
				</span>
                <h1>[LIVE] ${concertDto.concertName}</h1>
                <p class="artist">${concertDto.artistDto.artist_group_name}</p>
                <select class="date-select">
                    <option value="">스트리밍권 타입 선택</option>
                    <option value="${saleConcertDto.saleConcertNo}">${saleConcertDto.saleConcertDesc}</option>
                </select>
    			<input type="hidden" id="isLoggedIn" value="${memberId}">
                <button class="buy-button">구매하기</button>
            </div>
        </div>
        <div class="details-faq">
            <button class="active" onclick="showDetails()">상세정보</button>
            <button onclick="showNotice()">유의사항</button>
        </div>
        <hr/>
        
        
		<div id="event-content">
			<div class="event-image-container">
	            <img src="/images/ticket/${saleConcertDto.saleConcertDescImage}" alt="Event Details">
	        </div>
	        <button class="more-button">더보기 ▼</button>
        </div>
        
        <div id="notice-content" style="display: none;">
            <div class="notice-container">
                <h2>유의사항</h2>
                <p>콘서트 관련 유의사항이 여기에 표시됩니다.</p>
                <ul>
                    <li>입장은 공연 시작 30분 전부터 가능합니다.</li>
                    <li>티켓은 양도 및 재판매가 금지됩니다.</li>
                    <li>공연장 내 음식물 반입이 금지됩니다.</li>
                    <li>공연 중 사진 및 동영상 촬영이 제한될 수 있습니다.</li>
                </ul>
            </div>
        </div>
        
        
        <div class="scroll-to-top">
        	<i class="fa-solid fa-arrow-up fa-2x"></i>
        </div>
    </section>
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