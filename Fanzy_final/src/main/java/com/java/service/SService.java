package com.java.service;

import java.util.List;
import java.util.Optional;

import com.java.dto.ShopDto;

public interface SService {

	//전체 상품리스트
	List<ShopDto> findAll();

	//가수 상품 전체
	List<ShopDto> findByNo(int artist_no);

	//상품 하나 상세
	Optional<ShopDto> findById(int shop_no);

	// 관리자페이지 상품등록
	void shopwrite(ShopDto sdto);

	// 관리자페이지 상품수정
	ShopDto findByshopNo(int shop_no);

	// 관리자페이지 상품삭제
	void deleteByShopNo(int shop_no);

}
