package com.java.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.java.dto.MemberDto;

import jakarta.transaction.Transactional;

// JpaRepository<MemberDto, String> : <리턴타입,primary key타입>
public interface MRepository extends JpaRepository<MemberDto, String>{

	@Query(value="select * from memberdto where member_nickname=?", nativeQuery=true)
	MemberDto findByNickname(String nickname);

	// 회원탈퇴
	@Modifying
    @Transactional
    @Query(value = "DELETE FROM memberdto WHERE member_nickname=?", nativeQuery = true)
    void deleteByMemberNickname(String member_nickname);
	
	// 로그인
	@Query("SELECT m FROM MemberDto m WHERE m.member_id = :id AND m.member_pw = :pw")
	MemberDto findByIdAndPw(@Param("id") String id, @Param("pw") String pw);

	@Query(value = "select * from memberdto where member_id=?", nativeQuery = true)
	Optional<MemberDto> findById(String sessionId);

	@Query("select case when count(m) > 0 then true else false end from MemberDto m where m.member_id = :memberId")
	boolean existsByMemberId(@Param("memberId") String memberId);
	
	// 회원탈퇴
	@Modifying
	@Transactional
	@Query("DELETE FROM MemberDto m WHERE m.member_nickname = :session_nickname")
	void deleteByNickname(@Param("session_nickname") String session_nickname);
	
	// 비밀번호 수정
	@Modifying
	@Transactional
	@Query("UPDATE MemberDto m SET m.member_pw = :pw WHERE m.member_id = :id")
	void updateByPw(@Param("id") String id, @Param("pw") String newPw);
	
	// 회원수정
	@Modifying
	@Transactional
	@Query("UPDATE MemberDto m SET m.member_name = :name, m.member_address = :address, m.member_phone = :phone WHERE m.member_id = :id")
	void updateByUser(@Param("id") String id, @Param("name") String name, @Param("address") String address, @Param("phone") String phone);

	// 닉네임 중복확인
	@Query("select case when count(m) > 0 then true else false end from MemberDto m where m.member_nickname = :memberNickname")
	boolean existsByMemberNickname(@Param("memberNickname") String memberNickname);

	@Query(value = "select * from memberdto where member_nickname=?", nativeQuery = true)
	Optional<MemberDto> findByMemberNickname(String memberNickname);

	@Query(value = "select * from memberdto where member_id=?", nativeQuery = true)
	Optional<MemberDto> findByMemberId(String memberId);
	
	//적립금저장
	@Modifying
	@Transactional
	@Query("UPDATE MemberDto m SET m.member_mileage = :newPoints WHERE m.member_id = :memberId")
	void updatePoints(@Param("memberId") String memberId, @Param("newPoints") int newPoints);

	@Query(value="select * from memberdto where member_nickname=?",nativeQuery = true)
	MemberDto findByNickName(String memberNickname);
	//
	@Query(value="select * from memberdto where member_phone=?",nativeQuery = true)
	MemberDto findByPhone(String phone);

	
}
