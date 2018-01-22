package DB;

import bean.BoxBean;
import bean.OrderBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class OrderDAO 
{
	public static void add_pre_order(OrderBean bean) throws Exception
	{
		Connection conn = DBConnector.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append("insert into ORDER_DETAILS_TABLE ")
		   .append("(ORDER_USER_NAME, ORDER_GOODS_AMOUNT, ORDER_REQUIRE, ORDER_POINTS, ")
		   .append("ORDER_GIVE_POINTS, ORDER_SUM, ORDER_DATE, ORDER_NUM, DELIVERY_IDX, USER_ID, ORDER_DELIVERY_RS) ")
		   .append("values (?, ?, ?, ?, ?, ?, SYSDATE, ORDER_SEQ.nextval, ?, ?, 0)");

		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		
		pstmt.setString(1, bean.getOrder_user_name());
		pstmt.setInt(2, bean.getOrder_goods_amount());
		pstmt.setString(3, bean.getOrder_require());
		pstmt.setInt(4, bean.getOrder_points());
		pstmt.setInt(5, bean.getOrder_give_points());
		pstmt.setInt(6, bean.getOrder_sum());
		pstmt.setInt(7, bean.getDelivery_idx());
		pstmt.setString(8, bean.getUser_id());
		
		
		pstmt.execute();
		
		conn.close();
	}
	
	public static void add_pay_order(OrderBean bean) throws Exception
	{
		Connection conn = DBConnector.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append("update ORDER_DETAILS_TABLE ")
		   .append("set ORDER_STATE=?, ORDER_PAY_OPT=?, ORDER_PAY_RES=?, ORDER_DELIVERY_OPT=?, ")
		   .append("ORDER_DELIVERY_RS=0 ")
		   .append("where ORDER_NUM=?");
		   //.append("values (?, ?, ?, ?, ?)");
		
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		
		pstmt.setInt(1, bean.getOrder_state());
		pstmt.setInt(2, bean.getOrder_pay_opt());
		pstmt.setInt(3, bean.getOrder_pay_res());
		pstmt.setInt(4, bean.getOrder_delivery_opt());
		pstmt.setInt(5, bean.getOrder_num());
		
		pstmt.execute();
		
		conn.close();
	}
	
	public static void delete_order(int order_num) throws Exception
	{
		Connection conn = DBConnector.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append("delete from ORDER_DETAILS_TABLE ")
		   .append("where order_num=?");
		
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		pstmt.setInt(1, order_num);
		pstmt.execute();
		
		conn.close();
	}
	
	public static ArrayList<BoxBean> get_orderbean_info(String user_id) throws Exception
	{
		Connection conn = DBConnector.getConnection();
		
		StringBuffer sql = new StringBuffer("select ORDER_NUM,DELIVERY_IDX  from ORDER_DETAILS_TABLE ")
									.append("where USER_ID=?");
		ArrayList<BoxBean> box_bean = new ArrayList<BoxBean>();
		
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		pstmt.setString(1, user_id);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			BoxBean bean = new BoxBean();
			bean.setOrder_num(rs.getInt("ORDER_NUM"));
			bean.setOrder_num(rs.getInt("DELIVERY_IDX"));
			
			box_bean.add(new BoxBean());
		}
		
		conn.close();
		return box_bean;
	}
	
	public static int get_order_cnt(int delivery_idx) throws Exception
	{
		Connection conn = DBConnector.getConnection();
		
		StringBuffer sql = new StringBuffer("select count(*) from ORDER_DETAILS_TABLE ")
									.append("where DELIVERY_IDX=?");
		
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		pstmt.setInt(1, delivery_idx);
		
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		
		int cnt = rs.getInt(1);
		
		conn.close();
		return cnt;
	}
	
	
}
