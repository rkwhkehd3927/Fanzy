package com.java.controller;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

//import com.java.dto.MemberDto;
//import com.java.service.MemberService;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.dto.ArtistDto;
import com.java.dto.ConcertDto;
import com.java.dto.ConcertScheduleDto;
import com.java.dto.MemberDto;
import com.java.dto.SaleConcertDto;
import com.java.dto.TicketDto;
import com.java.repository.TicketRepository;
import com.java.service.ConcertService;
import com.java.service.MService;
import com.java.service.SaleConcertService;


@Controller
public class TicketController {

	
	@Autowired HttpSession session;
	@Autowired MService memberService;
	@Autowired ConcertService concertService;
	@Autowired SaleConcertService saleConcertService;
	
	@Autowired
    TicketRepository ticketRepository;  // TicketRepository 사용하여 DB에 저장
	
	// 메인페이지 오픈 - get
	@GetMapping("/ticketShop/ticketMain")
	public String ticketMain(String memberId, Model model) {
		memberId = (String)session.getAttribute("session_id");
		System.out.println("세션에 저장된 ID 1: " + memberId);
		
		// 콘서트 상품 리스트 불러오기
		List<SaleConcertDto> saleConcerts = saleConcertService.getOpenSaleConcerts();
		
		// ✅ 예약된 좌석 개수를 저장할 Map 생성
		Map<Integer, Integer> bookedTicketsMap = saleConcerts.stream()
		    .collect(Collectors.toMap(
		        SaleConcertDto::getSaleConcertNo, // 🔥 saleConcertNo 기준으로 매핑
		        saleConcert -> concertService.getBookedTickets(saleConcert.getSaleConcertNo()), // concertNo로 예약 좌석 개수 조회
		        (existing, replacement) -> existing // 중복 시 기존 값 유지 (근데 어차피 saleConcertNo는 유일하니까 중복 안 생김!)
		    ));

		System.out.println("bookedTicketsMap: "+bookedTicketsMap);
		
		System.out.println("saleConcerts: "+saleConcerts);
		// ID 값을 JSP로 전달 (세션에 값이 없는 경우 null 전달)
		model.addAttribute("memberId",memberId);
		// 콘서트 상품 리스트 불러오기
		model.addAttribute("saleConcerts",saleConcerts); // 상품 리스트 데이터 전송 
		model.addAttribute("bookedTicketsMap", bookedTicketsMap); // 예약 좌석 개수
		return "ticketShop/ticketMain";
	}
	
