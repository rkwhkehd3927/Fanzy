package com.java.controller;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.catalina.manager.util.SessionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.dto.AddressDto;
import com.java.dto.ApproveResponseDto;
import com.java.dto.ArtistDto;
import com.java.dto.CartDto;
import com.java.dto.ConcertDto;
import com.java.dto.ConcertScheduleDto;
import com.java.dto.MemberDto;
import com.java.dto.OrderItemDto;
import com.java.dto.ReadyResponseDto;
import com.java.dto.SaleConcertDto;
import com.java.dto.SeatDto;
import com.java.dto.TicketDto;
import com.java.service.AddressService;
import com.java.service.CartService;
import com.java.service.ConcertService;
//import com.java.service.KakaopayService;
import com.java.service.MService;
import com.java.service.SaleConcertService;
import com.java.service.SeatService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller

//@RestController
//@RequestMapping("/seat")
public class SeatController {
	
	
	@Autowired HttpSession session;
	@Autowired
	private SeatService seatService;
	@Autowired MService memberService;
	@Autowired ConcertService concertService;
	@Autowired CartService cartservice;
	@Autowired AddressService addressService;
	@Autowired SaleConcertService saleConcertService;
//	@Autowired KakaopayService kakaopayService;
	
	
	// 좌석 팝업 오픈 (선택한 일정의 좌석만 조회)
	@GetMapping("/ticketShop/seatPopUp")
	public String seatPopUp(
			@RequestParam("scheduleNo") Integer scheduleNo, 
			@RequestParam("saleConcertNo") Integer saleConcertNo,
			String memberId, Model model) {
		memberId = (String)session.getAttribute("session_id");
		System.out.println("세션에 저장된 ID 1: " + memberId);
		
		System.out.println("saleConcertNo: " + saleConcertNo);
		
		List<ConcertScheduleDto> schedules = seatService.getAllSchedules(saleConcertNo); // 콘서트 일정 조회
		List<SeatDto> seats = seatService.getSeatsBySchedule(scheduleNo); // 선택한 일정의 좌석 조회
		
		// 해당 콘서트의 판매 정보
		SaleConcertDto saleConcertdto = saleConcertService.getSaleConcertBySaleConcertNo(saleConcertNo);
        
		if (saleConcertdto == null || saleConcertdto.getConcertDto() == null) {
	        throw new IllegalStateException("❌ 해당 saleConcertNo에 대한 데이터가 없음: " + saleConcertNo);
	    }
		
		
		model.addAttribute("memberId",memberId);
		model.addAttribute("schedules", schedules); // jsp 로 전달
		model.addAttribute("seats", seats);
		model.addAttribute("saleConcertDto", saleConcertdto);
	    model.addAttribute("selectedScheduleNo", scheduleNo); // 선택한 일정 전달
		
		return "ticketShop/seatPopUp";
	}
	
	
	// ✅ 선택한 날짜의 좌석 데이터를 JSON으로 반환하는 API 추가
	@PostMapping("/ticketShop/seatPopUp/seatData")
	@ResponseBody
	public ResponseEntity<List<Map<String, Object>>> getSeatsBySchedule(@RequestParam("scheduleNo") Integer scheduleNo) {
	    List<SeatDto> seats = seatService.getSeatsBySchedule(scheduleNo);

	    // 불필요한 ConcertDto, ConcertScheduleDto, ArtistDto 제거
	    List<Map<String, Object>> simplifiedSeats = seats.stream().map(seat -> {
	        Map<String, Object> seatMap = new HashMap<>();
	        seatMap.put("seatNo", seat.getSeatNo());
	        seatMap.put("seatFloor", seat.getSeatFloor());
	        seatMap.put("seatLevel", seat.getSeatLevel());
	        seatMap.put("seatRow", seat.getSeatRow());
	        seatMap.put("seatCol", seat.getSeatCol());
	        seatMap.put("seatPrice", seat.getSeatPrice());
	        seatMap.put("isReserved", seat.isReserved());
	        seatMap.put("scheduleNo", seat.getConcertScheduleDto().getScheduleNo());
//		    seatMap.put("concertNo", seat.getConcertDto().getconcertNo());
	        return seatMap;
	    }).collect(Collectors.toList());

	    return ResponseEntity.ok(simplifiedSeats);
	}
	
	
	
	
	// 팝업 - 결제순서 1
	@GetMapping("/ticketShop/paymentPopUp")
	public String paymentPopUp(
			@RequestParam("scheduleNo") Integer scheduleNo,
			@RequestParam("saleConcertNo") Integer saleConcertNo,
			@RequestParam("seatNos") String seatNos,  // seatNos를 콤마로 구분된 문자열로 받음
			MemberDto memberDto, 
			String memberId,
			String sessionNick,
			Model model) {
		memberId = (String)session.getAttribute("session_id");
		sessionNick = (String)session.getAttribute("session_nickname");
		System.out.println("세션에 저장된 ID 1: " + memberId);
		
		
//		List<SeatDto> seats = seatService.getSeatsBySchedule(scheduleNo); // 선택한 일정의 좌석 조회
		
		
		// seatNos를 콤마로 구분하여 배열로 변환
	    List<Integer> seatNoList = Arrays.stream(seatNos.split(","))
	                                      .map(Integer::parseInt)
	                                      .collect(Collectors.toList());
	    // 좌석 정보 조회
	    List<SeatDto> seats = seatService.getSeatsBySeatNos(seatNoList);
	    
	    // 각 좌석의 price를 더해서 총 결제 금액 계산
	    int seatsAmount = seats.stream()
	                           .mapToInt(SeatDto::getSeatPrice)  // 각 좌석의 가격을 가져옴
	                           .sum();  // 가격의 합을 구함
		
	    // 콘서트 일정과 좌석 정보 가져오기
	    List<ConcertScheduleDto> schedules = seatService.getAllSchedules(saleConcertNo); // 콘서트 일정 조회
		SaleConcertDto saleConcertdto = saleConcertService.getSaleConcertBySaleConcertNo(saleConcertNo);
		
		// ✅ schedules 리스트에서 해당 scheduleNo에 맞는 ConcertScheduleDto 찾기
		ConcertScheduleDto concertScheduleDto = schedules.stream()
				.filter(s -> s.getScheduleNo() == scheduleNo)
		        .findFirst()
		        .get();
		
		// 배송자 정보
		if (memberId != null) {
	        MemberDto memberdto = memberService.findById(memberId);
	        List<AddressDto> aList = addressService.findByMemberNickname(sessionNick);
	        List<CartDto> cList = cartservice.findByMemberNickname(sessionNick);

	        ObjectMapper objectMapper = new ObjectMapper();

	        for (CartDto cart : cList) {
	            if (cart.getCart_items() != null) {
	                try {
	                    List<Map<String, Object>> parsedCartItems = objectMapper.readValue(
	                        cart.getCart_items(),
	                        new TypeReference<List<Map<String, Object>>>() {}
	                    );
	                    cart.setParsedCartItems(parsedCartItems); // ✅ JSON 변환한 데이터 저장
	                } catch (Exception e) {
	                    e.printStackTrace();
	                }
	            }
	        }

	        model.addAttribute("mdto", memberdto);
	        model.addAttribute("adto", aList);
	        model.addAttribute("cartList", cList); // ✅ CartDto 리스트 전달

	    }
		
		// ✅ ConcertDto 가져오기
		ConcertDto concertDto = concertScheduleDto.getSaleConcertDto().getConcertDto();
		
		System.out.println("concertDto: "+ concertDto);
		
		// ✅ 회원 정보 조회
		memberDto = memberService.findById(memberId);
		
		model.addAttribute("seatsAmount", seatsAmount);  // 총 결제금액 전달
		model.addAttribute("memberDto", memberDto);
		model.addAttribute("schedules", schedules); // jsp 로 전달
		model.addAttribute("seats", seats);
		model.addAttribute("concertScheduleDto", concertScheduleDto); // 일정 정보 추가
	    model.addAttribute("concertDto", concertDto); // 콘서트 정보 추가
	    model.addAttribute("selectedScheduleNo", scheduleNo); // 선택한 일정 전달
	    model.addAttribute("saleConcertDto", saleConcertdto);
		return "ticketShop/paymentPopUp";
		
	}
	
	
//	@PostMapping("/ticketShop/paymentPopUp/seatData")
//	@ResponseBody
//	public ResponseEntity<List<Map<String, Object>>> paymentPopUp(
//			@RequestParam("seatNos") String seatNos) {
//	    
//		// seatNos를 콤마로 구분하여 리스트로 변환
//	    List<Integer> seatNoList = Arrays.stream(seatNos.split(","))
//	                                      .map(Integer::parseInt)
//	                                      .collect(Collectors.toList());
//		
//	    // 해당 좌석들에 대한 정보 조회
//	    List<SeatDto> seats = seatService.getSeatsBySeatNos(seatNoList);
//	    
//	    System.out.println("seats: "+seats);
		
