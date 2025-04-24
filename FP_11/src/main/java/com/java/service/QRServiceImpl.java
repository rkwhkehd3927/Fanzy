package com.java.service;

import java.io.ByteArrayOutputStream;

import org.springframework.stereotype.Service;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

@Service
public class QRServiceImpl implements QRService {

    public byte[] generateQRCodeImage(String token){
        // 200x200 픽셀 크기의 QR 코드 생성 (크기는 필요에 따라 조절)
		try {
			QRCodeWriter qrCodeWriter = new QRCodeWriter();
			BitMatrix bitMatrix = qrCodeWriter.encode(token, BarcodeFormat.QR_CODE, 200, 200);
			ByteArrayOutputStream pngOutputStream = new ByteArrayOutputStream();
			MatrixToImageWriter.writeToStream(bitMatrix, "PNG", pngOutputStream);
			return pngOutputStream.toByteArray();
		} catch (Exception e) {
	        e.printStackTrace();
	        throw new RuntimeException("QR 코드 생성 중 예외 발생", e);

		}
    }
}
