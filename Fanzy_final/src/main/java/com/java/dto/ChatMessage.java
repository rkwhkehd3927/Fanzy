package com.java.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor

public class ChatMessage {
    private String sender;
    private String content;
    private String type; // 메시지 타입 (예: 채팅, 입장, 퇴장)

}
