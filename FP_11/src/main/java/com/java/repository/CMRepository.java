package com.java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.java.dto.ArtistCommunityDto;
import com.java.dto.CommentDto;
import com.java.dto.FanCommunityDto;

import jakarta.transaction.Transactional;

public interface CMRepository extends JpaRepository<CommentDto, Integer>{

	// 관리자페이지 댓글보기
	@Query(value="SELECT c FROM CommentDto c WHERE c.memberDto.member_nickname = :nickname")
	List<CommentDto> findByNickname(@Param("nickname") String nickname);

	// 관리자페이지 댓글삭제
	@Modifying
    @Transactional
    @Query(value = "DELETE FROM commentdto WHERE comment_no=?", nativeQuery = true)
	void deleteByCommunityNo(int comment_no);

	// 관리자페이지 댓글 수
	@Query("SELECT COUNT(c) FROM CommentDto c WHERE c.memberDto.member_nickname = :nickname")
	long countCommentByMemberNickname(@Param("nickname") String nickname);

	
	@Query("SELECT cm FROM CommentDto cm WHERE cm.communityDto.f_community_no = :community_no")
	List<CommentDto> findByCommunityNo(@Param("community_no") int community_no);

	// 댓글 수
	long countByCommunityDto(FanCommunityDto communityDto);

	// 댓글삭제
	
	@Query("SELECT c FROM CommentDto c WHERE c.comment_no = :commentNo")
	CommentDto findByCommentNo(@Param("commentNo") int commentNo);


	
	// 댓글 리스트
	@Query("select c from CommentDto c where c.artistcommunityDto.a_community_no = ?1 order by c.comment_date desc")
	List<CommentDto> findByACommunityNo(@Param("communityNo") int communityNo);
	
	//댓글 삭제
	@Query(value="select * from CommentDto where comment_no=?",nativeQuery = true)
	CommentDto findBycommentNo(int commentNo);

	// 댓글 수 
	long countByArtistcommunityDto(ArtistCommunityDto post);


//		@Modifying
//		@Query("DELETE FROM CommentDto c WHERE c.memberDto.member_nickname = :nickname")
//		void deleteByMemberNickname(@Param("nickname") String member_nickname);

}
