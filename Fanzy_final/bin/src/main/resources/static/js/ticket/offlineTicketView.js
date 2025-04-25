$(document).ready(function () {
    showDetails(); // 페이지 로드 시 기본적으로 상세정보 표시

    const buttons = $(".details-faq button");
    const eventImageContainer = $(".event-image-container");
    const moreButton = $(".more-button");
    const scrollToTopButton = $(".scroll-to-top");
    const buyButton = $(".buy-button");
	let saleStatus = $(".sold-out").text().trim();
	
	// 구매 오픈 날짜 전 구매하기 비활성화
	if (saleStatus === "오픈전") {
        $(".buy-button").prop("disabled", true).css({
            "background-color": "#ccc",
//            "opacity": "0.8"
        });
    }
	
    
    buttons.click(function () {
        buttons.removeClass("active"); // 모든 버튼에서 active 클래스 제거
        $(this).addClass("active"); // 클릭한 버튼에 active 클래스 추가
    });
    
	// 더보기
    moreButton.click(function () {
        eventImageContainer.css("height", "auto");
        moreButton.hide();
    });
    
	// 상단 이동
    scrollToTopButton.click(function () {
        $("html, body").animate({ scrollTop: 0 }, "smooth");
    });
    
	// 구매 하기
    buyButton.click(function (event) {
        event.preventDefault(); // 기본 동작 방지
		

		var memberId = $('#isLoggedIn').val();
		var selectedScheduleNo = $(".date-select").val(); // 선택한 scheduleNo 가져오기
		var saleConcertNo = $(".ticket-container").data("id");

        // 서버에서 로그인 여부를 확인하는 로직 (예제: hidden input 값 활용)
		// memberId가 null이거나 빈 값인지 확인
       if (!memberId || memberId.trim() === "") {
           alert("로그인 후 이용가능한 서비스입니다."); // 경고 메시지 출력
           window.location.href = "/login"; // 로그인 페이지로 이동
       } else {
		   if (!selectedScheduleNo || selectedScheduleNo.trim() === "") {
	           alert("콘서트 일정을 선택해주세요.");
	           return;
	       }
		   // 선택한 일정 정보를 seatPopUp에 넘겨서 오픈
           window.open('/ticketShop/seatPopUp?saleConcertNo=' + saleConcertNo + '&scheduleNo=' + selectedScheduleNo, 'popup', 'width=1100,height=650');
       }
    });
});

function showDetails() {
    $("#event-content").show();
    $("#notice-content").hide();
    
    $(".details-faq button").eq(0).addClass("active");
    $(".details-faq button").eq(1).removeClass("active");
}

function showNotice() {
    $("#event-content").hide();
    $("#notice-content").show();
    
    $(".details-faq button").eq(0).removeClass("active");
    $(".details-faq button").eq(1).addClass("active");
}