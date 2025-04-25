package com.java.service;

import java.util.List;

import com.java.dto.ArtistDto;

public interface AService {

	List<ArtistDto> findAll();

	ArtistDto findById(int artistNo);

	// 아티스트 등록
	void awrite(ArtistDto adto);

	// 아티스트 등록 토글
	void updateDisplayStatus(int artistNo, boolean display);
	
	ArtistDto findByArtistNo(int artist_no);
}


