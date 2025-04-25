package com.java.service;

import java.util.List;

import com.java.dto.MemberDto;

public interface MService {

	List<MemberDto> findAll();

	MemberDto findByNickname(String nickname);

	void save(MemberDto mdto);

	//회원탈퇴
	void deleteByMemberNickname(String member_nickname);

	// 로그인 확인
	MemberDto findByIdAndPw(String id, String pw);

	MemberDto findByMemberId(String sessionId);

	// 아이디 중복확인
	boolean existsMemberId(String memberId);

	MemberDto findById(String id);
	
	//회원탈퇴
	void deleteByNickname(String session_nickname);
	
	// 비밀번호 수정
	void updateByPw(String id,String newPW);
	
	// 회원정보 수정
	void updateByUser(String id, String name, String address, String phone);

	// 닉네임 중복확인
	boolean existsMemberNickname(String memberNickname);

    // 적립금 추가 메서드
    void addMemberPoints(String memberId, int pointsToAdd);

    // WebSocket OTP 인증
    MemberDto findByPhone(String phone);

	MemberDto findByNickName(String nickname);

	
}
