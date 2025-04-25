package com.java.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;  // 세션 사용을 위해 필요!
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;

@RestController
public class SessionController {

    @PostMapping("/updateSessionFilter")
    public void updateSessionFilter(@RequestParam("filterUnder15") String filterValue, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("filterUnder15", filterValue.equals("true"));
    }

    @PostMapping("/clearSessionFilter")
    public void clearSessionFilter(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("filterUnder15");
    }

    @GetMapping("/getSessionFilter")
    public String getSessionFilter(HttpServletRequest request) {
        Object filterValue = request.getSession().getAttribute("filterUnder15");
        return (filterValue != null && filterValue.equals(Boolean.TRUE)) ? "true" : "false";
    }
    
 // ✅ 세션 저장 (알림 ON)
    @PostMapping("/updateNotificationSession")
    public void updateNotificationSession(HttpServletRequest request, @RequestParam("status") String status) {
        HttpSession session = request.getSession();
        session.setAttribute("autoNotification", status);
        System.out.println("✅ 세션 저장됨: " + status);
    }

    // ✅ 세션 삭제 (알림 OFF)
    @PostMapping("/clearNotificationSession")
    public void clearNotificationSession(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("autoNotification");
        System.out.println("❌ 세션 삭제됨");
    }

    // ✅ 현재 세션 값 가져오기
    @GetMapping("/getNotificationSession")
    public ResponseEntity<String> getNotificationSession(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Object value = session.getAttribute("autoNotification");
        return ResponseEntity.ok(value != null ? value.toString() : "false");
    }
}
