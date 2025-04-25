package com.java.service;

import com.java.dto.OrderDto;

public interface TokenService {

	String generateJwtToken(OrderDto orderDto);

	boolean validateJwtToken(String token);

	String getSubjectFromToken(String jwtToken);

}
