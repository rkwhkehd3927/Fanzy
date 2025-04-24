package com.java.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.java.dto.ArtistMemberDto;
import com.java.dto.FanCommunityDto;
import com.java.dto.NicknameDto;

public interface NicknameRepository extends JpaRepository<NicknameDto, String>{

	@Query(value="select * from nicknamedto where nickname_name=?", nativeQuery = true)
	NicknameDto findByNickName(String memberNickname);

	// 닉네임 중복체크
	@Query("SELECT COUNT(n) > 0 FROM NicknameDto n WHERE n.nickname_name = :nicknameName")
    boolean existsByNicknameName(@Param("nicknameName") String nicknameName);

	// 나의 커뮤니티
	@Query("SELECT n FROM NicknameDto n WHERE n.memberDto.member_nickname = :sessionNick")
	List<NicknameDto> findByMemberDto_MemberNickname(@Param("sessionNick") String sessionNick);

	// 닉네임 찾고(삭제)
	@Query(value="SELECT n FROM NicknameDto n JOIN n.memberDto m WHERE m.member_nickname = :nickname")
	List<NicknameDto> findByNickname(@Param("nickname") String nickname);
	
	// 바로가기
 	@Query("SELECT n FROM NicknameDto n WHERE n.memberDto.member_id = :id")
	NicknameDto findByMemberId(@Param("id") String id);

 	// 닉네임 세션
 	@Query("SELECT n FROM NicknameDto n WHERE n.artistMemberDto.artistmember_nickname = :sessionNick")
	List<NicknameDto> findByArtistMemberDto_ArtistMemberNickname(@Param("sessionNick") String sessionNick);
 	
 	@Query("SELECT n FROM NicknameDto n WHERE n.artistMemberDto.artistmember_nickname = :nickname")
 	Optional<NicknameDto> findByArtistMemberDtoArtistMemberNickname(@Param("nickname") String nickname);

}
