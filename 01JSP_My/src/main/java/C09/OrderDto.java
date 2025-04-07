package C09;

import java.time.LocalDate;

public class OrderDto {
	private String category;
	private Integer sum;

	// 생성자
	public OrderDto() {
	}

	public OrderDto(String category, Integer sum) {
		super();
		this.category = category;
		this.sum = sum;
	}

	// getter & setter
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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
		return "OrderDto [ category = " + category + ", sum = " + sum + " ]";
	}

}
