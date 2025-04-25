	package com.java.service;

import java.util.ArrayList;

import com.java.dto.TicketDto;

public interface TicketShopService {

	ArrayList<TicketDto> findAll();

	TicketDto findById(int tno);

}
