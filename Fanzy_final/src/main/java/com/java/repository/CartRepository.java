package com.java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.java.dto.CartDto;
import com.java.dto.NicknameDto;

import jakarta.transaction.Transactional;

public interface CartRepository extends JpaRepository<CartDto, Integer>  {
		// 계정 하나 찾기(list)
		@Query("SELECT a FROM CartDto a WHERE a.member.member_nickname = :sessionNick")
		List<CartDto> findByMemberNickname(@Param("sessionNick") String sessionNick);
		
		// 장바구니 삭제
		@Modifying
		@Query("DELETE FROM CartDto c WHERE c.cart_no = :cartNo")
		void deleteByCartNo(@Param("cartNo") int cartNo);
	
		@Query("SELECT a FROM CartDto a WHERE a.member.member_nickname = :sessionNick")
		CartDto findByMember_Nickname(String memberNickname);

		@Transactional
		@Modifying
		@Query("DELETE FROM CartDto a WHERE a.member.member_nickname = :nickName")
		void clearCart(@Param("nickName") String nickName);
	

}