	    // 선택된 좌석 정보 받기
//	    List<Map<String, Object>> selectedSeats = (List<Map<String, Object>>) requestSeatData.get("selectedSeats");
	    // 문자열을 Integer로 변환
//	    List<SeatDto> selectedSeatDetails = new ArrayList<>();
	    
//	    System.out.println("선택된 좌석: " + selectedSeatsNos);
	    
	    // DB에서 선택된 좌석 정보 조회
//	    for (Map<String, Object> seatData : selectedSeats) {
//	        Integer seatNo = (Integer) seatData.get("seatNo");
//	        String seatLevel = (String) seatData.get("seatLevel");
//	        String seatFloor = (String) seatData.get("seatFloor");
//	        String seatRow = (String) seatData.get("seatRow");
//	        String seatCol = (String) seatData.get("seatCol");
//	        Integer seatPrice = (Integer) seatData.get("seatPrice");
//
//	        // DB에서 실제 좌석 정보를 조회하거나, 임시 객체로 추가
//	        SeatDto seatDto = new SeatDto();
//	        seatDto.setSeatNo(seatNo);
//	        seatDto.setSeatLevel(seatLevel);  // String으로 저장
//	        seatDto.setSeatFloor(seatFloor);  // String으로 저장
//	        seatDto.setSeatRow(seatRow);  // String으로 저장
////	        seatDto.setSeatCol(seatCol);  // String으로 저장
//	        Integer seatColInteger = Integer.parseInt(seatCol);  // String -> Integer
//	        seatDto.setSeatCol(seatColInteger);
//	        seatDto.setSeatPrice(seatPrice);
//	        
//	        // 해당 좌석에 대한 공연 일정 정보 조회
//	        ConcertScheduleDto concertScheduleDto = seatService.getSeatBySeatNo(seatNo).getConcertScheduleDto(); // 해당 좌석에 대한 공연 일정 정보 조회
//	        seatDto.setConcertScheduleDto(concertScheduleDto);  // Set concertScheduleDto
//
//	        selectedSeatDetails.add(seatDto);
//	    }
	    
