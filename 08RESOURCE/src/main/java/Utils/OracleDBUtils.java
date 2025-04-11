package Utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class OracleDBUtils {
	
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String id = "system";
	private String pw = "1234";
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;	
	
	// DataSource Resource 연결
	private DataSource dataSource;
	
	//싱글톤 
	private static OracleDBUtils instance;
	private OracleDBUtils() throws Exception {
		// Class.forName("oracle.jdbc.driver.OracleDriver");
		// conn = DriverManager.getConnection(url, id, pw);
		
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		dataSource = (DataSource) envContext.lookup("jdbc/OracleDB");
		conn = dataSource.getConnection();
		System.out.println("Connection : " + conn);
	}
	
	public static OracleDBUtils getInstance() throws Exception {
		if(instance==null)
			instance = new OracleDBUtils();
		return instance;
	}
	
	// DB
	public int insertUser(UserDto userDto) throws Exception {
		pstmt =conn.prepareStatement("insert into tbl_user_202504 values(?,?,?)");
		pstmt.setString(1, userDto.getUsername());
		pstmt.setString(2, userDto.getPassword());
		pstmt.setString(3, userDto.getRole());
		
		int result = pstmt.executeUpdate();
		
		conn.commit();
		pstmt.close();
		return result;
	}
	
	public UserDto selectOne(String username) throws Exception {
		pstmt = conn.prepareStatement("select * from tbl_user_202504 where username = ?");
		pstmt.setString(1, username);
		rs = pstmt.executeQuery();
		UserDto userDto = null;
		if (rs.next()) {
			userDto = new UserDto(rs.getString(1),rs.getString(2),rs.getString(3));
		}
		rs.close();
		pstmt.close();
		return userDto;
	}
	
}







