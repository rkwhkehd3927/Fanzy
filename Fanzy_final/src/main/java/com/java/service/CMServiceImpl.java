package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.CommentDto;
import com.java.dto.FanCommunityDto;
import com.java.repository.CMRepository;

@Service
public class CMServiceImpl implements CMService {

	@Autowired CMRepository cmRepository;
	
	// 관리자페이지 댓글 보기
	@Override
	public List<CommentDto> findByNickname(String nickname) {
		List<CommentDto> list = cmRepository.findByNickname(nickname);
		return list;
	}

	// 관리자페이지 댓글 삭제
	@Override
	public void deleteByCommentNo(int comment_no) {
		cmRepository.deleteByCommunityNo(comment_no);
	}

	// 게시글 댓글보기
	@Override
	public List<CommentDto> findByCommunityNo(int communityNo) {
		List<CommentDto> clist = cmRepository.findByCommunityNo(communityNo);
		return clist;
	}

	// 댓글 저장
	@Override
	public void saveComment(CommentDto commentDto) {
		cmRepository.save(commentDto);
		
	}

	// 댓글 수
	@Override
	public long countByCommunity(FanCommunityDto communityDto) {
		return cmRepository.countByCommunityDto(communityDto);
	}

	// 댓글 삭제
	@Override
	public void deleteByComment(int commentNo) {
		CommentDto cmdto = cmRepository.findByCommentNo(commentNo);
		cmRepository.delete(cmdto);
		
	}

}
