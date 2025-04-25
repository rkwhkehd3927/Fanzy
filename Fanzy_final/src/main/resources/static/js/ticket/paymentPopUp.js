$(document).ready(function() {

	
	// ✅ 날짜 변경 시 seatPopUp 페이지로 이동(좌석은 자동 초기화)
	$('.date-select').on('change', function () {
        let scheduleNo = $(this).val();
		let saleConcertNo = $(".popup").data("id");
		
		console.log("saleConcertNo: ",saleConcertNo);
		
		// seatPopUp 페이지로 이동하면서 scheduleNo를 전달
        window.location.href = "/ticketShop/seatPopUp?saleConcertNo=" + saleConcertNo + 
						       "&scheduleNo=" + scheduleNo;
    });
	
	
	

    // 이전 단계 버튼 클릭 이벤트 처리
    $('.prevStepBtn').on('click', function() {
        alert('이전 단계로 돌아갑니다.');
		let scheduleNo = $('.date-select').val();
		let saleConcertNo = $(".popup").data("id");
		// seatPopUp 페이지로 이동하면서 scheduleNo를 전달
        window.location.href = "/ticketShop/seatPopUp?saleConcertNo=" + saleConcertNo + 
							   "&scheduleNo=" + scheduleNo;
    });
	
	// 다음 단계 버튼 클릭 이벤트 처리
    $('.nextStepBtn').on('click', function() {
        alert('다음 단계로 넘어갑니다.');
		let scheduleNo = $('.date-select').val();
		let saleConcertNo = $(".popup").data("id");
		
		let seatNos = [];
		$(".seat-price").each(function() {
			let seatNo = $(this).data("seatno"); // data-seatNo로 접근
//            seatNos.push($(this).data("seatNo")); // 각 span에서 seatNo 값을 추출하여 배열에 추가
			if (seatNo) {
	            seatNos.push(seatNo); // seatNo가 존재하면 배열에 추가
	        }
		});
		
		alert(seatNos);
		
		// 배송 방법에 따라 delivery 파라미터 값 설정 (1: 배송, 0: 현장수령)
       	let deliveryParam = $("input[name='delivery']:checked").val() === "배송" ? 1 : 0;
		
		if (seatNos.length > 0) {
            // URL 파라미터로 넘기기
            let seatNosParam = seatNos.join(','); // seatNos 배열을 ','로 연결하여 문자열로 만듬
            window.location.href = "/ticketShop/paymentPopUp2?saleConcertNo=" + saleConcertNo + 
								   "&scheduleNo=" + scheduleNo +
								   "&seatNos=" + seatNosParam +
								   "&delivery=" + deliveryParam;
        }
    });
	
	
});