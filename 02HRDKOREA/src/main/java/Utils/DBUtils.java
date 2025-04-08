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

	public int insertVote(VoteDto voteDto) throws Exception {
		pstmt = conn.prepareStatement("insert into tbl_vote_202005 values(?,?,?,?,?,?)");
		pstmt.setString(1, voteDto.getV_jumin());
		pstmt.setString(2, voteDto.getV_name());
		pstmt.setString(3, voteDto.getM_no());
		pstmt.setString(4, voteDto.getV_time());
		pstmt.setString(5, voteDto.getV_area());
		pstmt.setString(6, voteDto.getV_confirm());
		int result = pstmt.executeUpdate();

		conn.commit();

		pstmt.close();
		return result;
	}

	public List<VoteDto> selectAllVote() throws Exception {
		// SQL
		// select v_name,
		// '19'||substr(v_jumin,1,2)||'년'||substr(v_jumin,3,2)||'월'||substr(v_jumin,5,2)||'일생',
		// v_jumin, v_jumin, m_no, v_time, v_confirm
		// from tbl_vote_202005
		// where v_area = '제1투표장';

		String sql = "select v_name, v_jumin,"
				+ " v_jumin, v_jumin, m_no, substr(v_time,1,2)||':'||substr(v_time,3,2), v_confirm"
				+ " from tbl_vote_202005 where v_area = '제1투표장'";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		List<VoteDto> list = new ArrayList();
		VoteDto voteDto = null;
		if (rs != null) {
			while (rs.next()) {
				voteDto = new VoteDto();
				voteDto.setV_name(rs.getString(1));
				voteDto.setV_jumin(rs.getString(2));
				voteDto.setV_jumin(rs.getString(3));
				voteDto.setV_jumin(rs.getString(4));
				voteDto.setM_no(rs.getString(5));
				voteDto.setV_time(rs.getString(6));
				voteDto.setV_confirm(rs.getString(7));
				list.add(voteDto);
			}
		}
		rs.close();
		pstmt.close();
		return list;
	}

	public List<MemberDto2> rankMember() throws Exception {
		// SQL
		// select m.m_no, m_name, count(*) from tbl_member_202005 m
		// join tbl_vote_202005 v
		// on m.m_no = v.m_no
		// group by m.m_no, m_name
		// order by count(*) desc;

		String sql = "select m.m_no, m_name, count(*) from tbl_member_202005 m" + " join tbl_vote_202005 v"
				+ " on m.m_no = v.m_no" + " group by m.m_no, m_name" + " order by count(*) desc";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		List<MemberDto2> list = new ArrayList();
		MemberDto2 memberDto2 = null;
		if (rs != null) {
			while (rs.next()) {
				memberDto2 = new MemberDto2();
				memberDto2.setM_no(rs.getString(1));
				memberDto2.setM_name(rs.getString(2));
				memberDto2.setV_total(rs.getString(3));
				list.add(memberDto2);
			}
		}
		
		rs.close();
		pstmt.close();
		return list;
	}

}
