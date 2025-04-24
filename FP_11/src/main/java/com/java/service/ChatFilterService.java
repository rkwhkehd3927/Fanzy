package com.java.service;

import org.springframework.stereotype.Service;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class ChatFilterService {

    private Set<String> badWords;
    private final String filePath = "src/main/data/bad_words.txt";  // 외부 경로로 수정

    public ChatFilterService() {
        badWords = new HashSet<>();
        loadBadWords();  // 초기 로딩
    }

    // 금지어 파일 로딩
    private void loadBadWords() {
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(
                new FileInputStream(filePath), StandardCharsets.UTF_8))) {
            if (reader == null) {
                throw new RuntimeException("금지어 파일을 찾을 수 없습니다.");
            }
            badWords = reader.lines().collect(Collectors.toSet()); // Set으로 중복 제거
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 새로운 단어 추가
    public void addBadWord(String word) {
        try {
            // 기존 단어들을 파일에서 읽기
            List<String> existingBadWords = Files.readAllLines(Paths.get(filePath), StandardCharsets.UTF_8);

            // 새로 신고된 단어가 중복되지 않도록 처리 (기존 단어 목록에 추가)
            word = word.trim();  // 불필요한 공백 제거
            if (!word.isEmpty() && !existingBadWords.contains(word)) {
                // 새로운 단어를 기존 단어 뒤에 추가
                existingBadWords.add(word);

                // 파일에 새 단어 추가 (덮어쓰지 않고 append 방식으로 추가)
                Files.write(Paths.get(filePath), (word + "\n").getBytes(), StandardOpenOption.APPEND);

                // 메모리에서도 갱신
                badWords.add(word); // 세트에 새 단어 추가
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 메시지에서 금지어 필터링
    public String filterMessage(String message) {
        for (String badWord : badWords) {
            // 정규식: 알파벳, 숫자, 특수문자까지 포함한 필터링
            String regex = badWord
                .replaceAll("[a-zA-Z]", "[a-zA-Z0-9@#\\$\\^\\*\\+\\(\\)\\-]+"); // 숫자와 특수문자 포함
            if (message.matches(".*" + regex + ".*")) {
                return "금지어가 포함된 문장입니다."; // 금지어 포함 시 전체 문장 차단
            }
        }
        return message; // 금지어가 없으면 그대로 반환
    }
}
