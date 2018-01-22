package DB;

import bean.DeliveryBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

public class DeliveryDAO {
	
	// 해당 아이디의 정보 반환
	public static ArrayList<DeliveryBean> mydata_read(String user_id) throws Exception {
		Connection conn = DBConnector.getConnection();

		String sql = "select a1.order_num, a1.order_goods_amount, a1.order_pay_opt, "
				+ "a1.order_invoice, a1.order_delivery_opt, a1.order_delivery_rs, "
				+ "a1.order_date, a2.to_name, a2.to_addr, a2.to_phnum "
				+ "from order_details_table a1, delivery_info_table a2 " + "where a1.delivery_idx = a2.delivery_idx "
				+ "and user_id=?";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, user_id);

		ResultSet rs = pstmt.executeQuery();
		// 데이터 담을 컬렉션
		ArrayList<DeliveryBean> list = new ArrayList<DeliveryBean>();
		// 데이터의 개수만큼 반복
		while (rs.next()) {
			
			int order_num = rs.getInt("order_num");
			int order_goods_amount = rs.getInt("order_goods_amount");
			int order_pay_opt = rs.getInt("order_pay_opt");
			String order_invoice = rs.getString("order_invoice");
			int order_delivery_opt = rs.getInt("order_delivery_opt");
			Date order_date = rs.getDate("order_date");
			String to_name = rs.getString("to_name");
			String to_addr = rs.getString("to_addr");
			String to_phnum = rs.getString("to_phnum");
			int order_delivery_rs = rs.getInt("order_delivery_rs");

			DeliveryBean sub = new DeliveryBean();
			sub.setOrder_num(order_num);
			sub.setOrder_goods_amount(order_goods_amount);
			sub.setOrder_pay_opt(order_pay_opt);
			sub.setOrder_invoice(order_invoice);
			sub.setOrder_delivery_opt(order_delivery_opt);
			sub.setOrder_date(order_date);
			sub.setTo_name(to_name);
			sub.setTo_addr(to_addr);
			sub.setTo_phnum(to_phnum);
			sub.setOrder_delivery_rs(order_delivery_rs);

			list.add(sub);
			System.out.println("고객디비끝");
		
		}

		conn.close();

