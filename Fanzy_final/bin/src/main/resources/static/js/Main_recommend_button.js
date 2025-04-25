// ✅ 추천 모달 열기
/*function openRecommendationModal() {
    const modal = document.getElementById('recommendationModal');
    if (!modal) {
        console.error("❌ recommendationModal을 찾을 수 없습니다!");
        return;
    }

    console.log("✅ 추천 모달 열기 실행됨!");
    modal.style.display = 'block';

    setTimeout(() => {
        modal.classList.add("show"); // 애니메이션 실행
        modal.classList.remove("closing"); // 혹시 남아있을 수도 있는 닫기 클래스 제거
    }, 10);
}

// ✅ 추천 모달 닫기
function closeRecommendationModal() {
    const modal = document.getElementById('recommendationModal');
    if (!modal) {
        console.error("❌ recommendationModal을 찾을 수 없습니다!");
        return;
    }

    console.log("✅ 추천 모달 닫기 실행됨!");
    
    modal.classList.remove("show"); // 열리는 상태 제거
    modal.classList.add("closing"); // 닫기 애니메이션 실행

    // ✅ 애니메이션이 끝난 후 display: none 적용
    setTimeout(function () {
        modal.style.display = 'none';
        modal.classList.remove("closing"); // 닫기 애니메이션 끝나면 초기화
    }, 400); // 애니메이션 시간(0.4초) 후 실행
}

// ✅ 닫기 버튼 클릭 이벤트 추가
document.addEventListener('DOMContentLoaded', function () {
    const closeButton = document.querySelector('#recommend-close-btn');
    if (!closeButton) {
        console.error("❌ 닫기 버튼 (#recommend-close-btn) 찾을 수 없음!");
        return;
    }

    // 닫기 버튼 클릭 이벤트
    closeButton.addEventListener("click", closeRecommendationModal);
});*/
// ✅ 추천 아티스트 목록을 모달에 추가 후 모달 열기


// ✅ 추천 모달 열기
function openRecommendationModal() {
    const modal = document.getElementById('recommendationModal');
    if (!modal) {
        console.error("❌ recommendationModal을 찾을 수 없습니다!");
        return;
    }

    console.log("✅ 추천 모달 열기 실행됨!");
    modal.style.display = 'block';

    setTimeout(() => {
        modal.classList.add("show"); // 애니메이션 실행
        modal.classList.remove("closing"); // 혹시 남아있을 수도 있는 닫기 클래스 제거
    }, 10);
}

// ✅ 추천 모달 닫기
function closeRecommendationModal() {
    const modal = document.getElementById('recommendationModal');
    if (!modal) {
        console.error("❌ recommendationModal을 찾을 수 없습니다!");
        return;
    }

    console.log("✅ 추천 모달 닫기 실행됨!");
    
    modal.classList.remove("show"); // 열리는 상태 제거
    modal.classList.add("closing"); // 닫기 애니메이션 실행

    // ✅ 애니메이션이 끝난 후 display: none 적용
    setTimeout(function () {
        modal.style.display = 'none';
        modal.classList.remove("closing"); // 닫기 애니메이션 끝나면 초기화
    }, 400); // 애니메이션 시간(0.4초) 후 실행
}

// ✅ 닫기 버튼 클릭 이벤트 추가
document.addEventListener('DOMContentLoaded', function () {
    const closeButton = document.querySelector('#recommend-close-btn');
    if (!closeButton) {
        console.error("❌ 닫기 버튼 (#recommend-close-btn) 찾을 수 없음!");
        return;
    }

    // 닫기 버튼 클릭 이벤트
    closeButton.addEventListener("click", closeRecommendationModal);
});
document.querySelector('.modal-recommend-content').addEventListener('wheel', function(event) {
    if (event.deltaY !== 0) {
        // 모달 내에서만 스크롤이 발생하도록 설정
        this.scrollTop += event.deltaY;
        event.preventDefault();  // 페이지 스크롤 방지
    }
});

