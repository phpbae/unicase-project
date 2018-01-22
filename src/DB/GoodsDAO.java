package DB;

import bean.BoxBean;
import bean.GoodsBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class GoodsDAO 
{	
	//*상품 구매 페이지에서 상품 하나의 정보를 가져오는 메서드*
	//[파라미터] 상품번호
	//[리턴값] 상품데이터가 담겨져있는 빈객체
	public static GoodsBean get_goods_data(String goods_num) throws Exception
	{
		StringBuffer sql = new StringBuffer();
		sql.append("select * from GOODS_TABLE ")
		   .append("where GOODS_NUM=?");
		
	
		Connection conn = DBConnector.getConnection();

		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		pstmt.setString(1, goods_num);
		System.out.println("in goods DAO :"+goods_num);
		ResultSet rs = pstmt.executeQuery();

		if(rs.next()){
			System.out.println("결과 집합 있음");
		}else{
			System.out.println("결과 집합 없음");
		}
		
		
		GoodsBean bean = new GoodsBean();
		bean.setGoods_num(goods_num);
		bean.setGoods_brand(rs.getString("GOODS_BRAND"));
		bean.setGoods_img(rs.getString("GOODS_IMG"));
		bean.setGoods_info(rs.getString("GOODS_INFO"));
		bean.setGoods_name(rs.getString("GOODS_NAME"));
		bean.setGoods_points(rs.getInt("GOODS_POINTS"));
		bean.setGoods_price(rs.getInt("GOODS_PRICE"));
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return bean;
	}
	
	public static ArrayList<BoxBean> get_goods_images(ArrayList<BoxBean> beanList) throws Exception
	{
		Connection conn = DBConnector.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append("select goods_img from GOODS_TABLE ")
		   .append("where goods_num=?");
		
		System.out.println("gdao:"+beanList.get(0).getBox_num());
		//arr > arr > boxbean 형식 으로 되어있어 각 그룹의 0번째 빈에 이미지를 담아준다.
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		ResultSet rs;
		for(int index = 0; index < beanList.size() ; index++){
			pstmt.setString( 1, beanList.get(index).getGoods_num() );
			rs = pstmt.executeQuery();
			rs.next();
			beanList.get(index).setGoods_image( rs.getString("goods_img") );
		}
		conn.close();
		
		return beanList;
	}
	
}
