package com.java.dto;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
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
@ToString(exclude = {"saleConcertDto","tickets","seats"})
public class ConcertScheduleDto {
	
	@Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "schedule_seq")
    @SequenceGenerator(name = "schedule_seq", sequenceName = "schedule_seq", allocationSize = 1)
	@Column(name = "schedule_no", nullable = false)
    private int scheduleNo; // 스케줄 고유 번호

    @Column(name = "schedule_date", nullable = false)
    private LocalDate scheduleDate; // 스케줄 날짜

    @Column(name = "schedule_start_time", nullable = false)
    private LocalTime scheduleStartTime; // 스케줄 시작 시간

    // Concert 엔티티와의 관계 설정 (ManyToOne)
//    @ManyToOne
//    @JoinColumn(name = "concert_no", nullable = false) // 외래 키 지정
//    private ConcertDto concertDto; 
    
    @ManyToOne
	@JoinColumn(name = "sale_concert_no", nullable = false)
	private SaleConcertDto saleConcertDto;  // 콘서트 전체 기준
	
    @OneToMany(mappedBy = "concertScheduleDto", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<TicketDto> tickets; // 온라인땜에 바로 받아오는거 필요함
    
    @OneToMany(mappedBy = "concertScheduleDto", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<SeatDto> seats; // 오프라인 전용 
	

} 