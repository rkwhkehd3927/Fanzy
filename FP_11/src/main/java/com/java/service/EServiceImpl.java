package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.EventDto;
import com.java.repository.ERepository;

@Service
public class EServiceImpl implements EService {

	@Autowired ERepository eRepository;
	
	@Override
	public List<EventDto> findAll() {
		
		List<EventDto> list = eRepository.findAll();
		return list;
	}

	@Override
	public void ewrite(EventDto edto) {
		eRepository.save(edto);
		
	}

	@Override
	public EventDto findByEventNo(int event_no) {
		
		EventDto edto = eRepository.findByEventNo(event_no);
		return edto;
	}

	@Override
	public void save(EventDto edto) {
		eRepository.save(edto);
		
	}

	@Override
	public void deleteByEventNo(int event_no) {
		
		eRepository.deleteById(event_no);
		
	}

}