		return list;
	}

	// 주문정보 반환하는 메소드
	public static DeliveryBean data_read_all(int order_num) throws Exception {
		// DB연결
		Connection conn = DBConnector.getConnection();

		String sql = "SELECT f1.DELIVERY_IDX, f1.order_num, f1.user_id, f1.order_user_name, f1.order_pay_opt, f1.order_invoice, f1.order_delivery_rs, f1.order_date, f1.order_delivery_opt, f1.order_goods_amount, "
				+ "f2.to_name, f2.to_addr, f2.to_phnum " + "FROM DELIVERY_INFO_TABLE f2, ORDER_DETAILS_TABLE f1 "
				+ "WHERE f1.delivery_idx = f2.delivery_idx AND f1.order_num=?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, order_num);

		ResultSet rs = pstmt.executeQuery();
		rs.next();

		DeliveryBean delivery_bean = new DeliveryBean();

		delivery_bean.setDelivery_idx(rs.getInt("DELIVERY_IDX"));  // 배송인덱스
		delivery_bean.setUser_id(rs.getString("USER_ID"));         // 아이디
		delivery_bean.setOrder_user_name(rs.getString("ORDER_USER_NAME")); // 주문자
		delivery_bean.setOrder_pay_opt(rs.getInt("ORDER_PAY_OPT")); // 결제방법
		delivery_bean.setOrder_delivery_opt(rs.getInt("ORDER_DELIVERY_OPT")); //배송방법
		delivery_bean.setOrder_num(rs.getInt("ORDER_NUM"));        // 주문번호
		delivery_bean.setTo_name(rs.getString("TO_NAME"));         // 받는사람
		delivery_bean.setTo_addr(rs.getString("TO_ADDR"));         // 받는사람 주소
		delivery_bean.setTo_phnum(rs.getString("TO_PHNUM"));       // 받는사람 연락처
		delivery_bean.setOrder_delivery_rs(rs.getInt("ORDER_DELIVERY_RS")); //배송결과
		delivery_bean.setOrder_invoice(rs.getString("ORDER_INVOICE"));//송장번호
		delivery_bean.setOrder_goods_amount(rs.getInt("ORDER_GOODS_AMOUNT"));//주문수량;
		delivery_bean.setOrder_date(rs.getDate("ORDER_DATE")); //주문날짜

		conn.close();

		return delivery_bean;
	}

	// 총 주문리스트를 구함.
	public static int order_list_Count() throws Exception {

		Connection conn = DBConnector.getConnection();

		// 쿼리문
		String sql = "select count(*) from ORDER_DETAILS_TABLE";

		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();

		// 전체 글의 개수를 가져온다.
		int cnt = rs.getInt(1);

		conn.close();

		// 총 페이지 개수 리턴
		return cnt;

	}

	/*
	// 주문 상세정보 데이터에 담겨져 있는 빈 객체를 반환
	public static ArrayList<DeliveryBean> data_read_all2(int delivery_idx) throws Exception {

		Connection conn = DBConnector.getConnection();

		String sql = "select * " + "from ORDER_DETAILS_TABLE f1, DELIVERY_INFO_TABLE f2 "
				+ "where f1.delivery_idx = f2.delivery_idx and delivery_idx=?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, delivery_idx);

		ArrayList<DeliveryBean> list = new ArrayList<DeliveryBean>();

		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			DeliveryBean delivery_bean = new DeliveryBean();
			delivery_bean.setOrder_num(rs.getInt("ORDER_NUM"));
			delivery_bean.setUser_id(rs.getString("USER_ID"));
			delivery_bean.setOrder_user_name(rs.getString("ORDER_USER_NAME"));
			delivery_bean.setOrder_pay_opt(rs.getInt("ORDER_PAY_OPT"));
			delivery_bean.setOrder_invoice(rs.getString("ORDER_INVOICE"));
			delivery_bean.setOrder_delivery_opt(rs.getInt("ORDER_DELIVERY_OPT"));
			delivery_bean.setOrder_delivery_rs(rs.getInt("ORDER_DELIVERY_RS"));
			delivery_bean.setOrder_date(rs.getDate("ORDER_DATE"));

			list.add(delivery_bean);
		}
		conn.close();

		return list;
	}
	*/

	// 배송상태 수정하는 메소드
	public static void delivery_change(DeliveryBean delivery_bean) throws Exception {
		Connection conn = DBConnector.getConnection();

		String sql = "update ORDER_DETAILS_TABLE "
				+ "set order_delivery_rs=? "
				+ "where order_num=?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, delivery_bean.getOrder_delivery_rs());
		pstmt.setInt(2, delivery_bean.getOrder_num());

		pstmt.execute();

		conn.close();
	}

	public static ArrayList<DeliveryBean> order_list_get(int start, int end, int align, String search_val) {

		// Arraylist 생성
		// 빈객체를 담을 arraylist
		ArrayList<DeliveryBean> list = new ArrayList<DeliveryBean>();
		try {

			// DB연결
			Connection conn = DBConnector.getConnection();
			String sql = null;
			System.out.println("정렬값 : " + align);
			System.out.println("검색값 : " + search_val);

			if (align == 0 && search_val == null) {
				// SQL
				System.out.println("여기는 전체부르는곳 ");
				// ORDER_DETAILS_TABLE에 모든 데이터를 불러온다. (결제완료/주문날짜기준으로 내림차순 출력)
				sql = "select * from " + "(select rownum as rnum, a1.* from "
						+ "(select * FROM ORDER_DETAILS_TABLE where  order_delivery_rs=0 ) a1) a2 "
						+ "where a2.rnum >= ? and a2.rnum <=?";

			} else if (align == 1) {
				// SQL
				// 배송준비중별 정렬
				sql = "select * from " + "(select rownum as rnum, a1.* from "
						+ "(select * FROM ORDER_DETAILS_TABLE where  order_delivery_rs=1 ) a1) a2 "
						+ "where a2.rnum >= ? and a2.rnum <=?";

			} else if (align == 2) {
				// SQL
				// 배송중별 정렬
				sql = "select * from " + "(select rownum as rnum, a1.* from "
						+ "(select * FROM ORDER_DETAILS_TABLE where  order_delivery_rs=2 ) a1) a2 "
						+ "where a2.rnum >= ? and a2.rnum <=?";

			} else if (align == 3) {
				// SQL
				// 배송완료별 정렬
				sql = "select * from " + "(select rownum as rnum, a1.* from "
						+ "(select * FROM ORDER_DETAILS_TABLE where  order_delivery_rs=3 ) a1) a2 "
						+ "where a2.rnum >= ? and a2.rnum <=?";
			}

			// 검색
			if (search_val != null) {
				// SQL

				
				sql = "select * from " + "(select rownum as rnum, a1.* from "
						+ "(select * FROM ORDER_DETAILS_TABLE WHERE order_num='" + search_val + "') a1) a2 "
						+ "where a2.rnum >= ? and a2.rnum <=?";

			}
			System.out.println("디비쿼리:" + sql);
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			// SQL 실행
			ResultSet rs = pstmt.executeQuery();

			// ArrayList<DeliveryBean> delivery_bean = new
			// ArrayList<DeliveryBean>();
			// rs.next() 값이 있으면 투루를 반환.
			while (rs.next()) {
				int delivery_idx = rs.getInt("DELIVERY_IDX");
				int order_num = rs.getInt("ORDER_NUM");
				String user_id = rs.getString("USER_ID");
				String order_user_name = rs.getString("ORDER_USER_NAME");
				int order_pay_opt = rs.getInt("ORDER_PAY_OPT");
				int order_delivery_opt = rs.getInt("ORDER_DELIVERY_OPT");
				Date order_date = rs.getDate("ORDER_DATE");
				int order_delivery_rs = rs.getInt("ORDER_DELIVERY_RS");

				// 빈객체 생성
				DeliveryBean sub = new DeliveryBean();

				sub.setDelivery_idx(delivery_idx);
				sub.setOrder_num(order_num);
				sub.setUser_id(user_id);
				sub.setOrder_user_name(order_user_name);
				sub.setOrder_pay_opt(order_pay_opt);
				sub.setOrder_delivery_opt(order_delivery_opt);
				sub.setOrder_date(order_date);
				sub.setOrder_delivery_rs(order_delivery_rs);

				list.add(sub);
			}

			// DB 연결 종료
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	//////////////////////////////////
	public static void add_delivery_info(DeliveryBean delivery_bean) throws Exception{
		Connection conn = DBConnector.getConnection();
		
		StringBuffer sql = new StringBuffer("insert into DELIVERY_INFO_TABLE ")
									.append("(DELIVERY_IDX, TO_NAME, TO_ADDR, TO_PHNUM) ")
									.append("values (DELIVERY_SEQ.nextval, ?, ?, ?)");
		
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		
		pstmt.setString(1, delivery_bean.getTo_name());
		pstmt.setString(2, delivery_bean.getTo_addr());
		pstmt.setString(3, delivery_bean.getTo_phnum());
		
		pstmt.execute();
		
		conn.close();
	}
	public static int get_delivery_seq() throws Exception
	{
		Connection conn = DBConnector.getConnection();
		
		StringBuffer sql = new StringBuffer("select LAST_NUMBER FROM USER_SEQUENCES ") 
									.append("WHERE SEQUENCE_NAME = UPPER('DELIVERY_SEQ')");
		
		//StringBuffer 
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		
		int seq = Integer.parseInt(rs.getString(1));
		conn.close();
		
		return seq;
	}
	public static int delete_delivery_info(int delivery_idx) throws Exception
	{
		Connection conn = DBConnector.getConnection();
		
		StringBuffer sql = new StringBuffer(" ") 
				.append("WHERE SEQUENCE_NAME = UPPER('DELIVERY_SEQ')");
		
		//StringBuffer 
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		
		int seq = Integer.parseInt(rs.getString(1));
		conn.close();
		
		return seq;
	}
//	public static void delivery_delete(int delivery_idx) throws Exception {
//		Connection conn = DBConnector.getConnection();
//
//		String sql = "delete from DELIVERY_INFO_TABLE where delivery_idx=?";
//
//		PreparedStatement pstmt = conn.prepareStatement(sql);
//
//		pstmt.setInt(1, delivery_idx);
//		pstmt.executeQuery();
//
//		conn.close();
//	}
}
