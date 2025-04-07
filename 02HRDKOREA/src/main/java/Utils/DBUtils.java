package Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DBUtils {

	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String id = "system";
	private String pw = "1234";

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// 싱글톤
	private static DBUtils instance;

	private DBUtils() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, id, pw);
	}

	public static DBUtils getInstance() throws Exception {
		if (instance == null)
			instance = new DBUtils();
		return instance;
	}

	// DB
	public List<MemberDto> selectAllMember() throws Exception {

		/*
		 * select m_no, m_name, p_name, p_school, m_jumin, m_city, p_tel1, p_tel2,
		 * p_tel3 from tbl_member_202005 m join tbl_party_202005 p on m.p_code =
		 * p.p_code;
		 */
		String sql = "select m_no, m_name, p_name, p_school, substr(m_jumin,1,6)||'-'||substr(m_jumin,7), m_city, p_tel1, p_tel2, p_tel3"
				+ " from tbl_member_202005 m" + " join tbl_party_202005 p" + " on m.p_code = p.p_code";

		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		List<MemberDto> list = new ArrayList();
		MemberDto memberDto = null;

		if (rs != null) {
			while (rs.next()) {
				memberDto = new MemberDto();
				memberDto.setM_no(rs.getString(1));
				memberDto.setM_name(rs.getString(2));
				memberDto.setP_name(rs.getString(3));
				memberDto.setP_school(rs.getString(4));
				memberDto.setM_jumin(rs.getString(5));
				memberDto.setM_city(rs.getString(6));
				memberDto.setP_tel1(rs.getString(7));
				memberDto.setP_tel2(rs.getString(8));
				memberDto.setP_tel3(rs.getString(9));

				list.add(memberDto);
			}
		}
		rs.close();
		pstmt.close();
		return list;
	}

}
