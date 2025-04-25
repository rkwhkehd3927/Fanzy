	package com.java.dto;

import java.sql.Timestamp;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicInsert;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@DynamicInsert
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
public class ShopDto {
	
	@Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "shop_seq")
    @SequenceGenerator(name = "shop_seq", sequenceName = "shop_seq", allocationSize = 1)
	private int shop_no; 					// 상품고유번호
	@Column(nullable = false, length=30)
	private String shop_category; 			// 카테고리
	@Column(nullable = false, length=30)
	private String shop_title; 				// 상품명
	@Column(length=100)
	private String shop_content; 			// 상품설명
	@Column(length=100)
	private String shop_spinfo; 			// 상품정보
	@Column(length=100)
	private String shop_image1; 			// 상품이미지1
	@Column(length=100)
	private String shop_image2; 			// 상품이미지2
	@Column(length=100)
	private String shop_image3; 			// 상품이미지3
	@Column(nullable = false, length=10)
	private int shop_price; 				// 가격
	@Column(nullable = true, length=10)
	private int shop_discount_price; 		// 할인율
	@Column(length=10)
	private int shop_quantity; 				// 재고수량
	@Column(length=10)
	private int shop_buylimit; 				// 구매수량
	@CreationTimestamp
	private Timestamp shop_date; 			// 등록일

	
    @ManyToOne
    @JoinColumn(name = "artist_no")  // 외래키로 artist와 연결
    @ToString.Exclude
    private ArtistDto artistDto;
}