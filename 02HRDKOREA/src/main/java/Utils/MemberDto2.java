package Utils;

public class MemberDto2 {
	private String m_no;
	private String m_name;
	private String v_total;

	public MemberDto2() {
	}

	public MemberDto2(String m_no, String m_name, String v_total) {
		super();
		this.m_no = m_no;
		this.m_name = m_name;
		this.v_total = v_total;
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

	public String getV_total() {
		return v_total;
	}

	public void setV_total(String v_total) {
		this.v_total = v_total;
	}

	@Override
	public String toString() {
		return "MemberDto2 [m_no=" + m_no + ", m_name=" + m_name + ", v_total=" + v_total + "]";
	}

}
