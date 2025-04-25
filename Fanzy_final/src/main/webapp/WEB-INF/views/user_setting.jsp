<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <title>Global Fandom Platform - Fanzy</title>
    <link rel="stylesheet" href="/css/setting.css">
    <script>
    // 1. 로그아웃
    $(document).ready(function() {
        $(".logout").click(function() {
            location.href = "/logout"; 
        });
    });
    
	 // 2. 검색창 토글
	    window.onload = () => {
			document.getElementById('searchInput').addEventListener('keyup', searchArtist);
		    
		    // 🔥 NULL 체크 추가해서 오류 방지
		    const searchBtnElement = document.getElementById('searchBtn');
		    if (searchBtnElement) {
		        searchBtnElement.addEventListener('click', searchBtn);
		    }
		};
		
		const searchArtist = () => {
		    const query = document.getElementById('searchInput').value.trim();
		    const resultsBox = document.getElementById('searchResults');
		    const searchBox = document.getElementById('searchBox');
		
		    if (query.length === 0) {
		        resultsBox.style.display = 'none';
		        resultsBox.innerHTML = '';
		        return;
		    }
		
		    fetch('/search?query=' + encodeURIComponent(query))
		        .then(response => {
		            if (!response.ok) {
		                throw new Error('검색 요청 실패');
		            }
		            return response.json();
		        })
		        .then(data => {
		            if (!data || data.length === 0) {
		                resultsBox.innerHTML = '<p style="padding: 10px;">검색 결과가 없습니다.</p>';
		                resultsBox.style.display = 'block';
		                return;
		            }
		
		            resultsBox.innerHTML = data.map(artist => 
		            '<a href="/artist?artist_no=' + artist.no + '" class="search-result-link">' + // ✅ a 태그가 div 바깥으로 감싸도록 수정
		                '<div class="search-result-item">' +
		                    '<img src="/images/' + artist.imageUrl + '" alt="' + artist.name + '" class="search-result-img">' +
		                    '<span class="search-result-name">' + artist.name + '</span>' +
		                '</div>' +
		            '</a>'
		        	).join('');

		            resultsBox.style.display = 'block';
		        })
		        .catch(error => console.error('Error fetching search results:', error));
		};
		
		
		const searchBtn = () => {
		    const searchBox = document.getElementById('searchBox');
		    const searchIcon = document.querySelector('.fa-magnifying-glass');
		    const searchInput = document.getElementById('searchInput');
		    const searchLi = document.querySelector('nav ul li a'); // a 요소 선택

		    // 검색창과 검색 아이콘을 토글
		    if (searchBox.style.display === 'none' || searchBox.style.display === '') {
		        searchBox.style.display = 'block'; // 검색창을 보이게
		        searchIcon.style.visibility = 'hidden'; // 검색 아이콘 숨기기
		        searchIcon.style.opacity = '0'; // 아이콘을 완전히 투명하게 만듦
		        searchInput.focus(); // 검색창이 보일 때 포커스를 맞추기
		        searchLi.classList.add('no-hover'); // hover 비활성화
		    }
		};
		
		
		//CSS 추가 (필요하면 HTML의 <style> 태그 안에 넣어줘)
		const style = document.createElement('style');
		style.innerHTML = `
		    .search-result-item {
		        display: flex;
		        align-items: center;
		        padding: 5px;
		        cursor: pointer;
				margin-bottom: 5px;
		    }
		    .search-result-item:hover {
		        background-color: #f0f0f0;
		    	border-radius: 5px;
		    }
		    .search-result-link::before {
		        display: none !important;
		        content: none !important;
		    }
		    .search-result-img {
		        width: 30px;
		        height: 30px;
		        border-radius: 50%;
		        margin-right: 10px;
		    }
		    .search-result-name {
		        font-size: 14px;
		    }
		`;
		document.head.appendChild(style);
		
		document.addEventListener("click", (event) => {
		    const resultsBox = document.getElementById("searchResults");
		    const searchBox = document.getElementById("searchBox");
		    const searchInput = document.getElementById("searchInput");
		    const searchBtn = document.querySelector('nav ul li a'); // 검색 버튼
		    const searchIcon = document.querySelector(".fa-magnifying-glass");
		    const searchLi = document.querySelector('nav ul li a'); // hover 효과 복구용

		    if (
		        !resultsBox.contains(event.target) && 
		        !searchBox.contains(event.target) &&
		        event.target !== searchInput &&
		        event.target !== searchBtn && 
		        !searchBtn.contains(event.target) // 검색 버튼 클릭 예외 처리
		    ) {
		        resultsBox.style.display = "none";  
		        searchBox.style.display = "none";  
		        searchIcon.style.visibility = "visible";  
		        searchIcon.style.opacity = "1";  
		        searchLi.classList.remove('no-hover'); // hover 효과 복구
		    }
		}); // 2번 끝
	
	// 3. 장바구니 클릭시
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
	}; // 3번 종료
	
	// 4. 알림창 모달 열기
			// 프로그레스바 위치 및 너비 업데이트 함수
		function updateProgressBar(targetIndex) {
		    let totalTabs = $(".modal-link").length;  // 탭의 총 개수
		    let progressWidth = (1 / totalTabs) * 100;  // 각 탭의 너비 비율

		    // 프로그레스바의 왼쪽 위치를 인덱스를 기준으로 설정
		    let progressLeft = (targetIndex / totalTabs) * 100;

		    // progress2의 위치와 너비 설정
		    $(".progress2").css({
		        "left": progressLeft + "%",  // 실선의 위치
		        "width": progressWidth + "%"  // 실선의 너비
		    });
		}

		// 알림창 모달 열기
		const openAlert = () => {
		    $("#messageModal").show();

		    // 모달이 열릴 때 기본적으로 'all' 타겟을 보여주기
		    $(".notification-content").removeClass("active").hide();  // 모든 콘텐츠 숨기기
		    $("#all").addClass("active").show();  // 'all' 콘텐츠만 보여주기

		    // 'all' 탭 글자 색상 변경 (모달이 열릴 때)
		    $(".modal-link").css("color", "");  // 모든 탭 글자 색 초기화
		    $(".modal-link[data-target='all']").css("color", "#ff9a9e");  // 'all' 탭 글자 색상 변경

		    // 초기 핑크 실선 위치 설정 (전체 탭에 맞춰)
		    updateProgressBar(0);  // 'all' 탭이 첫 번째이므로 인덱스 0으로 설정
		};

		// 모달 닫기 (배경 클릭 시)
		$(document).ready(function () {
		    // 'messageModal' 외부를 클릭 시 모달을 닫는 코드
		    $("#messageModal").click(function (e) {
		        if ($(e.target).closest(".message-content").length === 0) {  // 클래스 이름 수정
		            $("#messageModal").hide();
		        }
		    });

		    // 탭 전환
		    $(".modal-link").click(function (e) {
		        e.preventDefault();
		        let target = $(this).data("target");

		        // 모든 탭의 색을 원래 상태로 되돌리기
		        $(".modal-link").css("color", "");  // 텍스트 색 원래 상태로 복원

		        // 클릭한 탭만 색상 변경 (ff9a9e)
		        $(this).css("color", "#ff9a9e");

		        // 콘텐츠 전환
		        $(".notification-content").removeClass("active").hide();
		        $("#" + target).addClass("active").show();

		        // 해당 탭에 대한 프로그레스바 위치 업데이트
		        let targetIndex = $(this).parent().index(); // 클릭된 탭의 인덱스 (0부터 시작)

		        // 해당 탭에 맞게 핑크 실선 위치 및 너비 업데이트
		        updateProgressBar(targetIndex);  // 클릭한 탭에 맞춰 업데이트
		    });
		}); // 4번 끝

    // 7. 알림창 ul 드래그
    document.addEventListener("DOMContentLoaded", function () {
        const artistListWrapper = document.querySelector(".artist-list-wrapper");  // ul을 감싸는 부모 요소
        const artistList = document.querySelector(".artist-list");  // ul 요소
        let isMouseDown = false;  // 마우스를 눌렀는지 여부
        let startX;  // 마우스 시작 위치
        let scrollLeft;  // 시작 시의 scrollLeft 값

        // 드래그 기능 설정
        const enableDrag = () => {
            // 마우스를 클릭했을 때 (드래그 시작)
            artistListWrapper.addEventListener("mousedown", (e) => {
                if (e.target.classList.contains("modal-link")) return;  // 링크 클릭 시 드래그 방지
                isMouseDown = true;
                startX = e.pageX - artistListWrapper.offsetLeft;  // 마우스 시작 위치
                scrollLeft = artistListWrapper.scrollLeft;  // 현재 스크롤 위치
                artistListWrapper.style.cursor = "grabbing";  // 드래그 중 커서 변경
            });

            // 마우스를 이동했을 때 (드래그 중)
            artistListWrapper.addEventListener("mousemove", (e) => {
                if (!isMouseDown) return;  // 마우스가 클릭되지 않았다면 이동하지 않음
                const moveX = e.pageX - artistListWrapper.offsetLeft - startX;  // 마우스 이동 거리
                artistListWrapper.scrollLeft = scrollLeft - moveX;  // 부모의 scrollLeft를 이동
            });

            // 마우스 버튼을 뗐을 때 (드래그 끝)
            artistListWrapper.addEventListener("mouseup", () => {
                isMouseDown = false;
                artistListWrapper.style.cursor = "grab";  // 커서 원래대로
            });

            // 마우스가 요소 밖으로 나갔을 때 (드래그 끝)
            artistListWrapper.addEventListener("mouseleave", () => {
                isMouseDown = false;
            });
        };

        // 탭 전환시 드래그 이벤트가 리셋되지 않도록 함
        $(".modal-link").click(function (e) {
            e.preventDefault();
            let target = $(this).data("target");

            // 모든 탭의 색을 원래 상태로 되돌리기
            $(".modal-link").css("color", "");  // 텍스트 색 원래 상태로 복원

            // 클릭한 탭만 색상 변경 (ff9a9e)
            $(this).css("color", "#ff9a9e");

            // 콘텐츠 전환
            $(".notification-content").removeClass("active").hide();
            $("#" + target).addClass("active").show();

            // 드래그 기능 다시 활성화
            enableDrag();

            // 해당 탭에 대한 프로그레스바 위치 업데이트
            let targetIndex = $(this).parent().index(); // 클릭된 탭의 인덱스 (0부터 시작)

            // 해당 탭에 맞게 핑크 실선 위치 및 너비 업데이트
            updateProgressBar(targetIndex);  // 클릭한 탭에 맞춰 업데이트
        });

        // 페이지 로드 시 드래그 활성화
        enableDrag();
    }); // 7번 끝
