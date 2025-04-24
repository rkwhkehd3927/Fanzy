package com.java.dto;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class TicketDto {
//	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "shop_seq")
    @SequenceGenerator(name = "shop_seq", sequenceName = "shop_seq", allocationSize = 1)
    @Column(name = "ticket_no", nullable = false)
    private int ticketNo; 		// 티켓 고유 번호

    @Column(name = "ticket_title", nullable = false, length = 100)
    private String ticketTitle; 		// 티켓 이름

    @Column(name = "ticket_content", length = 1000)
    private String ticketContent; 		// 티켓 설명(좌석, 온라인)

    @Column(name = "ticket_price", nullable = false)
    private int ticketPrice; 		// 가격

    @Column(name = "ticket_quantity", nullable = false)
    private int ticketQuantity; 		// 재고 수량

    @CreationTimestamp
    @Column(name = "ticket_date", nullable = false)
    private Timestamp ticketDate;         // 등록일
    
    @Column(name = "ticket_type", nullable = false, length = 10)
    private String ticketType;           // 티켓 유형 (offline, online)
    
    @Column(name = "ticket_valid_from")
    private Timestamp ticketValidFrom;    // 티켓 사용 가능 시작일
    
    @Column(name = "ticket_valid_to")
    private Timestamp ticketValidTo;     // 티켓 사용 가능 종료일
    
    @Column(name = "redeem_code", length = 8)
    private String redeemCode;            // 리딤 코드 (랜덤 8자리, 온라인 티켓용)
    
    @Column(name = "is_restreaming_allowed", nullable = false)
    private boolean isRestreamingAllowed; // 재스트리밍 가능 여부 (온라인 티켓용)
    
//    @ManyToOne
//    @JoinColumn(name = "concert_no", nullable = false)  // 외래키로 concert와 연결
//    private ConcertDto concertDto;
    
    @ManyToOne
    @JoinColumn(name = "schedule_no", nullable = false)  // 외래키 추가
    private ConcertScheduleDto concertScheduleDto;
    
    @ManyToOne
    @JoinColumn(name = "seat_no", nullable = true)  // 온라인 티켓은 좌석이 없으므로 NULL 허용
    private SeatDto seatDto; // 좌석 정보

}