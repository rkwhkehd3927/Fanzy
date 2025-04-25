package com.java.controller;

import java.io.File;
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
import com.java.dto.CommentDto;
import com.java.dto.ConcertDto;
import com.java.dto.ConcertScheduleDto;
import com.java.dto.FanCommunityDto;
import com.java.dto.MemberDto;
import com.java.dto.NoticeDto;
import com.java.dto.SaleConcertDto;
import com.java.dto.ShopDto;
import com.java.service.AService;
import com.java.service.ArtistMemberService;
import com.java.service.CMService;
import com.java.service.CService;
import com.java.service.ConcertScheduleService;
import com.java.service.ConcertService;
import com.java.service.MService;
import com.java.service.SaleConcertService;

@Controller
public class AController {
	
	@Autowired MService mService;
	@Autowired CService cService;
	@Autowired CMService cmService;
	@Autowired AService aService;
	@Autowired ArtistMemberService artistMemberService;
	@Autowired ConcertService concertService;
	@Autowired SaleConcertService saleConcertService;
	@Autowired ConcertScheduleService concertScheduleService;
	
	// 회원 관리
	@GetMapping("/admin")
	public String admin(Model model) {
		
		List<MemberDto> list = mService.findAll();
		model.addAttribute("list",list);
		return "/admin/admin";
	}
	
	// 회원정보
	@GetMapping("/memInfo")
	public String memInfo(@RequestParam("nickname") String nickname,Model model) {
		
		MemberDto memberDto = mService.findByNickname(nickname);
		model.addAttribute("mdto",memberDto);
		return "/admin/memInfo";
	}
	
	// 회원정보 수정
	@PostMapping("/memupdate")
	public String memupdate(MemberDto mdto) {
		MemberDto memberDto = mService.findByNickname(mdto.getMember_nickname());
		System.out.println("MemberDto: " + memberDto);
		if (memberDto == null) {
		    System.out.println("Member not found with nickname: " + mdto.getMember_nickname());
		}
		
		// 변경되지 않는 값
	    mdto.setMember_id(memberDto.getMember_id());
	    mdto.setMember_birth(memberDto.getMember_birth());
	    mdto.setMember_phone(memberDto.getMember_phone());
	    mdto.setMember_date(memberDto.getMember_date());
		
		memberDto.setMember_pw(mdto.getMember_pw());
		memberDto.setMember_name(mdto.getMember_name());
		memberDto.setMember_email(mdto.getMember_email());
		memberDto.setMember_address(mdto.getMember_address());
		memberDto.setMember_country(mdto.getMember_country());
		memberDto.setMember_membership(mdto.getMember_membership());
		memberDto.setMember_usertype(mdto.getMember_usertype());
		mService.save(mdto);
		return "redirect:/admin";
	}
	
	// 회원정보 삭제
	@ResponseBody
	@PostMapping("/memdelete")
	public String memDelete(@RequestParam("member_nickname") String member_nickname) {
		//회원정보삭제
		System.out.println("nickname: "+member_nickname);
		mService.deleteByMemberNickname(member_nickname);
		return "1";
	}
	
	// 커뮤니티 글정보
	@GetMapping("/communityInfo")
	public String communityInfo(@RequestParam("nickname") String nickname,Model model) {
		
		List<FanCommunityDto> list = cService.findByNickname(nickname);
		model.addAttribute("list",list);
		return "/admin/communityInfo";
	}
	
	// 게시판글 삭제
	@ResponseBody
	@PostMapping("/commudelete")
	public String commudelete(@RequestParam("community_no") int community_no) {
		//회원정보삭제
		System.out.println("community_no: "+community_no);
		cService.deleteByCommunityNo(community_no);
		return "1";
	}
	
