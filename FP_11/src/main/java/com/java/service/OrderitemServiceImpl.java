package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.OrderItemDto;
import com.java.repository.OrderItemRepository;

@Service
public class OrderitemServiceImpl implements OrderitemService {
	@Autowired OrderItemRepository oiRepository;

	// 주문내역 조회 - 여러 건 반환
    @Override
    public List<OrderItemDto> findByMemberId(String id) {
        List<OrderItemDto> orderItems = oiRepository.findByMemberId(id);
        return orderItems;
    }

}
