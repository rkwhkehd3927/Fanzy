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
public class MemberDto {
	
	@Column(length=30, unique = true)
	private String member_id;			// 아이디
	@Column(nullable = false,length=30)
	private String member_pw;			// 패스워드;
	@Column(nullable = false,length=20)
	private String member_name;		// 실명
	@Id // primary key
	@Column(nullable = false,length=20)
	private String member_nickname;    // 닉네임
	@Column(nullable = false,length=30)
	private String member_email;       // 이메일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(nullable = false, length = 20)
	private LocalDate member_birth;        // 생년월일 (DATE 타입)
	@Column(nullable = false,length=20)
	private String member_phone;       // 전화번호
	@ColumnDefault("'남자'")
	private String member_gender;		//성별
	@Column(nullable = false,length=50)  
	private String member_address;		// 주소
	@Column(nullable = false,length=20)
	private String member_postalCode;     // 우편번호
	@Column(nullable = false,length=20)
	private String member_country;     // 국가/지역
	@Column(nullable = false,length=20)
	private String member_membership;  // 멤버십 등급
	@Column(nullable = false,length=20)
	private String member_usertype; 	// Fan, Admin
	@Column(length = 10)
	@ColumnDefault("0")
	private int member_mileage; // 적립금
	@CreationTimestamp
	@Column(updatable = false)
	private LocalDateTime member_date;	// 가입일;
	private String member_notification_enabled;
	
	@Column(length=10)
	private int communityCnt;
	@Column(length=10)
	private int commentCnt;
	
}