	// 댓글정보
	@GetMapping("/commentInfo")
	public String commentInfo(@RequestParam("nickname") String nickname,Model model) {
		
		List<CommentDto> list = cmService.findByNickname(nickname);
		model.addAttribute("list",list);
		return "/admin/commentInfo";
	}
	
//	// 댓글 삭제
//	@ResponseBody
//	@PostMapping("/commentdelete")
//	public String commentdelete(@RequestParam("comment_no") int comment_no) {
//		//회원정보삭제
//		System.out.println("comment_no: "+comment_no);
//		cmService.deleteByCommentNo(comment_no);
//		return "1";
//	}
	
	// 아티스트 리스트
	@GetMapping("/aartistlist")
	public String aartistlist(Model model) {
		
		List<ArtistDto> list = aService.findAll();
		model.addAttribute("list",list);
		return "/admin/aartistlist";
	}
	
	// 아티스트 등록
	@GetMapping("/awrite")
	public String awrite(Model model) {
		return "/admin/awrite";
	}
	
	// 아티스트 등록
	@PostMapping("/awrite")
	public String awrite(ArtistDto adto, 
			@RequestPart("files") MultipartFile files,
			@RequestPart("files2") MultipartFile files2,
			@RequestPart("files3") MultipartFile files3) throws Exception {
		
		System.out.println("notice_file: " + files); // ✅ 파일 값 확인
		
		String realName = ""; 
		adto.setArtist_group_image(""); // 파일첨부가 되지 않았을 경우
		if(files != null && !files.isEmpty()) {
			String origin = files.getOriginalFilename();
			long time = System.currentTimeMillis();
			realName = String.format("%d_%s", time, origin);
			
			String url = "c:/upload/test/";
			File f = new File(url+realName);
			files.transferTo(f);
			
			adto.setArtist_group_image(realName);
		}
		
		// 로고 이미지
	    String realName2 = "";
	    adto.setArtist_logo_image("");
	    if(files2 != null && !files2.isEmpty()) {
	        String origin2 = files2.getOriginalFilename();
	        long time2 = System.currentTimeMillis();
	        realName2 = String.format("%d_%s", time2, origin2);
	        
	        String url = "c:/upload/test/";
	        File f2 = new File(url + realName2);
	        files2.transferTo(f2);
	        
	        // DTO의 두 번째 파일 관련 필드에 저장
	        adto.setArtist_logo_image(realName2);
	    }
	    
		// 커버 이미지
	    String realName3 = "";
	    adto.setArtist_cover_image("");
	    if(files3 != null && !files3.isEmpty()) {
	        String origin3 = files3.getOriginalFilename();
	        long time3 = System.currentTimeMillis();
	        realName3 = String.format("%d_%s", time3, origin3);
	        
	        String url = "c:/upload/test/";
	        File f3 = new File(url + realName3);
	        files3.transferTo(f3);
	        
	        // DTO의 두 번째 파일 관련 필드에 저장
	        adto.setArtist_cover_image(realName3);
	    }
		
		aService.awrite(adto);
		
		return "redirect:/aartistlist";
	}
	
	// 아티스트 등록 토글
	@PostMapping("/toggleArtistDisplay")
	@ResponseBody
	public ResponseEntity<?> toggleArtistDisplay(@RequestBody Map<String, Object> payload) {
	    int artistNo = Integer.parseInt((String) payload.get("artist_no"));
	    boolean display = (Boolean) payload.get("display");
	    
	    // 서비스 계층에서 DB 업데이트 수행 (예: updateDisplayStatus)
	    aService.updateDisplayStatus(artistNo, display);
	    
	    return ResponseEntity.ok().build();
	}
		
	// 아티스트 멤버리스트
	@GetMapping("/aartist")
	public String aartist(Model model) {
		
		List<ArtistMemberDto> list = artistMemberService.findAll();
		model.addAttribute("list",list);
		return "/admin/aartist";
	}
	
	// 아티스트 멤버등록
	@GetMapping("/amwrite")
	public String amwrite(Model model) {
		List<ArtistDto> list = aService.findAll(); // ArtistDto 목록 조회
	    model.addAttribute("alist", list);
		return "/admin/amwrite";
	}
	
