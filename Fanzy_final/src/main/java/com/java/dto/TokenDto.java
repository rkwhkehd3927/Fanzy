package com.java.dto;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
public class TokenDto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int token_no;				// 토큰 고유번호
    
    private String token;				// QR코드에 포함 될 문자열
    
    private LocalDateTime createdAt;	// 토큰 생성시간
    
    private LocalDateTime expiresAt;	// 토큰 만료시간
    
    private boolean used;				// 토큰 사용여부
    
    
    @ManyToOne
    @JoinColumn(name = "order_id")
    private OrderDto orderDto;	
    
}
