package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.MediaDto;
import com.java.repository.MediaRepository;
@Service
public class MediaServiceimpl implements MediaService {
	@Autowired MediaRepository mediaRepository;
	
	
	@Override
	public List<MediaDto> findByArtistNo(int artistNo) {
		
		return mediaRepository.findByMedia(artistNo);
	}

}
