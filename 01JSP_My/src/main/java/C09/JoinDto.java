package C09;

import java.time.LocalDate;

public class JoinDto {
	private String addr;
	private LocalDate order_date;
	private Integer sum;

	// 생성자
	public JoinDto() {
	}

	public JoinDto(String addr, LocalDate order_date, Integer sum) {
		super();
		this.addr = addr;
		this.order_date = order_date;
		this.sum = sum;
	}

	// getter & setter
	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public LocalDate getOrder_date() {
		return order_date;
	}

	public void setOrder_date(LocalDate order_date) {
		this.order_date = order_date;
	}

	public Integer getSum() {
		return sum;
	}

	public void setSum(Integer sum) {
		this.sum = sum;
	}

	// toString
	@Override
	public String toString() {
		return "JoinDto [ addr = " + addr + ", order_date = " + order_date + ", sum = " + sum + " ]";
	}

}
