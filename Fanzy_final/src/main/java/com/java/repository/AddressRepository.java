package com.java.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.java.dto.AddressDto;
import com.java.dto.NicknameDto;

public interface AddressRepository extends JpaRepository<AddressDto, Integer> {
	// 계정 하나 찾기(list)
	@Query("SELECT a FROM AddressDto a WHERE a.member.member_nickname = :sessionNick ORDER BY a.address_isDefault DESC")
	List<AddressDto> findByMemberNickname(@Param("sessionNick") String sessionNick);

	// 배송지 찾기
	@Query("SELECT a FROM AddressDto a WHERE a.address_no = :selectedAddressId")
	Optional<AddressDto> findById(@Param("selectedAddressId") Long selectedAddressId);
}
