package Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

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
	public int insertResv(ResvDto resvDto) throws Exception {
		pstmt = conn.prepareStatement("insert into values(?,?,?,?,?,?)");
		pstmt.setInt(1, resvDto.getResvno());
		pstmt.setString(2, resvDto.getJumin());
		pstmt.setString(3, resvDto.getHospcode());
		LocalDate resvDate = resvDto.getResvdate();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		pstmt.setString(4, formatter.format(resvDate));
		pstmt.setInt(5, resvDto.getResvtime());
		pstmt.setString(6, resvDto.getVcode());
		int result = pstmt.executeUpdate();
		conn.commit();
		
		pstmt.close();
		return result;
	}
	

}
