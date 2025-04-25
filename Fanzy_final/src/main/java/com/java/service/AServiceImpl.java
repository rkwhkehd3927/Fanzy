package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.ArtistDto;
import com.java.repository.ARepository;

@Service
public class AServiceImpl implements AService {

	@Autowired ARepository aRepository;
	
	// 메인페이지 아티스트 리스트
	@Override
	public List<ArtistDto> findAll() {
		
		List<ArtistDto> list = aRepository.findAll();
		return list;
	}
	
	// 
	@Override
	public ArtistDto findById(int artistNo) {
		
		return aRepository.findById(artistNo).orElse(null);
	}

	// 아티스트 등록
	@Override
	public void awrite(ArtistDto adto) {
		aRepository.save(adto);
		
	}

	// 아티스트 등록 토글
	@Override
	public void updateDisplayStatus(int artistNo, boolean display) {
		  ArtistDto artist = aRepository.findById(artistNo)
		            .orElseThrow(() -> new RuntimeException("Artist not found with id: " + artistNo));
          artist.setDisplay(display);
          aRepository.save(artist);  // 변경된 내용 저장
		
	}
	


	@Override
	public ArtistDto findByArtistNo(int artist_no) {
		ArtistDto artistDto = aRepository.findByArtistNo(artist_no);
		return artistDto;
	}
}
