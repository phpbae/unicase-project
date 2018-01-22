package DB;

import bean.BoxBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoxDAO 
{
	public static void add_goods_to_cart(BoxBean bean) throws Exception
	{
		Connection conn = DBConnector.getConnection();
		
		//쿼리문
		StringBuffer sql = new StringBuffer();
		sql.append("insert into BOX_TABLE ")
		   .append("(USER_ID, BOX_NUM, BOX_GOODS_AMOUNT, BOX_GOODS_PRICE, ")
		   .append("GOODS_COLOR_NUM_1, GOODS_COLOR_NUM_2, GOODS_COLOR_NUM_3, GOODS_COLOR_NUM_4, GOODS_NUM, ORDER_STATE ) ")
		   .append("values(?, BOX_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?, ?)");
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		//같은그룹에 있는 상품을 같은 그룹번호에 담는다.
		pstmt.setString(1, bean.getUser_id());
		pstmt.setInt(2, bean.getBox_goods_amount());
		pstmt.setInt(3, bean.getBox_goods_price());
		pstmt.setInt(4, bean.getGoods_color_num_1());
		pstmt.setInt(5, bean.getGoods_color_num_2());
		pstmt.setInt(6, bean.getGoods_color_num_3());
		pstmt.setInt(7, bean.getGoods_color_num_4());
		pstmt.setString(8, bean.getGoods_num());
		pstmt.setInt(9, -1);
		pstmt.execute();
		
		conn.close();
	}
	
	public static ArrayList<BoxBean> get_goods_data(String user_id) throws Exception
	{
		Connection conn = DBConnector.getConnection();
		//카트 리스트 보여주는 페이지에 출력하기 위한 
		//DAO BOX_TABLE 에서 가져온 GOODS_NUM으로
		//GOODS_TABLE의 이미지경로를 가져온다.
		//정렬을 하여 같은 상품끼리 정렬한다.
		ArrayList<BoxBean> box_bean_list = new ArrayList<BoxBean>();
		StringBuffer sql = new StringBuffer();
		sql.append("select * from BOX_TABLE ")
		   .append("where USER_ID=?");
		
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());

		pstmt.setString(1, user_id);
		
		ResultSet rs = pstmt.executeQuery();
		
		//
		while(rs.next()){
			if(rs.getInt("ORDER_STATE") == -1){
				BoxBean bean = new BoxBean();
				bean.setBox_num(rs.getInt("BOX_NUM"));
				bean.setBox_goods_amount(rs.getInt("BOX_GOODS_AMOUNT"));
				bean.setBox_goods_price(rs.getInt("BOX_GOODS_PRICE"));
				bean.setGoods_color_num_1(rs.getInt("GOODS_COLOR_NUM_1"));
				bean.setGoods_color_num_2(rs.getInt("GOODS_COLOR_NUM_2"));
				bean.setGoods_color_num_3(rs.getInt("GOODS_COLOR_NUM_3"));
				bean.setGoods_color_num_4(rs.getInt("GOODS_COLOR_NUM_4"));
				bean.setGoods_num(rs.getString("GOODS_NUM"));
				bean.setOrder_state(rs.getInt("ORDER_STATE"));
				box_bean_list.add(bean);
			}
		}

		conn.close();
		
		return box_bean_list;
	}
	
	public static void delete_goods_from_cart(String box_num) throws Exception
	{
		int _box_num = Integer.parseInt(box_num);
		
		Connection conn = DBConnector.getConnection();
		
		StringBuffer sql = new StringBuffer("delete from BOX_TABLE ")
									.append("where BOX_NUM=?");
		
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		pstmt.setInt(1, _box_num);
		
		pstmt.execute();
		
		conn.close();
	}
	
	
	public static void update_cart_data(BoxBean box_bean) throws Exception
	{
		Connection conn = DBConnector.getConnection();
		
		StringBuffer sql = new StringBuffer("update BOX_TABLE set GOODS_COLOR_NUM_1=?, ")
									.append("GOODS_COLOR_NUM_2=?, GOODS_COLOR_NUM_3=?, GOODS_COLOR_NUM_4=?")
									.append("where BOX_NUM=").append(box_bean.getBox_num());
		
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		
		pstmt.setInt(1, box_bean.getGoods_color_num_1());
		pstmt.setInt(2, box_bean.getGoods_color_num_2());
		pstmt.setInt(3, box_bean.getGoods_color_num_3());
		pstmt.setInt(4, box_bean.getGoods_color_num_4());
		
		pstmt.execute();
		System.out.println("in boxDao");
		System.out.println(box_bean.getGoods_color_num_1());
		System.out.println(box_bean.getGoods_color_num_2());
		System.out.println(box_bean.getGoods_color_num_3());
		System.out.println(box_bean.getGoods_color_num_4());
		conn.close();
	}
	
	public static void get_goods_num(BoxBean box_bean) throws Exception
	{
		Connection conn = DBConnector.getConnection();
		
		StringBuffer sql = new StringBuffer("");
	}
	
	public static void set_order_state(int box_num)
	{
		try{
			Connection conn = DBConnector.getConnection();
			
			StringBuffer sql = new StringBuffer("update BOX_TABLE set order_state=2 ")
										.append("where BOX_NUM=?");
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setInt(1, box_num);
			
			pstmt.execute();
			
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
