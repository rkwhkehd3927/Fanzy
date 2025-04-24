package com.java.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.dto.TicketDto;

public interface TicketShopRepository extends JpaRepository<TicketDto, Integer> {
 
}