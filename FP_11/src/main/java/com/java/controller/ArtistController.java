package com.java.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.ArtistDto;
import com.java.dto.ArtistMemberDto;
import com.java.dto.MediaDto;
import com.java.dto.MemberDto;
import com.java.dto.NicknameDto;
import com.java.dto.NoticeDto;
import com.java.service.AService;
import com.java.service.ArtistMemberService;
import com.java.service.MService;
import com.java.service.MediaService;
import com.java.service.NService;
import com.java.service.NicknameService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ArtistController {

	@Autowired AService aService;
	@Autowired MService mService;
	@Autowired ArtistMemberService artistMemberService;
	@Autowired NicknameService nicknameService;
	@Autowired NService nService;
	@Autowired HttpSession session;
	@Autowired MediaService mediaService;
	
	// 아티스트 상세보기페이지
	@GetMapping("/artist")
	public String Artist(@RequestParam("artist_no") int artist_no, Model model){
		
		String sessionId = (String) session.getAttribute("session_id");
		
		ArtistDto artistDto = aService.findById(artist_no);
	    MemberDto memberDto = null;
	    if (sessionId != null) {
	        memberDto = mService.findByMemberId(sessionId); // 세션 ID로 사용자 조회
	    }
	    
	    NicknameDto nicknameDto = nicknameService.findByMemberId(sessionId);
	    
		List<ArtistMemberDto> list = artistMemberService.findByArtistNo(artist_no);
		List<MediaDto> medilist = mediaService.findByArtistNo(artist_no);
		System.out.println("멤버 list : "+ list.size());
		System.out.println("멤버 getArtist_no : "+ list);
		
		List<NoticeDto> noticeDto = nService.findbyArtistNo(artist_no);
		
		model.addAttribute("list",list);
		model.addAttribute("adto",artistDto);
		model.addAttribute("mdto",memberDto);
		model.addAttribute("ndto",noticeDto);
		model.addAttribute("nicknameDto",nicknameDto);
		model.addAttribute("medilist",medilist);
		System.out.println("noticeDto : "+noticeDto);
		return "/community/Artist";
		}
	
	    @PostMapping("/nickname")
	    public ResponseEntity<Map<String, Object>> nickname(@RequestBody NicknameDto ndto, HttpSession session) {
	        Map<String, Object> response = new HashMap<>();
	
	        // 닉네임 중복 체크
	        if (nicknameService.isNicknameExists(ndto.getNickname_name())) {
	            response.put("success", false);
	            response.put("message", "이미 사용 중인 닉네임입니다.");
	            return ResponseEntity.ok(response);
	        }
	
	        // 중복이 없으면 닉네임 저장 후 세션에 저장
	        nicknameService.save(ndto);
	        session.setAttribute("nickname", ndto.getNickname_name());
	
	        int artistNo = ndto.getArtistDto().getArtist_no();
	        response.put("success", true);
	        response.put("redirectUrl", "/fancommunity?artist_no=" + artistNo);
	        return ResponseEntity.ok(response);
	    }
	
	
//	// 커뮤니티 닉네임
//	@PostMapping("/nickname")
//	public String nickname(NicknameDto ndto) {
//		nicknameService.save(ndto);
//		
//		session.setAttribute("nickname", ndto.getNickname_name());
//		int artistNo = ndto.getArtistDto().getArtist_no();
//		System.out.println("뭔데"+artistNo);
//		return "redirect:/fancommunity?artist_no="+artistNo;
//	}
	
//	@GetMapping("/ArtistWrite")
//	public String ArtistWrite(ArtistDto adto, @RequestPart MultipartFile files) throws Exception{
//		adto.setArtist_member_image(""); //null이면 에러가 나기때문에 빈공백처리
//		if(!files.isEmpty()) {
//			String origin = files.getOriginalFilename(); //1.jpg
//			long time = System.currentTimeMillis(); //120120120120011_1.jpg
//			String realFileName = String.format("%d_%S", time, origin) ;
//			String url= "c:/upload/artist/";
//			File f = new File(url+realFileName);
//			files.transferTo(f); //폴더에 파일을 서버업로드
//			adto.setArtist_member_image(realFileName); //파일첨부가 되면 다시 이름을 저장
//		}
//	
//	    //artistService.bwrite(adto);
//		// <img src='/images/artist/1.jpg' />
//		// <img src='/upload/artist/1.jpg' />
//		
//		return "ArtistWrite";
//	}
}