	// 메인페이지 오픈 - post
	@PostMapping("/ticketShop/ticketMain")
	public String ticketMain(ArtistDto artistDto, MemberDto memberDto,String memberId, Model model) {
		memberId = (String)session.getAttribute("session_id");
		System.out.println("세션에 저장된 ID 2: " + memberId);
		
		// 회원 정보 조회
		// 세션에서 로그인된 사용자 정보 확인
		memberDto = memberService.findById(memberId);
		model.addAttribute("mdto", memberDto);
		return "ticketShop/ticketMain";
	}
	
	
	// 온라인 티켓 구매 페이지 - get
	@GetMapping("/ticketShop/onlineTicketView")
	public String onlineTicketView(@RequestParam("saleConcertNo") Integer saleConcertNo, 
			String memberId, Model model) {
		memberId = (String)session.getAttribute("session_id");
		System.out.println("세션에 저장된 ID 1: " + memberId);
		
		System.out.println("요청받은 saleConcertNo: " + saleConcertNo);
		
		// 해당 콘서트의 판매 정보
		SaleConcertDto saleConcertDto = saleConcertService.getSaleConcertBySaleConcertNo(saleConcertNo);
		
		
	    if (saleConcertDto == null) {
	        System.out.println("❌ 해당 콘서트의 판매 정보가 없습니다.");
	    } else {
	        System.out.println("✅ 판매 정보 조회 성공: " + saleConcertDto.getSaleConcertDesc());
	    }
	    
	    
	    ConcertScheduleDto concertScheduleDto = concertService.getConcertScheduleBySaleConcertNo(saleConcertNo);
	    System.out.println("concertScheduleDto: "+concertScheduleDto);
	    
	    // 콘서트 정보 조회
	    ConcertDto concertDto = saleConcertDto.getConcertDto();
	    System.out.println("concertDto: "+concertDto);
	    
	    // SaleConcertDto에서 concertNo 가져오기
	    Integer concertNo = saleConcertDto.getConcertDto().getConcertNo();
	    
	    
        System.out.println("concertNo: "+ concertNo);
//        System.out.println("concertSchedules: " + concertSchedules);
        
        // 오늘 날짜 추가
        String today = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        
		
		// ID 값을 JSP로 전달 (세션에 값이 없는 경우 null 전달)
		model.addAttribute("memberId",memberId);
		model.addAttribute("concertDto", concertDto);
		model.addAttribute("saleConcertDto", saleConcertDto);
		model.addAttribute("concertScheduleDto", concertScheduleDto); 
		model.addAttribute("today", today); 
		return "ticketShop/onlineTicketView";
		
	}
	// 온라인 티켓 구매 페이지 - post
	@PostMapping("/ticketShop/onlineTicketView")
	public String onlineTicketView(MemberDto memberDto,String memberId, Model model) {
		memberId = (String)session.getAttribute("session_id");
		System.out.println("세션에 저장된 ID 2: " + memberId);
		
		// 회원 정보 조회
		// 세션에서 로그인된 사용자 정보 확인
		memberDto = memberService.findById(memberId);
		model.addAttribute("mdto", memberDto);
		return "ticketShop/onlineTicketView";
		
	}
	
	
	// 오프라인 티켓 구매 페이지- get (파라미터로 concertNo 전달)
	@GetMapping("/ticketShop/offlineTicketView")
	public String offlineTicketView(
			@RequestParam("saleConcertNo") Integer saleConcertNo,
			String memberId, Model model) {
		memberId = (String)session.getAttribute("session_id");
		System.out.println("세션에 저장된 ID 1: " + memberId);
		
		
		System.out.println("요청받은 saleConcertNo: " + saleConcertNo);
        // 해당 콘서트의 판매 티켓 리스트 (판매 가능 기간, 전체 티켓 개수, 남은 티켓 개수, 솔드아웃 여부 등)
//        List<SaleConcertDto> saleConcerts = saleConcertService.getSaleConcertBySaleConcertNo(saleConcertNo);
		
		// 해당 콘서트의 판매 정보
		SaleConcertDto saleConcertDto = saleConcertService.getSaleConcertBySaleConcertNo(saleConcertNo);
        
		if (saleConcertDto == null || saleConcertDto.getConcertDto() == null) {
	        throw new IllegalStateException("❌ 해당 saleConcertNo에 대한 데이터가 없음: " + saleConcertNo);
	    }
		
		
        // 콘서트 정보 조회
//        ConcertDto concertDto = concertService.getConcertByConcertNo(concertNo);
        ConcertDto concertDto = saleConcertDto.getConcertDto();
        System.out.println("concertDto: "+concertDto);
        
        // SaleConcertDto에서 concertNo 가져오기
//        Integer concertNo = saleConcertdto.getConcertDto().getConcertNo();
        
        // 해당 콘서트의 일정 리스트 조회
        List<ConcertScheduleDto> concertSchedules = concertService.getConcertSchedulesBySaleConcertNo(saleConcertNo);

//        System.out.println("concertNo: " + concertNo);
        System.out.println("concertSchedules: " + concertSchedules);
        
        // 콘서트 일정이 정상적으로 불러와지는지 확인
        System.out.println("콘서트 일정 개수: " + concertSchedules.size());
        for (ConcertScheduleDto schedule : concertSchedules) {
            System.out.println("scheduleNo: " + schedule.getScheduleNo() + ", 날짜: " + schedule.getScheduleDate());
        }
        
        // 오늘 날짜 추가
        String today = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        
		
		// ID 값을 JSP로 전달 (세션에 값이 없는 경우 null 전달)
		model.addAttribute("memberId",memberId);
		model.addAttribute("concertDto", concertDto);
		model.addAttribute("saleConcertDto", saleConcertDto);
		model.addAttribute("concertSchedules", concertSchedules); 
		model.addAttribute("today", today); 
		return "ticketShop/offlineTicketView";
		
	}

