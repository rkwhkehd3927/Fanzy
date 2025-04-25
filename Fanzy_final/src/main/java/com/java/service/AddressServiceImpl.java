package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.AddressDto;
import com.java.repository.AddressRepository;

@Service
public class AddressServiceImpl implements AddressService {
	@Autowired AddressRepository aRepository;

	// 배송지목록 가져오기
	@Override
	public List<AddressDto> findByMemberNickname(String sessionNick) {
		List<AddressDto> aList = aRepository.findByMemberNickname(sessionNick);
		return aList;
	}

	// 기본배송지 저장
	@Override
	public void save(AddressDto address) {
		aRepository.save(address);
		
	}
	
	// 배송지 찾기
	@Override
	public AddressDto findById(Long selectedAddressId) {
		return aRepository.findById(selectedAddressId).orElse(null);
	}
}
