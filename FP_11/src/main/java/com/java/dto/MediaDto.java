package com.java.dto;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
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
public class MediaDto {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int media_no;
	@ManyToOne
	@JoinColumn(name="artist_no")
	private ArtistDto artistDto;
	@Column(nullable=false,length = 100)
	private String media_title;
	@Column(length = 1000)
	private String media_content;
	@UpdateTimestamp
	private String media_date;
	@Column(length = 100)
	private String media_image;
	
	private String media_link;
	
}
