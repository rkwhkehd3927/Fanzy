package com.java.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.java.dto.OrderDto;
import com.java.service.OrderService;
import com.java.service.QRService;
import com.java.service.TokenService;

@RestController
@RequestMapping("/api/qr")
public class QRController {

	@Autowired TokenService tokenService;
	@Autowired QRService qrService;
	
   	@Autowired
   	private OrderService orderService;
	
    // 주문 ID를 받아 토큰 생성 및 QR 코드 이미지 반환
    @GetMapping("/generate/{orderId}")
    public ResponseEntity<?> generateQRCode(@PathVariable int orderId) {
        // OrderService를 통해 주문 정보를 조회 (실제 구현에 맞게 수정)
        OrderDto orderDto = orderService.getOrderById(orderId);
        if (orderDto == null) {
            return ResponseEntity.badRequest().body("유효하지 않은 주문 ID입니다.");
        }
        
        // 주문 정보 기반 토큰 생성
        String jwtToken = tokenService.generateJwtToken(orderDto);
        
        try {
        	byte[] qrImage = qrService.generateQRCodeImage(jwtToken);
            return ResponseEntity.ok()
                    .contentType(MediaType.IMAGE_PNG)
                    .body(qrImage);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("QR 코드 생성 중 오류가 발생했습니다.");
        }
    }

    // QR 코드 스캔 후, 토큰의 유효성 검증 (요청 본문에 { "token": "생성된토큰문자열" } 형태)
    @PostMapping("/validate")
    public ResponseEntity<?> validateToken(@RequestBody Map<String, String> request) {
        String token = request.get("token");
        boolean valid = tokenService.validateJwtToken(token);
        if (valid) {
            return ResponseEntity.ok("토큰이 유효하며, 사용 완료 처리되었습니다.");
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("유효하지 않거나 만료된 토큰입니다.");
        }
    }
}
