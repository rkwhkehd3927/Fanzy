package com.java.service;

import java.util.List;

import com.java.dto.NicknameDto;

public interface NicknameService {

	void save(NicknameDto ndto);

	NicknameDto findByNickName(String memberNickname);

	// 닉네임 중복확인
	boolean isNicknameExists(String nickname_name);

	// 나의 커뮤니티
	List<NicknameDto> findByMemberDto_MemberNickname(String sessionNick);
	
	// 바로가기
	NicknameDto findByMemberId(String id);

	// 닉네임 세션
	List<NicknameDto> findByArtistMemberDto_ArtistMemberNickname(String sessionNick);

}
