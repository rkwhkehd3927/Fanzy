package com.java.service;

import java.util.List;

import com.java.dto.LiveDto;

public interface LiveService {

	List<LiveDto> findByArtistNo(int artistNo);

}
