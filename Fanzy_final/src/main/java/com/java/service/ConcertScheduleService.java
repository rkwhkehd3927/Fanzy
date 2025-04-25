package com.java.service;

import java.util.List;

import com.java.dto.ConcertScheduleDto;

public interface ConcertScheduleService {

	// 관리자페이지 스케줄 관리
	List<ConcertScheduleDto> findAll();

	// 관리자페이지 스케줄 등록
	void cswrite(ConcertScheduleDto csdto);

	// 관리자페이지 스케줄 상세보기
	ConcertScheduleDto findByconcertscheduleNo(int concertschedule_no);

	// 관리자페이지 스케줄 삭제
	void deleteByScheduleNo(int schedule_no);

}
