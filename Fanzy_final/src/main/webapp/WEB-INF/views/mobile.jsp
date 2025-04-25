<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>모바일 QR 스캔 앱</title>
    <!-- html5-qrcode 라이브러리 (CDN) -->
    <script src="https://unpkg.com/html5-qrcode"></script>
</head>
<body>
    <h1>QR 코드 스캔</h1>
    <!-- QR 코드 스캔 영역 -->
    <div id="qr-reader" style="width:300px;"></div>
    <!-- 스캔 결과 표시 영역 -->
    <div id="qr-result"></div>
    
    <!-- OTP 입력 폼 (초기에는 숨김) -->
    <div id="otp-form" style="display:none;">
        <h2>OTP 입력</h2>
        <input type="text" id="otp-input" placeholder="OTP 입력">
        <button onclick="verifyOtp()">OTP 검증</button>
    </div>
    
    <script type="text/javascript">
	    var scanningCompleted = false; // 스캔 한 번만 처리하기 위한 플래그
	    // html5QrcodeScanner 객체를 전역 변수로 선언하여 나중에 clear() 호출 가능하도록 함.
	    var html5QrcodeScanner;
	    
        // QR 코드 스캔 성공 시 콜백 함수
        function onScanSuccess(decodedText, decodedResult) {

              if(scanningCompleted) return; // 이미 스캔 처리한 경우 무시
              scanningCompleted = true;
              
              console.log("QR 코드 스캔 성공: " + decodedText);
              document.getElementById("qr-result").innerText = decodedText;
              
              // 스캔 성공 후 스캐너 중지 (더 이상 스캔하지 않도록)
              html5QrcodeScanner.clear().then(_ => {
                  console.log("스캐너 정지됨.");
              }).catch(error => {
                  console.error("스캐너 정지 오류:", error);
              });
                   
                   // 스캔 결과(여기서는 JWT 토큰)를 OTP 전송 API로 보냄
            sendOtp(decodedText);
        }

        // 스캔 오류 발생 시 콜백 함수
        function onScanError(errorMessage) {
            console.error("QR 스캔 오류: " + errorMessage);
        }
    
        // OTP 전송 API 호출
        function sendOtp(jwtToken) {
            fetch('<%= request.getContextPath() %>/api/otp/send', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ token: jwtToken })
            })
            .then(response => response.text())
            .then(data => {
                console.log("OTP 전송 응답: " + data);
                // OTP 전송 성공 시 OTP 입력 폼 표시
                document.getElementById("otp-form").style.display = "block";
            })
            .catch(error => {
                console.error("OTP 전송 에러:", error);
            });
        }
    
        // OTP 검증 API 호출
        function verifyOtp() {
            const otp = document.getElementById("otp-input").value;
            
            const phone = "010-3082-7173";
    
            fetch('<%= request.getContextPath() %>/api/otp/verify', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ phone: phone, otp: otp })
            })
            .then(response => response.text())
            .then(data => {
                console.log("OTP 검증 응답: " + data);
                if (data.indexOf("인증 성공") >= 0) {
                    // 인증 성공 시 메인 페이지로 이동
                    window.location.href = '/';
                } else {
                    alert("OTP 인증 실패");
                }
            })
            .catch(error => {
                console.error("OTP 검증 에러:", error);
            });
        }
        
        window.onload = function() {
        	console.log("window.onload 실행됨");
            html5QrcodeScanner = new Html5QrcodeScanner("qr-reader", { fps: 10, qrbox: 250 });
            html5QrcodeScanner.render(onScanSuccess, onScanError);
        }
    </script>
</body>
</html>