	// 아티스트 멤버등록
	@PostMapping("/amwrite")
	public String amwrite(ArtistMemberDto amdto, 
			@RequestPart("files") MultipartFile files) throws Exception {
		
		System.out.println("notice_file: " + files); // ✅ 파일 값 확인
		
		String realName = ""; 
		amdto.setArtistmember_image(""); // 파일첨부가 되지 않았을 경우
		if(files != null && !files.isEmpty()) {
			String origin = files.getOriginalFilename();
			long time = System.currentTimeMillis();
			realName = String.format("%d_%s", time, origin);
			
			String url = "c:/upload/test/";
			File f = new File(url+realName);
			files.transferTo(f);
			
			amdto.setArtistmember_image(realName);
		}
		
		artistMemberService.amwrite(amdto);
		
		return "redirect:/aartist";
	}
	
	// 아티스트 멤버 아이디 중복확인
	@PostMapping("/checkartistmemberId")
	@ResponseBody
	public Map<String, Object> checkartistmemberId(@RequestParam("artistmemberId") String artistmemberId) {
	    boolean exists = artistMemberService.existsArtistMemberId(artistmemberId); // DB에 존재하는지 확인
	    Map<String, Object> response = new HashMap<>();
	    response.put("exists", exists);
	    return response;
	}
	
	// 아티스트 멤버 닉네임 중복확인
	@PostMapping("/checkartistmemberNickname")
	@ResponseBody
	public Map<String, Object> checkartistmemberNickname(@RequestParam("artistmemberNickname") String artistmemberNickname) { 
	    boolean exists = artistMemberService.existsArtistMemberNickname(artistmemberNickname); // DB에 존재하는지 확인 
	    Map<String, Object> response = new HashMap<>();
	    response.put("exists", exists);
	    return response;
	}
	
	// 아티스트 상세정보
	@GetMapping("/artistmemberInfo")
	public String artistmemberInfo(@RequestParam("nickname") String nickname,Model model) {
		
		ArtistMemberDto artistmemberDto = artistMemberService.findByNickname(nickname);
		model.addAttribute("amdto",artistmemberDto);
		return "/admin/artistmemberInfo";
	}
	
	// 콘서트 관리
	@GetMapping("/concert")
	public String concert(Model model) {
		
		List<ConcertDto> list = concertService.findAll();
		model.addAttribute("list",list);
		return "/admin/concert";
	}

	// 콘서트 등록
	@GetMapping("/concertwrite")
	public String concertwrite(Model model) {
		List<ArtistDto> list = aService.findAll(); // ArtistDto 목록 조회
	    model.addAttribute("list", list);
		return "/admin/concertwrite";
	}
	
	// 콘서트 등록
	@PostMapping("/concertwrite")
	public String concertwrite(ConcertDto cdto) throws Exception {
		concertService.cwrite(cdto);
		return "redirect:/concert";
	}
	
	// 콘서트 상세보기
	@GetMapping("/concertInfo")
	public String concertInfo(@RequestParam("concert_no") int concert_no,Model model) {
		
		List<ArtistDto> list = aService.findAll(); // ArtistDto 목록 조회
		ConcertDto concertDto = concertService.findByconcertNo(concert_no);
		model.addAttribute("alist", list);
		model.addAttribute("cdto",concertDto);
		return "/admin/concertInfo";
	}
	
	// 콘서트정보 삭제
	@ResponseBody
	@PostMapping("/concertdelete")
	public String concertdelete(@RequestParam("concert_no") int concert_no) {
		concertService.deleteByConcertNo(concert_no);
		return "1";
	}
	
	// 콘서트 티켓관리
	@GetMapping("/saleconcert")
	public String saleconcert(Model model) {
		
		List<SaleConcertDto> list = saleConcertService.findAll();
		model.addAttribute("list",list);
		return "/admin/saleconcert";
	}
	
	// 콘서트 티켓등록
	@GetMapping("/saleconcertwrite")
	public String saleconcertwrite(Model model) {
		List<ConcertDto> list = concertService.findAll(); // ArtistDto 목록 조회
	    model.addAttribute("list", list);
		return "/admin/saleconcertwrite";
	}
	
