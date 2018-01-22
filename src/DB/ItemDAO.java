package DB;

import bean.ItemBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

public class ItemDAO {

	// 상품등록
	// 상품을 등록하는 메서드
	public static void add_item_register(ItemBean goodsbean) throws Exception {
		// import java.sql
		Connection conn = DBConnector.getConnection();
		// goods_price NUMBER, /* 가격 */
		String sql = "insert into GOODS_TABLE " + "(GOODS_NUM, GOODS_CODE, "
				+ "GOODS_NAME, GOODS_IMG, GOODS_BRAND, GOODS_PRICE, GOODS_INFO, GOODS_POINTS, GOODS_REGDATE) values "
				+ "(?, ?, ?, ?, ?, ?, ?, ?, SYSDATE)";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, goodsbean.getGoods_num());
		pstmt.setInt(2, goodsbean.getGoods_code());
		pstmt.setString(3, goodsbean.getGoods_name());
		pstmt.setString(4, goodsbean.getGoods_img());
		pstmt.setString(5, goodsbean.getGoods_brand());
		pstmt.setInt(6, goodsbean.getGoods_price());
		pstmt.setString(7, goodsbean.getGoods_info());
		pstmt.setInt(8, goodsbean.getGoods_points());

		pstmt.execute();

		conn.close();
	}

	// 상품 색상과 수량을 등록하는 메서드
	public static void add_item_register2(ItemBean goodsbean) throws Exception {
		// arrylist 처리
		// import java.sql
		Connection conn = DBConnector.getConnection();
		// goods_price NUMBER, /* 가격 */
		String sql = "insert into GOOD_DETAILS_TABLE " + "(GOODS_PK_NUM, GOODS_NUM, "
				+ "GOODS_AMOUNT, GOODS_COLOR_NUM) values " + "(goods_pk_num.nextval, ?, ?, ?)";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, goodsbean.getGoods_num());
		pstmt.setInt(2, goodsbean.getGodds_amount());
		pstmt.setInt(3, goodsbean.getGoods_color_num());

		pstmt.execute();

		conn.close();
	}

	//

	// 상품 정보 전체를 게시판으로 가져오는 메서드
	// [파라미터]
	// page_num : 페이지 번호
	// [리턴]
	// 해당 페이지에 보여줄 글의 정보를 가지고 있는 컬렉션
	public static ArrayList<ItemBean> get_board_all(int page_num) throws Exception {

		Connection conn = DBConnector.getConnection();

		String sql = "select * from " + "(select rownum as rnum, a1.* from " + "(select * from GOODS_TABLE "
				+ "order by GOODS_REGDATE desc) a1) a2 " + "where a2.rnum >= ? and a2.rnum <= ?";

		int min = 1 + ((page_num - 1) * 5);
		int max = min + (5 - 1);

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, min);
		pstmt.setInt(2, max);

		ResultSet rs = pstmt.executeQuery();
		// 데이터 담을 컬렉션
		ArrayList<ItemBean> list = new ArrayList<ItemBean>();
		// 데이터의 개수만큼 반복
		while (rs.next()) {
			String goods_num = rs.getString("GOODS_NUM");
			int goods_code = rs.getInt("GOODS_CODE");
			String goods_name = rs.getString("GOODS_NAME");
			String goods_img = rs.getString("GOODS_IMG");
			String goods_brand = rs.getString("GOODS_BRAND");
			int goods_price = rs.getInt("GOODS_PRICE");
			String goods_info = rs.getString("GOODS_INFO");
			int goods_points = rs.getInt("GOODS_POINTS");
			Date goods_regdate = rs.getDate("GOODS_REGDATE");

			// 빈 객체에 담는다.
			ItemBean sub = new ItemBean();
			sub.setGoods_num(goods_num);
			sub.setGoods_code(goods_code);
			sub.setGoods_name(goods_name);
			sub.setGoods_img(goods_img);
			sub.setGoods_brand(goods_brand);
			sub.setGoods_price(goods_price);
			sub.setGoods_points(goods_points);
			sub.setGoods_regdate(goods_regdate);

			// 컬렉션에 담아준다.
			list.add(sub);
		}

		conn.close();

		return list;

	}

	// 상품 정보 전체를 메인으로 가져오는 메서드
	// [파라미터]
	// page_num : 페이지 번호
	// [리턴]
	// 해당 페이지에 보여줄 글의 정보를 가지고 있는 컬렉션
	public static ArrayList<ItemBean> get_main_item_all() throws Exception {

		Connection conn = DBConnector.getConnection();

		String sql = "select * from GOODS_TABLE " + "order by GOODS_REGDATE desc";

		Statement stmt = conn.createStatement();

		ResultSet rs = stmt.executeQuery(sql);
		// 데이터 담을 컬렉션
		ArrayList<ItemBean> list = new ArrayList<ItemBean>();
		// 데이터의 개수만큼 반복
		while (rs.next()) {
			String goods_num = rs.getString("GOODS_NUM");
			int goods_code = rs.getInt("GOODS_CODE");
			String goods_name = rs.getString("GOODS_NAME");
			String goods_img = rs.getString("GOODS_IMG");
			String goods_brand = rs.getString("GOODS_BRAND");
			int goods_price = rs.getInt("GOODS_PRICE");
			String goods_info = rs.getString("GOODS_INFO");
			int goods_points = rs.getInt("GOODS_POINTS");
			Date goods_regdate = rs.getDate("GOODS_REGDATE");

			System.out.println(goods_num);

			// 빈 객체에 담는다.
			ItemBean sub = new ItemBean();
			sub.setGoods_num(goods_num);
			sub.setGoods_code(goods_code);
			sub.setGoods_name(goods_name);
			sub.setGoods_img(goods_img);
			sub.setGoods_brand(goods_brand);
			sub.setGoods_price(goods_price);
			sub.setGoods_points(goods_points);
			sub.setGoods_regdate(goods_regdate);

			// 컬렉션에 담아준다.
			list.add(sub);
		}

		conn.close();

		return list;

	}

	// 메인페이지 신상품정보를 불러오는 메소드
	// 8개 까지 표시(날짜가 최신인 순으로..)
	public static ArrayList<ItemBean> get_main_item_new() throws Exception {

		Connection conn = DBConnector.getConnection();

//		String sql = "select * from " + "(select rownum as rnum, a1.* from " + "(select * from GOODS_TABLE "
//				+ "order by GOODS_REGDATE desc) a1) a2 " + "where a2.rnum >= 1 and a2.rnum <= 8";

		String sql = "SELECT * FROM goods_table ORDER BY goods_regdate DESC LIMIT 1,8";

		Statement stmt = conn.createStatement();

		ResultSet rs = stmt.executeQuery(sql);
		// 데이터 담을 컬렉션
		ArrayList<ItemBean> list = new ArrayList<ItemBean>();
		// 데이터의 개수만큼 반복
		while (rs.next()) {
			String goods_num = rs.getString("GOODS_NUM");
			int goods_code = rs.getInt("GOODS_CODE");
			String goods_name = rs.getString("GOODS_NAME");
			String goods_img = rs.getString("GOODS_IMG");
			String goods_brand = rs.getString("GOODS_BRAND");
			int goods_price = rs.getInt("GOODS_PRICE");
			String goods_info = rs.getString("GOODS_INFO");
			int goods_points = rs.getInt("GOODS_POINTS");
			Date goods_regdate = rs.getDate("GOODS_REGDATE");

			System.out.println(goods_num);

			// 빈 객체에 담는다.
			ItemBean sub = new ItemBean();
			sub.setGoods_num(goods_num);
			sub.setGoods_code(goods_code);
			sub.setGoods_name(goods_name);
			sub.setGoods_img(goods_img);
			sub.setGoods_brand(goods_brand);
			sub.setGoods_price(goods_price);
			sub.setGoods_points(goods_points);
			sub.setGoods_regdate(goods_regdate);

			// 컬렉션에 담아준다.
			list.add(sub);
		}

		conn.close();

		return list;

	}

	// 상품 전체를 분류코드 별로 보기위해 가져오는 메서드
	// [파라미터]
	// page_num : 페이지 번호
	// [리턴]
	// 해당 페이지에 보여줄 글의 정보를 가지고 있는 컬렉션
	public static ArrayList<ItemBean> get_board_all2(int page_num) throws Exception {

		Connection conn = DBConnector.getConnection();

		String sql = "select * from " + "(select rownum as rnum, a1.* from " + "(select * from GOODS_TABLE "
				+ "order by GOODS_CODE desc) a1) a2 " + "where a2.rnum >= ? and a2.rnum <= ?";

		int min = 1 + ((page_num - 1) * 5);
		int max = min + (5 - 1);

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, min);
		pstmt.setInt(2, max);

		ResultSet rs = pstmt.executeQuery();
		// 데이터 담을 컬렉션
		ArrayList<ItemBean> list = new ArrayList<ItemBean>();
		// 데이터의 개수만큼 반복
		while (rs.next()) {
			String goods_num = rs.getString("GOODS_NUM");
			int goods_code = rs.getInt("GOODS_CODE");
			String goods_name = rs.getString("GOODS_NAME");
			// 빈 객체에 담는다.
			ItemBean sub = new ItemBean();
			sub.setGoods_num(goods_num);
			sub.setGoods_code(goods_code);
			sub.setGoods_name(goods_name);
			// 컬렉션에 담아준다.
			list.add(sub);
		}

		conn.close();

		return list;

	}

	// 상품 정보를 반화는 메서드
	// [ 파라미터 ]
	// [ 리턴 ]
	// 상품 데이터에 담겨져 있는 빈 객체를 반환
	public static ItemBean get_itemboard_data(String goods_num) throws Exception {
		Connection conn = DBConnector.getConnection();

		String sql = "select * from GOODS_TABLE where goods_num=?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, goods_num);

		System.out.println("디비다");
		ResultSet rs = pstmt.executeQuery();
		rs.next();

		ItemBean goodsbean = new ItemBean();
		goodsbean.setGoods_num(rs.getString("GOODS_NUM"));
		goodsbean.setGoods_code(rs.getInt("GOODS_CODE"));
		goodsbean.setGoods_name(rs.getString("GOODS_NAME"));
		goodsbean.setGoods_name(rs.getString("GOODS_NAME"));
		goodsbean.setGoods_img(rs.getString("GOODS_IMG"));
		goodsbean.setGoods_brand(rs.getString("GOODS_BRAND"));
		goodsbean.setGoods_info(rs.getString("GOODS_INFO"));
		goodsbean.setGoods_points(rs.getInt("GOODS_POINTS"));
		goodsbean.setGoods_price(rs.getInt("GOODS_PRICE"));

		conn.close();

		return goodsbean;
	}

	// 상품 상세정보 데이터에 담겨져 있는 빈 객체를 반환
	public static ArrayList<ItemBean> get_itemboard2_data(String goods_num) throws Exception {
		Connection conn = DBConnector.getConnection();

		String sql = "select * from GOOD_DETAILS_TABLE where goods_num=?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, goods_num);

		System.out.println("디비다");

		ArrayList<ItemBean> list = new ArrayList<ItemBean>();

		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			ItemBean goodsbean = new ItemBean();
			goodsbean.setGoods_color_num(rs.getInt("GOODS_COLOR_NUM"));
			goodsbean.setGodds_amount(rs.getInt("GOODS_AMOUNT"));

			list.add(goodsbean);
		}

		conn.close();

		return list;
	}

	// 페이지의 개수를 반환하는 메서드
	// [리턴]
	// 정수 : 페이지의 개수
	public static int get_page_cnt() throws Exception {
		Connection conn = DBConnector.getConnection();

		String sql = "select count(*) from GOODS_TABLE";

		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();

		int cnt_temp = rs.getInt(1);
		// 페이지 개수를 계산
		int cnt = cnt_temp / 5;

		if (cnt_temp % 5 > 0) {
			cnt++;
		}

		conn.close();

		return cnt;
	}

	// 상품을 수정하는 메서드
	public static void modify_item(ItemBean goodsbean) throws Exception {
		Connection conn = DBConnector.getConnection();
		String sql = "update GOODS_TABLE " + "set GOODS_NUM=?, " + "GOODS_CODE=?, " + "GOODS_NAME=?, " + "GOODS_IMG=?, "
				+ "GOODS_BRAND=?, " + "GOODS_PRICE=?, " + "GOODS_INFO=?, " + "GOODS_POINTS=? " + "where GOODS_NUM=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, goodsbean.getGoods_num());
		pstmt.setInt(2, goodsbean.getGoods_code());
		pstmt.setString(3, goodsbean.getGoods_name());
		pstmt.setString(4, goodsbean.getGoods_img());
		pstmt.setString(5, goodsbean.getGoods_brand());
		pstmt.setInt(6, goodsbean.getGoods_price());
		pstmt.setString(7, goodsbean.getGoods_info());
		pstmt.setInt(8, goodsbean.getGoods_points());
		pstmt.setString(9, goodsbean.getGoods_num());

		System.out.println("상품수정하는 메서드");
		pstmt.execute();

		conn.close();
	}

	// 상품 상세정보를 수정하는 메서드
	public static void modify_item2(ItemBean goodsbean) throws Exception {
		Connection conn = DBConnector.getConnection();
		String sql = "update GOOD_DETAILS_TABLE " + "set GOODS_AMOUNT=? " + "where GOODS_NUM=? and GOODS_COLOR_NUM=? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, goodsbean.getGodds_amount());
		pstmt.setString(2, goodsbean.getGoods_num());
		pstmt.setInt(3, goodsbean.getGoods_color_num());

		System.out.println("상품수정하는 메서드2");
		pstmt.execute();

		conn.close();
	}

	// 아이템을 제거하는 메서드
	public static void delete_item(String goods_num) throws Exception {
		
		Connection conn = DBConnector.getConnection();

		// 쿼리문
		String sql = "delete from GOODS_TABLE " + "where GOODS_NUM=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, goods_num);

		pstmt.execute();
		
		
		//SQL 해당 상품정보가 삭제가 되면..
		// 해당 상품에 관련된 리뷰들 전부 삭제.
		
		String sql2 = "delete from REVIEW_TABLE where REVIEW_GOODS_NUM=?";
		
		PreparedStatement pstmt2 = conn.prepareStatement(sql2);
				
		pstmt2.setString(1, goods_num);
		pstmt2.executeQuery();

		conn.close();
	} 
	
	
	// 아이템의 세부사항을 제거하는 메서드
   public static void delete_item_detail(String goods_num) throws Exception {
		
	   Connection conn = DBConnector.getConnection();

		// 쿼리문
		String sql = "delete from GOOD_DETAILS_TABLE where GOODS_NUM=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, goods_num);

		pstmt.execute();

		conn.close();
	}
	
   
	// 파라미터 값에 따라.. 화면에 해당 상품만 보여지게 얻어오는
	// 메소드
	public static ArrayList<ItemBean> filter_get_item(int num) throws Exception{
		
		//DB연결
		Connection conn = DBConnector.getConnection();

		//SQL
		String sql = "SELECT * FROM GOODS_TABLE WHERE GOODS_CODE=?";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setInt(1, num);
		ResultSet rs =  pstm.executeQuery();
		
		// 데이터 담을 컬렉션
		ArrayList<ItemBean> list = new ArrayList<ItemBean>();
		// 데이터의 개수만큼 반복
		
		while (rs.next()) {
			String goods_num = rs.getString("GOODS_NUM");
			int goods_code = rs.getInt("GOODS_CODE");
			String goods_name = rs.getString("GOODS_NAME");
			String goods_img = rs.getString("GOODS_IMG");
			String goods_brand = rs.getString("GOODS_BRAND");
			int goods_price = rs.getInt("GOODS_PRICE");
			String goods_info = rs.getString("GOODS_INFO");
			int goods_points = rs.getInt("GOODS_POINTS");
			Date goods_regdate = rs.getDate("GOODS_REGDATE");

			

			// 빈 객체에 담는다.
			ItemBean sub = new ItemBean();
			sub.setGoods_num(goods_num);
			sub.setGoods_code(goods_code);
			sub.setGoods_name(goods_name);
			sub.setGoods_img(goods_img);
			sub.setGoods_brand(goods_brand);
			sub.setGoods_price(goods_price);
			sub.setGoods_points(goods_points);
			sub.setGoods_regdate(goods_regdate);

			// 컬렉션에 담아준다.
			list.add(sub);
		}

		conn.close();

		return list;
		
	}
	
	
	
	    // 검색값에 따라 화면에 해당 상품만 보여지게 얻어오는
		// 메소드
		public static ArrayList<ItemBean> search_get_item(String search) throws Exception{
			
			//DB연결
			Connection conn = DBConnector.getConnection();

			//SQL
			String sql = "SELECT * FROM GOODS_TABLE WHERE GOODS_NAME LIKE ?";
			
			
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, "%" + search + "%");
			ResultSet rs =  pstm.executeQuery();
			
			
			//Statement stmt = conn.createStatement();
			//ResultSet rs = stmt.executeQuery(sql);
			 
			
			
			// 데이터 담을 컬렉션
			ArrayList<ItemBean> list = new ArrayList<ItemBean>();
			// 데이터의 개수만큼 반복
			
			while (rs.next()) {
				String goods_num = rs.getString("GOODS_NUM");
				int goods_code = rs.getInt("GOODS_CODE");
				String goods_name = rs.getString("GOODS_NAME");
				String goods_img = rs.getString("GOODS_IMG");
				String goods_brand = rs.getString("GOODS_BRAND");
				int goods_price = rs.getInt("GOODS_PRICE");
				String goods_info = rs.getString("GOODS_INFO");
				int goods_points = rs.getInt("GOODS_POINTS");
				Date goods_regdate = rs.getDate("GOODS_REGDATE");

				

				// 빈 객체에 담는다.
				ItemBean sub = new ItemBean();
				sub.setGoods_num(goods_num);
				sub.setGoods_code(goods_code);
				sub.setGoods_name(goods_name);
				sub.setGoods_img(goods_img);
				sub.setGoods_brand(goods_brand);
				sub.setGoods_price(goods_price);
				sub.setGoods_points(goods_points);
				sub.setGoods_regdate(goods_regdate);

				// 컬렉션에 담아준다.
				list.add(sub);
			}

			conn.close();

			return list;
			
		}
		
		
		 // 상품을 수정하는 메서드
		   public static void modify_item_0(ItemBean goodsbean) throws Exception {
		      Connection conn = DBConnector.getConnection();
		      String sql = "update GOODS_TABLE " + "set GOODS_NUM=?, " + "GOODS_CODE=?, " + "GOODS_NAME=?, "
		            + "GOODS_BRAND=?, " + "GOODS_PRICE=?, " + "GOODS_INFO=?, " + "GOODS_POINTS=? " + "where GOODS_NUM=?";
		      PreparedStatement pstmt = conn.prepareStatement(sql);
		      pstmt.setString(1, goodsbean.getGoods_num());
		      pstmt.setInt(2, goodsbean.getGoods_code());
		      pstmt.setString(3, goodsbean.getGoods_name());
		      pstmt.setString(4, goodsbean.getGoods_brand());
		      pstmt.setInt(5, goodsbean.getGoods_price());
		      pstmt.setString(6, goodsbean.getGoods_info());
		      pstmt.setInt(7, goodsbean.getGoods_points());
		      pstmt.setString(8, goodsbean.getGoods_num());
		      
		      System.out.println("상품수정하는 메서드");
		      pstmt.execute();
		      
		      conn.close();
		   }
	
	
}
