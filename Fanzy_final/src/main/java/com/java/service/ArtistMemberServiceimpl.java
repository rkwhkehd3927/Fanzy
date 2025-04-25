package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.ArtistMemberDto;
import com.java.dto.MemberDto;
import com.java.dto.NicknameDto;
import com.java.repository.ArtistMemberRepository;
import com.java.repository.MRepository;
import com.java.repository.NicknameRepository;

@Service
public class ArtistMemberServiceimpl implements ArtistMemberService {
	
	@Autowired MRepository mRepository;
	@Autowired ArtistMemberRepository artistMemberRepository;
	@Autowired NicknameRepository nicknameRepository;
	
	@Override
	public List<ArtistMemberDto> findByArtistNo(int artist_no) {
		List<ArtistMemberDto> list = artistMemberRepository.findByArtistDto_ArtistNo(artist_no);
		return list;
	}

	// 아티스트 멤버 리스트
	@Override
	public List<ArtistMemberDto> findAll() {
		List<ArtistMemberDto> amlist = artistMemberRepository.findAll();
		return amlist;
	}

	// 아티스트 멤버등록
	@Override
	public void amwrite(ArtistMemberDto amdto) {
		artistMemberRepository.save(amdto);
		
	    // ✅ 2. 일반 회원(MemberDto)도 같은 닉네임으로 저장 (필수 값 포함)
	    MemberDto memberDto = MemberDto.builder()
	        .member_nickname(amdto.getArtistmember_nickname())  // 닉네임 동일하게 설정
	        .member_id(amdto.getArtistmember_id())  // ID 설정
	        .member_pw(amdto.getArtistmember_pw())  // 비밀번호 설정
	        .member_name(amdto.getArtistmember_name())  // 실명 동일하게 설정
	        .member_email(amdto.getArtistmember_email())  // 이메일 동일하게 설정
	        .member_birth(amdto.getArtistmember_birth())  // 생년월일 동일하게 설정
	        .member_phone(amdto.getArtistmember_phone())  // 전화번호 동일하게 설정
	        .member_address(amdto.getArtistmember_address())  // 주소 동일하게 설정
	        .member_postalCode(amdto.getArtistmember_postalCode())  // 우편번호 동일하게 설정
	        .member_country(amdto.getArtistmember_country())  // 국가 동일하게 설정
	        .member_gender(amdto.getArtistmember_gender()) // 성별 설정

	        // ✅ 추가 필드 기본값 설정
	        .member_usertype("artist")  // 아티스트 유형 설정
	        .member_membership("0")  // 기본 멤버십 설정
	        .member_mileage(0)  // 초기 적립금 0
	        .communityCnt(0)  // 초기 커뮤니티 활동 수 0
	        .commentCnt(0)  // 초기 댓글 수 0
	        .build();
	    
	    mRepository.save(memberDto);  // ✅ MemberDto 저장

	    // ✅ 3. NicknameDto 생성 및 저장
	    NicknameDto nicknameDto = NicknameDto.builder()
	        .nickname_name(amdto.getArtistmember_nickname())  // 닉네임 설정
	        .artistMemberDto(amdto)  // 아티스트 연결
	        .artistDto(amdto.getArtistDto())  // 아티스트 정보 연결
	        .memberDto(memberDto)  // ✅ 동일한 닉네임의 일반 회원도 저장
	        .build();
	    
        nicknameRepository.save(nicknameDto);
	}
	
	// 아티스트 아이디 중복확인
	@Override
	public boolean existsArtistMemberId(String artistmemberId) {
		return mRepository.existsByMemberId(artistmemberId) ||
	           artistMemberRepository.existsArtistMemberId(artistmemberId);
	}
	// 아티스트 닉네임 중복확인
	@Override
	public boolean existsArtistMemberNickname(String artistmemberNickname) {
		return mRepository.existsByMemberNickname(artistmemberNickname) ||
				artistMemberRepository.existsArtistMemberNickname(artistmemberNickname);
	}
	// 아티스트 멤버 상세보기
	@Override
	public ArtistMemberDto findByNickname(String nickname) {
		ArtistMemberDto artistmemberdto = artistMemberRepository.findByNickname(nickname);
		return artistmemberdto;
	}

	// 로그인
	@Override
	public ArtistMemberDto findByIdAndPw(String id, String pw) {
		ArtistMemberDto amdto = artistMemberRepository.findByIdAndPw(id,pw);
		return amdto;
	}
}