</script>
</head>
<body>
    <header>
        <div id="logo">
            <a href="/"><img src="/images/index_login/logo.png" alt="Logo"></a>
        </div>
        <!-- nav_bar -->
        <nav>
            <ul>
            <c:if test="${session_id==null}">
                <li><button type="button" class="sign_in">Sign in</button></li>
            </c:if>
			<c:if test="${session_id!=null}">
                <li><a onclick="searchBtn()">
					    <i class="fa-solid fa-magnifying-glass"></i>
					    <div id="searchBox" style="display: none;">
					        <input style="position: absolute; top:-15px; right:20px;"  type="text" id="searchInput" placeholder="아티스트 검색" />
					        <div id="searchResults" style="display: none; position: absolute; top: 40px; left: -200px; background: white; border-radius: 10px; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); width: 200px; padding: 8px 15px;"></div>
					    </div>
					</a></li>
                <li><a onclick="openAlert()"><i style="font-size: 35px; position: relative; top: -5px;" class="fa-regular fa-envelope"></i></a></li>
                <li><a href="/mypage"><i class="fa-regular fa-user"></i></a></li>
                <li><a href="/user_setting"><i class="fa-solid fa-gear"></i></a></li>
                <li class="cart coin"><a href="/smain"><img src="/images/index_login/coin.png"></a></li>
                <li class="cart" style="position: relative; top:-1px;"><a onclick="cartBtn()"><i class="fa-solid fa-cart-shopping"></i></a></li>
            </c:if>
            <c:if test="${session_id==null}">
                <li class="cart coin"><a href="/smain"><img src="/images/index_login/coin.png"></a></li>
                <li class="cart" style="position: relative; top:4px;"><a onclick="cartBtn()"><i class="fa-solid fa-cart-shopping"></i></a></li>
            </c:if>
            </ul>
        </nav>
    </header>
    <!-- 배너 아래 메인 부분, 연한 회색 배경 -->
    <main class="main-container">
    <!-- 핑크배너 -->
    <section class="banner">
    </section>
        <section class="settings-container">
    <h2>설정</h2>
	<div class="setting-group">
	    <h3>서비스 언어</h3>
	    <select id="service-language">
	        <option value="ko">한국어</option>
	        <option value="en">English</option>
	    </select>
	</div>
	
	<div class="setting-group">
	    <h3>번역 언어</h3>
	    <!-- 구글 번역 위젯을 삽입할 위치 -->
	    <div id="google_translate_element"></div>
	    <select id="translate-language">
	        <option value="ko">한국어</option>
	        <option value="en">English</option>
	        <option value="zh">中文</option>
	        <option value="ja">日本語</option>
	        <option value="fr">Français</option>
	        <option value="de">Deutsch</option>
	        <option value="es">Español</option>
	        <option value="it">Italiano</option>
	        <option value="pt">Português</option>
	        <option value="ru">Русский</option>
	    </select>
	</div>
	
	
	<div class="setting-group">
	    <h3>자동 번역</h3>
	    <label class="toggle-switch">
	        <input type="checkbox" id="auto-translate">
	        <span class="slider"></span>
	    </label>
	    <p>아티스트와 팬의 일부 콘텐츠가 선택한 번역 언어로 자동 번역되어 보입니다.</p>
	</div>
	    
	    <h2>콘텐츠 설정</h2>
	    <div class="setting-group">
	        <h3>제한모드</h3>
	        <label class="toggle-switch">
	            <input type="checkbox" id="auto-filter">
	            <span class="slider"></span>
	        </label>
	        <p>15세 이상부터 관람 가능한 유료 VOD를 숨김 처리합니다.</p>
	    </div>
	    
		<h2>알림 및 서비스 설정</h2>
		<ul>
		    <li>
		        <a>이벤트 · 혜택 알림 설정</a>
		        <label class="toggle-switch">
		            <input type="checkbox" id="auto-notification">
		            <span class="slider"></span>
		        </label>
		    </li>
		    <li>
		        <a>맞춤형 광고 및 서비스 보기</a>
		    </li>
		</ul>
		</section>
	
	
	
	<script>
	
	// 브라우저의 기본 언어 가져오기
    const userLang = navigator.language || navigator.userLanguage; // ex) "ko-KR", "en-US"

    // 언어 코드만 추출 (첫 2글자)
    const langCode = userLang.substring(0, 2); 

    // select 요소 가져오기
    const languageSelect = document.getElementById("service-language");

    // 언어 설정 (ko 또는 en만 지원)
    if (langCode === "ko") {
        languageSelect.value = "ko";
    } else {
        languageSelect.value = "en";
    }
    
    window.addEventListener("load", function () {
        setTimeout(function () {
            let banner = document.querySelector(".goog-te-banner-frame");
            if (banner) {
                banner.style.display = "none";
            }
            document.body.style.top = "0px"; // 혹시 top margin이 생기면 제거
        }, 800); // 번역 적용될 시간 고려
    });
    
	// 1. 자동번역 토글 on/off
	$(document).ready(function() {
	    const autoTranslateToggle = $('#auto-translate'); // 토글 요소
	    const savedAutoTranslate = localStorage.getItem('autoTranslate'); // 저장된 값 불러오기
	
	    if (savedAutoTranslate === 'true') {
	        autoTranslateToggle.prop('checked', true);
	        setTranslateCookie(localStorage.getItem('selectedTranslateLanguage') || languageSelect.value);
	        autoTranslateToggle.closest('.toggle-switch').addClass('no-animation'); // 애니메이션 없이 적용
	    } else {
	        autoTranslateToggle.prop('checked', false);
	        deleteTranslateCookie();
	        autoTranslateToggle.closest('.toggle-switch').removeClass('no-animation');
	    }
	
	    // 토글 변경 시 동작
	    autoTranslateToggle.change(function() {
	        const isChecked = autoTranslateToggle.prop('checked');
	        localStorage.setItem('autoTranslate', isChecked.toString());
	
	        if (isChecked) {
	            setTranslateCookie(localStorage.getItem('selectedTranslateLanguage') || languageSelect.value); 
	        } else {
	            deleteTranslateCookie();
	        }
	
	        autoTranslateToggle.closest('.toggle-switch').removeClass('no-animation'); // 애니메이션 활성화
	    });
	
	    // 페이지 로드 후 일정 시간 지나면 애니메이션 다시 활성화
	    setTimeout(function() {
	        autoTranslateToggle.closest('.toggle-switch').removeClass('no-animation');
	    }, 500);
	});
	
	// ✅ 쿠키 생성 함수
	function setTranslateCookie(lang) {
	    document.cookie = "googtrans=/auto/" + lang + "; path=/; expires=Fri, 31 Dec 9999 23:59:59 GMT";
	
	    let select = document.querySelector('.goog-te-combo');
	    if (select) {
	        select.value = lang;
	        select.dispatchEvent(new Event('change')); // 번역 실행
	    }
	
	    localStorage.setItem('selectedTranslateLanguage', lang);
	}
	
	// ✅ 쿠키 삭제 함수
	function deleteTranslateCookie() {
	    document.cookie = "googtrans=; path=/; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	} // 1번 끝

    // 2. 구글 번역
    function googleTranslateElementInit() {
        new google.translate.TranslateElement({
            pageLanguage: 'ko',  // 기본 서비스 언어
            includedLanguages: 'en,ko,zh,ja,fr,de,es,it,pt,ru',  // 지원되는 번역 언어
            layout: google.translate.TranslateElement.InlineLayout.SIMPLE
        }, 'google_translate_element');
    }

    $(document).ready(function() {
        // 페이지 로드 시 저장된 언어 값을 가져와서 셀렉트 요소에 반영
        var savedLang = localStorage.getItem('selectedTranslateLanguage');
        if (savedLang) {
            $('#translate-language').val(savedLang);
        }

        // 번역 언어 변경 시
        $('#translate-language').change(function() {
            var language = $(this).val();
            setTranslateCookie(language); // 선택된 언어로 쿠키 설정
            localStorage.setItem('selectedTranslateLanguage', language); // 선택된 언어 저장
        });

        // 서비스 언어 변경 시 번역 언어도 변경
        $('#service-language').change(function() {
            var selectedLang = $(this).val();
            $('#translate-language').val(selectedLang).trigger('change'); // 번역 언어 select도 변경
            localStorage.setItem('selectedTranslateLanguage', selectedLang); // 서비스 언어 변경 시 저장
        });

        // 자동 번역 토글 기능
        const autoTranslateToggle = $('#auto-translate');
        const savedAutoTranslate = localStorage.getItem('autoTranslate');

        if (savedAutoTranslate === 'true') {
            autoTranslateToggle.prop('checked', true);
        } else {
            autoTranslateToggle.prop('checked', false);
        }

        autoTranslateToggle.change(function() {
            const isChecked = autoTranslateToggle.prop('checked');
            localStorage.setItem('autoTranslate', isChecked.toString());
        });
    });

    // 쿠키로 구글 번역 언어 설정
	function setTranslateCookie(lang) {
	    document.cookie = "googtrans=/auto/" + lang + "; path=/";
	
	    // 구글 번역 위젯을 강제로 언어 변경
	    let select = document.querySelector('.goog-te-combo');
	    if (select) {
	        select.value = lang;
	        select.dispatchEvent(new Event('change')); // 번역 실행
	    }
	
	    localStorage.setItem('selectedTranslateLanguage', lang);
	}

	function getTranslateCookie() {
	    let matches = document.cookie.match(/(^| )googtrans=([^;]+)/);
	    return matches ? decodeURIComponent(matches[2]) : null;
	}

	$(document).ready(function() {
	    let savedLang = getTranslateCookie();

	    if (savedLang) {
	        // `googtrans` 값이 있다면, 해당 언어로 번역 적용
	        let langCode = savedLang.split('/')[2]; // "/auto/ko" → "ko" 추출
	        if (langCode) {
	            localStorage.setItem('selectedTranslateLanguage', langCode);
	            let selectBox = $('#translate-language');
	            if (selectBox.length) {
	                selectBox.val(langCode).trigger('change'); // UI 업데이트
	            }
	        }
	    }
	}); // 2번 끝
	
// 3. 콘텐츠 필터 적용
document.addEventListener("DOMContentLoaded", function () {
    const toggle = document.getElementById("auto-filter");

    // 서버에서 전달된 생년월일 값 (JSP에서 EL 문법으로 전달)
    const memberBirth = "${mdto.member_birth}"; // YYYY-MM-DD 형식

    // 만 나이 계산 함수
    function calculateAge(birthDate) {
        const today = new Date();
        const birth = new Date(birthDate);
        let age = today.getFullYear() - birth.getFullYear();
        const monthDiff = today.getMonth() - birth.getMonth();
        if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birth.getDate())) {
            age--; // 생일이 안 지났으면 나이 -1
        }
        return age;
    }

    // 만 나이 계산
    const memberAge = calculateAge(memberBirth);

    // ✅ 세션 필터 쿠키 저장 함수 (15세 필터 ON)
    function setSessionFilterCookie() {
        document.cookie = "filterUnder15=true; path=/; expires=Fri, 31 Dec 9999 23:59:59 GMT";
    }

    // ✅ 세션 필터 쿠키 삭제 함수 (필터 OFF)
    function deleteSessionFilterCookie() {
        document.cookie = "filterUnder15=; path=/; expires=Thu, 01 Jan 1970 00:00:00 UTC";
    }

    // ✅ 쿠키 값 가져오는 함수
    function getSessionFilterCookie() {
        const cookies = document.cookie.split("; ");
        for (let cookie of cookies) {
            let [name, value] = cookie.split("=");
            if (name === "filterUnder15") {
                return value;
            }
        }
        return null;
    }

    // 15세 미만이면 강제 ON + 비활성화
    if (memberAge < 15) {
        toggle.checked = true;
        toggle.disabled = true;
        setSessionFilterCookie(); // 필터 ON 저장
    } else {
        // ✅ 쿠키 값 불러와서 토글 설정
        const filterCookie = getSessionFilterCookie();
        toggle.checked = (filterCookie === "true");

        // ✅ 토글 변경 이벤트
        toggle.addEventListener("change", function () {
            if (toggle.checked) {
                localStorage.setItem("autoFilter", "on");
                setSessionFilterCookie(); // 필터 ON 저장
            } else {
                localStorage.setItem("autoFilter", "off");
                deleteSessionFilterCookie(); // 필터 OFF (쿠키 삭제)
            }
        });
    }
}); // 3번 끝
 
	// 4. 알림 기능 적용
