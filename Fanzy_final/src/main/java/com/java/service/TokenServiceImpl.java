package com.java.service;

import java.security.Key;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.OrderDto;
import com.java.repository.TokenRepository;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;

@Service
public class TokenServiceImpl implements TokenService{

    @Autowired TokenRepository tokenRepository; // TokenDto를 DB에 저장하는 Repository

    // 비밀키. 프로덕션에서는 환경 변수나 외부 설정으로 관리할 것.
    private final Key secretKey = Keys.secretKeyFor(SignatureAlgorithm.HS256);

    // JWT 토큰 생성
    public String generateJwtToken(OrderDto orderDto) {
        // 주문과 연동된 회원 정보 가져오기 (member_nickname 사용)
        String memberNickname = orderDto.getMember().getMember_nickname();
        
        // JWT 토큰 생성 (예: 5분 후 만료)
        return Jwts.builder()
                .setSubject(memberNickname)
                .claim("orderId", orderDto.getOrder_id())
                .setIssuedAt(new Date())
                .setExpiration(Date.from(Instant.now().plus(5, ChronoUnit.MINUTES)))
                .signWith(secretKey)
                .compact();
    }
    
    // JWT 토큰 검증
    public boolean validateJwtToken(String token) {
        try {
            Jwts.parserBuilder()
                .setSigningKey(secretKey)
                .build()
                .parseClaimsJws(token);
            // 파싱이 성공하면 토큰은 유효함
            return true;
        } catch (Exception e) {
            // 토큰이 만료되었거나 위변조된 경우 예외 발생
            e.printStackTrace();
            return false;
        }
    }

	@Override
	public String getSubjectFromToken(String jwtToken) {
		return Jwts.parserBuilder()
	               .setSigningKey(secretKey)
	               .build()
	               .parseClaimsJws(jwtToken)
	               .getBody()
	               .getSubject();
	}
    
}
