package C09;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import C04.UserDto;

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
	public int insertUser(UserDto userDto) throws Exception {
		pstmt = conn.prepareStatement("insert into tbl_user values(?,?,?)");
		pstmt.setString(1, userDto.getUserid());
		pstmt.setString(2, userDto.getPassword());
		pstmt.setString(3, userDto.getRole());
		int result = pstmt.executeUpdate();

		conn.commit();

		pstmt.close();
		return result;
	}

	public List<UserDto> selectAllUser() throws Exception {
		List<UserDto> userlist = new ArrayList();
		UserDto userDto = null;
		pstmt = conn.prepareStatement("select * from TBL_USER");
		rs = pstmt.executeQuery();

		if (rs != null) {
			while (rs.next()) {
				userDto = new UserDto();
				userDto.setUserid(rs.getString("userid"));
				userDto.setPassword(rs.getString("password"));
				userDto.setRole(rs.getString("role"));
				userlist.add(userDto);
			}
		}
		rs.close();
		pstmt.close();
		return userlist;
	}

	public UserDto selectOneUser(String userid) throws Exception {
		UserDto userDto = null;
		pstmt = conn.prepareStatement("select * from TBL_USER where userid = ?");
		pstmt.setString(1, userid);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			userDto = new UserDto();
			userDto.setUserid(rs.getString("userid"));
			userDto.setPassword(rs.getString("password"));
			userDto.setRole(rs.getString("role"));
			return userDto;
		}
		rs.close();
		pstmt.close();
		return null;
	}

	public int updateUser(UserDto userDto) throws Exception {
		pstmt = conn.prepareStatement("update tbl_user set password = ?, role = ? where userid = ?");
		pstmt.setString(1, userDto.getPassword());
		pstmt.setString(2, userDto.getRole());
		pstmt.setString(3, userDto.getUserid());
		int result = pstmt.executeUpdate();

		conn.commit();

		pstmt.close();
		return result;
	}

	public int deleteUser(String userid) throws Exception {
		pstmt = conn.prepareStatement("delete from tbl_user where userid = ?");
		pstmt.setString(1, userid);
		int result = pstmt.executeUpdate();

		conn.commit();
		pstmt.close();

		return result;
	}

	// selectAllOrder
	public List<OrderDto> selectAllOrder() throws Exception {
		// SQL
		// select category, sum(price*quantity) as 총합 from tbl_order
		// group by category
		// having sum(price*quantity) >= 50000
		// order by sum(price*quantity) desc;
		String sql = "select category, sum(price*quantity) from tbl_order" + " group by category"
				+ " having sum(price*quantity) >= 50000" + " order by sum(price*quantity) desc";

		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		List<OrderDto> list = new ArrayList();
		OrderDto orderDto = null;

		if (rs != null) {
			while (rs.next()) {
				orderDto = new OrderDto();
				orderDto.setCategory(rs.getString(1));
				orderDto.setSum(rs.getInt(2));
				list.add(orderDto);
			}
		}
		rs.close();
		pstmt.close();
		return list;
	}

	public List<JoinDto> JoinOrder() throws Exception {
		// SQL
		// select addr, order_date, sum(price*quantity) from tbl_user u
		// join tbl_order o
		// on u.userid = o.userid
		// group by addr, order_date
		// order by addr asc, sum(price*quantity) desc;

		String sql = "select addr, order_date, sum(price*quantity) from tbl_user u" + " join tbl_order o"
				+ " on u.userid = o.userid" + " group by addr, order_date"
				+ " order by addr asc, sum(price*quantity) desc";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		List<JoinDto> list = new ArrayList();
		JoinDto joinDto = null;
		if (rs != null) {
			while (rs.next()) {
				joinDto = new JoinDto();
				joinDto.setAddr(rs.getString(1));
				joinDto.setOrder_date(rs.getDate(2).toLocalDate());
				joinDto.setSum(rs.getInt(3));
				list.add(joinDto);
			}
		}
		rs.close();
		pstmt.close();
		return list;
	}

	public List<DateDto> selectDate() throws Exception {
		// SQL
		// select order_date, round(avg(price * quantity), 2) from tbl_order
		// group by order_date;

		String sql = "select order_date, round(avg(price * quantity), 2) from tbl_order" + " group by order_date";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		List<DateDto> list = new ArrayList();
		DateDto dateDto = null;
		if (rs != null) {
			while (rs.next()) {
				dateDto = new DateDto();
				LocalDate date = rs.getDate(1).toLocalDate();
				dateDto.setOrder_date(date);
				dateDto.setRound(rs.getDouble(2));
				list.add(dateDto);
			}
		}
		rs.close();
		pstmt.close();
		return list;
	}

}
