package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.NicknameDto;
import com.java.repository.NicknameRepository;

@Service
public class NicknameServiceimpl implements NicknameService {

	@Autowired NicknameRepository nicknameRepository;
	
	@Override
	public void save(NicknameDto ndto) {
		nicknameRepository.save(ndto);
	}

	@Override
	public NicknameDto findByNickName(String memberNickname) {
		NicknameDto ndto = nicknameRepository.findByNickName(memberNickname);
		return ndto;
	}


	// 닉네임 중복확인
	@Override
	public boolean isNicknameExists(String nickname_name) {
		return nicknameRepository.existsByNicknameName(nickname_name);
	}

	// 나의 커뮤니티
	@Override
	public List<NicknameDto> findByMemberDto_MemberNickname(String sessionNick) {
	    return nicknameRepository.findByMemberDto_MemberNickname(sessionNick); // ✅ 올바르게 수정
		
	}

	// 바로가기
	@Override
	public NicknameDto findByMemberId(String id) {
		
		NicknameDto nndto = nicknameRepository.findByMemberId(id);
		return nndto;
	}

	// 닉네임 세션
	@Override
	public List<NicknameDto> findByArtistMemberDto_ArtistMemberNickname(String sessionNick) {
		
		return nicknameRepository.findByArtistMemberDto_ArtistMemberNickname(sessionNick);
	}

}
