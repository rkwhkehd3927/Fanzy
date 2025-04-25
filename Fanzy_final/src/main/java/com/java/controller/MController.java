package com.java.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.dto.AddressDto;
import com.java.dto.ArtistMemberDto;
import com.java.dto.CartDto;
import com.java.dto.MemberDto;
import com.java.dto.NicknameDto;
import com.java.dto.OrderItemDto;
import com.java.dto.ShopDto;
import com.java.service.AddressService;
import com.java.service.ArtistMemberService;
import com.java.service.CartService;
import com.java.service.MService;
import com.java.service.NicknameService;
import com.java.service.OrderitemService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MController {
	
	@Autowired MService mService;
	@Autowired HttpSession session;
	@Autowired CartService cartservice;
	@Autowired AddressService addressService;
	@Autowired NicknameService nickService;
	@Autowired ArtistMemberService amService;
	@Autowired OrderitemService oiservice;
	
	// 로그인페이지 호출
	@GetMapping("/login")
	public String login() {
		return "/member/login";
	}
	
	// 로그인 확인
	@PostMapping("/login")
	public String login(String id, String pw) {
	    // 팬(Fan) 회원 로그인 확인
	    MemberDto memberDto = mService.findByIdAndPw(id, pw);
	    
	    if (memberDto == null) {
	        // 아이디가 없는 경우
	        if (mService.findById(id) == null) {  // 아이디만 조회해서 없으면
	            return "redirect:/login?chkLogin=0";  // 계정이 없다는 메시지로 리다이렉트
	        } else {
	            // 아이디는 있지만 비밀번호가 틀린 경우
	            return "redirect:/login?chkLogin=2";  // 비밀번호 틀린 경우 메시지로 리다이렉트
	        }
	    }
	    
	    if (memberDto != null) {
	        session.setAttribute("session_id", id);
	        session.setAttribute("memberType", "Fan");
	        session.setAttribute("session_nickname", memberDto.getMember_nickname());
	        return "redirect:/login?chkLogin=1";
	    }

	    // ✅ 아티스트 회원(ArtistMemberDto) 로그인 확인
	    ArtistMemberDto artistMemberDto = amService.findByIdAndPw(id, pw);
	    if (artistMemberDto != null) {
	        session.setAttribute("session_id", id);
	        session.setAttribute("memberType", "artist"); 
	        session.setAttribute("session_nickname", artistMemberDto.getArtistmember_nickname());
	        
	        // ✅ ArtistMemberDto 객체 자체를 세션에 저장 (변경된 부분)
	        session.setAttribute("artistMember", artistMemberDto); 

	        return "redirect:/login?chkLogin=1";
	    }

	    return "redirect:/login?chkLogin=0"; // 로그인 실패 시
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout() {
		session.invalidate();
		return "redirect:/?chkLogin=0";
	}
	
	// 약관동의
	@GetMapping("/memberTerms")
	public String memberTerms() {
		return "/member/memberTerms";
	}
	
	// 회원가입 페이지
	@GetMapping("/member")
	public String member() {
		return "/member/member";
	}
	
	// 아이디 중복확인
	@PostMapping("/checkMemberId")
	@ResponseBody
	public Map<String, Object> checkMemberId(@RequestParam("memberId") String memberId) {
	    boolean exists = mService.existsMemberId(memberId); // DB에 존재하는지 확인
	    Map<String, Object> response = new HashMap<>();
	    response.put("exists", exists);
	    return response;
	}
	
	// 닉네임 중복확인
	@PostMapping("/checkMemberNickname")
	@ResponseBody
	public Map<String, Object> checkMemberNickname(@RequestParam("memberNickname") String memberNickname) {
	    boolean exists = mService.existsMemberNickname(memberNickname); // DB에 존재하는지 확인
	    Map<String, Object> response = new HashMap<>();
	    response.put("exists", exists);
	    return response;
	}
	
	// 회원가입
	@PostMapping("/memberInput")
	public String memberInput(@ModelAttribute MemberDto mdto) {
		
		mService.save(mdto);
		
	    AddressDto address = new AddressDto();
	    address.setMember(mdto);  // 회원 정보 연결
	    address.setAddress_address(mdto.getMember_address()); // 주소
	    address.setAddress_receiverName(mdto.getMember_name()); // 받는 사람 (회원 이름)
	    address.setAddress_receiverPhone(mdto.getMember_phone()); // 연락처
	    address.setAddress_postalCode(mdto.getMember_postalCode()); // 우편번호
	    address.setAddress_isDefault(true); // 기본 배송지 설정

	 // 기본배송지 저장
	    addressService.save(address);
		return "redirect:/login";
	}
	
	// mypage 호출
	@GetMapping("/mypage")
	public String mypage(Model model) {
		// 세션에서 아이디 가져오기
	    String id = (String) session.getAttribute("session_id");
		String sessionNick = (String) session.getAttribute("session_nickname");
		
		// 나의 커뮤니티 리스트 가져오기 (로그인한 경우만)
	    if (sessionNick != null) {
	        List<NicknameDto> nlist = nickService.findByMemberDto_MemberNickname(sessionNick);
	        model.addAttribute("nlist", nlist); // 전체 리스트 유지
	    }
	    if (id != null) {
	    	List<OrderItemDto> orderItems = oiservice.findByMemberId(id);
	        MemberDto memberdto = mService.findById(id);
	        model.addAttribute("mdto", memberdto);
	        model.addAttribute("orderItems", orderItems);
	        return "/member/mypage";
	    } else {
	        // 로그인하지 않은 상태라면, 로그인 페이지로 리다이렉트
	        return "redirect:/login";
	    }
	}
	
	// 비밀번호 수정
	@PostMapping("/mypage")
	public String updatePassword(@RequestParam("newPassword") String newPW,
			@RequestParam("id") String id) {
		mService.updateByPw(id,newPW);
		return "redirect:/mypage";
	}
	

	// 회원정보 수정
	@PostMapping("/mypage2")
	public String updatePassword(@RequestParam("id") String id,
			@RequestParam("name") String name,
			@RequestParam("address") String address,
			@RequestParam("phone") String phone) {
		mService.updateByUser(id,name,address,phone);
		return "redirect:/mypage";
	}
	
	// 장바구니
		@GetMapping("/cart")
		public String cart(Model model) {
		    String id = (String) session.getAttribute("session_id");
		    String sessionNick = (String) session.getAttribute("session_nickname");

		    // 나의 커뮤니티 리스트 가져오기 (로그인한 경우만)
		    if (sessionNick != null) {
		        List<NicknameDto> nlist = nickService.findByMemberDto_MemberNickname(sessionNick);
		        model.addAttribute("nlist", nlist); // 전체 리스트 유지
		    }

		    if (id != null) {
		        MemberDto memberdto = mService.findById(id);
		        List<AddressDto> aList = addressService.findByMemberNickname(sessionNick);
		        List<CartDto> cList = cartservice.findByMemberNickname(sessionNick);

		        ObjectMapper objectMapper = new ObjectMapper();

		        for (CartDto cart : cList) {
		            if (cart.getCart_items() != null) {
		                try {
		                    List<Map<String, Object>> parsedCartItems = objectMapper.readValue(
		                        cart.getCart_items(),
		                        new TypeReference<List<Map<String, Object>>>() {}
		                    );
		                    cart.setParsedCartItems(parsedCartItems); // ✅ JSON 변환한 데이터 저장
		                } catch (Exception e) {
		                    e.printStackTrace();
		                }
		            }
		        }

		        // ✅ 최근 본 상품 리스트 가져오기
		        List<ShopDto> recentViewedList = cartservice.getRecentViewedItems(sessionNick);
		        model.addAttribute("recentViewedList", recentViewedList); // 📌 JSP에 전달

		        model.addAttribute("mdto", memberdto);
		        model.addAttribute("adto", aList);
		        model.addAttribute("cartList", cList); // ✅ CartDto 리스트 전달

		        return "/Nav_Bar/cart";
		    } else {
		        return "/Nav_Bar/cart";
		    }
		}


		
	// 장바구니 삭제
	@PostMapping("/delete")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> deleteCartItem(@RequestBody Map<String, Integer> payload) {
	    int cartNo = payload.get("cartNo"); // JSON에서 cartNo 추출
	    System.out.println("📌 삭제 요청 들어옴! cartNo: " + cartNo);

	    Map<String, Object> response = new HashMap<>();
	    boolean isDeleted = cartservice.deleteCartItem(cartNo);  // 삭제 처리 로직

	    response.put("success", isDeleted);
	    return ResponseEntity.ok(response);
	}
	
	// 쿠폰, 포인트 페이지 호출
	@GetMapping("/myCoupon")
	public String myCoupon(Model model) {
		// 세션에서 아이디 가져오기
	    String id = (String) session.getAttribute("session_id");
		String sessionNick = (String) session.getAttribute("session_nickname");
		
		// 나의 커뮤니티 리스트 가져오기 (로그인한 경우만)
	    if (sessionNick != null) {
	        List<NicknameDto> nlist = nickService.findByMemberDto_MemberNickname(sessionNick);
	        model.addAttribute("nlist", nlist); // 전체 리스트 유지
	    }

	    if (id != null) {
	        MemberDto memberdto = mService.findById(id);
	        model.addAttribute("mdto", memberdto);
	        return "/member/myCoupon";
	    } else {
	        // 로그인하지 않은 상태라면, 로그인 페이지로 리다이렉트
	        return "redirect:/login";
	    }
	}
	
	// 회원탈퇴 페이지 호출
	@GetMapping("/deactivate")
	public String deactivate() {
		return "/member/deactivate";
	}
	
	// 회원탈퇴 실행
	@PostMapping("/deactivate")
	public String deactivate(String session_nickname) {
		session_nickname = (String) session.getAttribute("session_nickname");
		
		mService.deleteByNickname(session_nickname);
		session.invalidate();
		return "redirect:/?deactivate=1";
	}
	
	// 비밀번호 찾기
	@GetMapping("/findPw")
	public String findPw() {
		return "/member/findPw";
	}
	
	
	// 비밀번호 찾기 확인
	@PostMapping("/findPw")
	public String findPw(String id) {
		MemberDto memberDto = mService.findById(id);		
		if (memberDto == null) {
	        return "redirect:/findPw?findNo=0"; // null이면 findPw 페이지로 리디렉트
	    }
		
		// ✅ 세션에 ID 저장
        session.setAttribute("findPwId", id);
	    
	    return "redirect:/nextPw"; 
	}
	
	// 비밀번호 찾기
	@GetMapping("/nextPw")
	public String nextPw() {
		return "/member/nextPw";
	}
	
	
}
