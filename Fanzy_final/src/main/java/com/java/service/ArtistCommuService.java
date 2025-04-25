package com.java.service;

import java.util.List;

import com.java.dto.ArtistCommunityDto;

public interface ArtistCommuService {

	void acwrite(ArtistCommunityDto acdto);

	List<ArtistCommunityDto> findAll();
	
	//삭제
	void deleteByCommunity(int communityNo);
	
	//게시글 수정
	ArtistCommunityDto findByACommunityNo(int communityNo);
	
	void updateCommunity(ArtistCommunityDto existingPost);

	// 아티스트 페이지별 게시글 출력
	List<ArtistCommunityDto> findAll(int artist_no);

}
