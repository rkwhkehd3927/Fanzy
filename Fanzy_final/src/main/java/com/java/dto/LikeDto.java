package com.java.dto;

import org.hibernate.annotations.DynamicInsert;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@DynamicInsert
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class LikeDto {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int like_no;
	
	// 어떤 게시글에 좋아요를 눌렀는지
    @ManyToOne
    @JoinColumn(name = "f_community_no")
    private FanCommunityDto communityDto;
	
    // 어떤 사용자가 좋아요를 눌렀는지
    @ManyToOne
    @JoinColumn(name = "nickname_name")
    private NicknameDto nicknameDto;
}
