package com.java.service;

import java.util.List;

import com.java.dto.EventDto;

public interface EService {

	List<EventDto> findAll();

	void ewrite(EventDto edto);

	EventDto findByEventNo(int event_no);

	void save(EventDto edto);

	void deleteByEventNo(int event_no);

}
