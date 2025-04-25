<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>데스크탑 OTP 인증 대기 페이지</title>
    <!-- SockJS와 StompJS 라이브러리 CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
</head>
<body>
    <h1>인증 대기 중...</h1>
    <p>모바일에서 OTP 인증(결제 등)이 완료되면, 이 페이지가 자동으로 전환됩니다.</p>
    
    <button onclick="showQRCode()">QR 생성</button>
	        <!-- QR 코드 이미지를 보여줄 영역 (초기엔 숨김) -->
	    <div id="qrCodeContainer" style="margin-top:20px; display:none;">
	        <img id="qrCodeImg" src="" alt="QR Code"/>
	    </div>
	</div>
	    
    <script type="text/javascript">
    
		function showQRCode() {
		    // 예시: orderId가 1인 주문의 QR 코드 생성 엔드포인트 호출
		    var orderId = 1; // 실제 주문 ID로 변경 필요
		    var imgElement = document.getElementById("qrCodeImg");
		    imgElement.src = "/api/qr/generate/" + orderId;
		    
		    // QR 코드 이미지 컨테이너 표시
		    document.getElementById("qrCodeContainer").style.display = "block";
		}
    
        var stompClient = null;
        // 데스크탑 사용자의 고유 식별자(예: member_nickname)를 가져옵니다.
        // 실제로는 로그인 세션 등에서 해당 정보를 얻어야 합니다.
        var memberNickname = "admin"; // 예시 값

        function connectWebSocket() {
            // JSP에서 컨텍스트 경로를 동적으로 가져옵니다.
            var socket = new SockJS('/ws');
            stompClient = Stomp.over(socket);
            stompClient.connect({}, function(frame) {
                console.log('WebSocket 연결됨: ' + frame);
                // 모바일 인증 성공 메시지를 수신할 구독 설정
                stompClient.subscribe("/topic/otp-success/" + memberNickname, function(messageOutput) {
                    console.log("WebSocket 메시지 수신: " + messageOutput.body);
                    if(messageOutput.body === "결제 성공") {
                        window.location.href = '/chatting';
                    }
                });
            }, function(error) {
                console.error("WebSocket 연결 오류: " + error);
            });
        }

        // 페이지 로드 시 WebSocket 연결 실행
        window.onload = connectWebSocket;
    </script>
</body>
</html>