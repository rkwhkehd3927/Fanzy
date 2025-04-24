package com.java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.java.dto.LiveDto;

public interface LiveRepository extends JpaRepository<LiveDto, Integer>{

	@Query(value = "select * from livedto where artist_no = ? order by media_date desc", nativeQuery = true)
	List<LiveDto> findBylive(int artistNo);


}
