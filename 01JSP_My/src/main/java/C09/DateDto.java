package C09;

import java.time.LocalDate;

public class DateDto {
	private LocalDate order_date;
	private Double round;

	// 생성자
	public DateDto() {
	}

	public DateDto(LocalDate order_date, Double round) {
		super();
		this.order_date = order_date;
		this.round = round;
	}

	// getter & setter
	public LocalDate getOrder_date() {
		return order_date;
	}

	public void setOrder_date(LocalDate order_date) {
		this.order_date = order_date;
	}

	public Double getRound() {
		return round;
	}

	public void setRound(Double round) {
		this.round = round;
	}

	// toString
	@Override
	public String toString() {
		return "DateDto [order_date=" + order_date + ", round=" + round + "]";
	}

}
