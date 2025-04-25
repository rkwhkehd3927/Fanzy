package com.java.dto;

import java.security.Timestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
@Entity
public class RestockAlertDto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int restock_notification_id; // 재입고 알림 고유번호

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id", nullable = false)
    private MemberDto member;  // 🚀 회원 테이블과 연결 (외래키)

    @ManyToOne
    private ShopDto shop; // 상품 정보 (외래키)

    @Column(length=1000)
    private String restock_message; // 알림 메시지

    @Column
    private Timestamp restock_created_at; // 알림 생성일

    @Column
    private boolean restock_seen; // 알림 확인 여부

    @Column
    private boolean restock_is_active; // 알림 활성화 여부
}
