package com.java.dto;

import java.sql.Timestamp;

import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder

@Entity
public class NoticeDto {
	@Id // primary key
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int notice_no;						// 공지사항 번호
	@Column(nullable = false, length=100)
	private String notice_title;				// 제목
	@Lob  // 대용량 데이터
	private String notice_content;				// 내용
	@UpdateTimestamp  // 자동시간 입력
	private Timestamp notice_date;				// 등록일
	@Column(nullable = true, length = 100)
	private String notice_file;					// 파일
	@Column(nullable = false, length=20)
	private String notice_type;					// 기본, 굿즈, 티켓
	
	
	@ManyToOne(fetch = FetchType.EAGER) 
	@JoinColumn(name="artist_no")
	private ArtistDto artistDto;   
}