document.addEventListener("DOMContentLoaded", function () {
    const toggle = document.getElementById("auto-notification");

    // 기존 세션 값 가져오기
    fetch("/getNotificationSession")
        .then(response => response.text())
        .then(data => {
            if (data === "true") {
                toggle.checked = true;
            } else {
                toggle.checked = false;
            }
        });

    // 토글 변경 시 세션 저장
    toggle.addEventListener("change", function () {
        if (toggle.checked) {
            localStorage.setItem("autoNotification", "on");
            fetch("/updateNotificationSession", { 
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: "status=true"
            });
        } else {
            localStorage.setItem("autoNotification", "off");
            fetch("/clearNotificationSession", { method: "POST" });
        }
    });
});


 // 4번 끝
	</script>
	<script type="text/javascript" src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
	
    	<!-- 추천 아티스트 -->
        <c:if test="${session_id!=null}">
        <a><div class="fixed-heart">
		    <img src="/images/index_login/heart.png" alt="Heart" />
		</div></a>
		</c:if>
	
		<!-- 알림 모달창 -->
			<div id="messageModal" class="modal" style="display: none;">
			    <div class="message-content">
			        <div class="message-header">
			            <span class="modal-title">알림</span>
			        </div>
			        <div class="message-body">
		                <div class="artist-list-wrapper">
		                    <ul class="artist-list">
		                        <li><a href="#" class="modal-link" data-target="all">전체</a></li>
		                    		<c:forEach var="n" items="${nlist}">
		                        		<li><a class="modal-link" data-target="${n.artistDto.artist_group_name}">${n.artistDto.artist_group_name}</a></li>
		                        	</c:forEach>
		                        <li><a href="#" class="modal-link" data-target="shop">Shop</a></li>
		                    </ul>
		                </div>
						<!-- 진행 상태 표시 (회색 실선과 핑크 실선) -->
			            <div class="progress-bar2">
			                <div class="progress2"></div>
			            </div>
			            <!-- 각 탭에 대한 알림 내용 -->
			            <div class="notification-content" id="all">
			                전체 알림 내용...
			            </div>
			            <c:forEach var="n" items="${nlist}">
				            <div class="notification-content" id=${n.artistDto.artist_group_name} style="display: none;">
				                ${n.artistDto.artist_group_name} 알림 내용...
				            </div>
			            </c:forEach>
			            <div class="notification-content" id="shop" style="display: none;">
			                Shop 알림 내용...
			            </div>
			        </div>
			    </div>
			</div>
	</main>
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
		    <p>© <strong>FANZY COMPANY Inc.</strong> Ver 2.32.6</p>
		</div>	
	    </footer>
</body>
</html>
