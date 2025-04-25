package com.java.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.java.dto.NoticeDto;

public interface NRepository extends JpaRepository<NoticeDto, Integer>{

	@Query(value="select * from noticedto where notice_no=?", nativeQuery=true)
	NoticeDto findByNoticeNo(int notice_no);

	@Query("SELECT n FROM NoticeDto n WHERE n.artistDto.artist_no = :artistNo")
	Page<NoticeDto> findByArtistNo(Pageable pageable, @Param("artistNo") int artistNo);

	
	// 아티스트 상세보기 페이지
	@Query(value="select * from noticedto where artist_no=? ORDER BY notice_date DESC", nativeQuery=true)
	List<NoticeDto> findbyArtistNo(int artist_no);
	
}
