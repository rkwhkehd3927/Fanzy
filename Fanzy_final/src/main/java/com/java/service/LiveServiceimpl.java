package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.LiveDto;
import com.java.repository.LiveRepository;
import com.java.repository.MediaRepository;

@Service
public class LiveServiceimpl implements LiveService {
	@Autowired LiveRepository liveRepository;

	@Override
	public List<LiveDto> findByArtistNo(int artistNo) {
		
		return liveRepository.findBylive(artistNo);
	}

}
