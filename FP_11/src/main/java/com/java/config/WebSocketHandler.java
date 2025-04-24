package com.java.config;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.Map;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.ConcurrentHashMap;

public class WebSocketHandler extends TextWebSocketHandler {

    // 방에 있는 WebSocketSession들을 관리하는 Map
    private final Map<String, CopyOnWriteArraySet<WebSocketSession>> rooms = new ConcurrentHashMap<>();

    // WebSocket 연결 시 호출되는 메소드
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        String roomId = getRoomId(session); // 방 ID를 가져옴 (예: ?room=roomId 형태로)

        // 방에 해당하는 세션 목록에 사용자 추가
        rooms.computeIfAbsent(roomId, key -> new CopyOnWriteArraySet<>()).add(session);

        // 사용자 수 출력 (디버깅용)
        System.out.println("User connected to room: " + roomId + ". Total users: " + rooms.get(roomId).size());
    }

    // 메시지를 처리하는 메소드 (방에 있는 모든 클라이언트에게 메시지를 전달)
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String roomId = getRoomId(session); // 방 ID를 가져옴

        if (rooms.containsKey(roomId)) {
            // 방에 있는 모든 세션에 메시지 전송
            for (WebSocketSession s : rooms.get(roomId)) {
                if (s.isOpen()) {
                    s.sendMessage(message); // 메시지 전달
                }
            }
        }
    }

    // WebSocket 연결이 종료되었을 때 호출되는 메소드
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        String roomId = getRoomId(session); // 방 ID를 가져옴

        // 해당 방에서 세션 제거
        rooms.getOrDefault(roomId, new CopyOnWriteArraySet<>()).remove(session);

        // 방에 더 이상 세션이 없으면 방 제거
        if (rooms.get(roomId).isEmpty()) {
            rooms.remove(roomId);
            System.out.println("Room " + roomId + " has no users, removing the room.");
        }

        // 사용자 수 출력 (디버깅용)
        System.out.println("User disconnected from room: " + roomId + ". Total users: " + rooms.get(roomId).size());
    }

    // WebSocketSession에서 방 ID를 추출하는 메소드 (예: ?room=roomId 형태로 URI에서 추출)
    private String getRoomId(WebSocketSession session) {
        return session.getUri().getQuery().split("=")[1]; // URI에서 roomId 추출
    }
}
