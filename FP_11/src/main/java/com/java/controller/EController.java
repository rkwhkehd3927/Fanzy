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
import com.java.dto.EventDto;
import com.java.service.AService;
import com.java.service.EService;

@Controller
public class EController {

	@Autowired EService eService;
	@Autowired AService aService;
	
	// 이벤트 관리
	@GetMapping("/event")
	public String event(Model model) {
		
		List<EventDto> list = eService.findAll();
		model.addAttribute("list",list);
		return "/admin/event";
	} 
	
	// 이벤트 작성
	@GetMapping("/ewrite")
	public String ewrite(Model model) {
		List<ArtistDto> list = aService.findAll(); // ArtistDto 목록 조회
	    model.addAttribute("alist", list);
		return "/admin/ewrite";
	}
	
	// 이벤트 작성등록
	@PostMapping("/ewrite")
	public String ewrite(EventDto edto, 
			@RequestPart("files") MultipartFile files) throws Exception {
		
		System.out.println("event_file: " + files); // ✅ 파일 값 확인
		
		String realName = ""; 
		edto.setEvent_file(""); // 파일첨부가 되지 않았을 경우
		if(files != null && !files.isEmpty()) {
			String origin = files.getOriginalFilename();
			long time = System.currentTimeMillis();
			realName = String.format("%d_%s", time, origin);
			
			String url = "c:/upload/test/";
			File f = new File(url+realName);
			files.transferTo(f);
			
			edto.setEvent_file(realName);
		}
		
		System.out.println("새로운 event_file: " + edto.getEvent_file());
		eService.ewrite(edto);
		
		return "redirect:/event";
	}
	
	// 이벤트 상세보기
	@GetMapping("/eventInfo")
	public String noticeInfo(@RequestParam("event_no") int event_no,Model model) {
		
		List<ArtistDto> list = aService.findAll(); // ArtistDto 목록 조회
		EventDto eventDto = eService.findByEventNo(event_no);
		model.addAttribute("alist", list);
		model.addAttribute("edto",eventDto);
		return "/admin/eventInfo";
	}
	
	// 이벤트 수정
	@PostMapping("/eventupdate")
	public String eventupdate(EventDto edto,
			@RequestPart(value = "files", required = false) MultipartFile files) throws Exception {
		
		EventDto eventDto = eService.findByEventNo(edto.getEvent_no());
		System.out.println("eventDto: " + eventDto);
		if (eventDto == null) {
		    System.out.println("Event not found with no: " + edto.getEvent_no());
		}
		
	    int artistNo = edto.getArtistDto().getArtist_no();
	    ArtistDto adto = aService.findById(artistNo); // DB에서 전체 객체 조회
	    edto.setArtistDto(adto);
		
	    eventDto.setEvent_title(edto.getEvent_title());
	    eventDto.setEvent_type(edto.getEvent_type());
	    eventDto.setEvent_content(edto.getEvent_content());
		// 파일 수정
		if(files != null && !files.isEmpty()) {
			String origin = files.getOriginalFilename();
			long time = System.currentTimeMillis();
			String realName = String.format("%d_%s", time, origin);
			
			String url = "c:/upload/test/";
			File f = new File(url+realName);
			files.transferTo(f);
			
			edto.setEvent_file(realName);
		}
		
		eService.save(edto);
		return "redirect:/event";
	}
	
	// 이벤트정보 삭제
	@ResponseBody
	@PostMapping("/eventdelete")
	public String eventdelete(@RequestParam("event_no") int event_no) {
		//회원정보삭제
		System.out.println("event_no: "+event_no);
		eService.deleteByEventNo(event_no);
		return "1";
	}
	// 이벤트 관리
	@GetMapping("/eventlist")
	public String eventlist(Model model) {
		
		List<EventDto> list = eService.findAll();
		model.addAttribute("list",list);
		return "/Nav_Bar/eventlist";
	}
	
}
