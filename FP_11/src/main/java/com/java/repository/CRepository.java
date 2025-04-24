package com.java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.java.dto.FanCommunityDto;

import jakarta.transaction.Transactional;


public interface CRepository extends JpaRepository<FanCommunityDto, Integer>{

	// 관리자페이지 게시글보기
	@Query(value="SELECT c FROM FanCommunityDto c JOIN c.memberDto m WHERE m.member_nickname = :nickname")
	List<FanCommunityDto> findByNickname(@Param("nickname") String nickname);

	// 게시글 삭제 (관리자페이지 + 커뮤니티)
	@Modifying
    @Transactional
    @Query(value = "DELETE FROM fancommunitydto WHERE f_community_no=?", nativeQuery = true)
	void deleteByCommunityNo(int community_no);

	// 게시글 수
	@Query("SELECT COUNT(c) FROM FanCommunityDto c WHERE c.memberDto.member_nickname = :nickname")
	long countCommunityByMemberNickname(@Param("nickname") String nickname);

	// 게시글 상세보기
	@Query("SELECT c FROM FanCommunityDto c WHERE c.f_community_no = :community_no")
	FanCommunityDto findByCommunityNo(@Param("community_no") int community_no);

	@Query("SELECT a FROM FanCommunityDto a WHERE a.artistDto.artist_no = :artist_no order by a.f_community_date desc")
	List<FanCommunityDto> findAll(@Param("artist_no") int artist_no);

//	@Modifying
//	@Query("DELETE FROM CommunityDto c WHERE c.memberDto.member_nickname = :nickname")
//	void deleteByMemberNickname(@Param("nickname") String member_nickname);


}
