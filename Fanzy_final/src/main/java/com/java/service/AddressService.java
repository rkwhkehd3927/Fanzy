package com.java.service;

import java.util.List;

import com.java.dto.AddressDto;

public interface AddressService {
	// 주소목록 갖고오기
	List<AddressDto> findByMemberNickname(String sessionNick);

	// 기본배송지 저장
	void save(AddressDto address);
	
	// 배송지 찾기
	AddressDto findById(Long selectedAddressId);
}
