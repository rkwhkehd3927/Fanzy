package com.java.service;

import java.util.List;

import com.java.dto.OrderItemDto;

public interface OrderitemService {

	// 주문내역
	List<OrderItemDto> findByMemberId(String id);

}
