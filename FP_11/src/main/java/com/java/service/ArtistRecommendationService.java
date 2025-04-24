package com.java.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import com.java.dto.RecommendedArtistDto;
import com.java.repository.RecommendedArtistRepository;

import jakarta.transaction.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;

@Service
public class ArtistRecommendationService {

    @Autowired
    private RecommendedArtistRepository recommendedArtistRepository;  // 추천 아티스트 저장소
    
    private final RestTemplate restTemplate;

    public ArtistRecommendationService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    // Python 서버에 추천 아티스트를 요청
    public List<RecommendedArtistDto> getRecommendedArtists(int artistNo) {
        String url = "http://localhost:5001/recommend";  // Python 서버 URL

        Map<String, Object> requestData = new HashMap<>();
        Map<String, Object> artistDto = new HashMap<>();
        artistDto.put("artist_no", artistNo);  // 클라이언트에서 받은 artist_no
        requestData.put("artistDto", artistDto);

        try {
            // Python 서버에 POST 요청 보내기
            ResponseEntity<Map> responseEntity = restTemplate.exchange(
                url,
                HttpMethod.POST,
                new HttpEntity<>(requestData),
                Map.class
            );

            // Python 서버 응답 처리
            Map<String, Object> body = responseEntity.getBody();
            List<Map<String, String>> recommendedArtists = (List<Map<String, String>>) body.get("recommendations");

            // ArtistDto에서 RecommendedArtistDto로 변환
            List<RecommendedArtistDto> recommendations = new ArrayList<>();
            for (Map<String, String> artist : recommendedArtists) {
      
                RecommendedArtistDto recommendedArtist = new RecommendedArtistDto(
                    artist.get("name"),
                    artist.get("imagePath"),
                    artist.get("artist_no") // String으로 전달, 생성자에서 변환
                );
                recommendations.add(recommendedArtist);
            }

            return recommendations;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Flask API 호출 오류");
        }
    }

    // 추천 아티스트 목록을 DB에 저장
    @Transactional
    public void saveRecommendations(List<RecommendedArtistDto> recommendations) {
        try {
        	// 기존 데이터 삭제
            recommendedArtistRepository.deleteAll();

            // 새로운 데이터 저장
            recommendedArtistRepository.saveAll(recommendations);
            System.out.println("서비스 아티스트  : "+recommendations);
        } catch (Exception e) {
            e.printStackTrace();  // 예외가 발생하면 로그를 출력하여 확인
            throw new RuntimeException("추천 아티스트 목록 저장 실패");
        }
    }

}
