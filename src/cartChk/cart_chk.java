package cartChk;

import DB.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class cart_chk
 */
@WebServlet("/cart_chk")
public class cart_chk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cart_chk() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	
		
		/*My_Crat에 물건이 담겨있는지 확인.*/
		
		// 1 : 값 있음.
		// 0 : 값 없음.
		
		//파라미터 한글처리 및 저장
		request.setCharacterEncoding("utf-8");
		String user_id = null;
		
		if(request.getParameter("user_id") != null){
			user_id = request.getParameter("user_id");
		}
		
		
		try {
		
			int res = 0;
			Connection conn = DBConnector.getConnection();
		
			String sql = "SELECT * FROM BOX_TABLE WHERE user_id=?";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user_id);
			
			ResultSet rs = ps.executeQuery();
			
			
			if(rs.next()){
				
				res = 1;
				
			} else{
				
				res = 0;
				
			}
			
			PrintWriter pw = response.getWriter();
			pw.print(res);
		
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
