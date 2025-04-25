package com.java.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.java.dto.MemberDto;
import com.java.service.MService;
import com.java.service.OTPService;
import com.java.service.TokenService;


@RestController
@RequestMapping("/api/otp")
public class OTPController {

	@Autowired TokenService tokenService;
	@Autowired OTPService otpService;
	@Autowired MService memberService;
	
    @PostMapping("/send")
    public ResponseEntity<?> sendOtp(@RequestBody Map<String, String> request) {
        String jwtToken = request.get("token");
        // JWT 검증: 실패하면 예외 혹은 false 반환
        if (!tokenService.validateJwtToken(jwtToken)) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                                 .body("유효하지 않은 토큰입니다.");
        }
        // 토큰에서 회원 식별자(예: member_nickname)를 추출
        String nickname = tokenService.getSubjectFromToken(jwtToken);
        
        // 회원 조회 (MemberDto에서 member_phone 필드를 포함)
        MemberDto member = memberService.findByNickName(nickname);
        if (member == null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                                 .body("회원 정보를 찾을 수 없습니다.");
        }
        
        System.out.println("Retrieved member phone: " + member.getMember_phone());
        
        // 회원 전화번호를 통해 OTP 전송
        otpService.generateOtp(member.getMember_phone());
        return ResponseEntity.ok("OTP가 전송되었습니다.");
    }

    // OTP 입력 후 검증 엔드포인트
    @PostMapping("/verify")
    public ResponseEntity<?> verifyOtp(@RequestBody Map<String, String> request) {
        String phone = request.get("phone");
        String otp = request.get("otp");

        if (otpService.validateOtp(phone, otp)) {
            MemberDto member = memberService.findByPhone(phone); // 또는 findByNickName() 등을 활용
            if(member != null) {
                // 인증 성공 후, WebSocket 메시지를 통해 데스크탑 대기 페이지에 알림 전송
                notifyOtpSuccess(member.getMember_nickname());
            }
            return ResponseEntity.ok("인증 성공. 메인 페이지로 이동합니다.");
        }else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                                 .body("OTP가 올바르지 않습니다.");
        }
    }
    
    // WebSocket
    @Autowired
    private SimpMessagingTemplate messagingTemplate;
    

    // 예시: 모바일에서 인증 성공 후 호출되는 메소드 (실제 로직에 맞게 호출)
    public void notifyOtpSuccess(String memberNickname) {
        // 특정 사용자에게 메시지를 보냅니다.
        // 여기서는 "/topic/otp-success/{memberNickname}"에 메시지를 보냅니다.
    	System.out.println("notifyOtpSuccess 호출됨, memberNickname: " + memberNickname);
    	messagingTemplate.convertAndSend("/topic/otp-success/" + memberNickname, "결제 성공");
    }
    
    
}
