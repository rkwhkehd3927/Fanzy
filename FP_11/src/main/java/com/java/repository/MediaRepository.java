package com.java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.java.dto.MediaDto;

public interface MediaRepository  extends JpaRepository<MediaDto, Integer>{
	@Query(value = "select * from mediadto where artist_no = ? order by media_date desc", nativeQuery = true)
	List<MediaDto> findByMedia(int artistNo);


}
