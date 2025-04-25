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
	    if("${param.chkLogin}"=="1"){
			alert("로그인이 되었습니다.");
			location.href="/";
		}else if("${param.chkLogin}"=="0"){
			var result = confirm("계정이 없습니다. 새로 가입하겠습니까?");
		    if (result) {
		        location.href = "/memberTerms";  // 회원가입 페이지로 이동
		    }
		}else if("${param.chkLogin}"=="2"){
			alert("아이디 또는 비밀번호가 일치하지 않습니다.");
		}
	   
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
	    
	    const signUp = () => {
	        location.href = "/memberTerms";
	    };
	</script>
</head>
<body>
    <div class="login-container">
    	<div id="logo">
        	<a href="/"><img src="/images/index_login/logoPink.png" alt="Logo"></a>
        </div>
        <form action="/login" method="POST" name="loginFrm" class="loginFrm">
            <label for="id">ID</label>
            <input type="id" id="id" name="id" required><br>
            
            <label for="password">Password</label>
            <input type="password" id="password" name="pw" required><br>
            
            <button type="submit" class="loginBtn">로그인</button>
            <div class="forgot-container">
			    <p class="forgot-password"><a href="/findPw">비밀번호를 잊어버리셨나요?</a></p>
			    <button type="button" class="signup-btn" onclick="signUp()">회원가입</button>
			</div>

        </form>
        <div class="social-login">
            <button class="social-btn kakao"></button>
            <button class="social-btn google"></button>
            <button class="social-btn x"></button>
        </div>
    </div>
    <div id="google_translate_element"></div>
</body>
</html>
