package notice;

import DB.notice_DAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class delete_content
 */
@WebServlet("/NoticeDeleteServlet")
public class NoticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NoticeDeleteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 파라미터 데이터 추출
		try {
			String notice_num_str = request.getParameter("notice_idx");
			int notice_num = Integer.parseInt(notice_num_str);

			
			// 글을 삭제한다.
			notice_DAO.delete_content(notice_num);
			
			
			//Page 이동
			
			String site = "notice.credu";
			response.sendRedirect(site);
			/*
			RequestDispatcher dis = request.getRequestDispatcher(site);
			dis.forward(request, response);
			*/
			

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
