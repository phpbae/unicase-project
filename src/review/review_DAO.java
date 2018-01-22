package review;

import DB.*;
import bean.*;

import java.sql.*;
import java.util.ArrayList;

public class review_DAO {

	// 빈객체를 매개변수로 받는다.
	// 리뷰작성
	public static void review_write(review_Bean bean) {

		try {

			// DB연결
			Connection conn = DBConnector.getConnection();

			// SQL 문
			String sql = "INSERT INTO REVIEW_TABLE(review_num, user_id, review_goods_name, review_title, review_content, review_cnt, review_star, review_buy_opt, review_goods_num, review_regdate)"
					+ " VALUES(review_num.nextval, ?, ?, ?, ?, 0, ?, ?, ?, sysdate)";

			PreparedStatement psmt = conn.prepareStatement(sql);

			psmt.setString(1, bean.getUser_id());
			psmt.setString(2, bean.getReview_goods_name());
			psmt.setString(3, bean.getReview_title());
			psmt.setString(4, bean.getReview_content());
			psmt.setInt(5, bean.getReview_star());
			psmt.setInt(6, bean.getReview_buy_opt());
			psmt.setInt(7, bean.getReview_goods_num());

			// SQL 실행
			psmt.execute();

			// DB 연결 종료
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	} // review_write()

	// 모든 리뷰글들을 불러온다.
	public static ArrayList<review_Bean> review_get(int start, int end, int goods_num) {

		// Arraylist 생성
		// 빈객체를 담을 arraylist
		ArrayList<review_Bean> list = new ArrayList<review_Bean>();

		try {

					
			// DB연결
			Connection conn = DBConnector.getConnection();

			// SQL
			// 리뷰게시판에 모든 데이터를 불러온다.
			String sql =  "select * from "
						 + "(select rownum as rnum, a1.* from "
					     + "(select review_num, user_id, review_goods_name, review_title, review_content, review_cnt, review_star, review_buy_opt, review_goods_num, review_regdate FROM REVIEW_TABLE ORDER BY review_num DESC) a1) a2 "
						 + "where a2.rnum >= ? and a2.rnum <=? and review_goods_num = ?";

			//Statement stmt = conn.createStatement();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			pstmt.setInt(3, goods_num);

			// SQL 실행
			ResultSet rs = pstmt.executeQuery();

			// rs.next() 값이 있으면 투루를 반환.
			while (rs.next()) {

				int review_num = rs.getInt("REVIEW_NUM"); // 글 번호
				String user_id = rs.getString("USER_ID"); // 작성자 ID
				String review_goods_name = rs.getString("REVIEW_GOODS_NAME"); // 상품명
				String review_title = rs.getString("REVIEW_TITLE"); // 리뷰 제목
				String review_content = rs.getString("REVIEW_CONTENT"); // 리뷰 내용
				int review_cnt = rs.getInt("REVIEW_CNT"); // 조회수
				int review_star = rs.getInt("REVIEW_STAR"); // 별점
				int review_buy_opt = rs.getInt("REVIEW_BUY_OPT"); // 구매여부 0 : X
																	// 1 : 구매
				int review_goods_num = rs.getInt("REVIEW_GOODS_NUM");
				Date review_regdate = rs.getDate("REVIEW_REGDATE"); // 리뷰 작성일

				// 빈객체 생성
				review_Bean bean = new review_Bean();

				bean.setReview_num(review_num);
				bean.setUser_id(user_id);
				bean.setReview_goods_name(review_goods_name);
				bean.setReview_title(review_title);
				bean.setReview_content(review_content);
				bean.setReview_cnt(review_cnt);
				bean.setReview_buy_opt(review_buy_opt);
				bean.setReview_star(review_star);
				bean.setReview_regdate(review_regdate);
				bean.setReview_goods_num(review_goods_num);

				list.add(bean);
			}

			// DB 연결 종료
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	// 페이지 수를 구하는 메서드
	// 총 레코드수(게시글 수)를 구함.
	public static int review_getPageCount() throws Exception {

		Connection conn = DBConnector.getConnection();

		// 쿼리문
		String sql = "SELECT COUNT(*) FROM " + "REVIEW_TABLE";

		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();

		// 전체 글의 개수를 가져온다.
		int cnt = rs.getInt(1);

		
		conn.close();

		// 총 페이지 개수 리턴
		return cnt;

	}

	// 리뷰글을 읽어오는 메서드
	public static review_Bean review_read(int num) throws Exception {

		// 빈객체 생성
		review_Bean bean = new review_Bean();

		// DB 연결
		Connection conn = DBConnector.getConnection();

		// SQL
		String sql = "SELECT * FROM REVIEW_TABLE WHERE REVIEW_NUM=" + num;

		Statement stmt = conn.createStatement();

		ResultSet rs = stmt.executeQuery(sql);

		while (rs.next()) {

			int review_num = rs.getInt("REVIEW_NUM"); // 글 번호
			String user_id = rs.getString("USER_ID"); // 작성자 ID
			String review_goods_name = rs.getString("REVIEW_GOODS_NAME"); // 상품명
			String review_title = rs.getString("REVIEW_TITLE"); // 리뷰 제목
			String review_content = rs.getString("REVIEW_CONTENT"); // 리뷰 내용
			int review_cnt = rs.getInt("REVIEW_CNT"); // 조회수
			int review_star = rs.getInt("REVIEW_STAR"); // 별점
			int review_buy_opt = rs.getInt("REVIEW_BUY_OPT"); // 구매여부 0 : X 1 :
																// 구매
			Date review_regdate = rs.getDate("REVIEW_REGDATE"); // 리뷰 작성일

			bean.setReview_num(review_num);
			bean.setUser_id(user_id);
			bean.setReview_goods_name(review_goods_name);
			bean.setReview_title(review_title);
			bean.setReview_content(review_content);
			bean.setReview_cnt(review_cnt);
			bean.setReview_buy_opt(review_buy_opt);
			bean.setReview_star(review_star);
			bean.setReview_regdate(review_regdate);

		}

		conn.close();

		return bean;

	}
	
	
	public static void review_delete(int num, String user_id) throws Exception{
		
		Connection conn = DBConnector.getConnection();

		// SQL
		String sql = "DELETE FROM REVIEW_TABLE WHERE REVIEW_NUM=" + num + "and USER_ID=?";
		
		PreparedStatement pstm = conn.prepareStatement(sql);
		
		pstm.setString(1, user_id);
		pstm.executeQuery();
		//Statement stmt = conn.createStatement();
		//stmt.executeQuery(sql);
		
		conn.close();
	
		
	}

	

}
