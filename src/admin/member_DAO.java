package admin;

import DB.*;
import bean.*;

import java.sql.*;
import java.util.ArrayList;

public class member_DAO {

	// 빈객체를 매개변수로 받는다.
	// 리뷰작성
	public static void member_update(MemberBean2 bean) {

		try {

			// DB연결
			Connection conn = DBConnector.getConnection();

			// SQL 문
			String sql = "UPDATE MEMBER_TABLE "
					      + "SET user_name=?, user_addr=?, user_phnum=?, user_email=?, user_grade=?, user_points=?"
					      + "WHERE user_id=?";
			

			PreparedStatement psmt = conn.prepareStatement(sql);

			psmt.setString(1, bean.getUser_name());
			psmt.setString(2, bean.getUser_addr());
			psmt.setString(3, bean.getUser_phnum());
			psmt.setString(4, bean.getUser_email());
			psmt.setInt(5, bean.getUser_grade());
			psmt.setInt(6, bean.getUser_points());
			psmt.setString(7, bean.getUser_id());
			
			

			// SQL 실행
			psmt.execute();

			// DB 연결 종료
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	} // review_write()

	// 모든 회원들을 불러온다.
	public static ArrayList<MemberBean2> member_get(int start, int end, int align, String search_val) {

		// Arraylist 생성
		// 빈객체를 담을 arraylist
		ArrayList<MemberBean2> list = new ArrayList<MemberBean2>();

		try {

			// DB연결
			Connection conn = DBConnector.getConnection();
			String sql=null;
			System.out.println("정렬값 : " + align);
			System.out.println("검색값 : " + search_val);
			
			if(align == 0 && search_val == null){
				// SQL
				// MEMBER_TABLE에 모든 데이터를 불러온다. (가입일기준으로 내림차순 출력)
				sql = "select * from " + "(select rownum as rnum, a1.* from "
						+ "(select * FROM MEMBER_TABLE ORDER BY user_regdate DESC) a1) a2 " + "where a2.rnum >= ? and a2.rnum <=?";
				
			} else if(align == 1){
				// SQL
				// 등급별 내림차순
				sql = "select * from " + "(select rownum as rnum, a1.* from "
						+ "(select * FROM MEMBER_TABLE ORDER BY user_grade DESC) a1) a2 " + "where a2.rnum >= ? and a2.rnum <=?";
				
				
			} else if(align == 2){
				// SQL
				// ID별 내림차순
				sql = "select * from " + "(select rownum as rnum, a1.* from "
						+ "(select * FROM MEMBER_TABLE ORDER BY user_id DESC) a1) a2 " + "where a2.rnum >= ? and a2.rnum <=?";
								
				
			} else if(align == 3){
				// SQL
				// 이름별 내림차순
				sql = "select * from " + "(select rownum as rnum, a1.* from "
						+ "(select * FROM MEMBER_TABLE ORDER BY user_name DESC) a1) a2 " + "where a2.rnum >= ? and a2.rnum <=?";
				
			} else if(align == 4){
				// SQL
				// 탈퇴회원 명단
				sql = "select * from " + "(select rownum as rnum, a1.* from "
						+ "(select * FROM MEMBER_TABLE WHERE user_grade=4) a1) a2 " + "where a2.rnum >= ? and a2.rnum <=?";
				
			}
			
			//검색
			if(search_val != null){
				//SQL
				
				sql = "select * from " + "(select rownum as rnum, a1.* from "
						+ "(select * FROM MEMBER_TABLE WHERE user_id='" + search_val + "' OR user_name='" + search_val + "'"
						+ ") a1) a2 " + "where a2.rnum >= ? and a2.rnum <=?";
				
			}
			
			
			

			// Statement stmt = conn.createStatement();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			// SQL 실행
			ResultSet rs = pstmt.executeQuery();

			// rs.next() 값이 있으면 투루를 반환.
			while (rs.next()) {

				String user_id = rs.getString("USER_ID"); // ID
				String user_pw = rs.getString("USER_PW"); // PW
				String user_name = rs.getString("USER_NAME"); // NAME
				String user_addr = rs.getString("USER_ADDR"); // ADDR
				String user_phnum = rs.getString("USER_PHNUM"); // 연락처
				String user_email = rs.getString("USER_EMAIL"); // e-mail
				int user_grade = rs.getInt("USER_GRADE"); 	// 1 : 일반
															// 2: 우수
															// 3: 관리자
															// 4: 탈퇴를 원하는 녀석들
				int user_points = rs.getInt("USER_POINTS"); // 포인트
				Date user_regdate = rs.getDate("USER_REGDATE"); // 가입일

				// 빈객체 생성
				MemberBean2 bean = new MemberBean2();

				
				bean.setUser_id(user_id);
				bean.setUser_pw(user_pw);
				bean.setUser_name(user_name);
				bean.setUser_addr(user_addr);
				bean.setUser_email(user_email);
				bean.setUser_phnum(user_phnum);
				bean.setUser_grade(user_grade);
				bean.setUser_points(user_points);
				bean.setUser_regdate(user_regdate);
				

				list.add(bean);
			}

			// DB 연결 종료
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	
	// 총 레코드수(회원 수)를 구함.
	public static int member_Count() throws Exception {

		Connection conn = DBConnector.getConnection();

		// 쿼리문
		String sql = "SELECT COUNT(*) FROM MEMBER_TABLE";

		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();

		// 전체 글의 개수를 가져온다.
		int cnt = rs.getInt(1);

		conn.close();

		// 총 페이지 개수 리턴
		return cnt;

	}

	// 회원정보를 읽어온다. 인자값으로 받은 ID의 회원 정보를 불러옴
	//(JSON으로 전달 : Object to JSON)
	public static MemberBean2 member_read(String id) throws Exception {

		// 빈객체 생성
		MemberBean2 bean = new MemberBean2();

		// DB 연결
		Connection conn = DBConnector.getConnection();

		// SQL
		String sql = "SELECT * FROM MEMBER_TABLE WHERE USER_ID=?";

		//Statement stmt = conn.createStatement();

		PreparedStatement psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, id);
		
		ResultSet rs = psmt.executeQuery();

		while (rs.next()) {

			String user_id = rs.getString("USER_ID"); // ID
			String user_pw = rs.getString("USER_PW"); // PW
			String user_name = rs.getString("USER_NAME"); // NAME
			String user_addr = rs.getString("USER_ADDR"); // ADDR
			String user_phnum = rs.getString("USER_PHNUM"); // 연락처
			String user_email = rs.getString("USER_EMAIL"); // e-mail
			int user_grade = rs.getInt("USER_GRADE"); 	// 1 : 일반
														// 2: 우수
														// 3: 관리자
														// 4: 탈퇴를 원하는 녀석들
			int user_points = rs.getInt("USER_POINTS"); // 포인트
			Date user_regdate = rs.getDate("USER_REGDATE"); // 가입일

						
			bean.setUser_id(user_id);
			bean.setUser_pw(user_pw);
			bean.setUser_name(user_name);
			bean.setUser_addr(user_addr);
			bean.setUser_email(user_email);
			bean.setUser_phnum(user_phnum);
			bean.setUser_grade(user_grade);
			bean.setUser_points(user_points);
			bean.setUser_regdate(user_regdate);

		}
		
		//DB연결 종료
		conn.close();

		return bean;

	}

	public static void member_delete(String user_id) throws Exception {

		Connection conn = DBConnector.getConnection();

		// SQL
		String sql = "DELETE FROM MEMBER_TABLE WHERE USER_ID=?";

		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.setString(1, user_id);
		pstm.executeQuery();
		// Statement stmt = conn.createStatement();
		// stmt.executeQuery(sql);

		conn.close();

	}

}
