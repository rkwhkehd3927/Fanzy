package com.java.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.java.dto.RecommendedArtistDto;
import com.java.repository.RecommendedArtistRepository;
import com.java.service.ArtistRecommendationService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
public class ArtistRecommendationController {

    private final ArtistRecommendationService arService;
    @Autowired
    private RecommendedArtistRepository recommendedArtistRepository;

    // Constructor injection으로 서비스 주입
    @Autowired
    public ArtistRecommendationController(ArtistRecommendationService artistRecommendationService) {
        this.arService = artistRecommendationService;
    }

    // 추천 아티스트 목록 반환
    @PostMapping("/recommend")
    public Map<String, Object> recommend(@RequestBody Map<String, Object> request) {
        try {
            // 요청에서 artist_no 값을 추출
            int artistNo = (Integer) ((Map<String, Object>) request.get("artistDto")).get("artist_no");
            System.out.println("Received artist_no: " + artistNo); // 로그로 확인

            // 아티스트 추천 로직 처리
            List<RecommendedArtistDto> recommendedArtists = arService.getRecommendedArtists(artistNo);
            System.out.println("추천 리스트: " + recommendedArtists);

            // 추천된 아티스트 목록 반환
            return Map.of("recommendations", recommendedArtists);
        } catch (Exception e) {
            e.printStackTrace();
            return Map.of("error", "서버에서 오류가 발생했습니다.");
        }
    }

    // 추천 아티스트 목록 DB에 저장
    @PostMapping("/save-recommendations")
    public ResponseEntity<String> saveRecommendations(@RequestBody List<RecommendedArtistDto> recommendations) {
        try {
            // 추천 아티스트 목록을 DB에 저장
            arService.saveRecommendations(recommendations);
            System.out.println("컨트롤러 아티스트 : " + recommendations);
            return ResponseEntity.ok("추천 아티스트 목록이 성공적으로 저장되었습니다.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("추천 아티스트 목록 저장에 실패했습니다.");
        }
    }
    @GetMapping("/modal")
    public List<RecommendedArtistDto> getRecommendations() {
        try {
            // DB에서 추천 아티스트 목록 조회
            List<RecommendedArtistDto> recommendations = recommendedArtistRepository.findAll();
            System.out.println("모달 컨트롤러 아티스트 : " + recommendations);
            return recommendations;  // JSON 형식으로 반환
        } catch (Exception e) {
            return new ArrayList<>();  // 오류가 발생하면 빈 리스트 반환
        }
    }
}
