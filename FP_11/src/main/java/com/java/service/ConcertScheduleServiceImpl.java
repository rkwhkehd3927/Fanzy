package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.ConcertScheduleDto;
import com.java.repository.ConcertScheduleRepository;

@Service
public class ConcertScheduleServiceImpl implements ConcertScheduleService {

	@Autowired ConcertScheduleRepository concertScheduleRepository;
	
	// 관리자페이지 스케줄 관리
	@Override
	public List<ConcertScheduleDto> findAll() {
		List<ConcertScheduleDto> list = concertScheduleRepository.findAll();
		return list;
	}

	// 관리자페이지 스케줄 등록
	@Override
	public void cswrite(ConcertScheduleDto csdto) {
		concertScheduleRepository.save(csdto);
	}

	// 관리자페이지 스케줄 상세보기
	@Override
	public ConcertScheduleDto findByconcertscheduleNo(int concertschedule_no) {
		ConcertScheduleDto csdto = concertScheduleRepository.findByconcertscheduleNo(concertschedule_no);
		return csdto;
	}

	// 관리자페이지 스케줄 삭제
	@Override
	public void deleteByScheduleNo(int schedule_no) {
		concertScheduleRepository.deleteById(schedule_no);
		
	}

}