	    // // 좌석 정보를 간단한 Map 형태로 변환
//	    List<Map<String, Object>> seatDataList = seats.stream().map(seat -> {
//	        Map<String, Object> seatMap = new HashMap<>();
//	        seatMap.put("seatNo", seat.getSeatNo());
//	        seatMap.put("seatLevel", seat.getSeatLevel());
//	        seatMap.put("seatFloor", seat.getSeatFloor());
//	        seatMap.put("seatRow", seat.getSeatRow());
//	        seatMap.put("seatCol", seat.getSeatCol());
//	        seatMap.put("seatPrice", seat.getSeatPrice());
////	        seatMap.put("scheduleDate", seat.getConcertScheduleDto().getScheduleDate());
////	        seatMap.put("scheduleStartTime", seat.getConcertScheduleDto().getScheduleStartTime());
//	        return seatMap;
//	    }).collect(Collectors.toList());
//	    
//	    
//	    // 선택된 좌석 정보 모델에 추가
//	    return ResponseEntity.ok(seatDataList);
//	}


	
	// 팝업 - 결제순서 2
	@GetMapping("/ticketShop/paymentPopUp2")
	public String paymentPopUp2(
			@RequestParam("scheduleNo") Integer scheduleNo,
			@RequestParam("saleConcertNo") Integer saleConcertNo,
			@RequestParam("seatNos") String seatNos,  // seatNos를 콤마로 구분된 문자열로 받음
			MemberDto memberDto, 
			String memberId,
			String sessionNick,
			Model model) {
		memberId = (String)session.getAttribute("session_id");
		sessionNick = (String)session.getAttribute("session_nickname");
		System.out.println("세션에 저장된 ID 1: " + memberId);
		
		
//		List<SeatDto> seats = seatService.getSeatsBySchedule(scheduleNo); // 선택한 일정의 좌석 조회
		
		
		// seatNos를 콤마로 구분하여 배열로 변환
	    List<Integer> seatNoList = Arrays.stream(seatNos.split(","))
	                                      .map(Integer::parseInt)
	                                      .collect(Collectors.toList());
	    // 좌석 정보 조회
	    List<SeatDto> seats = seatService.getSeatsBySeatNos(seatNoList);
	    
	    // 각 좌석의 price를 더해서 총 결제 금액 계산
	    int seatsAmount = seats.stream()
	                           .mapToInt(SeatDto::getSeatPrice)  // 각 좌석의 가격을 가져옴
	                           .sum();  // 가격의 합을 구함
		
	    // 콘서트 일정과 좌석 정보 가져오기
	    List<ConcertScheduleDto> schedules = seatService.getAllSchedules(saleConcertNo); // 콘서트 일정 조회
		SaleConcertDto saleConcertdto = saleConcertService.getSaleConcertBySaleConcertNo(saleConcertNo);
		
		// ✅ schedules 리스트에서 해당 scheduleNo에 맞는 ConcertScheduleDto 찾기
		ConcertScheduleDto concertScheduleDto = schedules.stream()
				.filter(s -> s.getScheduleNo() == scheduleNo)
		        .findFirst()
		        .get();
		
		// 배송자 정보
		if (memberId != null) {
	        MemberDto memberdto = memberService.findById(memberId);
	        List<AddressDto> aList = addressService.findByMemberNickname(sessionNick);
	        List<CartDto> cList = cartservice.findByMemberNickname(sessionNick);

	        ObjectMapper objectMapper = new ObjectMapper();

	        for (CartDto cart : cList) {
	            if (cart.getCart_items() != null) {
	                try {
	                    List<Map<String, Object>> parsedCartItems = objectMapper.readValue(
	                        cart.getCart_items(),
	                        new TypeReference<List<Map<String, Object>>>() {}
	                    );
	                    cart.setParsedCartItems(parsedCartItems); // ✅ JSON 변환한 데이터 저장
	                } catch (Exception e) {
	                    e.printStackTrace();
	                }
	            }
	        }

	        model.addAttribute("mdto", memberdto);
	        model.addAttribute("adto", aList);
	        model.addAttribute("cartList", cList); // ✅ CartDto 리스트 전달
	    }
		
		
	

		
		
		
		// ✅ ConcertDto 가져오기
		ConcertDto concertDto = concertScheduleDto.getSaleConcertDto().getConcertDto();
		
		System.out.println("concertDto: "+ concertDto);
		
		// ✅ 회원 정보 조회
		memberDto = memberService.findById(memberId);
		
		model.addAttribute("seatsAmount", seatsAmount);  // 총 결제금액 전달
		model.addAttribute("memberDto", memberDto);
		model.addAttribute("schedules", schedules); // jsp 로 전달
		model.addAttribute("seats", seats);
		model.addAttribute("concertScheduleDto", concertScheduleDto); // 일정 정보 추가
	    model.addAttribute("concertDto", concertDto); // 콘서트 정보 추가
	    model.addAttribute("selectedScheduleNo", scheduleNo); // 선택한 일정 전달
	    model.addAttribute("saleConcertDto", saleConcertdto);
		return "ticketShop/paymentPopUp2";
		
	}
	
	
	//카카오페이페이지 결제
//	@ResponseBody
//	@PostMapping("/pay/orderPay")
//	public ReadyResponseDto orderPay(OrderItemDto odto,TicketDto tdto) {
//		log.info("tdto name : "+tdto.getTicketTitle());
//		System.out.println("tdto name : "+tdto.getTicketTitle());
//		
//        // 카카오 결제 준비하기
//        ReadyResponseDto readyResponseDto = kakaopayService.payReady(odto,tdto);
//        
//        // 세션에 결제 고유번호(tid) 저장
//        SessionUtils.addAttribute("tid", readyResponseDto.getTid());
//        log.info("결제 고유번호: " + readyResponseDto.getTid());
//        return readyResponseDto;
//		
//	}
//	
//	@GetMapping("/pay/completed")
//    public String payCompleted(@RequestParam("pg_token") String pgToken) {
//    
//		//세션에서 tid값을 가져옴.
//        String tid = SessionUtils.getStringAttributeValue("tid");
//        log.info("결제승인 요청을 인증하는 토큰: " + pgToken);
//        log.info("결제 고유번호: " + tid);
//
//        // 카카오 결제 요청하기
//        ApproveResponseDto approveResponseDto = kakaopayService.payApprove(tid, pgToken);
//
//        System.out.println("승인날짜 : "+approveResponseDto.getApproved_at());
//        
//        return "redirect:/success";
//    }
		
		

}