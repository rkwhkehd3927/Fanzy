package com.java.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.web.SortDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.ArtistDto;
import com.java.dto.NicknameDto;
import com.java.dto.NoticeDto;
import com.java.service.AService;
import com.java.service.NService;
import com.java.service.NicknameService;

import jakarta.servlet.http.HttpSession;

@Controller
public class NController {

	@Autowired NService nService;
	@Autowired AService aService;
	@Autowired HttpSession session;
	@Autowired NicknameService nickService;
	
	// 공지 관리
	@GetMapping("/notice")
	public String notice(Model model) {
		
		List<NoticeDto> list = nService.findAll();
		model.addAttribute("list",list);
		return "/admin/notice";
	}
	
	// 공지 작성
	@GetMapping("/nwrite")
	public String nwrite(Model model) {
		List<ArtistDto> list = aService.findAll(); // ArtistDto 목록 조회
	    model.addAttribute("alist", list);
		return "/admin/nwrite";
	}
	
	// 공지 작성등록
	@PostMapping("/nwrite")
	public String nwrite(NoticeDto ndto, 
			@RequestPart("files") MultipartFile files) throws Exception {
		
		System.out.println("notice_file: " + files); // ✅ 파일 값 확인
		
		String realName = ""; 
		ndto.setNotice_file(""); // 파일첨부가 되지 않았을 경우
		if(files != null && !files.isEmpty()) {
			String origin = files.getOriginalFilename();
			long time = System.currentTimeMillis();
			realName = String.format("%d_%s", time, origin);
			
			String url = "c:/upload/test/";
			File f = new File(url+realName);
			files.transferTo(f);
			
			ndto.setNotice_file(realName);
		}
		
	    int artistNo = ndto.getArtistDto().getArtist_no();
	    ArtistDto persistentArtist = aService.findById(artistNo);
	    ndto.setArtistDto(persistentArtist);
		
		
		System.out.println("새로운 notice_file: " + ndto.getNotice_file());
		nService.nwrite(ndto);
		
		return "redirect:/notice";
	}
	
	
	// 공지 상세보기
	@GetMapping("/noticeInfo")
	public String noticeInfo(@RequestParam("notice_no") int notice_no,Model model) {
		
		List<ArtistDto> list = aService.findAll(); // ArtistDto 목록 조회
		NoticeDto noticeDto = nService.findByNoticeNo(notice_no);
		model.addAttribute("alist", list);
		model.addAttribute("ndto",noticeDto);
		return "/admin/noticeInfo";
	}
	
	// 공지 수정
	@PostMapping("/noticeupdate")
	public String noticeupdate(NoticeDto ndto,
			@RequestPart(value = "files", required = false) MultipartFile files) throws Exception {
		
		NoticeDto noticeDto = nService.findByNoticeNo(ndto.getNotice_no());
		System.out.println("noticeDto: " + noticeDto);
		if (noticeDto == null) {
		    System.out.println("Notice not found with no: " + ndto.getNotice_no());
		}
		
	    int artistNo = ndto.getArtistDto().getArtist_no();
	    ArtistDto adto = aService.findById(artistNo); // DB에서 전체 객체 조회
	    ndto.setArtistDto(adto);
		
		noticeDto.setNotice_title(ndto.getNotice_title());
		noticeDto.setNotice_type(ndto.getNotice_type());
		noticeDto.setNotice_content(ndto.getNotice_content());
		// 파일 수정
		if(files != null && !files.isEmpty()) {
			String origin = files.getOriginalFilename();
			long time = System.currentTimeMillis();
			String realName = String.format("%d_%s", time, origin);
			
			String url = "c:/upload/test/";
			File f = new File(url+realName);
			files.transferTo(f);
			
			ndto.setNotice_file(realName);
		}
		
		nService.save(ndto);
		return "redirect:/notice";
	}
	
	// 공지정보 삭제
	@ResponseBody
	@PostMapping("/noticedelete")
	public String noticedelete(@RequestParam("notice_no") int notice_no) {
		//공지정보삭제
		System.out.println("notice_no: "+notice_no);
		nService.deleteByNoticeNo(notice_no);
		return "1";
	}
	
	// 공지사항 리스트
	@GetMapping("/noticelist")
	public String notice(
	    @PageableDefault(page=0, size=10) // 페이지는 0부터 시작
	    @SortDefault(sort="notice_no", direction=Sort.Direction.DESC)
	    Pageable pageable, Model model, 
	    @RequestParam("artistNo") int artistNo) {
		
		String sessionNick = (String) session.getAttribute("session_nickname");
		
		// 나의 커뮤니티 리스트 가져오기 (로그인한 경우만)
	    if (sessionNick != null) {
	        List<NicknameDto> nicklist = nickService.findByMemberDto_MemberNickname(sessionNick);
	        model.addAttribute("nicklist", nicklist); // 전체 리스트 유지
	    }

	    // Page 객체 생성
	    Page<NoticeDto> page = nService.findbyArtistNo(pageable,artistNo);
	    List<NoticeDto> nlist = page.getContent();
	    System.out.println("nlist"+nlist);

	    // 현재 페이지는 0부터 시작하므로, 이를 1-based로 변경
	    int nowpage = page.getPageable().getPageNumber()+1;  // 실제로는 0부터 시작
	    int maxpage = page.getTotalPages()-1;  // 총 페이지
	    int startpage = ((nowpage) / 10) * 10;  // 페이지 번호 범위 계산 (1-based)
	    int endpage = startpage + 10 - 1;
	    endpage = Math.min(maxpage, endpage);  // 1~10, 11~20, 21~30...

	    // 모델에 값 전달
	    model.addAttribute("nlist", nlist);
	    model.addAttribute("nowpage", nowpage);  // 실제 페이지 번호
	    model.addAttribute("maxpage", maxpage);
	    model.addAttribute("startpage", startpage);
	    model.addAttribute("endpage", endpage);

	    return "/Nav_Bar/noticelist";
	    
	}
	
	// 공지사항 상세보기
	@CrossOrigin
	@ResponseBody
	@GetMapping("/notice_view")
	public NoticeDto notice_view(@RequestParam("noticeNo") int noticeNo) {
	    // 공지사항 번호를 기준으로 데이터 조회
	    System.out.println("notice_no : " + noticeNo); // noticeNo가 제대로 출력되는지 확인
	    NoticeDto ndto = nService.findByNoticeNo(noticeNo);
	    return ndto;  // NoticeDto 객체를 반환하면 Spring이 자동으로 JSON으로 변환
	}

}
