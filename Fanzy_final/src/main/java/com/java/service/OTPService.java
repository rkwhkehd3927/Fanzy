package com.java.service;

public interface OTPService {

	void generateOtp(String member_phone);

	boolean validateOtp(String phone, String otp);

}
