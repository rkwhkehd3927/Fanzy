package com.java.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.ArtistDto;
import com.java.dto.ArtistMemberDto;
import com.java.dto.NoticeDto;
import com.java.dto.ShopDto;
import com.java.service.AService;
import com.java.service.ArtistMemberService;
import com.java.service.SService;

@Controller
public class SController {

	@Autowired SService sService;
	@Autowired AService aService;
	
	// 관리자페이지 상품 관리
	@GetMapping("/shop")
	public String shop(Model model) {
		
		
		List<ShopDto> list = sService.findAll();
		model.addAttribute("list",list);
		return "/admin/shop";
	}
	
	// 관리자페이지 상품 등록
	@GetMapping("/shopwrite")
	public String shopwrite(Model model) {
		
		List<ArtistDto> list = aService.findAll();
		model.addAttribute("list",list);
		return "/admin/shopwrite";
	}
	
	// 관리자페이지 상품 등록
	@PostMapping("/shopwrite")
	public String shopwrite(ShopDto sdto) throws Exception {
	    sService.shopwrite(sdto);
		return "redirect:/shop";
	}
	
	// 상품 상세보기
	@GetMapping("/shopInfo")
	public String shopInfo(@RequestParam("shop_no") int shop_no,Model model) {
		
		List<ArtistDto> list = aService.findAll(); // ArtistDto 목록 조회
		ShopDto shopDto = sService.findByshopNo(shop_no);
		model.addAttribute("alist", list);
		model.addAttribute("sdto",shopDto);
		return "/admin/shopInfo";
	}
	
	// 상품정보 삭제
	@ResponseBody
	@PostMapping("/shopdelete")
	public String shopdelete(@RequestParam("shop_no") int shop_no) {
		//공지정보삭제
		System.out.println("shop_no: "+shop_no);
		sService.deleteByShopNo(shop_no);
		return "1";
	}
}
