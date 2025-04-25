package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.dto.ArtistDto;
import com.java.dto.LiveDto;
import com.java.dto.MediaDto;
import com.java.service.AService;
import com.java.service.LiveService;
import com.java.service.MediaService;

@Controller
public class MediaController {

	@Autowired MediaService mediaService;
	@Autowired AService artistService;
	@Autowired LiveService liveService;
	
	@GetMapping("/media")
	public String media(@RequestParam("artist_no") int artistNo,Model model) {
		List<MediaDto> mediaList = mediaService.findByArtistNo(artistNo);
		List<LiveDto> liveList = liveService.findByArtistNo(artistNo);
		ArtistDto artistDto = artistService.findByArtistNo(artistNo);
		
		model.addAttribute("mediaList", mediaList);
		model.addAttribute("adto", artistDto);
		model.addAttribute("liveList", liveList);
		System.out.println(mediaList);
		return "/community/media";
	}
	
    @GetMapping("/mobile")
    public String mobile() {
        return "mobile";
    }
    
    @GetMapping("/OTP")
    public String OTP() {
        return "OTP"; // /WEB-INF/views/desktopOTP.jsp
    }
}
