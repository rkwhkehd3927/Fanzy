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


// 5. 회원탈퇴 클릭 시
function deactivateAccount() {
    location.href = "/deactivate";  // 탈퇴 페이지로 이동
} // 5번 종료


// 6. 사이드 바 클릭 시
$(document).ready(() => {
    
    $(".reward-points").click(() => {
        const headerHeight = 300;  
        $('html, body').animate({
            scrollTop: $(".subscribe").offset().top - headerHeight  // .couponHere 위치에서 헤더 높이만큼 빼기
        }, 500);  // 500ms 동안 부드럽게 스크롤
    });
    
    $(".order").click(() => {
        const headerHeight = 300;  
        $('html, body').animate({
            scrollTop: $(".order-history").offset().top - headerHeight  // .couponHere 위치에서 헤더 높이만큼 빼기
        }, 500);  // 500ms 동안 부드럽게 스크롤
    });
    
    $(".return").click(() => {
        const headerHeight = 300;  
        $('html, body').animate({
            scrollTop: $(".return-exchange").offset().top - headerHeight  // .couponHere 위치에서 헤더 높이만큼 빼기
        }, 500);  // 500ms 동안 부드럽게 스크롤
    });
    
    $(".review").click(() => {
        const headerHeight = 300;  
        $('html, body').animate({
            scrollTop: $(".my-reviews").offset().top - headerHeight  // .couponHere 위치에서 헤더 높이만큼 빼기
        }, 500);  // 500ms 동안 부드럽게 스크롤
    });
    
    $(".viewed").click(() => {
        const headerHeight = 300;  
        $('html, body').animate({
            scrollTop: $(".recently-viewed").offset().top - headerHeight  // .couponHere 위치에서 헤더 높이만큼 빼기
        }, 500);  // 500ms 동안 부드럽게 스크롤
    });
}); // 6번 끝


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
    
