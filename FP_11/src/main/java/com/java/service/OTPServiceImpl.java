package com.java.service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

@Service
public class OTPServiceImpl implements OTPService {

    // 임시 저장을 위한 Map(실제 서비스에서는 Redis나 DB를 사용하세요)
    private Map<String, String> otpStore = new ConcurrentHashMap<>();

    // OTP 생성 (예: 6자리 숫자)
    public void generateOtp(String phoneNumber) {
        String otp = String.valueOf((int)(Math.random() * 900000) + 100000);
        // 저장: 전화번호를 key로 OTP 저장 (유효기간 관리는 별도 스케줄러나 TTL 적용 필요)
        otpStore.put(phoneNumber, otp);
        
        // SMS API를 호출해 OTP 전송 (여기서는 단순 출력으로 대체)
        System.out.println("Sending OTP " + otp + " to phone " + phoneNumber);
        
    }

    // OTP 검증
    public boolean validateOtp(String phoneNumber, String otp) {
        String storedOtp = otpStore.get(phoneNumber);
        // 비교 후, 사용된 OTP는 삭제
        if (storedOtp != null && storedOtp.equals(otp)) {
            otpStore.remove(phoneNumber);
            return true;
        }
        return false;
    }
}
