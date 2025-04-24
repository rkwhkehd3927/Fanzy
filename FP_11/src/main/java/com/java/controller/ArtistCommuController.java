package com.java.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.ArtistCommunityDto;
import com.java.dto.ArtistDto;
import com.java.dto.ArtistMemberDto;
import com.java.dto.CommentDto;
import com.java.dto.FanCommunityDto;
import com.java.dto.MemberDto;
import com.java.dto.NicknameDto;
import com.java.dto.NoticeDto;
import com.java.repository.ArtistMemberRepository;
import com.java.repository.NicknameRepository;
import com.java.service.AService;
import com.java.service.ArtistCommuService;
import com.java.service.CService;
import com.java.service.MService;
import com.java.service.MediaService;
import com.java.service.NService;
import com.java.service.NicknameService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ArtistCommuController {
	@Autowired CService commentService;
	@Autowired ArtistCommuService artistCommuService;
	@Autowired MService memberService;
	@Autowired NicknameService nicknameService;
	@Autowired HttpSession session;
	@Autowired AService artistService;
	@Autowired MediaService mediaService;
	@Autowired NService nService;
	@Autowired NicknameRepository nicknameRepository;
	@Autowired ArtistMemberRepository artistMemberRepository;
	
	// 게시글 출력
	@GetMapping("/artistcommunity")
	public String artistCommunity(@RequestParam("artist_no") int artist_no, Model model) {
		
//		String sessionId = (String) session.getAttribute("session_id");
//		
//	    MemberDto memberDto = null;
//	    if (sessionId != null) {
//	        memberDto = memberService.findByMemberId(sessionId); // 세션 ID로 사용자 조회
//	    }
		List<NoticeDto> noticeDto = nService.findbyArtistNo(artist_no);
		
		List<ArtistCommunityDto> list = artistCommuService.findAll(artist_no);
		ArtistDto artistDto = artistService.findByArtistNo(artist_no);
		//ArtistMemberDto artistMemberDto = artistMemberRepository.findByAr(artist_no);
		model.addAttribute("list",list);
		model.addAttribute("ndto",noticeDto);
		model.addAttribute("adto", artistDto);
		model.addAttribute("adto", artistDto);
//		model.addAttribute("mdto", memberDto);
		return "/community/artistcommunity";
	}
	
	// 게시글 상세보기
	@GetMapping("/artistcommunity/detail")
	@ResponseBody
	public List<CommentDto> artistcommunityview(@RequestParam("communityNo") int communityNo) {
		List<CommentDto> clist = commentService.findByACommunityNo(communityNo);
		
		System.out.println("아티스트 댓글리스트 :"+clist);
		
		return clist;
	}
	
	//글쓰기 저장
	@PostMapping("/acwrite")
	public String acwrite(@RequestParam("artist_no") int artistNo,
			@RequestParam(value="imageFile", required=false) MultipartFile files, ArtistCommunityDto acdto) throws Exception {
		
		System.out.println("artistNo  : "+artistNo);
		
	    ArtistDto artistDto = new ArtistDto();
	    artistDto.setArtist_no(artistNo);
	    
	    // ArtistDto에 artistDto 설정
	    acdto.setArtistDto(artistDto);
	    
	    // 세션에서 nickname 바로 가져오기
	    String nickname = (String) session.getAttribute("session_nickname");
	    // 세션 값 체크 (필수!)
	    if (nickname == null || nickname.isEmpty()) {
	        throw new RuntimeException("세션에서 nickname을 가져오지 못했습니다.");
	    }

	    // artistMemberDto를 nickname으로 찾아오기 (반드시 존재해야 함)
	    ArtistMemberDto artistMemberDto = artistMemberRepository.findById(nickname)
	        .orElseThrow(() -> new RuntimeException("해당 ArtistMemberDto가 존재하지 않습니다: " + nickname));

	    // nicknameDto가 이미 존재하는지 확인
	    NicknameDto ndto = nicknameRepository.findByArtistMemberDtoArtistMemberNickname(nickname).orElse(null);
	    if(ndto == null) {
	        // 만약 존재하지 않는다면, 미리 저장해서 영속 상태로 만듭니다.
	        ndto = new NicknameDto();
	        ndto.setNickname_name(nickname);
	        // 필요하다면 연관 엔티티(MemberDto 등)도 설정해줍니다.
	        ndto = nicknameRepository.save(ndto);
	    }
	    acdto.setNicknameDto(ndto);
	    
	    //  이미지 출력
	    acdto.setA_community_image("");
	    if(!files.isEmpty()) {
	    	String origin = files.getOriginalFilename();
	    	long time = System.currentTimeMillis();
	    	String realFileName = String.format("%d_%s", time, origin) ;
	    	String url= "c:/upload/test/";
	    	File f = new File(url+realFileName);
	    	files.transferTo(f);
	    	acdto.setA_community_image(realFileName);
	    }
		artistCommuService.acwrite(acdto);
		return "redirect:/artistcommunity?artist_no="+artistNo;
	}
	
//	//게시글 삭제하기
	@ResponseBody
	@PostMapping("/artistcommunity/delete")
	public String deletePost(@RequestParam("communityNo") int communityNo) {
	    // 게시글 삭제 처리 (삭제 후 결과에 따라 "success" 반환)
	    artistCommuService.deleteByCommunity(communityNo);
	    return "1";
	}
	
	//게시글 수정
		@GetMapping("/artistcommunity/getPost")
		@ResponseBody
		public ArtistCommunityDto getPost(@RequestParam("communityNo") int communityNo) {
		    return artistCommuService.findByACommunityNo(communityNo);
		}
		
		@PostMapping("/acupdate")
		public String acupdate(@ModelAttribute ArtistCommunityDto acdto, 
		        @RequestParam("artist_no") int artistNo,
		        @RequestParam("a_community_no") int communityNo,
		        @RequestParam(value="imageFile1", required=false) MultipartFile file) throws Exception{
		
			// 기존 게시글을 DB에서 조회
		    ArtistCommunityDto existingPost = artistCommuService.findByACommunityNo(communityNo);
		    
		    // 수정할 내용 업데이트 (예: 게시글 내용)
		    existingPost.setA_community_content(acdto.getA_community_content());
		    
		    // 만약 새 이미지가 업로드 되었다면, 파일 처리 후 이미지 파일명 업데이트
		    if (file != null && !file.isEmpty()) {
		    	
		        String originalFilename = file.getOriginalFilename();
		        long time = System.currentTimeMillis();
		        String newFileName = time + "_" + originalFilename;
		        // 실제 이미지 저장 경로 (서버 환경에 맞게 수정)
		        String uploadPath = "c:/upload/test/";  
		        File dest = new File(uploadPath + newFileName);
		        file.transferTo(dest);
		        existingPost.setA_community_image(newFileName);
		    }
		    
		    
		    
		    // 게시글 업데이트 (업데이트 로직이 fanCommuService.updateCommunity()에 구현되어 있다고 가정)
		    artistCommuService.updateCommunity(existingPost);
			
			return "redirect:/artistcommunity?artist_no="+artistNo;
			
		}
		
		//댓글 저장
		@PostMapping("/acomments/add")
		@ResponseBody
		public CommentDto addComment(
		        @ModelAttribute CommentDto commentDto,
		        @RequestParam("communityNo") int communityNo,
		        @RequestParam("memberNickname") String memberNickname) {
		    
		    // 게시글(artistCommunityDto) 설정
		    ArtistCommunityDto addacdto = artistCommuService.findByACommunityNo(communityNo);
		    commentDto.setArtistcommunityDto(addacdto);
		    
		    // 댓글 작성자(MemberDto) 설정 (여기서는 member_nickname을 사용)
		    NicknameDto addmdto = nicknameService.findByNickName(memberNickname);
		    commentDto.setNicknameDto(addmdto);
		    
		    
		    // commentDto의 comment_date는 @CreationTimestamp로 자동 세팅됨
		    commentService.saveComment(commentDto);
		    
		    return commentDto;
		}
		
		
		// 댓글 삭제하기
		@ResponseBody
		@PostMapping("/artistcomment/delete")
		public String deleteComment(@RequestParam("commentNo") int commentNo) {
		    // 게시글 삭제 처리 (삭제 후 결과에 따라 "success" 반환)
			commentService.deleteByComment(commentNo);
		    return "1";
		}
		
		//댓글 수
		@GetMapping("/acomments/count")
		@ResponseBody
		public long getCommentCount(@RequestParam("communityNo") int communityNo) {
		    ArtistCommunityDto post = artistCommuService.findByACommunityNo(communityNo);
		    if(post == null) {
		        return 0;
		    }
		    return commentService.countByACommunity(post);
		}
		
}




