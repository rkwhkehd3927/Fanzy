package com.java.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.TicketDto;
import com.java.repository.TicketShopRepository;

@Service
public class TicketshopServiceImpl implements TicketShopService {

	@Autowired TicketShopRepository mRepository;
	
	@Override
	public ArrayList<TicketDto> findAll() {
		ArrayList<TicketDto> list = (ArrayList<TicketDto>) mRepository.findAll();
		return list;
	}

	@Override
	public TicketDto findById(int tno) {
		TicketDto tdto = mRepository.findById(tno).orElseThrow(
				()->{
			return new IllegalArgumentException("데이터 처리시 에러!!");
		});
		return tdto;
	}

}
