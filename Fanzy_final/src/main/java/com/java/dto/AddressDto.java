package com.java.dto;

import jakarta.persistence.*;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
@Entity
public class AddressDto {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long address_no;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_nickname", nullable = false)
    private MemberDto member;  // 🚀 회원 테이블과 연결 (외래키)

    @Column(nullable = false, length = 100)
    private String address_address;  // 배송지 주소
    
	@Column(nullable = false,length=20)
	private String address_postalCode;     // 우편번호

    @Column(nullable = false, length = 30)
    private String address_receiverName; // 받는 사람

    @Column(nullable = false, length = 20)
    private String address_receiverPhone; // 연락처

    @Column(nullable = false)
    private boolean address_isDefault; // 🚀 기본 배송지 여부 (true: 기본 배송지)
}
