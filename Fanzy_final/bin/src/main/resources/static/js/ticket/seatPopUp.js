$(document).ready(function() {
	
	
	let selectedScheduleNo = $('.date-select').val();  // 처음 선택된 일정
	
	// ✅ 처음 선택된 일정의 좌석 정보 불러오기
	// scheduleNo 값이 숫자가 아니면 실행 안함
    if (selectedScheduleNo && !isNaN(selectedScheduleNo)) {
        loadSeats(selectedScheduleNo);
    }

	// VIP:A~B, S:C~E, R:F~I, A:A~E
	const seatData = [
        { floor: "1층", sections: ["vip", "s", "r"], rowCounts: [2, 3, 4], cols: 18 },
        { floor: "2층", sections: ["a"], rowCounts: [5], cols: 20 }
    ];
	
	
	// 좌석 동적 생성 - 완료(수정전)
	seatData.forEach(({ floor, sections, rowCounts, cols }) => {
        const floorDiv = $(`<div class='floor'>${floor}</div>`);
        const seatContainer = $("<div class='seat-container'></div>");
		const tempPrice = 0;
		
		let rowIndex = 0; // 층별 행 인덱스 (A, B, C, D... 초기화됨)
		
		sections.forEach((section, sectionIndex) => {
	        for (let i = 0; i < rowCounts[sectionIndex]; i++) {
	            const row = $("<div class='row'></div>");
				const rowLetter = String.fromCharCode(65 + rowIndex); // A, B, C, D...
				
	            for (let j = 0; j < cols; j++) {
//	                const seatNumber = `${String.fromCharCode(65 + sectionIndex)}${i * cols + (j + 1)}`;
	                const seatNumber = `${rowLetter}${j + 1}`; // A1, A2, ..., B1, B2, ...
	                const seat = $(`<div class='seat' data-no='${i+1}' data-seat='${seatNumber}' data-floor='${floor}' data-section='${section}' data-price='${tempPrice}'></div>`);
	                row.append(seat);
	            }
	            seatContainer.append(row);
				rowIndex++; // 다음 행으로 넘어가면 알파벳 증가!
	        }
	    });
        $("#seatMap").append(floorDiv, seatContainer);
    });
	
	    
	// ✅ 날짜 변경시 URL 파라미터 업데이트 함수 (새로고침 없이)
    function updateURLParameter(param, value) {
        let currentURL = new URL(window.location.href);
        currentURL.searchParams.set(param, value);
        window.history.replaceState({}, "", currentURL);
    }
	
	

	// ✅ 날짜 변경 시 API 호출하여 좌석 정보 업데이트
	$('.date-select').on('change', function () {
        let scheduleNo = $(this).val();
//        if (!scheduleNo) return;
		// scheduleNo 값이 정상인지 체크
	    if (!scheduleNo || scheduleNo === "undefined" || isNaN(scheduleNo)) {
	        console.error("선택한 일정 값이 올바르지 않습니다!", scheduleNo);
	        return;
	    }

		
		// ✅ URL 업데이트 (scheduleNo 변경)
        updateURLParameter("scheduleNo", scheduleNo);
		
		// ✅ 좌석 정보 다시 불러오기
        loadSeats(scheduleNo);
    });
	
	

	// ✅ 서버에서 좌석 정보 불러오는 함수
	function loadSeats(scheduleNo) {
		console.log("loadSeats 호출됨! scheduleNo:", scheduleNo); // ✅ 로그 추가
        $.ajax({
            url: '/ticketShop/seatPopUp/seatData',
            type: 'POST',
            data: { scheduleNo: scheduleNo },
            success: function (response) {
				console.log("✅ 서버 응답 성공! 데이터:", response); // ✅ 응답 로그 추가
				updateSeatSelection(response);
				updateSeatsInfo();
				
//				let seat_all = seats.seat_row+seats.seat_col;
//				console.log("좌석위치 : ",seat_all);
//				console.log("좌석등급 : ",seats.seat_level);
				
            },
            error: function (xhr) {
				console.error("좌석 정보를 불러오는 데 실패!", xhr.responseText);
		        console.error("상태 코드:", xhr.status);
		        console.error("오류 메시지:", error);
                alert('좌석 정보를 불러오는 데 실패했습니다.');
            }
        });
    }
	

	// ✅ 좌석 데이터 업데이트 함수 (예약된 좌석 표시)
	function updateSeatSelection(response) {
	    $('.seat').removeClass('selected reserved available'); // 날짜 변경시, 모든 좌석 초기화
		
		$('.seat').each(function () {
	        let seatElement = $(this);
	        let seatDataAttr = seatElement.attr("data-seat"); // 현재 HTML에 있는 좌석 ID (예: 'A1')
			let floorDataAttr = seatElement.attr("data-floor"); // 현재 HTML의 층수 (예: '1층')
			
	        // 응답 데이터에서 현재 좌석에 해당하는 데이터 찾기
	        let seat = response.find(s => `${s.seatRow}${s.seatCol}` === seatDataAttr && s.seatFloor === floorDataAttr);
	
	        if (seat) {  
	            // ✅ 좌석이 DB에 존재하는 경우, 데이터 적용
	            seatElement.attr("data-no", seat.seatNo);
	            seatElement.attr("data-floor", seat.seatFloor);
				seatElement.attr("data-seat", `${seat.seatRow}${seat.seatCol}`);
	            seatElement.attr("data-price", seat.seatPrice);
	            seatElement.attr("data-section", seat.seatLevel.toLowerCase()); // 소문자
	
	            // ✅ 예약 여부에 따라 클래스 추가
	            if (seat.isReserved) {
	                seatElement.addClass("reserved"); // 예약된 좌석
	            } else {
	                seatElement.addClass("available"); // 예약 가능 좌석
	            }
	        } 
	        // ✅ DB에 없는 좌석은 아무 변화 없이 둠 (기존 상태 유지)
	    });
		
	} // updateSeatSelection

	
	
	// 좌석 클릭 이벤트 (동적 요소 적용)
    $(document).on("click", ".seat", function() {
		if ($(this).hasClass('reserved')) return;  // 예약된 좌석 선택 불가
		
		
		const section = $(this).data('section');
        $(this).toggleClass(`selected ${section}`);
		
		if (!$(this).hasClass('selected')) {
            $(this).removeClass('vip r s a');
        }
		updateSeatsInfo();
    });

	
	// 좌석 선택 및 남은 좌석 수량, 가격 업데이트 함수 - (90%) 예약된 좌석도 빼야함
    function updateSeatsInfo() {
        const selectedSeats = $('.seat.selected').map(function() {
		 	const floor = $(this).attr('data-floor');
			const seat = $(this).attr('data-seat');
            return `${floor} ${seat}`;
        }).get();
        
        $('#selected-seats').text(selectedSeats.length > 0 ? selectedSeats.join(', ') : '없음');
        $('#count').text(selectedSeats.length);
//        $('#total').text(selectedSeats.length * 132000 + '원'); // 가격 부분 추후 수정
		
		// ✅ 선택된 좌석 가격 합산
	    let totalPrice = 0;
	    $('.seat.selected').each(function() {
	        totalPrice += parseInt($(this).attr('data-price'), 10) || 0; // `data-price` 값 가져와서 더하기
	    });
	    $('#total').text(totalPrice.toLocaleString() + '원'); // 3자리마다 콤마 추가하여 표시

		
		// ✅ 남은 좌석 수 계산
		const remainingSeats = {
	        vip: 0,
	        r: 0,
	        s: 0,
	        a: 0
	    };
		
		seatData.forEach(({ sections, rowCounts, cols }) => {
	        sections.forEach((section, sectionIndex) => {
	            remainingSeats[section] += rowCounts[sectionIndex] * cols;
	        });
	    });
		
		$('.seat.selected, .seat.reserved').each(function() {
	        const section = $(this).data('section');
	        remainingSeats[section]--; // 좌석 1 감소 (선택된 좌석 + 예약된 좌석 제외)
	    });
		
		$('#remaining-vip').text(`VIP: 잔여 ${remainingSeats.vip}석`);
	    $('#remaining-r').text(`R: 잔여 ${remainingSeats.r}석`);
	    $('#remaining-s').text(`S: 잔여 ${remainingSeats.s}석`);
	    $('#remaining-a').text(`A: 잔여 ${remainingSeats.a}석`);
    }
	
	
	
	
	
	// 좌석 초기화 버튼 클릭 이벤트 처리 - 완료
    $('#resetSelection').on('click', function() {
        $('.seat.selected').removeClass('selected vip r s a'); // 모든 선택된 좌석 해제
        updateSeatsInfo(); // 좌석 정보 업데이트
    });
	
	

    // 다음 단계 버튼 클릭 이벤트 처리 
    $('.nextStepBtn').on('click', function() {
		let selectedScheduleNo = $('.date-select').val();
		let saleConcertNo = $(".popup").data("id");
		let selectedSeats = $(".seat.selected").map(function() {
			return $(this).data("no"); // 좌석 고유번호만 전송
//			return {
//	           seatNo: $(this).data("no"),
//	           seatLevel: $(this).data("section"),
//	           seatFloor: $(this).data("floor"),
//			   seatRow: $(this).data("seat").charAt(0), // A, B, C와 같은 좌석 행
//	           seatCol: $(this).data("seat").slice(1), // 1, 2, 3과 같은 좌석 열
//	           seatPrice: $(this).data("price")
//	       };  // SeatDto 형식으로 객체 생성
	    }).get();
		
		console.log("선택한 좌석들: ", selectedSeats);

	    if (selectedSeats.length === 0) {
	        alert("좌석을 선택하세요!");
	        return;
	    }
		
		
		if (selectedSeats.length > 2) {
            alert("좌석은 최대 2개까지만 선택 가능합니다!");
            return;
        }
		
		alert('다음 단계로 넘어갑니다.');
		let seatNos = selectedSeats.join(",");
	 	window.location.href = "/ticketShop/paymentPopUp?saleConcertNo=" + saleConcertNo + 
						        "&scheduleNo=" + selectedScheduleNo +
								"&seatNos=" + seatNos;
		
    });
	
	
	// 초기 좌석 정보 업데이트
	updateSeatsInfo();
});