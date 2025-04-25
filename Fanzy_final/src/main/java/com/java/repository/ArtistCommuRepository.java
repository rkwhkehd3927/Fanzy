package com.java.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.java.dto.ArtistCommunityDto;
import com.java.dto.FanCommunityDto;

import jakarta.transaction.Transactional;

public interface ArtistCommuRepository extends JpaRepository<ArtistCommunityDto, Integer>{
	@Query(value="select * from artistcommunitydto order by a_community_no desc", nativeQuery = true)
	List<ArtistCommunityDto> findAll();

	
	@Query(value="select * from artistcommunitydto where a_community_no=?",nativeQuery = true)
	ArtistCommunityDto findByCommunityNo(int communityNo);
	

	@Modifying
    @Transactional
    @Query(value = "DELETE FROM artistcommunitydto WHERE a_community_no=?", nativeQuery = true)
    void deleteByCommunityNo(int communityNo);

	@Query("SELECT a FROM ArtistCommunityDto a WHERE a.artistDto.artist_no = :artist_no order by a.a_community_date desc")
	List<ArtistCommunityDto> findAll(@Param("artist_no") int artist_no);


}
