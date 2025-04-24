<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <title>Global Fandom Platform - Fanzy</title>
    <link rel="stylesheet" href="/css/user-status.css">
	<script>
	    $(document).ready(function() {
	        $("form").submit(function(event) {
	            let userInput = $("#confirmationText").val().trim(); // 입력값 가져오기
	            let correctText = "Fanzy 탈퇴"; // 정답 텍스트
	            
	            if (userInput !== correctText) {
	                event.preventDefault(); // 폼 제출 방지
	                alert("문구를 정확히 입력해주세요."); // 알림 띄우기
	                $("#confirmationText").focus(); // input에 포커스 맞추기
	            }
	        });
	    });
	    
	 // 6. 번역
	    function googleTranslateElementInit() {
	        new google.translate.TranslateElement({
	            pageLanguage: 'ko',
	            includedLanguages: 'en,ko,zh,ja,fr,de,es,it,pt,ru',
	            layout: google.translate.TranslateElement.InlineLayout.SIMPLE
	        }, 'google_translate_element');
	    }

	    // 쿠키에서 번역 언어 가져오는 함수
	    function getTranslateCookie() {
	        let matches = document.cookie.match(/(^| )googtrans=([^;]+)/);
	        return matches ? decodeURIComponent(matches[2]) : null;
	    }

	    // 저장된 번역 언어 강제 적용
	    function applySavedTranslation() {
	        let savedLang = getTranslateCookie();
	        if (!savedLang) return;

	        let langCode = savedLang.split('/')[2]; // "/auto/ko" → "ko"

	        let checkExist = setInterval(function () {
	            let selectBox = document.querySelector('.goog-te-combo');
	            if (selectBox) {
	                clearInterval(checkExist);
	                selectBox.value = langCode;
	                selectBox.dispatchEvent(new Event('change')); // 번역 실행
	                console.log("번역 적용됨:", langCode);
	            }
	        }, 500);
	    }

	    // 페이지 로드 시 번역 유지
	    window.addEventListener("load", function () {
	        googleTranslateElementInit(); // 구글 번역 위젯 초기화
	        setTimeout(function () {
	            let banner = document.querySelector(".goog-te-banner-frame");
	            if (banner) {
	                banner.style.display = "none";
	            }
	            document.body.style.top = "0px"; // 혹시 top margin이 생기면 제거
	        }, 800); // 번역 적용될 시간 고려
	    }); // 6번 끝
	</script>
</head>
<body>
    <div class="login-container">
    	<div id="logo">
        	<a href="/"><img src="/images/index_login/logoPink.png" alt="Logo"></a>
        </div>
        <div class="withdrawal-content">
            <h3>Fanzy 탈퇴</h3>
                <div class="withdrawal-warning">
                    <p><strong>유의사항:</strong></p>
                    <ul>
                        <li>계정 정보 복구는 불가능하며, 동일 계정으로는 90일 후에 재가입할 수 있습니다.</li>
                        <li>탈퇴 후에도 작성한 포스트와 댓글은 삭제되지 않으며, 'Unknown'으로 표시됩니다.</li>
                        <li>구매한 디지털 상품 및 멤버십 혜택을 더 이상 이용할 수 없습니다.</li>
                        <li>정기 구독 상품(예: Jelly 자동 충전 상품)은 직접 해지해야 합니다.</li>
                        <li>보유하고 있는 위버스 캐시는 탈퇴 시 모두 소멸됩니다.</li>
                    </ul>
                </div>
            <form action="/deactivate" method="post">
		    	<p class="warning">유의 사항을 충분히 숙지하고 동의하신다면, <br>아래 문구를 직접 입력해주세요.</p>
		    	<div class="confirmation"><strong>Fanzy 탈퇴</strong></div>
		    	<input type="text" id="confirmationText" name="confirmationText" placeholder="위의 메시지를 똑같이 입력해주세요.">
		    	<input type="hidden" name="id" value="${session_nickname}">
		
			    <div class="withdrawal-actions">
				    <button type="submit" class="withdraw-btn">Fanzy 탈퇴</button>
				    <a href="/mypage">이전으로</a>
			    </div>
			</form>
        </div>
        <div id="google_translate_element"></div>
</body>
</html>
