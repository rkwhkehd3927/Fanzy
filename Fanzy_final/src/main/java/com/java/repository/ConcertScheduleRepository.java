package com.java.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.java.dto.ConcertScheduleDto;

public interface ConcertScheduleRepository extends JpaRepository<ConcertScheduleDto, Integer>{

	// 관리자페이지 스케줄 상세보기
	@Query(value="select * from concertscheduledto where schedule_no=?", nativeQuery=true)
	ConcertScheduleDto findByconcertscheduleNo(int concertschedule_no);

}
