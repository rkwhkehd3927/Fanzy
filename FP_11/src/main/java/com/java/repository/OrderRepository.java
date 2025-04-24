package com.java.repository;

import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.java.dto.OrderDto;

import jakarta.transaction.Transactional;

@Repository
public interface OrderRepository extends JpaRepository<OrderDto, Integer> {
    // 주문번호로 주문을 찾는 메소드
    Optional<OrderDto> findByOrderNumber(String orderNumber);

    //적립금저장
    @Modifying
    @Transactional
    @Query("UPDATE OrderDto o SET o.order_save_reward = :saveReward WHERE o.orderNumber = :orderNumber")
    void updateSaveReward(@Param("orderNumber") String orderNumber, @Param("saveReward") int saveReward);


}