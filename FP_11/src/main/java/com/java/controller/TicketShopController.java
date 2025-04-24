package com.java.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.java.dto.ReadyResponseDto;
import com.java.dto.TicketDto;
import com.java.service.TicketShopService;

@Controller
public class TicketShopController {

	@Autowired TicketShopService mService;
	
	
    @GetMapping("/Ticketshop")
    public String Ticketshop(Model model) {
    	ArrayList<TicketDto> list =  mService.findAll();
    	model.addAttribute("tlist", list);
    	return "Ticketshop"; // index.jsp 파일을 반환
    }
    // 홈페이지 접속
    @GetMapping("/TicketshopView")
    public String TicketshopView(int tno, Model model) {
    	TicketDto ticketDto = mService.findById(tno);
    	model.addAttribute("tdto", ticketDto);
    	return "TicketshopView"; // index.jsp 파일을 반환
    }

}
