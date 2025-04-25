package com.java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.java.dto.OrderItemDto;

public interface OrderItemRepository extends JpaRepository<OrderItemDto, Integer> {
    // 기본 CRUD 메소드는 JpaRepository에서 제공됨
	
	// 주문내역
	@Query("SELECT o FROM OrderItemDto o WHERE o.order.member.member_id = :memberId")
    List<OrderItemDto> findByMemberId(@Param("memberId") String memberId);
}