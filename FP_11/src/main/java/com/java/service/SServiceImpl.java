package com.java.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.ShopDto;
import com.java.repository.ShopRepository;

@Service
public class SServiceImpl implements SService{

	@Autowired ShopRepository sRepository;
	
	@Override
	public List<ShopDto> findAll() {
		
		List<ShopDto> list = sRepository.findAll();
		return list;
	}
	
	//가수상품전체
	@Override
	public List<ShopDto> findByNo(int artist_no) {
		List<ShopDto> list = sRepository.findByNo(artist_no);
		return list;
	}

	//가수상품상세
	@Override
	public Optional<ShopDto> findById(int shop_no) {
		Optional<ShopDto> list = sRepository.findById(shop_no);
		return list;
	}

	// 관리자페이지 상품등록
	@Override
	public void shopwrite(ShopDto sdto) {
		sRepository.save(sdto);
		
	}

	// 관리자페이지 상품수정
	@Override
	public ShopDto findByshopNo(int shop_no) {
		ShopDto sdto = sRepository.findByshopNo(shop_no);
		return sdto;
	}

	@Override
	public void deleteByShopNo(int shop_no) {
		sRepository.deleteById(shop_no);
		
	}
}
