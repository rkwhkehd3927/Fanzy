package com.java.dto;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class RecommendedArtistDto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;  // 추천 아티스트 고유 ID (자동 증가)
    
    @Column(name = "artist_no", length=10)
    private int artist_no;

    @Column(name = "name",length = 20) // 테이블의 컬럼 이름과 매핑
    private String name;  // 추천 아티스트의 이름

    @Column(name = "image_path",length = 100)  // 테이블의 컬럼 이름과 매핑
    private String imagePath;  // 추천 아티스트의 이미지 경로
    
    public RecommendedArtistDto(String name, String imagePath, String artist_no) {
        this.name = name;
        this.imagePath = imagePath;
        this.artist_no = Integer.parseInt(artist_no); // String을 int로 변환하여 할당
    }

    // Getter 및 Setter
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    public int getArtist_no() {
        return artist_no;
    }

    public void setArtist_no(int artist_no) {
        this.artist_no = artist_no;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
}
