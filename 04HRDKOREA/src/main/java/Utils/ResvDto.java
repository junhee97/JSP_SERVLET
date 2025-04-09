package Utils;

import java.time.LocalDate;

public class ResvDto {
	private int resvno;
	private String jumin;
	private String hospcode;
	private LocalDate resvdate;
	private int resvtime;
	private String vcode;

	// 생성자
	public ResvDto() {
	}

	public ResvDto(int resvno, String jumin, String hospcode, LocalDate resvdate, int resvtime, String vcode) {
		super();
		this.resvno = resvno;
		this.jumin = jumin;
		this.hospcode = hospcode;
		this.resvdate = resvdate;
		this.resvtime = resvtime;
		this.vcode = vcode;
	}

	// getter & setter
	public int getResvno() {
		return resvno;
	}

	public void setResvno(int resvno) {
		this.resvno = resvno;
	}

	public String getJumin() {
		return jumin;
	}

	public void setJumin(String jumin) {
		this.jumin = jumin;
	}

	public String getHospcode() {
		return hospcode;
	}

	public void setHospcode(String hospcode) {
		this.hospcode = hospcode;
	}

	public LocalDate getResvdate() {
		return resvdate;
	}

	public void setResvdate(LocalDate resvdate) {
		this.resvdate = resvdate;
	}

	public int getResvtime() {
		return resvtime;
	}

	public void setResvtime(int resvtime) {
		this.resvtime = resvtime;
	}

	public String getVcode() {
		return vcode;
	}

	public void setVcode(String vcode) {
		this.vcode = vcode;
	}

	// toString
	@Override
	public String toString() {
		return "ResvDto [resvno=" + resvno + ", jumin=" + jumin + ", hospcode=" + hospcode + ", resvdate=" + resvdate
				+ ", resvtime=" + resvtime + ", vcode=" + vcode + "]";
	}

}
