$(document).ready(function() {
	

    // 이전 단계 버튼 클릭 이벤트 처리
	$('.prevStepBtn').on('click', function() {
		alert('이전 단계로 돌아갑니다.');
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
		// seatPopUp 페이지로 이동하면서 scheduleNo를 전달
        window.location.href = "/ticketShop/paymentPopUp?saleConcertNo=" + saleConcertNo + 
							   "&scheduleNo=" + scheduleNo +
							   "&seatNos=" + seatNos;
    });

	// 결제 버튼 클릭 이벤트 처리
    $('.pay-btn').on('click', function() {
//        alert('결제 단계로 넘어갑니다.');
//		window.location.href = '/';

		var paymentMethod = $(".choosePayment").val();
		if (paymentMethod != "kakao") {
		                alert("결제수단을 선택해주세요.");
						return;
					}
		

		if(confirm("상품을 구매하시겠습니까?")){
		  let saleConcertNo = $(".popup").data("id");  // saleConcertNo
          let scheduleNo = $('.date-select').val();    // scheduleNo

		  let concertName = "${concertDto.concertName}";// JSP에서 concertDto의 concertName 가져오기
		  let totalPrice = $(".finalPrice").text().replace('₩','').trim(); // 최종 금액			  
		  let memberId = "${sessionScope.session_id}";  // 세션에서 사용자 ID 가져오기
		 let memberNickname = "${sessionScope.session_nickname}";  // 세션에서 사용자 닉네임 가져오기

		  
		  $.ajax({
                 url: '/ticketShop/createOnlineTicket',  // 티켓 생성 API
                 type: 'POST',
                 data: {
                     saleConcertNo: saleConcertNo,  // 공연 ID
                     scheduleNo: scheduleNo,  // 일정 ID
                     concertPrice: totalPrice  // 결제 금액
                 },
                 success: function(response) {
                     alert("티켓이 생성되었습니다!");
					 
					 console.log("response: ",response);
					 
					 let buyData = {
		 	              name: concertName,    // 카카오페이에 보낼 대표 상품명
		 	              totalPrice: totalPrice, // 총 결제금액
		 				  memberId: memberId,
		 				  saleConcertNo: saleConcertNo, // 공연 ID
		                  scheduleNo: scheduleNo  // 일정 ID
		 	         };
					 
					 $.ajax({
					     url: '/pay/orderPay',
					     type: 'POST',
					     data: buyData,
					     dataType: 'json',
					     success: function(data) {
					   	  alert("성공");
					         console.log(data);
					         console.log(data.next_redirect_pc_url);
							 location.href = data.next_redirect_pc_url;

			             }, // success
			             error:function(){
			           	  alert("실패");
			             } // error
			 		  
			         }); // buy ajax
                 },
                 error: function(xhr) {
                     alert("티켓 생성 실패");
					 console.error("좌석 정보를 불러오는 데 실패!", xhr.responseText);
	 		         console.error("상태 코드:", xhr.status);
	 		         console.error("오류 메시지:", error);
					 
                 } // error
         	}); // ticket_ajax
			  
					  
		  } // if 

		  
		  if(confirm("상품을 구매하시겠습니까?")){
		  	          let buyData = {
		  	              name: '공연티켓',    // 카카오페이에 보낼 대표 상품명
		  	              totalPrice: 150000 // 총 결제금액
		  	          };
		  	        
		  	          $.ajax({
		  	              url: '/pay/orderPay',
		  	              type: 'POST',
		  	              data: buyData,
		  	              dataType: 'json',
		  	              success: function(data) {
		  	            	  alert("성공");
		  	                  console.log(data);
		  	                  console.log(data.next_redirect_pc_url);
		  	            	  location.href = data.next_redirect_pc_url;
		  	              },
		  	              error:function(){
		  	            	  alert("실패");
		  	              }
		  	          });
		  		  } // if


    });
	
	
});