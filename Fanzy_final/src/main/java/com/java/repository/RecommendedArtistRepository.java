package com.java.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.java.dto.RecommendedArtistDto;
@Repository
public interface RecommendedArtistRepository extends JpaRepository<RecommendedArtistDto, Integer> {

	
}
