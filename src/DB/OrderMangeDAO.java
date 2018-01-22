package DB;

import bean.odermangebean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class OrderMangeDAO {
	   // 결제 내역을 가져오는 메서드
	   // [파라미터]
	   // page_num : 페이지 번호
	   // [리턴]
	   // 해당 페이지에 보여줄 글의 정보를 가지고 있는 컬렉션
	   public static ArrayList<odermangebean> 
	         get_oder_mange_all(int page_num) throws Exception {
	      
	      Connection conn = DBConnector.getConnection();
	      
//	      String sql = "select * from "
//	             + "(select rownum as rnum, a1.* from "
//	             + "(select * from ORDER_TABLE order by order_num desc) a1) a2 " 
//	             + "where a2.rnum >= ? and a2.rnum <= ?";
	      
	      String sql = "select * from "
	    		  + "(select rownum as rnum, a1.* from "
	    		  + "(select f1.ORDER_IDX, F1.ORDER_REAL_PRICAE, "
	    		  + "f1.GOODS_NUM, F1.ORDER_NUM, F2.USER_ID "
	    		  + "from ORDER_TABLE f1, ORDER_DETAILS_TABLE "
	    		  + "f2 where f1.ORDER_NUM = f2.ORDER_NUM order by order_idx desc) a1) a2 " 
	    		  + "where a2.rnum >= ? and a2.rnum <= ?";
	      
	      int min = 1 + ((page_num - 1) * 5);
	      int max = min + (5 - 1);
	      
	      PreparedStatement pstmt = conn.prepareStatement(sql);
	      pstmt.setInt(1, min);
	      pstmt.setInt(2, max);
	      
	      ResultSet rs = pstmt.executeQuery();
	      // 데이터 담을 컬렉션
	      ArrayList<odermangebean> list = new ArrayList<odermangebean>();
	      // 데이터의 개수만큼 반복
	      while(rs.next()){
	     
	     	int order_idx = rs.getInt("ORDER_IDX"); /* 주문인덱스 */
	    	int order_real_pricae =rs.getInt("ORDER_REAL_PRICAE"); /* 실제결제가격 */
	    	String goods_num=rs.getString("GOODS_NUM"); /* 상품번호 */
	    	int order_num =rs.getInt("ORDER_NUM"); /* 주문번호 */
	    	String user_id=rs.getString("USER_ID");/*주문자 아이디*/
	    	
	    	
	         // 빈 객체에 담는다.
	    	odermangebean sub = new odermangebean();
	         sub.setGoods_num(goods_num);
	         sub.setOrder_idx(order_idx);
	         sub.setOrder_num(order_num);
	         sub.setOrder_real_pricae(order_real_pricae);
	         sub.setUser_id(user_id);
	         // 컬렉션에 담아준다.
	         list.add(sub);
	      }
	      
	      
	      conn.close();
	      
	      return list;
	      
	   }
	   // 페이지의 개수를 반환하는 메서드
	   // [리턴]
	   // 정수 : 페이지의 개수
	   public static int get_page_cnt() throws Exception{
	      Connection conn = DBConnector.getConnection();
	      
	      String sql = "select count(*) from ORDER_TABLE";
	      
	      Statement stmt = conn.createStatement();
	      ResultSet rs = stmt.executeQuery(sql);
	      rs.next();
	      
	      int cnt_temp = rs.getInt(1);
	      // 페이지 개수를 계산
	      int cnt = cnt_temp / 5;
	      
	      if(cnt_temp % 5 > 0){
	         cnt++;
	      }
	      
	      conn.close();
	      
	      return cnt;
	   }
}
