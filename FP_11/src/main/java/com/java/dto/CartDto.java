package com.java.dto;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Transient;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder

@Entity
public class CartDto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int cart_no; // 장바구니 고유번호

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_nickname", nullable = false)
    private MemberDto member;  // 🚀 회원 테이블과 연결 (외래키)

    @Column(length=1000)
    private String cart_viewed_items; // 최근 본 상품(상세보기 클릭시 관련된 DB넘어오면 DB 추가)
    
    @Column(length=2000)
    private String cart_category; // 장바구니 카테고리(티켓, 굿즈)

    @Column(length=2000)
    private String cart_items; // 장바구니 상품

    @Column(length=1000)
    private String cart_restock_items; // 재입고 알림 상품(재고량 0의 알림표시 클릭 시 DB 추가)

    @Column(length=2000)
    private String cart_related_items; // 유사 상품

    @Column
    private int cart_purchase_count; // 구매 횟수

    @Column
    private int cart_total_amount; // 총 금액

    @Column
    private Timestamp cart_date; // 장바구니 업데이트 날짜
    
 // 🟢 JSON 파싱한 데이터를 저장하는 필드 (DB에는 저장 안 됨)
    @Transient
    private List<Map<String, Object>> parsedCartItems;
}
