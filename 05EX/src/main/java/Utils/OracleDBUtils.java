package Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OracleDBUtils {
	
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String id = "system";
	private String pw = "1234";
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;	
	
	//싱글톤 
	private static OracleDBUtils instance;
	private OracleDBUtils() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, id, pw);
	}
	public static OracleDBUtils getInstance() throws Exception {
		if(instance==null)
			instance = new OracleDBUtils();
		return instance;
	}
	
	// DB
	public int insertUser(UserDto userDto) throws Exception {
		pstmt =conn.prepareStatement("insert into tbl_user_202504 values(?,?)");
		pstmt.setString(1, userDto.getUsername());
		pstmt.setString(2, userDto.getPassword());
		int result = pstmt.executeUpdate();
		
		conn.commit();
		pstmt.close();
		return result;
	}
	
	public UserDto selectUser(UserDto userDto) throws Exception {
		pstmt = conn.prepareStatement("select * from tbl_user_202504 where username=? and password=?");
		pstmt.setString(1, userDto.getUsername());
		pstmt.setString(2, userDto.getPassword());
		rs = pstmt.executeQuery();

		if(rs.next()) {
			UserDto selectuser = new UserDto();
			selectuser.setUsername(rs.getString(1));
			selectuser.setPassword(rs.getString(2));
			return selectuser;
		}
		rs.close();
		pstmt.close();
		return null;
	}
	
	public UserDto selectOne(String username) throws Exception {
		pstmt = conn.prepareStatement("select * from tbl_user_202504 where username = ?");
		pstmt.setString(1, username);
		rs = pstmt.executeQuery();
		UserDto userDto = null;
		if (rs.next()) {
			userDto = new UserDto(rs.getString(1),rs.getString(2));
		}
		rs.close();
		pstmt.close();
		return userDto;
	}
	
}







