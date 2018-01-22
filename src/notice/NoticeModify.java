package notice;

import DB.notice_DAO;
import bean.notice_Bean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class NoticeModify
 */
@WebServlet("/NoticeModify")
public class NoticeModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeModify() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	
		
		// 파라미터 한글처리
		request.setCharacterEncoding("utf-8");
		
		//파라미터 처리
		String user_id = request.getParameter("user_id");
		int notice_num = Integer.parseInt(request.getParameter("notice_idx"));
		
		
		// DAO
		
		try {
			
			notice_Bean bean = notice_DAO.modify_content(user_id, notice_num);
			
			//페이지 이동
			
			request.setAttribute("modify", bean);
						
			String site = "notice_board/notice_modify_form.jsp";
			RequestDispatcher dis  = request.getRequestDispatcher(site);
			dis.forward(request, response);
			
			
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
