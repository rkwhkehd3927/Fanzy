package com.java.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.java.dto.ConcertScheduleDto;
import com.java.dto.SeatDto;

public interface SeatRepository extends JpaRepository<SeatDto, Integer> {

	
	List<SeatDto> findByConcertScheduleDto_ScheduleNo(Integer scheduleNo);

	// 좌석 정보에서 ConcertScheduleDto 리스트 가져오기
//    @Query("SELECT DISTINCT s.concertScheduleDto FROM SeatDto s")
//    @Query("SELECT s.concertScheduleDto FROM SeatDto s WHERE s.concertScheduleDto.saleConcertNo = :saleConcertNo")
//    List<com.java.dto.ConcertScheduleDto> findDistinctSchedules(@Param("saleConcertNo") Integer saleConcertNo);
	@Query("SELECT s.concertScheduleDto FROM SeatDto s WHERE s.concertScheduleDto.saleConcertDto.saleConcertNo = :saleConcertNo ORDER BY s.concertScheduleDto.scheduleNo ASC")
	List<ConcertScheduleDto> findDistinctSchedules(@Param("saleConcertNo") Integer saleConcertNo);
    

	// 해당 좌석에 대한 공연 일정 정보 조회
	@Query("SELECT s FROM SeatDto s WHERE s.seatNo = :seatNo")
	SeatDto findSeatBySeatNo(@Param("seatNo") Integer seatNo);
	
	// 선택한 좌석 정보를 데이터베이스에서 다시 조회
	List<SeatDto> findBySeatNoIn(List<Integer> seatNoList);

}