	// 콘서트 티켓등록
	@PostMapping("/saleconcertwrite")
	public String saleconcertwrite(SaleConcertDto scdto, 
			@RequestPart("files") MultipartFile files,
			@RequestPart("files2") MultipartFile files2) throws Exception {
		
		String realName = ""; 
		scdto.setSaleConcertImage(""); // 파일첨부가 되지 않았을 경우
		if(files != null && !files.isEmpty()) {
			String origin = files.getOriginalFilename();
			long time = System.currentTimeMillis();
			realName = String.format("%d_%s", time, origin);
			
			String url = "c:/upload/test/";
			File f = new File(url+realName);
			files.transferTo(f);
			
			scdto.setSaleConcertImage(realName);
		}
		
		String realName2 = ""; 
		scdto.setSaleConcertDescImage(""); // 파일첨부가 되지 않았을 경우
		if(files2 != null && !files2.isEmpty()) {
			String origin2 = files2.getOriginalFilename();
			long time2 = System.currentTimeMillis();
			realName2 = String.format("%d_%s", time2, origin2);
			
			String url2 = "c:/upload/test/";
			File f2 = new File(url2+realName2);
			files2.transferTo(f2);
			
			scdto.setSaleConcertDescImage(realName2);
		}
		saleConcertService.scwrite(scdto);
		
		return "redirect:/saleconcert";
	}
	
	// 콘서트 티켓상세보기
	@GetMapping("/saleconcertInfo")
	public String saleconcertInfo(@RequestParam("saleconcert_no") int saleconcert_no,Model model) {
		
		List<ConcertDto> list = concertService.findAll();
		SaleConcertDto saleConcertDto = saleConcertService.findBysaleconcertNo(saleconcert_no);
		model.addAttribute("list", list);
		model.addAttribute("scdto",saleConcertDto);
		return "/admin/saleconcertInfo";
	}
	
	// 콘서트정보 삭제
	@ResponseBody
	@PostMapping("/saleconcertdelete")
	public String saleconcertdelete(@RequestParam("saleconcert_no") int saleconcert_no) {
		saleConcertService.deleteByConcertNo(saleconcert_no);
		return "1";
	}
	
	// 스케줄 관리
	@GetMapping("/concertschedule")
	public String concertschedule(Model model) {
		
		List<ConcertScheduleDto> list = concertScheduleService.findAll();
		model.addAttribute("list",list);
		return "/admin/concertschedule";
	}
	
	// 콘서트 스케줄 등록
	@GetMapping("/concertschedulewrite")
	public String concertschedulewrite(Model model) {
		List<SaleConcertDto> list = saleConcertService.findAll();
	    model.addAttribute("list", list);
		return "/admin/concertschedulewrite";
	}
	
	// 콘서트 스케줄 등록
	@PostMapping("/concertschedulewrite")
	public String concertschedulewrite(ConcertScheduleDto csdto) {
		concertScheduleService.cswrite(csdto);
		return "redirect:/concertschedule";
	}
	
	// 콘서트 티켓상세보기
	@GetMapping("/concertscheduleInfo")
	public String concertscheduleInfo(@RequestParam("schedule_no") int concertschedule_no,Model model) {
		
		List<SaleConcertDto> list = saleConcertService.findAll();
		ConcertScheduleDto concertScheduleDto = concertScheduleService.findByconcertscheduleNo(concertschedule_no);
		model.addAttribute("list", list);
		model.addAttribute("csdto",concertScheduleDto);
		return "/admin/concertscheduleInfo";
	}
	
	// 콘서트 스케줄 삭제
	@ResponseBody
	@PostMapping("/concertscheduledelete")
	public String concertscheduledelete(@RequestParam("schedule_no") int schedule_no) {
		concertScheduleService.deleteByScheduleNo(schedule_no);
		return "1";
	}
	
}
