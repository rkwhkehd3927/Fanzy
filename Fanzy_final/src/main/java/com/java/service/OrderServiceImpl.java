package com.java.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.MemberDto;
import com.java.dto.OrderDto;
import com.java.dto.OrderItemDto;
import com.java.dto.ShopDto;
import com.java.repository.MRepository;
import com.java.repository.OrderItemRepository;
import com.java.repository.OrderRepository;
import com.java.repository.ShopRepository;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired private OrderRepository orderRepository;
    @Autowired private OrderItemRepository orderItemRepository;
    @Autowired private MRepository memberRepository;
    @Autowired private ShopRepository shopRepository;
    
    @Override
    public OrderDto saveOrder(String memberId, int shopNo, int quantity, 
                             String orderNumber, String address, String zipCode, 
                             int totalPrice, int shippingFee, int usedReward) {
        
        try {
            // 1. 회원 정보 가져오기
            Optional<MemberDto> memberOpt = memberRepository.findByMemberId(memberId);
            if (!memberOpt.isPresent()) {
                System.out.println("회원 정보를 찾을 수 없습니다: " + memberId);
                return null;
            }
            MemberDto member = memberOpt.get();
            
            // 2. 상품 정보 가져오기
            Optional<ShopDto> shopOpt = shopRepository.findById(shopNo);
            if (!shopOpt.isPresent()) {
                System.out.println("상품 정보를 찾을 수 없습니다: " + shopNo);
                return null;
            }
            ShopDto shop = shopOpt.get();
            
            // 3. OrderDto 객체 생성
            OrderDto order = new OrderDto();
            order.setMember(member);
            order.setOrderNumber(orderNumber);
            order.setOrder_date(new Timestamp(System.currentTimeMillis()));
            order.setName(shop.getShop_title()); // 상품명
            order.setTotalPrice(totalPrice); // 총 금액
            order.setOrder_status("PENDING"); // 상태: 결제 대기중
            order.setOrder_total_amount(totalPrice); // 총 금액
            order.setOrder_product_price(totalPrice - shippingFee); // 상품 가격
            order.setOrder_shipping_fee(shippingFee); // 배송비
            order.setOrder_used_reward(usedReward); // 사용한 적립금
            order.setOrder_address(address); // 배송지 주소
            order.setOrder_zipcode(zipCode); // 우편번호
            order.setOrder_payment_method("KAKAOPAY"); // 결제 방법
            
            // 4. OrderDto 저장
            OrderDto savedOrder = orderRepository.save(order);
            
            // 5. OrderItemDto 객체 생성
            OrderItemDto orderItem = new OrderItemDto();
            orderItem.setOrder(savedOrder); // 주문 정보 설정
            orderItem.setShop(shop); // 상품 정보 설정
            orderItem.setOrderItem_quantity(quantity); // 수량
            orderItem.setOrderItem_unitPrice(shop.getShop_price()); // 단가
            orderItem.setOrderItem_totalPrice(shop.getShop_price() * quantity); // 총 가격
            orderItem.setOrderItem_type("SHOP"); // 상품 타입 (SHOP)
            
            // 6. OrderItemDto 저장
            OrderItemDto savedItem = orderItemRepository.save(orderItem);
            
            // 7. 주문 상품 목록 설정 (양방향 관계)
            List<OrderItemDto> items = new ArrayList<>();
            items.add(savedItem);
            savedOrder.setOrderItems(items);
            
            // 8. 상품 재고 감소
            shop.setShop_quantity(shop.getShop_quantity() - quantity);
            shopRepository.save(shop);
            
            return savedOrder;
            
        } catch (Exception e) {
            System.out.println("주문 저장 중 오류 발생: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
    
    @Override
    public void updateOrderStatus(String orderNumber, String tid, String status) {
        try {
            // 주문 번호로 주문 정보 조회
            Optional<OrderDto> orderOpt = orderRepository.findByOrderNumber(orderNumber);
            if (!orderOpt.isPresent()) {
                System.out.println("주문 정보를 찾을 수 없습니다: " + orderNumber);
                return;
            }
            
            // 주문 정보 업데이트
            OrderDto order = orderOpt.get();
            order.setOrder_status(status); // 상태 업데이트
            order.setTid(tid); // 결제 고유 번호 설정
            
            // 변경사항 저장
            orderRepository.save(order);
            
        } catch (Exception e) {
            System.out.println("주문 상태 업데이트 중 오류 발생: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    // 적립금 업데이트 메서드 구현
    @Override
    public void updateOrderSaveReward(String orderNumber, int rewardPoints) {
        // 주문 번호로 주문을 찾아 적립금 업데이트
        orderRepository.updateSaveReward(orderNumber, rewardPoints);
    }
    
    @Override
    public OrderDto getOrderById(int orderId) {
        return orderRepository.findById(orderId).orElse(null);
    }
}