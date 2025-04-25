package com.java.controller;

import org.springframework.context.event.EventListener;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.socket.messaging.SessionConnectedEvent;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;
import org.springframework.stereotype.Component;

import java.util.concurrent.atomic.AtomicInteger;

@Component
public class WebSocketUserTracker {

    private static final AtomicInteger userCount = new AtomicInteger(0); // 사용자 수를 추적하는 AtomicInteger
    private final SimpMessagingTemplate messagingTemplate;

    public WebSocketUserTracker(SimpMessagingTemplate messagingTemplate) {
        this.messagingTemplate = messagingTemplate;
    }

    // 연결 시 호출
    @EventListener
    public void handleWebSocketConnectListener(SessionConnectedEvent event) {
        userCount.incrementAndGet();  // 사용자 수 증가
        System.out.println("User connected. Total users: " + userCount.get()); // 연결된 사용자 수 출력

        // 전체 사용자 수를 실시간으로 전송
        messagingTemplate.convertAndSend("/topic/userCount", userCount.get());
    }

    // 연결 종료 시 호출
    @EventListener
    public void handleWebSocketDisconnectListener(SessionDisconnectEvent event) {
        userCount.decrementAndGet();  // 사용자 수 감소
        System.out.println("User disconnected. Total users: " + userCount.get()); // 연결 종료 후 사용자 수 출력

        // 전체 사용자 수를 실시간으로 전송
        messagingTemplate.convertAndSend("/topic/userCount", userCount.get());
    }

    // 현재 접속한 사용자 수 반환
    public int getUserCount() {
        return userCount.get(); // 최신 사용자 수 반환
    }
}
