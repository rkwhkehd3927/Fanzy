package com.java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.java.dto.ArtistDto;

public interface ARepository extends JpaRepository<ArtistDto, Integer>{
	// 1번부터 리스트 출력
	@Query(value = "SELECT * FROM artistdto WHERE artist_no > 0 ORDER BY artist_no ASC", nativeQuery = true)
	List<ArtistDto> findAll();

	// JPQL을 활용한 검색 (추가적인 제어가 필요할 경우)
	@Query("SELECT a FROM ArtistDto a WHERE a.artist_no > 0 AND LOWER(a.artist_group_name) LIKE LOWER(CONCAT('%', :name, '%')) ORDER BY a.artist_no ASC")
	List<ArtistDto> searchArtists(@Param("name") String name);

	@Query(value = "select * from artistDto where artist_no=?", nativeQuery = true)
	ArtistDto findByArtistNo(int artist_no);
}
