package com.java.dto;

import java.time.LocalDate;
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
import jakarta.persistence.Transient;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@ToString(exclude = {"concertDto","concertSchedules"})
public class SaleConcertDto {

	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sale_concert_seq")
    @SequenceGenerator(name = "sale_concert_seq", sequenceName = "sale_concert_seq", allocationSize = 1)
	@Column(name = "sale_concert_no", nullable = false)
    private int saleConcertNo; // 판매 콘서트 고유 번호
	
	

	@Column(name = "total_ticket_count", nullable = true)
	private Integer totalTicketCount;  // 해당 콘서트의 전체 티켓 개수 (온라인은 null)

	@Column(name = "available_ticket_count", nullable = true)
	private Integer availableTicketCount;  // 판매 가능한 티켓 개수 (온라인은 null)
	
	@Column(name = "ticket_type", nullable = false)
	private String ticketType;  // "offline" 또는 "online"
	
	@Column(name = "rsv_open_date", nullable = false)
    private LocalDate rsvOpenDate; // 티켓 예약 오픈 날짜
	
	@Column(name = "sale_start_date", nullable = false)
    private LocalDate saleStartDate;  // 티켓 판매 시작일

    @Column(name = "sale_end_date", nullable = false)
    private LocalDate saleEndDate;  // 티켓 판매 종료일
    
    @Column(name = "concert_price", nullable = true)
    private Integer concertPrice;  // 티켓 가격 (온라인만 가격이 존재, 오프라인은 null)

    @Column(name = "sale_concert_desc", length = 300, nullable = true)
    private String saleConcertDesc; // 판매 아이템 설명 (온라인은 옵션용)
    
    @Column(name = "sale_concert_image", length = 200, nullable = true)
    private String saleConcertImage; // 판매 썸네일 이미지
    
    @Column(name = "sale_concert_desc_image", length = 200, nullable = true)
    private String saleConcertDescImage; // 판매 설명 이미지
    

	@ManyToOne
	@JoinColumn(name = "concert_no", nullable = false)
	private ConcertDto concertDto;  // 콘서트 전체 기준
	
	@OneToMany(mappedBy = "saleConcertDto", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ConcertScheduleDto> concertSchedules; // 해당 판매 단위의 스케줄 목록

//    @OneToMany(mappedBy = "saleConcertDto", cascade = CascadeType.ALL, orphanRemoval = true)
//    private List<TicketDto> tickets; // 온라인 전용 티켓 리스트
//
//    @OneToMany(mappedBy = "saleConcertDto", cascade = CascadeType.ALL, orphanRemoval = true)
//    private List<SeatDto> seats; // 오프라인 전용 좌석 리스트

    
    /** 
     * ✅ 프론트에서 솔드아웃 여부를 체크할 때 사용하는 메서드
     * - 온라인은 무조건 구매 가능해야 하므로 false 반환
     */
    @Transient
	public boolean isSoldOut(Integer bookedTickets) {
    	if ("online".equals(ticketType) || totalTicketCount == null) {
            return false; // 온라인은 무조건 판매 가능
        }
//    	int booked = (bookedTickets != null) ? bookedTickets : 0; // null이면 0으로 처리
//        return booked >= totalTicketCount;
    	return (bookedTickets != null && bookedTickets >= totalTicketCount);
	}  // 솔드아웃 여부 판단 (true: 솔드아웃)
    
    
    
   
}