	// 오프라인 티켓 구매 페이지 - post
	@PostMapping("/ticketShop/offlineTicketView")
	public String offlineTicketView(MemberDto memberDto,String memberId, Model model) {
		memberId = (String)session.getAttribute("session_id");
		System.out.println("세션에 저장된 ID 2: " + memberId);
		
		// 회원 정보 조회
		// 세션에서 로그인된 사용자 정보 확인
		memberDto = memberService.findById(memberId);
		model.addAttribute("mdto", memberDto);
		return "ticketShop/offlineTicketView";
	}	

	
	// 온라인 스트리밍권 결제 페이지
	@GetMapping("/ticketShop/onlinePayPopUp")
	public String onlinePayPopUp(
			@RequestParam("saleConcertNo") Integer saleConcertNo, 
			@RequestParam("scheduleNo") Integer scheduleNo, 
			MemberDto memberDto,
			String memberId, Model model) {
		memberId = (String)session.getAttribute("session_id");
		System.out.println("세션에 저장된 ID 1: " + memberId);
		
	    ConcertScheduleDto concertScheduleDto = concertService.getConcertScheculeByScheduleNo(scheduleNo);
	    
	    // 해당 콘서트의 판매 정보
 		SaleConcertDto saleConcertDto = saleConcertService.getSaleConcertBySaleConcertNo(saleConcertNo);
 		
 		if (saleConcertDto == null) {
 	        System.out.println("❌ 해당 콘서트의 판매 정보가 없습니다.");
 	    } else {
 	        System.out.println("✅ 판매 정보 조회 성공: " + saleConcertDto.getSaleConcertDesc());
 	    }
 		
 		ConcertDto concertDto = saleConcertDto.getConcertDto();
        System.out.println("concertDto: "+concertDto);
        System.out.println("saleConcertdto: "+saleConcertDto);

        memberDto = memberService.findById(memberId);
		
	    model.addAttribute("memberId",memberId);
	    model.addAttribute("concertScheduleDto",concertScheduleDto);
	    model.addAttribute("saleConcertDto",saleConcertDto);
		model.addAttribute("memberDto", memberDto);
	    model.addAttribute("concertDto",concertDto);
	    
		
		return "ticketShop/onlinePayPopUp";
	}
	
	
	// 온라인 스트리밍 티켓 생성 요청 처리
    @PostMapping("/ticketShop/createOnlineTicket")
    public String createOnlineTicket(
    		@RequestParam("saleConcertNo") Integer saleConcertNo,
    		@RequestParam("scheduleNo") Integer scheduleNo, 
    		@RequestParam("concertPrice") Integer totalPrice,
//    		Integer totalPrice,
    		Model model) {
        // SaleConcertDto와 ConcertScheduleDto를 가져옴
    	// 해당 콘서트의 판매 정보
 		SaleConcertDto saleConcertDto = saleConcertService.getSaleConcertBySaleConcertNo(saleConcertNo);
 		ConcertScheduleDto concertScheduleDto = concertService.getConcertScheculeByScheduleNo(scheduleNo);
// 		ConcertDto concertDto = saleConcertDto.getConcertDto();
 		
 		// 랜덤한 redeemCode 생성
        String redeemCode = generateRedeemCode();

        
        // ConcertDto에서 concertStartDatetime과 concertEndDatetime 가져오기
        LocalDateTime concertStartDatetime = saleConcertDto.getConcertDto().getConcertStartDatetime();
        LocalDateTime concertEndDatetime = saleConcertDto.getConcertDto().getConcertEndDatetime();
        
        // TicketDto 생성
        TicketDto ticketDto = TicketDto.builder()
                .ticketTitle(saleConcertDto.getSaleConcertDesc())  // SaleConcertDto에서 제목 가져오기
                .ticketContent(saleConcertDto.getConcertDto().getConcertName())  // 고정된 설명
                .ticketPrice(totalPrice)
                .ticketQuantity(1)  // 예시로 1000개 재고
                .ticketType("online")  // 온라인 티켓
                .ticketValidFrom(Timestamp.valueOf(concertStartDatetime)) // scheduleStartTime 그대로 사용
                .ticketValidTo(Timestamp.valueOf(concertEndDatetime)) // 23:59:59 설정
                .redeemCode(redeemCode) // 랜덤 생성된 redeemCode
                .isRestreamingAllowed(true)  // 재스트리밍 허용
                .concertScheduleDto(concertScheduleDto)  // 외래키로 콘서트 일정 설정
                .seatDto(null)  // 좌석 없음
                .build();

        // 티켓 저장 (DB에 저장)
        TicketDto savedTicket = ticketRepository.save(ticketDto);

        // 티켓 생성
//        TicketDto ticketDto = ticketService.createOnlineTicket(saleConcertDto, concertScheduleDto, saleConcertDto.getConcertPrice());

        // 티켓 생성 후 결과 반환
        model.addAttribute("ticketDto", savedTicket);
//        return "redirect:/pay/orderPay2"; // 예시로 티켓 확인 페이지로 이동
//        return "ticketShop/onlinePayPopUp";
        // 카카오페이 결제 API를 호출하기 전에 티켓 생성 후, 리디렉션 처리
        return "redirect:/pay/orderPay2?ticketNo=" + savedTicket.getTicketNo();
    }
	
