package com.java.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.ConcertDto;
import com.java.dto.ConcertScheduleDto;
import com.java.dto.SaleConcertDto;
import com.java.repository.ConcertRepository;

@Service
public class ConcertServiceImpl implements ConcertService {

	
	@Autowired
	private ConcertRepository concertRepository;
	
	// 콘서트 정보 조회
	@Override
	public ConcertDto getConcertByConcertNo(Integer concertNo) {
		ConcertDto concertDto = concertRepository.findByConcertNo(concertNo);
		return concertDto;
	}

	// ✅ 예약된 좌석 개수 조회 메서드 추가
	@Override
	public Integer getBookedTickets(Integer saleConcertNo) {
		return concertRepository.countReservedSeats(saleConcertNo);
	}

	// 해당 콘서트의 일정 리스트 조회
	@Override
	public List<ConcertScheduleDto> getConcertSchedulesBySaleConcertNo(Integer saleConcertNo) {
		return concertRepository.findSchedulesBySaleConcertNo(saleConcertNo);
	}

	// 콘서트 일정 조회(온라인용 단일 객체)
	@Override
	public ConcertScheduleDto getConcertScheduleBySaleConcertNo(Integer saleConcertNo) {
		return concertRepository.findScheduleBySaleConcertNo(saleConcertNo);
	}

	// scheduleNo로 일정 정보 찾기
	@Override
	public ConcertScheduleDto getConcertScheculeByScheduleNo(Integer scheduleNo) {
		return concertRepository.findScheduleByScheduleNo(scheduleNo);
	}
	
	// 관리자페이지 콘서트 리스트
	@Override
	public List<ConcertDto> findAll() {
		List<ConcertDto> list = concertRepository.findAll();
		return list;
	}

	// 콘서트 등록
	@Override
	public void cwrite(ConcertDto cdto) {
		concertRepository.save(cdto);
		
	}

	// 관리자페이지 콘서트 상세보기
	@Override
	public ConcertDto findByconcertNo(int concert_no) {
		ConcertDto cdto = concertRepository.findByconcertNo(concert_no);
		return cdto;
	}

	// 콘서트 삭제
	@Override
	public void deleteByConcertNo(int concert_no) {
		concertRepository.deleteById(concert_no);
	}

	// 콘서트 수정
	@Override
	public ConcertDto findByConcertNo(int concertNo) {
		return concertRepository.findByConcertNo(concertNo);
	}

}