package DB;

import bean.notice_Bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class notice_DAO {
	
	// 전달 받은 게시글 정보를 데이터 베이스에 저장한다.
	// [ 파라미터 ]
	// 저장할 게시글 정보가 들어 있는 빈 객체

	public static void add_notice_content(notice_Bean bean) throws Exception {
		// import java.sql
		Connection conn = DBConnector.getConnection();

		String sql = "insert into NOTICE_TABLE " + "(notice_num, notice_title, " + "notice_content, user_id) values "
				+ "(NOTICE_NUM_SEQ.nextval, ?, ?, ?)";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bean.getNotice_title());
		pstmt.setString(2, bean.getNotice_content());
		pstmt.setString(3, bean.getUser_id());

		pstmt.execute();

		conn.close();
	}
	
	//가장 최신글 가지고 오기.
	public static int get_notice_final() throws Exception {
		
		Connection conn = DBConnector.getConnection();

		String sql = "SELECT max(notice_num) FROM NOTICE_TABLE";

		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		//PreparedStatement pstmt = conn.prepareStatement(sql);
		//pstmt.setInt(1, notice_num);

		// ResultSet rs = pstmt.executeQuery();
		
		rs.next();		
		int idx = rs.getInt(1);
		
		
		conn.close();

		return idx;
	}

	
	// notice_idx : 글의 인덱스 번호(공지글 번호)
	
	public static notice_Bean get_notice_data(int notice_num) throws Exception {
		Connection conn = DBConnector.getConnection();

		String sql = "SELECT * FROM NOTICE_TABLE WHERE notice_num=?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, notice_num);

		ResultSet rs = pstmt.executeQuery();
		rs.next();

		notice_Bean bean = new notice_Bean();
		bean.setNotice_num(rs.getInt("notice_num"));
		bean.setNotice_title(rs.getString("notice_title"));
		bean.setNotice_content(rs.getString("notice_content"));
		bean.setUser_id(rs.getString("user_id"));

		conn.close();

		return bean;
	}

	// 글 정보 전체를 가져오는 메서드
	// [파라미터]
	// page_num : 페이지 번호
	// [리턴]
	// 해당 페이지에 보여줄 글의 정보를 가지고 있는 컬렉션
	public static ArrayList<notice_Bean> get_notice_all() throws Exception {

		Connection conn = DBConnector.getConnection();

		
		String sql = "SELECT * FROM NOTICE_TABLE ORDER BY notice_num DESC";

		Statement pstmt = conn.createStatement();

		ResultSet rs = pstmt.executeQuery(sql);
		// 데이터 담을 컬렉션
		ArrayList<notice_Bean> list = new ArrayList<notice_Bean>();
		// 데이터의 개수만큼 반복
		while (rs.next()) {
			int notice_num = rs.getInt("notice_num");
			String notice_title = rs.getString("notice_title");
			String user_id = rs.getString("user_id");
			// 빈 객체에 담는다.
			notice_Bean sub = new notice_Bean();
			sub.setNotice_num(notice_num);
			sub.setNotice_title(notice_title);
			sub.setUser_id(user_id);
			// 컬렉션에 담아준다.
			list.add(sub);
		}

		conn.close();

		return list;

	}

	// 글을 삭제하는 메서드
	public static void delete_content(int notice_num) throws Exception {
		Connection conn = DBConnector.getConnection();

		// 쿼리문
		String sql = "delete from NOTICE_TABLE " + "where notice_num=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, notice_num);

		pstmt.execute();

		conn.close();
	}

	// 글을 수정하는 메서드
	public static void modify_content2(int notice_num, String notice_title, String notice_content) throws Exception {
		//DB연결
		Connection conn = DBConnector.getConnection();
		
		String sql = "UPDATE NOTICE_TABLE SET notice_title=?, notice_content=? WHERE notice_num=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, notice_title);
		pstmt.setString(2, notice_content);
		pstmt.setInt(3, notice_num);

		pstmt.execute();

		conn.close();
	}
	
	//수정할 공지글을 읽어오는 메소드
	public static notice_Bean modify_content(String user_id, int notice_num) throws Exception{
		
		//DB접속
		Connection conn = DBConnector.getConnection();
		
		//SQL
		String sql = "SELECT * FROM NOTICE_TABLE WHERE notice_num=? AND user_id=?";
		
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setInt(1, notice_num);
		psmt.setString(2, user_id);
		
		ResultSet rs =  psmt.executeQuery();
		
		
		notice_Bean bean = new notice_Bean();
		
		if(rs.next()){
			
			bean.setNotice_num(rs.getInt("NOTICE_NUM"));
			bean.setNotice_title(rs.getString("NOTICE_TITLE"));
			bean.setNotice_content(rs.getString("NOTICE_CONTENT"));
			bean.setUser_id(rs.getString("USER_ID"));
			
		}
		
		
		
		
		return bean;
		
		
	}
	
	

}
