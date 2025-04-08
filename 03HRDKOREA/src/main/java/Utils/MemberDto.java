package Utils;

public class MemberDto {
	private String regist_month;
	private String m_no;
	private String m_name;
	private String c_name;
	private String c_area;
	private int tuition;
	private String m_grade;
	
	public MemberDto () {
	}

	public MemberDto(String regist_month, String m_no, String m_name, String c_name, String c_area, int tuition,
			String m_grade) {
		super();
		this.regist_month = regist_month;
		this.m_no = m_no;
		this.m_name = m_name;
		this.c_name = c_name;
		this.c_area = c_area;
		this.tuition = tuition;
		this.m_grade = m_grade;
	}

	public String getRegist_month() {
		return regist_month;
	}

	public void setRegist_month(String regist_month) {
		this.regist_month = regist_month;
	}

	public String getM_no() {
		return m_no;
	}

	public void setM_no(String m_no) {
		this.m_no = m_no;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_area() {
		return c_area;
	}

	public void setC_area(String c_area) {
		this.c_area = c_area;
	}

	public int getTuition() {
		return tuition;
	}

	public void setTuition(int tuition) {
		this.tuition = tuition;
	}

	public String getM_grade() {
		return m_grade;
	}

	public void setM_grade(String m_grade) {
		this.m_grade = m_grade;
	}

	@Override
	public String toString() {
		return "MemberDto [regist_month=" + regist_month + ", m_no=" + m_no + ", m_name=" + m_name + ", c_name="
				+ c_name + ", c_area=" + c_area + ", tuition=" + tuition + ", m_grade=" + m_grade + "]";
	}
	
}
