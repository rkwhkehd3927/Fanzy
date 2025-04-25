package com.java.dto;

import java.sql.Timestamp;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.UpdateTimestamp;

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

@DynamicInsert
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
public class FanCommunityDto {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int f_community_no;				// 글 번호
	
	@Column(nullable = false, length=1000)
	private String f_community_content; 		// 내용
	@UpdateTimestamp
	private Timestamp f_community_date; 		// 등록일
	@Column(nullable = true, length=100)
	private String f_community_image; 		// 이미지

    @ManyToOne
    @JoinColumn(name = "member_nickname")  // 외래키로 Member와 연결
    private MemberDto memberDto;
    
	@ManyToOne
	@JoinColumn(name="artist_no")
	private ArtistDto artistDto;
	
	@ManyToOne
	@JoinColumn(name="nickname_name")
	private NicknameDto nicknameDto;

}