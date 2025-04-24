package com.java.service;

import java.util.List;

import com.java.dto.ArtistCommunityDto;
import com.java.dto.CommentDto;
import com.java.dto.FanCommunityDto;

public interface CService {

	// 관리자페이지 게시글찾기
	List<FanCommunityDto> findByNickname(String nickname);

	// 관리자페이지 게시글삭제
	void deleteByCommunityNo(int community_no);

	// 게시글 전체리스트
	List<FanCommunityDto> findAll(int artist_no);

	// 게시글 쓰기
	void fcwrite(FanCommunityDto fcdto);
	
	// 게시글 상세보기
	FanCommunityDto findByCommunityNo(int communityNo);
	
	// 게시글 삭제
	void deleteByCommunity(int communityNo);

	// 게시글 수정
	void updateCommunity(FanCommunityDto existingPost);
	
	//댓글 리스트
//	List<CommentDto> findByACommunityNo(int communityNo);
	//댓글 저장
	void saveComment(CommentDto commentDto);
	//댓글 삭제
	void deleteByComment(int commentNo);
	// 댓글 수
	long countByACommunity(ArtistCommunityDto post);

	// 게시글 상세보기
	List<CommentDto> findByACommunityNo(int communityNo);

}
