package com.java.service;

import java.util.List;

import com.java.dto.CommentDto;
import com.java.dto.FanCommunityDto;

public interface CMService {

	// 관리자페이지 댓글 보기
	List<CommentDto> findByNickname(String nickname);
	// 관리자페이지 댓글삭제
	void deleteByCommentNo(int comment_no);

	// 게시글 댓글보기
	List<CommentDto> findByCommunityNo(int communityNo);

	// 게시글 댓글저장
	void saveComment(CommentDto commentDto);

	// 댓글 수
	long countByCommunity(FanCommunityDto post);

	// 댓글 삭제
	void deleteByComment(int commentNo);

}
