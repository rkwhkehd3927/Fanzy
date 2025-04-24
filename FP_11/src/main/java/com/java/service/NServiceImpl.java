package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.java.dto.NoticeDto;
import com.java.repository.NRepository;

@Service
public class NServiceImpl implements NService {

	@Autowired NRepository nRepository;
	
	@Override
	public List<NoticeDto> findAll() {
		
		List<NoticeDto> list = nRepository.findAll();
		return list;
	}

	@Override
	public void nwrite(NoticeDto ndto) {

		nRepository.save(ndto);
	}

	@Override
	public NoticeDto findByNoticeNo(int notice_no) {
		
		NoticeDto ndto = nRepository.findByNoticeNo(notice_no);
		return ndto;
	}

	@Override
	public void save(NoticeDto ndto) {
		nRepository.save(ndto);
		
	}

	@Override
	public void deleteByNoticeNo(int notice_no) {
		nRepository.deleteById(notice_no);
		
	}

	@Override
	public Page<NoticeDto> findbyArtistNo(Pageable pageable, int artistNo) {
		Page<NoticeDto> list = nRepository.findByArtistNo(pageable,artistNo);
		return list;
	}

	// 아티스트 상세보기 페이지
	@Override
	public List<NoticeDto> findbyArtistNo(int artist_no) {
		List<NoticeDto> list = nRepository.findbyArtistNo(artist_no);
		return list;
	}

}
