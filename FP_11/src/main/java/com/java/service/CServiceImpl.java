package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.ArtistCommunityDto;
import com.java.dto.CommentDto;
import com.java.dto.FanCommunityDto;
import com.java.repository.CMRepository;
import com.java.repository.CRepository;

@Service
public class CServiceImpl implements CService {
	
	@Autowired CRepository cRepository;
	@Autowired CMRepository cmRepository;

	// 관리자페이지 게시글보기
	@Override
	public List<FanCommunityDto> findByNickname(String nickname) {
		
		List<FanCommunityDto> list = cRepository.findByNickname(nickname);
		return list;
	}

	// 관리자페이지 게시글 삭제
	@Override
	public void deleteByCommunityNo(int community_no) {
	    // 1. 해당 커뮤니티 글을 먼저 조회
	    FanCommunityDto community = cRepository.findByCommunityNo(community_no);

	    if (community != null) {
	        // 2. 해당 커뮤니티 글과 연관된 댓글 삭제
	        List<CommentDto> comments = cmRepository.findByCommunityNo(community_no);
	        cmRepository.deleteAll(comments);

	        // 3. 커뮤니티 글 삭제
	        cRepository.delete(community);
	    } else {
	        throw new RuntimeException("해당 게시글을 찾을 수 없습니다.");
	    }
		
	}

	// 게시글 전체보기
	@Override
	public List<FanCommunityDto> findAll(int artist_no) {
		List<FanCommunityDto> list = cRepository.findAll(artist_no);
		return list;
	}

	// 게시글 쓰기
	@Override
	public void fcwrite(FanCommunityDto fcdto) {
		cRepository.save(fcdto);
		
	}

	// 게시글 상세보기 -- 안될수도 있음 crepository 보기
	@Override
	public FanCommunityDto findByCommunityNo(int communityNo) {
		FanCommunityDto fcdto = cRepository.findByCommunityNo(communityNo);
		return fcdto;
	}

	// 게시글 삭제
	@Override
	public void deleteByCommunity(int communityNo) {
		FanCommunityDto fcdto = cRepository.findByCommunityNo(communityNo);
		
		if(fcdto != null) {
			//게시글 댓글 삭제
			List<CommentDto> comments = cmRepository.findByCommunityNo(communityNo);
			cmRepository.deleteAll(comments);
			
			//게시글 삭제
			cRepository.delete(fcdto);
		} else {
	        throw new RuntimeException("해당 게시글을 찾을 수 없습니다.");
	    }
		
	}

	// 게시글 수정
	@Override
	public void updateCommunity(FanCommunityDto existingPost) {
		cRepository.save(existingPost);
		
	}

    // 댓글 리스트
	@Override
	public List<CommentDto> findByACommunityNo(int communityNo) {
		List<CommentDto> aclist = cmRepository.findByACommunityNo(communityNo);
		return aclist;
	}
		
		//댓글 저장
		@Override
		public void saveComment(CommentDto commentDto) {
			cmRepository.save(commentDto);
			
		}
		
		//댓글 삭제
		@Override
		public void deleteByComment(int commentNo) {
			CommentDto cmdto = cmRepository.findBycommentNo(commentNo);
			cmRepository.delete(cmdto);
			
		}
		//댓글 수
		@Override
		public long countByACommunity(ArtistCommunityDto post) {
			return cmRepository.countByArtistcommunityDto(post);
		}


}
