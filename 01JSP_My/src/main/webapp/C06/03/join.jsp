<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*, C04.*" %>

<%!
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String id = "system";
	private String pw = "1234";

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private void getConnection() throws Exception {
		if (conn == null) {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);					
		}
	}
	
	private int insert(UserDto userDto) throws Exception {
		
		pstmt = conn.prepareStatement("insert into TBL_USER values(?,?,?)");
		pstmt.setString(1, userDto.getUserid());
		pstmt.setString(2, userDto.getPassword());
		pstmt.setString(3, userDto.getRole());

		int result = pstmt.executeUpdate();

		conn.commit();
		pstmt.close();
		
		return result;
	}
%>

<%
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	
	// 유효성 체크
	if (userid.isEmpty()) {
		request.setAttribute("userid_msg", "userid를 입력하세요");
	}
	
	if (password.isEmpty()) {
		request.setAttribute("password_msg", "password를 입력하세요");
	}
	
	if (userid.isEmpty() || password.isEmpty()) {
		request.getRequestDispatcher("./join_form.jsp").forward(request, response);
		return ;
	}
	
	// db 연결
	getConnection();
	
	// db와 대조
	pstmt = conn.prepareStatement("select * from tbl_user where userid = ?");
	pstmt.setString(1, userid);
	rs = pstmt.executeQuery();
	
	boolean count = false;
	while (rs.next()) {
		if(userid.equals(rs.getString("userid"))) {
			count = true;
		}
	}
	if (count) {
		request.setAttribute("userid_msg", "동일한 id가 이미 존재합니다.");
		request.getRequestDispatcher("./join_form.jsp").forward(request, response);		
		return ;
	}
	
	// DB Insert
	// userDto 객체 생성
	UserDto userDto = new UserDto(userid, password, "ROLE_USER");

	if(insert(userDto) > 0) {
		out.println("<script>alert('회원가입 성공!'); location.href='./login.jsp'</script>");
		return ;
	}

%>