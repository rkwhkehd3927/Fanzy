package com.java.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.java.dto.ArtistDto;
import com.java.repository.ARepository;

@RestController
@RequestMapping("/search")
public class SearchController {

    @Autowired
    private ARepository artistRepository;

    @GetMapping
    public List<Map<String, Object>> searchArtists(@RequestParam(required = false) String query) {
        // 검색어가 없거나 공백이면 빈 리스트 반환 (쿼리 실행 방지)
        if (query == null || query.trim().isEmpty()) {
            return Collections.emptyList();
        }

        List<ArtistDto> artists = artistRepository.searchArtists(query);

        return artists.stream()
            .map(artist -> {
                Map<String, Object> map = new HashMap<>();
                map.put("name", artist.getArtist_group_name()); // ✅ 아티스트 이름
                map.put("imageUrl", artist.getArtist_logo_image()); // ✅ 아티스트 이미지 URL
                map.put("no", artist.getArtist_no()); // ✅ int도 저장 가능 (Object 사용)
                return map;
            })
            .collect(Collectors.toList());
    }
}

