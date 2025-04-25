package com.java.dto;

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
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@ToString(exclude = {"ConcertScheduleDto"})
public class SeatDto {
	
	@Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seat_seq")
    @SequenceGenerator(name = "seat_seq", sequenceName = "seat_seq", allocationSize = 1)
	@Column(name = "seat_no", nullable = false)
    private int seatNo; // 좌석 고유 번호

	@Column(name = "seat_floor", length = 10, nullable = true)
	private String seatFloor; // 좌석 층 (선택 사항)
	
    @Column(name = "seat_level", length = 50, nullable = true)
    private String seatLevel; // 좌석 레벨 (선택 사항)

    @Column(name = "seat_row", length = 1, nullable = false)
    private String seatRow; // 좌석 행

    @Column(name = "seat_col", nullable = false)
    private int seatCol; // 좌석 열
    
    @Column(name = "seat_price", nullable = false)
    private int seatPrice; 		// 가격

    @Column(name = "is_reserved", nullable = false)
    private boolean isReserved; // 예약 여부
    
//    @Column(name = "seat_status", nullable = false, length = 20)
//    private String seatStatus;  // "예약 가능", "예약됨", "점검 중" 등

    // ConcertSchedule와의 관계 설정 (ManyToOne)
    @ManyToOne
    @JoinColumn(name = "schedule_no", nullable = false) // 외래 키 설정
    private ConcertScheduleDto concertScheduleDto; 
	
}