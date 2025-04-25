package com.java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.java.dto.ArtistMemberDto;

public interface ArtistMemberRepository extends JpaRepository<ArtistMemberDto, String> {

	@Query(value = "select * from artistmemberdto where artist_no=?", nativeQuery = true)
	List<ArtistMemberDto> findByArtistDto_ArtistNo(int artist_no);

	// 로그인
	@Query(value = "select * from artistmemberdto where artistmember_id=? and artistmember_pw=?", nativeQuery = true)
	ArtistMemberDto findByIdAndPw(String id, String pw);

	// 아티스트 상세페이지
	@Query(value="select * from artistmemberdto where artistmember_nickname=?", nativeQuery=true)
	ArtistMemberDto findByNickname(String nickname);

	// 아티스트 멤버 아이디 중복확인
	@Query("select case when count(m) > 0 then true else false end from ArtistMemberDto m where m.artistmember_id = :artistmemberId")
	boolean existsArtistMemberId(@Param("artistmemberId") String artistmemberId);

	// 아티스트 멤버 닉네임 중복확인
	@Query("select case when count(m) > 0 then true else false end from ArtistMemberDto m where m.artistmember_nickname = :artistmemberNickname")
	boolean existsArtistMemberNickname(@Param("artistmemberNickname") String artistmemberNickname);

}
