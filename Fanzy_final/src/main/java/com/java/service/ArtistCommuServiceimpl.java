package com.java.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.ArtistCommunityDto;
import com.java.dto.CommentDto;
import com.java.dto.FanCommunityDto;
import com.java.repository.ArtistCommuRepository;
import com.java.repository.CMRepository;

@Service
public class ArtistCommuServiceimpl implements ArtistCommuService {
	@Autowired ArtistCommuRepository artistcommuRepository;
	@Autowired CMRepository commentRepository;
	
	@Override
	public void acwrite(ArtistCommunityDto acdto) {
		artistcommuRepository.save(acdto);
		
	}

	@Override
	public List<ArtistCommunityDto> findAll() {
		List<ArtistCommunityDto> list = artistcommuRepository.findAll();
		return list;
	}

	@Override
	public void deleteByCommunity(int communityNo) {
		ArtistCommunityDto acdto = artistcommuRepository.findByCommunityNo(communityNo);
		
//		if(acdto != null) {
//			//게시글 댓글 삭제
//			List<CommentDto> comments = commentRepository.findByACommunityNo(communityNo);
//			commentRepository.deleteAll(comments);
//			
//			//게시글 삭제
//			artistcommuRepository.delete(acdto);
//		} else {
//	        throw new RuntimeException("해당 게시글을 찾을 수 없습니다.");
//	    }
		
		//게시글 삭제
		artistcommuRepository.delete(acdto);
		
	}

	@Override
	public ArtistCommunityDto findByACommunityNo(int communityNo) {
		ArtistCommunityDto acdto = artistcommuRepository.findByCommunityNo(communityNo);
		return acdto;
	}

	@Override
	public void updateCommunity(ArtistCommunityDto existingPost) {
		artistcommuRepository.save(existingPost);

		
	}

	@Override
	public List<ArtistCommunityDto> findAll(int artist_no) {
		List<ArtistCommunityDto> list = artistcommuRepository.findAll(artist_no);
		return list;
	}

}
