package com.java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.dto.TicketDto;

public interface TicketRepository extends JpaRepository<TicketDto, Integer> {

	// 예시: 특정 redeemCode로 티켓 조회
    TicketDto findByRedeemCode(String redeemCode);
    
//    // 예시: SaleConcertDto와 연관된 티켓을 조회
//    List<TicketDto> findBySaleConcertDto_SaleConcertNo(Integer saleConcertNo);
	
	
}