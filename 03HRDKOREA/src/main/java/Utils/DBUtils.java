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
	public List<TeacherDto> selectAllTeacher() throws Exception {
		pstmt = conn.prepareStatement("select * from tbl_teacher_202201");
		rs = pstmt.executeQuery();

		List<TeacherDto> list = new ArrayList();
		TeacherDto teacherDto = null;
		if (rs != null) {
			while (rs.next()) {
				teacherDto = new TeacherDto();
				teacherDto.setTeacher_code(rs.getString(1));
				teacherDto.setTeacher_name(rs.getString(2));
				teacherDto.setClass_name(rs.getString(3));
				teacherDto.setClass_price(rs.getInt(4));
				teacherDto.setTeacher_regist_date(rs.getString(5));
				list.add(teacherDto);
			}
		}
		rs.close();
		pstmt.close();
		return list;
	}

	public List<MemberDto> selectAllMember() throws Exception {
		// SQL
		// select c.regist_month, m.c_no, m.c_name, t.class_name, c.class_area,
		// c.tuition, m.grade
		// from tbl_member_202201 m, tbl_class_202201 c, tbl_teacher_202201 t
		// where c.c_no = M.c_no and c.teacher_code = t.teacher_code;
		String sql = "select c.regist_month, m.c_no, m.c_name, t.class_name, c.class_area, c.tuition, m.grade"
				+ " from tbl_member_202201 m, tbl_class_202201 c, tbl_teacher_202201 t"
				+ " where c.c_no = M.c_no and c.teacher_code = t.teacher_code";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		List<MemberDto> list = new ArrayList();
		MemberDto memberDto = null;
		if (rs != null) {
			while (rs.next()) {
				memberDto = new MemberDto();
				memberDto.setRegist_month(rs.getString(1));
				memberDto.setM_no(rs.getString(2));
				memberDto.setM_name(rs.getString(3));
				memberDto.setC_name(rs.getString(4));
				memberDto.setC_area(rs.getString(5));
				memberDto.setTuition(rs.getInt(6));
				memberDto.setM_grade(rs.getString(7));
				list.add(memberDto);
			}
		}

		rs.close();
		pstmt.close();
		return list;
	}
}
