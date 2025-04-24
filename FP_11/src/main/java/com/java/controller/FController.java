package com.java.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.java.dto.ArtistDto;
import com.java.dto.ArtistMemberDto;
import com.java.dto.MemberDto;
import com.java.dto.NicknameDto;
import com.java.service.AService;
import com.java.service.ArtistMemberService;
import com.java.service.MService;
import com.java.service.NicknameService;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class FController {
	@Autowired MService mService;
	@Autowired HttpSession session;
	@Autowired AService aService;
	@Autowired NicknameService nickService;
	@Autowired ArtistMemberService artistMemberService;
	
	// 메인화면
	@GetMapping("/")
	public String index(Model model, HttpSession session) {
	    String sessionId = (String) session.getAttribute("session_id");
	    String sessionNick = (String) session.getAttribute("session_nickname");
	    String memberNickname = (String) session.getAttribute("session_nickname_name");

	    // 📌 아티스트 리스트 가져오기 (원본)
	    List<ArtistDto> list = aService.findAll();
	    model.addAttribute("list", list); // 전체 리스트 JSP로 넘김

	    // 📌 중복 없는 랜덤 8개 선택
	    Set<ArtistDto> uniqueSet = new LinkedHashSet<>(list);
	    List<ArtistDto> randomList = new ArrayList<>(uniqueSet);
	    Collections.shuffle(randomList);

	    int maxArtists = 8;
	    if (randomList.size() > maxArtists) {
	        randomList = randomList.subList(0, maxArtists);
	    }

	    // 📌 8개 중에서 긴 이름(11자 이상) 개수 확인
	    long longNameCount = randomList.stream()
	        .filter(adto -> adto.getArtist_group_name().length() >= 11)
	        .count();

	    // 📌 긴 이름 개수만큼 리스트 개수 줄이기 (최소 1개는 남기기)
	    int finalSize = (int) (maxArtists - longNameCount);
	    if (finalSize < 1) finalSize = 1;

	    if (randomList.size() > finalSize) {
	        randomList = randomList.subList(0, finalSize);
	    }

	    model.addAttribute("randomList", randomList); // JSP에서 사용할 리스트
	    System.out.println("최종 랜덤 리스트 개수: " + randomList.size()); // 디버깅 로그

	 // 나의 커뮤니티 리스트 가져오기 (로그인한 경우만)
	    if (sessionNick != null) {
	    	// 먼저 멤버 닉네임으로 조회
	        List<NicknameDto> nlist = nickService.findByMemberDto_MemberNickname(sessionNick);
	        
	        // 결과가 없으면 아티스트 닉네임으로 조회
	        if (nlist == null || nlist.isEmpty()) {
	            nlist = nickService.findByArtistMemberDto_ArtistMemberNickname(sessionNick);
	        }
	        
	        model.addAttribute("nlist", nlist);
	        
	    }

	    // 📌 로그인한 경우 MemberDto 정보 가져오기
	    if (sessionId != null) {
	        MemberDto memberDto = mService.findByMemberId(sessionId);
	        model.addAttribute("mdto", memberDto);
	    }
	    
	 // 로그인한 경우 NicknameDto 정보 가져오기
	    if (memberNickname != null) {
	    	NicknameDto nicknameDto = nickService.findByNickName(memberNickname);
	    	model.addAttribute("ndto", nicknameDto);
	    }
	    
	    List<ArtistMemberDto> alist = artistMemberService.findByArtistNo(1);
	    model.addAttribute("alist", alist);

	    return "index";
	}



		// 아티스트 랜덤출력
		@GetMapping("/refresh-random-list")
		@ResponseBody
		public List<ArtistDto> refreshRandomList() {
		    List<ArtistDto> list = aService.findAll();

		    // 📌 중복 없는 랜덤 8개 선택
		    Set<ArtistDto> uniqueSet = new LinkedHashSet(list);
		    List<ArtistDto> randomList = new ArrayList<>(uniqueSet);
		    Collections.shuffle(randomList);

		    int maxArtists = 8;
		    if (randomList.size() > maxArtists) {
		        randomList = randomList.subList(0, maxArtists);
		    }

		    // 📌 8개 중에서 긴 이름(11자 이상) 개수 확인
		    long longNameCount = randomList.stream()
		        .filter(adto -> adto.getArtist_group_name().length() >= 11)
		        .count();

		    // 📌 긴 이름 개수만큼 리스트 개수 줄이기 (최소 1개는 남기기)
		    int finalSize = (int) (maxArtists - longNameCount);
		    if (finalSize < 1) finalSize = 1; // 리스트가 완전히 사라지는 걸 방지

		    if (randomList.size() > finalSize) {
		        randomList = randomList.subList(0, finalSize);
		    }

		    return randomList; // JSON 형태로 반환
		}

	
		// 환경설정 호출
		@GetMapping("/user_setting")
		public String user_setting(Model model) {
			String sessionNick = (String) session.getAttribute("session_nickname");
			String id = (String) session.getAttribute("session_id");
			
			// 나의 커뮤니티 리스트 가져오기 (로그인한 경우만)
		    if (sessionNick != null) {
		        List<NicknameDto> nlist = nickService.findByMemberDto_MemberNickname(sessionNick);
		        model.addAttribute("nlist", nlist); // 전체 리스트 유지
		    }
		    
		    // 나이확인용
		    if (id != null) {
		    	MemberDto memberdto = mService.findById(id);
		        model.addAttribute("mdto", memberdto);
		    }

			return "/user_setting";
		}
	
}
