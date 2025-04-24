package com.java.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.java.dto.EventDto;

public interface ERepository extends JpaRepository<EventDto, Integer>{

	@Query(value="select * from eventdto where event_no=?",nativeQuery = true)
	EventDto findByEventNo(int event_no);
	
}
