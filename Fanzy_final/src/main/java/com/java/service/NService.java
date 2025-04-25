package com.java.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.java.dto.NoticeDto;

public interface NService {

	List<NoticeDto> findAll();

	void nwrite(NoticeDto ndto);

	NoticeDto findByNoticeNo(int notice_no);

	void save(NoticeDto ndto);

	void deleteByNoticeNo(int notice_no);
	
	// 공지사항, 페이지넘버링
	Page<NoticeDto> findbyArtistNo(Pageable pageable, int artistNo);

	// 공지사항 (아티스트 상세보기 페이지)
	List<NoticeDto> findbyArtistNo(int artist_no);

}
