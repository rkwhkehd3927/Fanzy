package com.java.service;

import java.util.List;

import com.java.dto.MediaDto;

public interface MediaService {

	List<MediaDto> findByArtistNo(int artistNo);

}
