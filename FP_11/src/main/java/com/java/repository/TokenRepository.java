package com.java.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.dto.TokenDto;

public interface TokenRepository extends JpaRepository<TokenDto, Integer>{

	Optional<TokenDto> findByToken(String token);

}
