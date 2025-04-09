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
	
	public List<MemberDto2> selectAllMember2() throws Exception {
		pstmt = conn.prepareStatement("select * from tbl_member_202201");
		rs = pstmt.executeQuery();
		
		List<MemberDto2> list = new ArrayList();
		MemberDto2 memberDto2 = null;
		if (rs != null) {
			while(rs.next()) {
				memberDto2 = new MemberDto2();
				memberDto2.setC_no(rs.getString(1));
				memberDto2.setC_name(rs.getString(2));
				memberDto2.setPhone(rs.getString(3));
				memberDto2.setAddress(rs.getString(4));
				memberDto2.setGrade(rs.getString(5));
				list.add(memberDto2);
			}
		}
		rs.close();
		pstmt.close();
		return list;
	}
	
	public int insertClass(ClassDto classDto) throws Exception {
		pstmt = conn.prepareStatement("insert into tbl_class_202201 values(?,?,?,?,?)");
		pstmt.setString(1, classDto.getRegist_month());
		pstmt.setString(2, classDto.getC_no());
		pstmt.setString(3, classDto.getClass_area());
		pstmt.setInt(4, classDto.getTuition());
		pstmt.setString(5, classDto.getTeacher_code());
		int result = pstmt.executeUpdate();
		
		conn.commit();
		
		pstmt.close();
		return result;
	}

	public List<MemberDto> selectAllMember() throws Exception {
		// SQL
		// select c.regist_month, m.c_no, m.c_name, t.class_name, c.class_area,
		// c.tuition, m.grade
		// from tbl_member_202201 m, tbl_class_202201 c, tbl_teacher_202201 t
		// where c.c_no = M.c_no and c.teacher_code = t.teacher_code;
		String sql = "select substr(c.regist_month,0,4)||'년'||substr(c.regist_month,5,2)||'월', m.c_no, m.c_name, t.class_name, c.class_area, c.tuition, m.grade"
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

	public List<TeacherDto> selectAllPrice() throws Exception {
		// SQL
		// select c.teacher_code, t.class_name, t.teacher_name, sum(c.tuition)
		// from tbl_class_202201 c
		// join tbl_teacher_202201 t
		// on c.teacher_code = t.teacher_code
		// group by c.teacher_code, t.class_name, t.teacher_name
		// order by c.teacher_code;
		String sql = "select c.teacher_code, t.class_name, t.teacher_name, sum(c.tuition)"
				+ " from tbl_class_202201 c join tbl_teacher_202201 t" + " on c.teacher_code = t.teacher_code"
				+ " group by c.teacher_code, t.class_name, t.teacher_name" + " order by c.teacher_code";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		List<TeacherDto> list = new ArrayList();
		TeacherDto teacherDto = null;
		if (rs != null) {
			while (rs.next()) {
				teacherDto = new TeacherDto();
				teacherDto.setTeacher_code(rs.getString(1));
				teacherDto.setClass_name(rs.getString(2));
				teacherDto.setTeacher_name(rs.getString(3));
				teacherDto.setClass_price(rs.getInt(4));
				list.add(teacherDto);
			}
		}
		rs.close();
		pstmt.close();
		return list;
	}
}
