package com.java.repository;


import java.util.List;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.java.dto.ConcertDto;
import com.java.dto.ConcertScheduleDto;
import com.java.dto.SaleConcertDto;

public interface ConcertRepository extends JpaRepository<ConcertDto, Integer>{

	
	// 콘서트 번호로 콘서트 조회
	ConcertDto findByConcertNo(Integer concertNo);
	
	// ✅ saleConcertNo 기준으로 예약된 좌석 개수 조회
//    @Query("SELECT COUNT(s) FROM SeatDto s WHERE s.concertScheduleDto.saleConcertDto.concertDto.concertNo = :concertNo AND s.isReserved = true")
//    int countReservedSeats(@Param("saleConcertNo") Integer saleConcertNo);
	
	@Query("SELECT COUNT(s) FROM SeatDto s WHERE s.concertScheduleDto.saleConcertDto.saleConcertNo = :saleConcertNo AND s.isReserved = true")
	int countReservedSeats(@Param("saleConcertNo") Integer saleConcertNo);
    
    // 해당 콘서트의 일정 리스트 조회
    @Query("SELECT cs FROM ConcertScheduleDto cs WHERE cs.saleConcertDto.saleConcertNo = :saleConcertNo ORDER BY cs.scheduleDate, cs.scheduleStartTime")
    List<ConcertScheduleDto> findSchedulesBySaleConcertNo(@Param("saleConcertNo") Integer saleConcertNo);
    
    // 해당 콘서트 일정 조회(온라인용 단일 객체)
    @Query("SELECT cs FROM ConcertScheduleDto cs WHERE cs.saleConcertDto.saleConcertNo = :saleConcertNo")
	ConcertScheduleDto findScheduleBySaleConcertNo(@Param("saleConcertNo") Integer saleConcertNo);

	// scheduleNo로 일정 정보 찾기
	@Query("SELECT cs FROM ConcertScheduleDto cs WHERE cs.scheduleNo = :scheduleNo")
	ConcertScheduleDto findScheduleByScheduleNo(@Param("scheduleNo") Integer scheduleNo);

    // 관리자페이지 콘서트 상세보기
    @Query(value="select * from concertdto where concert_no=?", nativeQuery=true)
	ConcertDto findByconcertNo(int concert_no);
}