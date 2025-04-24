$(document).ready(function() {

	// menu
	$(".menu-item").click(function () {
        // 모든 메뉴에서 active 제거 후 현재 클릭한 메뉴에 추가
        $(".menu-item").removeClass("active");
        $(this).addClass("active");

        // 선택한 메뉴의 index 확인 (0: Ticket, 1: Live)
        var index = $(this).index();

		// 일단 모든 상품 숨기고
		$(".product-item").hide();
		
        if (index === 0) {
        	// Ticket 탭 클릭 시: Category1 + Category2 표시
            $(".product-item[data-category='Category-offline']").show();
        } else {
        	// Live 탭 클릭 시: Category3만 표시
            $(".product-item[data-category='Category-live']").show();
        }
    });
	
	
	
	
    // 페이지 로드 시 기본값 (Ticket 탭 활성화 & Ticket 리스트만 표시)
	$(".product-item").show(); // 처음에 모든 상품을 보이게 함
	$(".menu-item").first().addClass("active"); // 첫 번째 메뉴만 active 추가
	
	
	
	
	// 아이템뷰 페이지 이동 - 임시
		$(".product-item").on("click", function () {
	        let saleConcertId = $(this).data("id"); // 해당 상품의 concert_no 값 가져오기
			let category = $(this).data("category"); // 티켓 타입 가져오기
			
	//		alert("concertId: " + concertId + "\ncategory: " + category); // 확인용
			console.log("saleConcertId:", saleConcertId);
			console.log("category:", category);
	        if (saleConcertId) {
				if (category === "Category-live") {
		            window.location.href = "/ticketShop/onlineTicketView?saleConcertNo=" + saleConcertId;
		        } else {
		            window.location.href = "/ticketShop/offlineTicketView?saleConcertNo=" + saleConcertId;
		        }
	        }
	    });
    
    
});