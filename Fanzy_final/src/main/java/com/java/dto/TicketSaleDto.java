package com.java.dto;

import java.time.LocalDateTime;

import org.hibernate.annotations.DynamicInsert;

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

@DynamicInsert // 데이터값이 null일 경우 컬럼에서 제외
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class TicketSaleDto {
	
	@Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sale_seq")
    @SequenceGenerator(name = "sale_seq", sequenceName = "sale_seq", allocationSize = 1)
    @Column(name = "sale_id", nullable = false)
    private int saleId; // 거래 고유 번호

    @ManyToOne
    @JoinColumn(name = "ticket_no", nullable = false) // TicketDto 외래 키
    private TicketDto ticketDto; // 티켓 정보

    @ManyToOne
    @JoinColumn(name = "seat_no", nullable = false) // SeatDto 외래 키
    private SeatDto seatDto; // 좌석 정보

    @Column(name = "viewing_date", nullable = false)
    private LocalDateTime viewingDate; // 관람 일시

    @Column(name = "seat_grade", nullable = false, length = 10)
    private String seatGrade; // 좌석 단계

    @Column(name = "total_quantity",nullable = false)
    private int totalQuantity; // 티켓 수량

    @Column(name = "price_per_ticket", nullable = false)
    private int pricePerTicket; // 티켓당 가격

    @Column(name = "seat_special_notes", length = 255)
    private String seatSpecialNotes; // 좌석 특이사항

    @Column(name = "ticket_image", length = 255)
    private String ticketImage; // 티켓 이미지

    @Column(name = "transaction_method", nullable = false, length = 50)
    private String transactionMethod; // 거래 방식

    @Column(name = "is_ticket_owned", nullable = false)
    private boolean isTicketOwned; // 티켓 보유 여부

    @Column(name = "transaction_description", nullable = false, length = 255)
    private String transactionDescription; // 거래 설명

    @Column(name = "penalty_payment_method", nullable = false, length = 255)
    private String penaltyPaymentMethod; // 패널티 결제 방법

    @Column(name = "penalty_terms_agreed", nullable = false)
    private boolean penaltyTermsAgreed; // 패널티 약관 동의 여부

}
