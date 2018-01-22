package DB;

import bean.GoodsDetailsBean;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class GoodsDetailsDAO 
{
	public static void remove_amount(GoodsDetailsBean bean) throws Exception{
		Connection conn = DBConnector.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append("update GOOD_DETAILS_TABLE ")
		   .append("set GOODS_AMOUNT=? ")
		   .append("where GOODS_NUM=?");
		
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		
		pstmt.setInt(1, bean.getGoods_amount());
		pstmt.setString(2, bean.getGoods_num());
		
		pstmt.execute();
		
		conn.close();
	}
}
