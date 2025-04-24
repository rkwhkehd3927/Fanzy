package com.java.dto;

import java.sql.Timestamp;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
@Entity
public class OrderDto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int order_id; // 주문 고유번호

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id", nullable = false)
    private MemberDto member;  // 회원 테이블과 연결 (외래키)
    
    @Column(nullable = false, unique = true, length = 20)
    private String orderNumber; // 주문번호 (YYYYMMDD-랜덤숫자)
    
    @Column
    private Timestamp order_date; // 주문 날짜

    
    @Column
    private String Name; // 총 금액
    @Column
    private int TotalPrice; // 총 금액
    
    @Column(length=50)
    private String order_status; // 주문 상태 (PENDING, PAID, CANCELLED)

    @Column
    private int order_total_amount; // 총 금액
    
    @Column
    private int order_product_price; // 상품 가격
    
    @Column
    private int order_shipping_fee; // 배송비
    
    @Column
    private int order_used_reward; // 사용 적립금
    
    @Column
    private int order_save_reward; // 저장 적립금
    
    @Column(length=500)
    private String order_address; // 배송지 주소
    
    @Column(length=20)
    private String order_zipcode; // 우편번호
    
    @Column(length=500)
    private String order_detail_address; // 상세 주소
    
    @Column(length=50)
    private String order_payment_method; // 결제 방법
    
    @Column(length=100)
    private String tid; // 카카오페이 결제 고유번호
    
    @Column(length=50)
    private String approved_at; // 결제 승인 시각
    
    // 주문 항목(상품)과의 관계 설정
    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<OrderItemDto> orderItems;
}