    // 랜덤 redeemCode 생성 함수
    private String generateRedeemCode() {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder code = new StringBuilder();
        Random rand = new Random();
        for (int i = 0; i < 8; i++) {
            code.append(characters.charAt(rand.nextInt(characters.length())));
        }
        return code.toString(); // 고유 코드 반환
    }

    
    
    
	
	// ~~~~~~~ 티켓거래
	
	
	// 티켓 거래 양도 페이지 - get
	@GetMapping("/ticketShop/marketplace")
	public String marketplace() {
		return "ticketShop/marketplace";
	}
	
	// 티켓 거래 양도 페이지 - post
	@PostMapping("/ticketShop/marketplace")
	public String marketplace(MemberDto memberDto,String memberId, Model model) {
		memberId = (String)session.getAttribute("session_id");
		System.out.println("세션에 저장된 ID 2: " + memberId);
		
		// 회원 정보 조회
		// 세션에서 로그인된 사용자 정보 확인
		memberDto = memberService.findById(memberId);
		model.addAttribute("mdto", memberDto);
		return "ticketShop/marketplace";
	}
	
	// 티켓 거래 상세 페이지 - get
	@GetMapping("/ticketShop/marketplaceView")
	public String marketplaceView() {
		return "ticketShop/marketplaceView";
	}
	
	
	// 티켓 거래 상세 페이지 - post
	@PostMapping("/ticketShop/marketplaceView")
	public String marketplaceView(MemberDto memberDto,String memberId, Model model) {
		memberId = (String)session.getAttribute("session_id");
		System.out.println("세션에 저장된 ID 2: " + memberId);
		
		// 회원 정보 조회
		// 세션에서 로그인된 사용자 정보 확인
		memberDto = memberService.findById(memberId);
		model.addAttribute("mdto", memberDto);
		return "ticketShop/marketplaceView";
	}
	
	
}