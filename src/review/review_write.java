package review;

import bean.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class review_write
 */
@WebServlet("/review_write")
public class review_write extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public review_write() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	
		System.out.println("review_write 서블릿 요청");
		
		//파라미터 추출
		
		//상품번호 추출
		int goods_num = Integer.parseInt(request.getParameter("goods_num"));
		
		System.out.println("상품번호 : " + goods_num);
			
		String user_id = request.getParameter("user_id");
		String review_title = request.getParameter("review_title");
		String review_goods_name = request.getParameter("review_goods_name");
		String review_content = request.getParameter("review_content");
		
		
		int review_buy_opt;
			
		if(request.getParameter("review_buy_opt") != null){
					
			review_buy_opt =  Integer.parseInt(request.getParameter("review_buy_opt"));
				
			} else{
			
			review_buy_opt = 0;
				
			}
		
		int review_star = Integer.parseInt(request.getParameter("review_star"));
		
		
		
		// 빈 객체에 데이터 set
		review_Bean bean = new review_Bean();
		
		bean.setUser_id(user_id);
		bean.setReview_title(review_title);
		bean.setReview_goods_name(review_goods_name);
		bean.setReview_content(review_content);
		bean.setReview_buy_opt(review_buy_opt);
		bean.setReview_star(review_star);
		bean.setReview_goods_num(goods_num);
		
		
		//DB에 저장
		review_DAO.review_write(bean);
		
		//페이지 이동
		String site = "review.credu?goods_num=" + bean.getReview_goods_num();
		response.sendRedirect(site);
		
		
		
		// DB 처리
		/*
		 * 
		 * INSERT INTO REVIEW_TABLE(review_num, user_id, review_goods_name, review_title, review_content, review_cnt, review_star, review_buy_opt, review_regdate)
		   VALUES (review_num.nextval, 'zzzz2222', '이동기', '이동기 구매', '이동기 완전 좋아요!', 0, 4, 1, sysdate);
		 * 
		 */
		
		/*
		Connection conn = DBConnector.getConnection();
		
		String sql = "INSERT INTO REVIEW_TABLE(review_num, user_id, review_goods_name, review_title, review_content, review_cnt, review_star, review_buy_opt, review_regdate)"
				   + " VALUES(review_num.nextval, ?, ?, ?, ?, 0, ?, ?, sysdate)";
		
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, user_id);
		psmt.setString(2, review_goods_name);
		psmt.setString(3, review_title);
		psmt.setString(4, review_content);
		psmt.setInt(5, review_star);
		psmt.setInt(6, review_buy_opt);
		
		//SQL 실행
		psmt.execute();
								
		//DB 연결 종료
		conn.close();
		*/
			
			
				
		
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
