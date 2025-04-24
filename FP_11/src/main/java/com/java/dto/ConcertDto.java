package com.java.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;
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
@ToString(exclude = {"saleConcerts"})
public class ConcertDto {
	
	
	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "concert_seq")
    @SequenceGenerator(name = "concert_seq", sequenceName = "concert_seq", allocationSize = 1)
	@Column(name = "concert_no", nullable = false)
    private int concertNo; // 콘서트 고유 번호

    @Column(name = "concert_name", nullable = false, length = 100)
    private String concertName; // 콘서트 이름

    @Column(name = "concert_start_datetime", nullable = false)
    private LocalDateTime concertStartDatetime; // 콘서트 시작 시간

    @Column(name = "concert_end_datetime", nullable = false)
    private LocalDateTime concertEndDatetime; // 콘서트 종료 시간

    

    @Column(name = "location", nullable = false, length = 255)
    private String location; // 장소

    @Column(name = "concert_avail_age", nullable = false)
    private int concertAvailAge; // 관람 가능 최소 연령

    @Column(name = "concert_duration", nullable = false)
    private int concertDuration; // 콘서트 지속 시간 (분)
	
	
	@ManyToOne
    @JoinColumn(name = "artist_no", nullable = false) // Artist와의 관계
    private ArtistDto artistDto; // 아티스트 데이터와 연결
	
	
//	// Concert와 ConcertSchedule 간의 관계 설정 (1:N 관계)
//    @OneToMany(mappedBy = "concertDto", cascade = CascadeType.ALL, orphanRemoval = true)
//    private List<ConcertScheduleDto> schedules; // 콘서트의 전체 일정
    
//    @OneToMany(mappedBy = "concertDto", cascade = CascadeType.ALL, orphanRemoval = true)
//    private List<TicketDto> tickets;  // 콘서트의 모든 티켓
//    
    @OneToMany(mappedBy = "concertDto", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<SaleConcertDto> saleConcerts; // 콘서트의 판매 정보 리스트

}