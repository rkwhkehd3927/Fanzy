package com.java.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.ConcertScheduleDto;
import com.java.dto.SeatDto;
import com.java.repository.SeatRepository;

@Service
public class SeatServiceImpl implements SeatService {
	
	@Autowired
	private SeatRepository seatRepository;

	// 선택한 날짜에 해당하는 좌석 정보를 가져오는 API
	@Override
	public List<SeatDto> getSeatsBySchedule(Integer scheduleNo) {
		
		List<SeatDto> seats = seatRepository.findByConcertScheduleDto_ScheduleNo(scheduleNo);

//	    System.out.println("찾은 좌석 개수: " + seats.size());  // ✅ 몇 개 가져오는지 확인
	    for (SeatDto seat : seats) {
//	        System.out.println("좌석 정보: " + seat.toString());  // ✅ 좌석 정보 확인
	    }

	    return seats;
		
		
//		 return seatRepository.findByConcertScheduleDto_ScheduleNo(scheduleNo)
//	                .stream()
//	                .collect(Collectors.toList());
	}
	
	
	// 좌석에서 콘서트 일정 가져오기
	@Override
	public List<ConcertScheduleDto> getAllSchedules(Integer saleConcertNo) {
		return seatRepository.findDistinctSchedules(saleConcertNo); 
	}

//	 선택한 seatNo 리스트에 해당하는 좌석만 가져옴
//	@Override
//	public List<SeatDto> getSeatsByIds(List<Integer> seatNos) {
//		// 선택된 좌석 번호들에 해당하는 좌석 정보 조회
//		List<SeatDto> seats = seatRepository.findBySeatNoIn(seatNos);
//
//	    // 선택된 좌석 정보가 String이 아닌 SeatDto 객체인지 체크
//	    for (SeatDto seat : seats) {
////	        System.out.println("좌석 정보: " + seat);
//	    }
//
//	    return seats;
//	}


	// 해당 좌석에 대한 공연 일정 정보 조회
	@Override
	public SeatDto getSeatBySeatNo(Integer seatNo) {
		return seatRepository.findSeatBySeatNo(seatNo);
	}


    // 선택한 seatNo 리스트에 해당하는 좌석만 가져옴
	@Override
	public List<SeatDto> getSeatsBySeatNos(List<Integer> seatNoList) {
		return seatRepository.findBySeatNoIn(seatNoList);  // Repository의 메서드 호출
	}


	



}