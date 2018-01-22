package DB;

import bean.MemberBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	// 아이디가 존재하는 확인하는 메서드
	// [ 파라미터 ]
	// user_id : 검사할 사용자 아이디
	// [반환값]
	// booean, 아이디가 있으면 true, 없으면 false
	public static boolean is_exist_user_id(String user_id)
										throws Exception {
		// 쿼리문
		String sql = "select * from MEMBER_TABLE "
				   + "where USER_ID=?";
		
		// 디비 접속
		// import java.sql
		Connection conn = DBConnector.getConnection();
		// 쿼리문 관리 객체 생성
		PreparedStatement pstmt = conn.prepareStatement(sql);
		// ?에 값 바인딩
		// assign : 할당한다~
		// binding : 셋팅한다~
		pstmt.setString(1, user_id);
		// 쿼리 실행
		ResultSet rs = pstmt.executeQuery();
		// next 메서드를 호출해서 가져온 데이터가 있는지 확인
		boolean check = rs.next();
		
		conn.close();
		
		return check;
	}
	
	// 사용자 정보를 저장하는 메서드
	// [ 파라미터 ]
	// 사용자 정보를 담고 있는 빈 객체
	public static void add_user(MemberBean bean) 
										throws Exception {
		// 데이터 베이스 접속
		Connection conn = DBConnector.getConnection();
		
		String sql = "insert into MEMBER_TABLE "
				   + "(USER_ID, USER_PW, USER_NAME, USER_ADDR, USER_PHNUM, USER_EMAIL, USER_GRADE, USER_POINTS, USER_REGDATE) "
				   + "values (?, ?, ?, ?, ?, ?, 1, 0, CURDATE())";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bean.getUser_id());
		pstmt.setString(2, bean.getUser_pw());
		pstmt.setString(3, bean.getUser_name());
		pstmt.setString(4, bean.getUser_addr());
		pstmt.setString(5, bean.getUser_phnum());
		pstmt.setString(6, bean.getUser_email());
		
		pstmt.execute();
		
		conn.close();
	}
	// 로그인 처리하는 메서드
	// [ 파라미터 ]
	// 사용자 아이디와 비밀번호를 담고 있는 빈 객체
	// [ 리턴 ]
	// 정수
	// 1 : 로그인 성공
	// 2 : 없는 아이디
	// 3 : 비밀번호가 틀린경우
	public static int check_login(MemberBean bean)
						throws Exception {
		Connection conn = DBConnector.getConnection();
		
		String sql = "select USER_PW from MEMBER_TABLE "
				   + "where USER_ID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, bean.getUser_id());
		
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()){			// 존재 하는 아이디
			// 비밀 번호를 가져온다.
			String pw = rs.getString("USER_PW");
			
			if(pw.equals(bean.getUser_pw())){
				// 비밀번호가 같은 경우
				conn.close();
				return 1;
			} else {			// 비밀번호가 다른 경우
				conn.close();
				return 3;
			}
		} else {				// 존재 하지 않는 아이디
			conn.close();
			return 2;
		}
	}
	// 사용자 정보를 가지고 오는 메서드
	// [파라미터]
	// 사용자 아이디
	// [리턴]
	// 사용자 정보가 담긴 빈 객체
	public static MemberBean get_user_info(String user_id)
					throws Exception {
		Connection conn = DBConnector.getConnection();
		
		String sql = "select * from MEMBER_TABLE "
				   + "where USER_ID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user_id);
		
		ResultSet rs = pstmt.executeQuery();
		// 데이터 추출하여 빈객체에 담는다.
		rs.next();
		
		MemberBean bean = new MemberBean();
		bean.setUser_id(rs.getString("USER_ID"));
		bean.setUser_pw(rs.getString("USER_PW"));
		bean.setUser_name(rs.getString("USER_NAME"));
		bean.setUser_grade(rs.getInt("USER_GRADE"));
		bean.setUser_addr(rs.getString("USER_ADDR"));
		bean.setUser_email(rs.getString("USER_EMAIL"));
		bean.setUser_phnum(rs.getString("USER_PHNUM"));
		bean.setUser_points(rs.getInt("USER_POINTS"));
		bean.setLogin_check(true);
		
		conn.close();
		
		return bean;
	}
	//회원 정보를 수정하는 메서드
	public static void modify_user(MemberBean bean) throws Exception {
		// 데이터 베이스 접속
		Connection conn = DBConnector.getConnection();

		String sql = "update MEMBER_TABLE set USER_PW=?, "
				+ "USER_ADDR=?, USER_PHNUM=?, "
				+ "USER_EMAIL=? where USER_ID=?";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, bean.getUser_pw());
	pstmt.setString(2, bean.getUser_addr());
	pstmt.setString(3, bean.getUser_phnum());
	pstmt.setString(4, bean.getUser_email());
	pstmt.setString(5, bean.getUser_id());
	
	
	pstmt.execute();
	
	conn.close();
	}
	//회원을 탈퇴처리하는 메서드
	public static void Memberleave(String user_id) throws Exception{
		//데이터 베이스 접속
		
		System.out.println(user_id);
		Connection conn = DBConnector.getConnection();
		
		String sql = "update MEMBER_TABLE set USER_GRADE=4 "
					+"where USER_ID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user_id);
		
		pstmt.execute();
		
		conn.close();
		
	}
}





























