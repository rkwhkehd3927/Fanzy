package com.java.service;


import java.util.List;

import com.java.dto.ConcertDto;
import com.java.dto.ConcertScheduleDto;
import com.java.dto.SaleConcertDto;

public interface ConcertService {

	// 콘서트 정보 조회
	ConcertDto getConcertByConcertNo(Integer concertNo);
	
	
	// 예약된 좌석 개수 가져오기
	Integer getBookedTickets(Integer saleConcertNo);


	// 해당 콘서트의 일정 리스트 조회
	List<ConcertScheduleDto> getConcertSchedulesBySaleConcertNo(Integer saleConcertNo);

	// 콘서트 일정 조회(온라인용 단일 객체)
	ConcertScheduleDto getConcertScheduleBySaleConcertNo(Integer saleConcertNo);


	// scheduleNo로 일정 정보 찾기
	ConcertScheduleDto getConcertScheculeByScheduleNo(Integer scheduleNo);

	// 관리자페이지 콘서트리스트
	List<ConcertDto> findAll();

	// 관리자페이지 콘서트등록
	void cwrite(ConcertDto cdto);

	// 관리자페이지 콘서트 상세보기
	ConcertDto findByconcertNo(int concert_no);

	// 관리자페이지 콘서트 삭제
	void deleteByConcertNo(int concert_no);


	ConcertDto findByConcertNo(int concertNo);


}