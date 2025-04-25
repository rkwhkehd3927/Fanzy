package com.java.dto;

import jakarta.persistence.*;
import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class OrderItemDto {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @SequenceGenerator(name = "order_item_seq", sequenceName = "order_item_seq", allocationSize = 1)
    private int orderItem_no;  // 주문 상세 고유번호

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_id", nullable = false)
    private OrderDto order;  // 주문과 연결 (외래키)

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "shop_no", nullable = true)
    private ShopDto shop;  // 굿즈 상품 (nullable → 티켓과 상호 배타적)

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ticket_no", nullable = true)
    private TicketDto ticket;  // 티켓 상품 (nullable → 굿즈와 상호 배타적)

    @Column(nullable = false)
    private int orderItem_quantity;  // 구매 수량

    @Column(nullable = false)
    private int orderItem_unitPrice;  // 개별 가격 (할인 적용 후)

    @Column(nullable = false)
    private int orderItem_totalPrice;  // 총 가격 (quantity * unitPrice)

    @Column(length = 10, nullable = false)
    private String orderItem_type;  // "SHOP" 또는 "TICKET" (상품 유형 구분)
}
