package com.java.service;

import java.util.List;

import com.java.dto.AddressDto;
import com.java.dto.CartDto;
import com.java.dto.ShopDto;

public interface CartService {
	// 장바구니 리스트
	List<CartDto> findByMemberNickname(String sessionNick);

	// 장바구니 삭제
	boolean deleteCartItem(int cartNo);
	
	// 카트에 물건추가
	CartDto addToCart(String memberNickname, String cartItemsJson, String cartCategory, int quantity, int finalPrice);

    //구매제한개수 확인
	int getCartItemQuantity(String memberNickname, int shopNo);
	
	// 최근 본 상품 추가
	void updateViewedItems(String memberNickname, int shopNo);
	
	List<ShopDto> getRecentViewedItems(String memberNickname);
	
	// 결제 성공 시 cart 삭제
		void clearCart(String nickName);
}
