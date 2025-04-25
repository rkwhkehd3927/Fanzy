package com.java.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.ConcertDto;
import com.java.dto.SaleConcertDto;
import com.java.repository.SaleConcertRepository;

@Service
public class SaleConcertServiceImpl implements SaleConcertService {

	
	@Autowired
    private SaleConcertRepository saleConcertRepository;
	@Autowired ConcertService concertService;
	
	// rsvOpenDate 이후인 판매 콘서트 리스트 조회 (메인 페이지에서 출력)
	@Override
	public List<SaleConcertDto> getOpenSaleConcerts() {
		LocalDate today = LocalDate.now();
        return saleConcertRepository.findByRsvOpenDateLessThanEqual(today);
	}

	// 특정 saleConcertNo에 해당하는 콘서트 판매 정보 조회 - 오프라인용
//	@Override
//	public List<SaleConcertDto> getSaleConcertBySaleConcertNo(Integer saleConcertNo) {
//		return saleConcertRepository.findBySaleConcertDto(saleConcertNo);
//	}

	// 특정 saleConcertNo에 해당하는 콘서트 판매 정보 조회
	@Override
	public SaleConcertDto getSaleConcertBySaleConcertNo(Integer saleConcertNo) {
		
		System.out.println("데이터베이스에서 조회할 saleConcertNo: " + saleConcertNo);
		
		
		return saleConcertRepository.findBySaleConcertNo(saleConcertNo);
	}

	// 관리자페이지 콘서트 티켓관리
	@Override
	public List<SaleConcertDto> findAll() {
		List<SaleConcertDto> list = saleConcertRepository.findAll();
		return list;
	}

	// 관리자페이지 콘서트 티켓등록
	@Override
	public void scwrite(SaleConcertDto scdto) {
		
		int concertNo = scdto.getConcertDto().getConcertNo();
        ConcertDto persistentConcert = concertService.findByConcertNo(concertNo);
        
        scdto.setConcertDto(persistentConcert);
		
		saleConcertRepository.save(scdto);
		
	}

	// 관리자페이지 콘서트 티켓 상세보기
	@Override
	public SaleConcertDto findBysaleconcertNo(int saleconcert_no) {
		SaleConcertDto scdto = saleConcertRepository.findBysaleconcertNo(saleconcert_no);
		return scdto;
	}

	// 관리자페이지 콘서트 티켓 삭제
	@Override
	public void deleteByConcertNo(int saleconcert_no) {
		saleConcertRepository.deleteById(saleconcert_no);
		
	}
}