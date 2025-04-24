package com.java.service;

import com.java.dto.OrderDto;

public interface OrderService {
    // 주문 저장 메소드
    OrderDto saveOrder(String memberId, int shopNo, int quantity, 
                     String orderNumber, String address, String zipCode, 
                     int totalPrice, int shippingFee, int usedReward);
    
    // 주문 상태 업데이트 메소드
    void updateOrderStatus(String orderNumber, String tid, String status);

    // 적립금 업데이트 메서드 추가
    void updateOrderSaveReward(String orderNumber, int rewardPoints);
    
    OrderDto getOrderById(int orderId);
}