package com.java.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicInsert;
import org.springframework.format.annotation.DateTimeFormat;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@DynamicInsert // 데이터값이 null일 경우 컬럼에서 제외
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity // jpa 자동생성(table명:MemberDto,column명:변수명)
public class ArtistMemberDto {
	
	@Column(length=30, unique = true)
	private String artistmember_id;			// 아이디
	@Column(nullable = false,length=30)
	private String artistmember_pw;			// 패스워드;
	@Column(nullable = false,length=20)
	private String artistmember_name;		// 실명
	@Id // primary key
	@Column(nullable = false,length=20)
	private String artistmember_nickname;    // 닉네임
	@Column(nullable = false,length=30)
	private String artistmember_email;       // 이메일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(nullable = false, length = 20)
	private LocalDate artistmember_birth;    // 생년월일 (DATE 타입)
	@Column(nullable = false,length=20)
	private String artistmember_phone;       // 전화번호
	@ColumnDefault("'남자'")
	private String artistmember_gender;		// 성별
	@Column(nullable = false,length=50)  
	private String artistmember_address;		// 주소
	@Column(nullable = false,length=20)
	private String artistmember_postalCode;     // 우편번호
	@Column(nullable = false,length=20)
	private String artistmember_country;     // 국가/지역
	@CreationTimestamp
	@Column(updatable = false)
	private LocalDateTime artistmember_date;	// 가입일;

	@Column(length = 300)
	private String artistmember_image;			// 아티스트 이미지
	private String artistmember_notification_enabled;
		
	@ManyToOne
	@JoinColumn(name="artist_no")
	private ArtistDto artistDto;
	
}
