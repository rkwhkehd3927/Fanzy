package com.java.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.AddressDto;
import com.java.dto.CartDto;
import com.java.dto.CommentDto;
import com.java.dto.FanCommunityDto;
import com.java.dto.MemberDto;
import com.java.dto.NicknameDto;
import com.java.repository.AddressRepository;
import com.java.repository.CMRepository;
import com.java.repository.CRepository;
import com.java.repository.CartRepository;
import com.java.repository.MRepository;
import com.java.repository.NicknameRepository;

import jakarta.transaction.Transactional;

@Service
public class MServiceImpl implements MService{

	@Autowired MRepository mRepository;
	@Autowired CRepository cRepository;
	@Autowired CMRepository cmRepository;
	@Autowired NicknameRepository nickRepository;
	@Autowired CartRepository cartRepository;
	@Autowired AddressRepository addressRepository;


	// 전체 회원정보 출력
	@Override
	public List<MemberDto> findAll() {
		List<MemberDto> list = mRepository.findAll(); // findById : 한개 가져올떄
		
	    for (MemberDto member : list) {
	        long communityCount = cRepository.countCommunityByMemberNickname(member.getMember_nickname());
	        long commentCount = cmRepository.countCommentByMemberNickname(member.getMember_nickname());
	        
	        
	        member.setCommunityCnt((int) communityCount);
	        member.setCommentCnt((int) commentCount);
	    }
		return list;
	}

	// 회원정보 열기
	@Override
	public MemberDto findByNickname(String nickname) {
		
		MemberDto memberDto = mRepository.findByNickname(nickname);
		return memberDto;
	}
	
	// 회원정보 수정
	@Transactional
	@Override
	public void save(MemberDto mdto) {
		mRepository.save(mdto);
	}
	
	// 회원정보 삭제
	@Override
	public void deleteByMemberNickname(String member_nickname) {
//		mRepository.deleteByMemberNickname(member_nickname);
	    // 1. 해당 멤버를 먼저 조회
	    MemberDto member = mRepository.findByNickname(member_nickname);
		
	    if (member != null) {
	        // 1. 멤버가 작성한 댓글 삭제
	        List<CommentDto> comments = cmRepository.findByNickname(member_nickname);
	        cmRepository.deleteAll(comments);

	        // 2. 멤버가 작성한 커뮤니티 삭제
	        List<FanCommunityDto> communities = cRepository.findByNickname(member_nickname);
	        cRepository.deleteAll(communities);

	        // 3. 멤버 삭제
	        mRepository.delete(member);
	    } else {
	        throw new RuntimeException("해당 회원을 찾을 수 없습니다.");
	    }    
	}
	
	// 로그인
	@Override
	public MemberDto findByIdAndPw(String id, String pw) {
		MemberDto memberDto = mRepository.findByIdAndPw(id,pw);
		return memberDto;
	}

	@Override
	public MemberDto findByMemberId(String sessionId) {
		
		return mRepository.findById(sessionId).orElse(null);
	}

	// 아이디 중복 확인
	@Override
	public boolean existsMemberId(String memberId) {
		
		return mRepository.existsByMemberId(memberId);
	}

	// 닉네임 중복확인
	@Override
	public boolean existsMemberNickname(String memberNickname) {
		
		return mRepository.existsByMemberNickname(memberNickname);
	}
	
	@Override
	public MemberDto findById(String id) {
		
		return mRepository.findById(id).orElse(null);
	}

	// 회원탈퇴
	@Override
	public void deleteByNickname(String session_nickname) {
		System.out.println("🧐 삭제 요청 받은 닉네임: " + session_nickname);

	    // 1. 해당 멤버를 먼저 조회
	    MemberDto member = mRepository.findByNickname(session_nickname);
	    
	    if (member == null) {
	        System.out.println("❌ 회원을 찾을 수 없습니다: " + session_nickname);
	        throw new RuntimeException("해당 회원을 찾을 수 없습니다.");
	    }

	    System.out.println("✅ 회원 조회 성공: " + member);

	    // 2. 멤버가 작성한 댓글 삭제
	    List<CommentDto> comments = cmRepository.findByNickname(session_nickname);
	    System.out.println("📝 삭제할 댓글 개수: " + comments.size());
	    cmRepository.deleteAll(comments);

	    // 3. 멤버가 작성한 커뮤니티 삭제
	    List<FanCommunityDto> communities = cRepository.findByNickname(session_nickname);
	    System.out.println("📢 삭제할 커뮤니티 개수: " + communities.size());
	    cRepository.deleteAll(communities);

	    // 4. 멤버가 등록한 닉네임 삭제
	    List<NicknameDto> nicknames = nickRepository.findByNickname(session_nickname);
	    System.out.println("🎭 삭제할 닉네임 개수: " + nicknames.size());
	    nickRepository.deleteAll(nicknames);
	    
	    // 5. 장바구니 삭제
	    List<CartDto> cartDto = cartRepository.findByMemberNickname(session_nickname);
	    System.out.println("🎭 삭제할 장바구니 개수: " + cartDto.size());
	    cartRepository.deleteAll(cartDto);
	    
	    // 6. 주소목록 삭제
	    List<AddressDto> addressdto = addressRepository.findByMemberNickname(session_nickname);
	    System.out.println("🎭 삭제할 주소목록 개수: " + addressdto.size());
	    addressRepository.deleteAll(addressdto);
	    
	    // 7. 멤버 삭제
	    System.out.println("🗑️ 회원 삭제 실행: " + member.getMember_nickname());
	    mRepository.delete(member);
	}

	
	// 비밀번호 수정
	@Override
	public void updateByPw(String id,String newPW) {
		mRepository.updateByPw(id,newPW);
		
	}

	// 회원정보 수정
	@Override
	public void updateByUser(String id, String name, String address, String phone) {
		mRepository.updateByUser(id,name,address,phone);
	}

    // 적립금 추가 메서드 구현
	@Override
	public void addMemberPoints(String memberId, int pointsToAdd) {
	    Optional<MemberDto> member = mRepository.findById(memberId);
	    if (member.isPresent()) { 
	        MemberDto memberDto = member.get();
	        int currentPoints = memberDto.getMember_mileage(); 
	        int newPoints = currentPoints + pointsToAdd;
	        mRepository.updatePoints(memberId, newPoints);
	    }
	}
	
    // WebSocket OTP 인증
    @Override
    public MemberDto findByPhone(String phone) {
        MemberDto mdto = mRepository.findByPhone(phone);
        return mdto;
    }

	@Override
	public MemberDto findByNickName(String nickname) {
		MemberDto mdto = mRepository.findByNickName(nickname);
		return mdto;
	}
	

}
